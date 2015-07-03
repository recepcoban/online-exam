using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinavSistemi
{
    public partial class Sinav : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db_sinav_sistemi"].ConnectionString);

        public object kullanici;
        public object sure;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            sure = Session["timeout"];
            if (sure == null) { }
            else { }

            //if (!ScriptManager1.IsInAsyncPostBack)
            //{
            //    Session["timeout"] = DateTime.Now.AddSeconds(60).ToString();
            //}

            kullanici = Session["kullanici"];

            if (kullanici == null)
            {
                beforeCreateExam.Enabled = false;
                lblUyari.Text = "Lütfen giriş yapınız!";
                lblUyari.Font.Bold = true;
                hyperSession.Text = "";
                btnMenuGiris.Visible = true;
                btnCikis.Visible = false;
            }
            else
            {
                
                hyperSession.Text = "Hoşgeldin, " + kullanici.ToString();
                hyperSession.NavigateUrl = "Profil.aspx";
                btnMenuGiris.Visible = false;
                btnCikis.Visible = true;

                if (!IsPostBack)
                {
                    try
                    {
                        SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Dersler", baglanti);
                        DataTable tbl = new DataTable();
                        adptr.Fill(tbl);
                        dropDersler.DataSource = tbl;
                        dropDersler.DataTextField = "ders_adi";
                        dropDersler.DataValueField = "ders_id";
                        dropDersler.DataBind();
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
            }

            try
            {
                string sorgu2 = "SELECT * FROM Dersler ORDER BY ders_id";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                baglanti.Open();
                SqlDataReader dr2 = komut2.ExecuteReader();
                lstMenuDersler.DataSource = dr2;
                lstMenuDersler.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                baglanti.Close();
            }

        }

        // ders seçiminden sonra sınav seçimi
        protected void dropDersler_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropSinavlar.Items.Clear();
            dropSinavlar.DataBind();
            dropSinavlar.Items.Add("Sınav Seçiniz");

            try
            {
                SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Sinavlar WHERE ders_id = " + dropDersler.SelectedItem.Value + " AND soru_var_mi = 1", baglanti);
                DataTable tbl = new DataTable();
                adptr.Fill(tbl);
                dropSinavlar.DataSource = tbl;
                dropSinavlar.DataTextField = "sinav_adi";
                dropSinavlar.DataValueField = "sinav_id";
                dropSinavlar.DataBind();
            }
            catch (Exception)
            {
                Response.Redirect(Request.RawUrl);
            }
            finally
            {
                baglanti.Close();
            }
        }

        // sınava başla
        protected void btnSinavaBasla_Click(object sender, EventArgs e)
        {
            if (dropDersler.Text.Equals("Ders Seçiniz") || dropSinavlar.Text.Equals("Sınav Seçiniz"))
            {
                lblUyari.Text = "Lütfen Ders ve Sınav seçiniz!";
            }
            else
            {
                try
                {
                    baglanti.Open();
                    SqlCommand select = new SqlCommand("SELECT * FROM Sonuclar WHERE kadi = '" + kullanici.ToString() + "' AND ders_adi = '" + dropDersler.SelectedItem.Text + "' AND sinav_adi = '" + dropSinavlar.SelectedItem.Text + "'", baglanti);

                    int varsa = Convert.ToInt32(select.ExecuteScalar());
                    if (varsa == 0)
                    {

                        beforeCreateExam.Visible = false;
                        afterCreateExam.Visible = true;
                        panelSinavSonucu.Visible = false;

                        int ders_id = Convert.ToInt32(dropDersler.SelectedValue);
                        int sinav_id = Convert.ToInt32(dropSinavlar.SelectedValue);

                        // sınav süresi vt den getiriliyor
                        lblSure.Text = "";
                        string sorgu1 = "SELECT * FROM Sinavlar WHERE sinav_id = @sinav_id";
                        SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                        komut1.Parameters.AddWithValue("@sinav_id", dropSinavlar.SelectedItem.Value);

                        SqlDataReader dr1 = komut1.ExecuteReader();

                        if (dr1.Read())
                        {
                            Session["timeout"] = DateTime.Now.AddSeconds(Convert.ToDouble(dr1["sinav_sure"]) * 60).ToString();
                        }

                        SinavOlustur sinav = new SinavOlustur(kullanici.ToString(), ders_id, sinav_id);
                        sinav.SoruGetir();
                        Session.Add("sinav", sinav);
                        DisplayQuestion();

                        lblDersAdi.Text = dropDersler.SelectedItem.Text;
                        lblSinavAdi.Text = dropSinavlar.SelectedItem.Text;

                    }
                    else
                    {
                        lblUyari.Text = "Bu Sınavı Daha Önce Çözdünüz!";
                    }
                }
                catch (Exception ex)
                {
                    lblUyari.Text = "Hata : " + ex;
                }
                finally
                {
                    baglanti.Close();
                }
            }

        }

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            beforeCreateExam.Enabled = false;
            lblUyari.Text = "Lütfen giriş yapınız!";
            lblUyari.Font.Bold = true;
            hyperSession.Text = "";
            btnMenuGiris.Visible = true;
            btnCikis.Visible = false;
            Response.Redirect(Request.RawUrl);
        }

        // önceki soru
        protected void btnPrev_Click(object sender, EventArgs e)
        {
            SinavOlustur sinav = (SinavOlustur)Session["sinav"];
            sinav.soru_no--;
            Session.Add("sinav", sinav);
            DisplayQuestion();
        }

        // sinav iptal
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("sinav");
            Response.Redirect(Request.RawUrl);
        }

        // sonraki soru
        protected void btnNext_Click(object sender, EventArgs e)
        {
            ProcessQuestion();
            SinavOlustur sinav = (SinavOlustur)Session["sinav"];
            if (sinav.soru_no == sinav.soru_sayisi - 1)
            {
                panelSinavSonucu.Visible = true;
                beforeCreateExam.Visible = false;
                afterCreateExam.Visible = false;

                // sınav sonucunun gösterilmesi
                lblDers.Text = dropDersler.SelectedItem.Text;
                lblSinav.Text = dropSinavlar.SelectedItem.Text;
                lblBaslama.Text = sinav.baslama_zamani.ToString();
                TimeSpan ts = DateTime.Now.Subtract(sinav.baslama_zamani);
                lblMin.Text = ts.Minutes.ToString();
                lblNquestions.Text = sinav.soru_sayisi.ToString();

                // doğru cevap kontrolu
                int cnt = 0;
                foreach (Sorular q in sinav.sorular)
                {
                    if (q.DogruMu())
                        cnt++;
                }

                lblNcans.Text = cnt.ToString();
                sinav.dogru_sayisi = cnt;
                Session.Add("sinav", sinav);

                double sonuc = cnt * 100 / sinav.soru_sayisi;

                lblGrade.Text = "% " + sonuc;

                baglanti.Open();
                string sorgu = "INSERT INTO Sonuclar VALUES(@kadi,@ders_adi,@sinav_adi,@soru_sayisi,@dogru_sayisi,@oran,@baslama,getdate())";
                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@kadi", kullanici);
                komut.Parameters.AddWithValue("@ders_adi", dropDersler.SelectedItem.Text);
                komut.Parameters.AddWithValue("@sinav_adi", dropSinavlar.SelectedItem.Text);
                komut.Parameters.AddWithValue("@soru_sayisi", sinav.soru_sayisi);
                komut.Parameters.AddWithValue("@dogru_sayisi", sinav.dogru_sayisi);
                komut.Parameters.AddWithValue("@oran", sonuc);
                komut.Parameters.AddWithValue("@baslama", sinav.baslama_zamani);
                komut.ExecuteNonQuery();
                baglanti.Close();

            }
            else
            {
                sinav.soru_no++;
                Session.Add("sinav", sinav);
                DisplayQuestion();
            }
        }

        // cevap kontrolü
        public void ProcessQuestion()
        {
            SinavOlustur sinav = (SinavOlustur)Session["sinav"];
            Sorular s = sinav.sorular[sinav.soru_no];
            String cevap;

            if (rdBtnCevap1.Checked)
                cevap = "A";
            else
                if (rdBtnCevap2.Checked)
                    cevap = "B";
                else
                    if (rdBtnCevap3.Checked)
                        cevap = "C";
                    else
                        if (rdBtnCevap4.Checked)
                            cevap = "D";
                        else
                            cevap = "";
            s.secilen_cvp = cevap;
            sinav.sorular[sinav.soru_no] = s;
            Session.Add("sinav", sinav);
        }

        // soru gösterimi
        public void DisplayQuestion()
        {
            SinavOlustur e = (SinavOlustur)Session["sinav"];
            lblSoruNo.Text = e.soru_no + 1 + " / " + e.soru_sayisi;
            lblTarih.Text = e.baslama_zamani.ToString();

            Sorular s = e.sorular[e.soru_no];
            // sorunun ve cevaplarının gösterımı
            lblSoruAciklama.Text = "<span style='color:blue;'>Soru : </span><br/>" + s.soru;
            imgSoruSekil.ImageUrl = s.resim;
            rdBtnCevap1.Text = s.cvp1;
            rdBtnCevap2.Text = s.cvp2;
            rdBtnCevap3.Text = s.cvp3;
            rdBtnCevap4.Text = s.cvp4;

            // radıo butonların temızlenmesı ve yenıden kullanılabılır hale getırılmesı
            rdBtnCevap1.Checked = false;
            rdBtnCevap2.Checked = false;
            rdBtnCevap3.Checked = false;
            rdBtnCevap4.Checked = false;

            // soru sayısının durumuna gore butonlar
            if (e.soru_no == 0)
                btnPrev.Enabled = false;
            else
                btnPrev.Enabled = true;

            if (e.soru_no == e.soru_sayisi - 1)
                btnNext.Text = "Sınavı Bitir";
            else
                btnNext.Text = "Sonraki";
        }

        // cevaplarını kontrol et
        protected void btnCevapKontrolEt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CevapKontrol.aspx");
        }

        // sınav süresi
        protected void timerSinavSuresi_Tick(object sender, EventArgs e)
        {
            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
            {
                // Eğer süre 0 dan büyük ise kalan süre Labelde gösteriliyor
                lblSure.Text = ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalSeconds).ToString() + " saniye";
            }
            else
            {
                // süre 0 ve küçük ise sürenin bittiği Labele yazdırılıyor
                lblSure.Text = "Süreniz Bitti!";
                Session["timeout"] = null;

                ProcessQuestion();
                SinavOlustur sinav = (SinavOlustur)Session["sinav"];

                panelSinavSonucu.Visible = true;
                beforeCreateExam.Visible = false;
                afterCreateExam.Visible = false;

                // sınav sonucunun gösterilmesi
                lblDers.Text = dropDersler.SelectedItem.Text;
                lblSinav.Text = dropSinavlar.SelectedItem.Text;
                lblBaslama.Text = sinav.baslama_zamani.ToString();
                TimeSpan ts = DateTime.Now.Subtract(sinav.baslama_zamani);
                lblMin.Text = ts.Minutes.ToString();
                lblNquestions.Text = sinav.soru_sayisi.ToString();

                // doğru cevap kontrolu
                int cnt = 0;
                foreach (Sorular q in sinav.sorular)
                {
                    if (q.DogruMu())
                        cnt++;
                }

                lblNcans.Text = cnt.ToString();
                sinav.dogru_sayisi = cnt;
                Session.Add("sinav", sinav);

                double sonuc = cnt * 100 / sinav.soru_sayisi;

                lblGrade.Text = "% " + sonuc;

                baglanti.Open();
                string sorgu = "INSERT INTO Sonuclar VALUES(@kadi,@ders_adi,@sinav_adi,@soru_sayisi,@dogru_sayisi,@oran,@baslama,getdate())";
                SqlCommand komut = new SqlCommand(sorgu, baglanti);
                komut.Parameters.AddWithValue("@kadi", kullanici);
                komut.Parameters.AddWithValue("@ders_adi", dropDersler.SelectedItem.Text);
                komut.Parameters.AddWithValue("@sinav_adi", dropSinavlar.SelectedItem.Text);
                komut.Parameters.AddWithValue("@soru_sayisi", sinav.soru_sayisi);
                komut.Parameters.AddWithValue("@dogru_sayisi", sinav.dogru_sayisi);
                komut.Parameters.AddWithValue("@oran", sonuc);
                komut.Parameters.AddWithValue("@baslama", sinav.baslama_zamani);
                komut.ExecuteNonQuery();
                baglanti.Close();
            }
        }

    }
}