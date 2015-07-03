using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinavSistemi.egitmen
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db_sinav_sistemi"].ConnectionString);

        public object egitmen;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            egitmen = Session["egitmen"];

            if (egitmen == null)
            {
                Response.Redirect("Giris.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    try
                    {
                        string sorgu1 = "SELECT * FROM Egitmen WHERE kadi = @kadi";
                        SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                        komut1.Parameters.AddWithValue("@kadi", egitmen);

                        baglanti.Open();

                        SqlDataReader dr1 = komut1.ExecuteReader();

                        if (dr1.Read())
                        {
                            // profil
                            imgProfilResim.ImageUrl = dr1["resim"].ToString();
                            lblKadi.Text = dr1["kadi"].ToString();
                            lblAdi.Text = dr1["adi"].ToString();
                            lblSoyadi.Text = dr1["soyadi"].ToString();
                            lblEposta.Text = dr1["eposta"].ToString();

                            lblSession.Text = "Hoşgeldin, " + dr1["adi"].ToString() + " " + dr1["soyadi"].ToString();
                        }
                        else
                        {
                            imgProfilResim.AlternateText = "Kayıt Bulunamadı!";
                            lblKadi.Text = "Kayıt Bulunamadı!";
                            lblAdi.Text = "Kayıt Bulunamadı!";
                            lblSoyadi.Text = "Kayıt Bulunamadı!";
                            lblEposta.Text = "Kayıt Bulunamadı!";
                        }

                    }
                    catch (Exception)
                    {

                        imgProfilResim.AlternateText = "Hatalı erişim!";
                        lblKadi.Text = "Hatalı erişim!";
                        lblAdi.Text = "Hatalı erişim!";
                        lblSoyadi.Text = "Hatalı erişim!";
                        lblEposta.Text = "Hatalı erişim!";

                    }
                    finally
                    {
                        baglanti.Close();
                    }

                    try
                    {
                        SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Dersler", baglanti);
                        DataTable tbl = new DataTable();
                        adptr.Fill(tbl);
                        dropDersler.DataSource = tbl;
                        dropDersler.DataTextField = "ders_adi";
                        dropDersler.DataValueField = "ders_id";
                        dropDersler.DataBind();

                        lstSinavDersler.DataSource = tbl;
                        lstSinavDersler.DataTextField = "ders_adi";
                        lstSinavDersler.DataValueField = "ders_id";
                        lstSinavDersler.DataBind();

                        sorular_ders.DataSource = tbl;
                        sorular_ders.DataTextField = "ders_adi";
                        sorular_ders.DataValueField = "ders_id";
                        sorular_ders.DataBind();
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                    finally
                    {
                        baglanti.Close();
                    }

                    try
                    {
                        string sorgu2 = "SELECT * FROM Kullanici ORDER BY id";
                        SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                        baglanti.Open();
                        SqlDataReader dr2 = komut2.ExecuteReader();
                        lstKullanicilar.DataSource = dr2;
                        lstKullanicilar.DataBind();

                    }
                    catch (Exception)
                    {

                    }
                    finally
                    {
                        baglanti.Close();
                    }

                }

            }

        }

        // sinav ekleme
        protected void btnSinavEkle_Click(object sender, EventArgs e)
        {
            try
            {
                lblSinavOK.Text = "";
                lblSinavFAIL.Text = "";

                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Sinavlar WHERE sinav_adi = '" + txtSinavAdi.Text + "'", baglanti);

                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Sinavlar VALUES(@sinav_adi, @sinav_sure, @ders_id, @soru_var_mi)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@sinav_adi", txtSinavAdi.Text);
                        komut.Parameters.AddWithValue("@sinav_sure", Convert.ToInt32(txtSinavSuresi.Text));
                        komut.Parameters.AddWithValue("@ders_id", lstSinavDersler.SelectedValue);
                        komut.Parameters.AddWithValue("@soru_var_mi", 0);
                        komut.ExecuteNonQuery();
                        baglanti.Close();

                        lblSinavOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";
                        GridView1.DataBind(); // sınavlar
                        UpdatePanel3.Update(); // sınavlar
                        UpdatePanel4.Update(); // soru ekle

                        txtSinavAdi.Text = "";

                        lstSinavDersler.Items.Clear();
                        lstSinavDersler.DataBind();
                        lstSinavDersler.Items.Add("Ders Seçiniz");

                        try
                        {
                            SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Dersler", baglanti);
                            DataTable tbl = new DataTable();
                            adptr.Fill(tbl);
                            lstSinavDersler.DataSource = tbl;
                            lstSinavDersler.DataTextField = "ders_adi";
                            lstSinavDersler.DataValueField = "ders_id";
                            lstSinavDersler.DataBind();
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
                    catch (Exception)
                    {
                        lblSinavFAIL.Text = "Kayıt Ekleme Başarısız!";
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
                else
                {
                    lblSinavFAIL.Text = "Bu Ders Zaten Kayıtlıdır!";
                }

            }
            catch (Exception)
            {
                lblSinavFAIL.Text = "Kayıt Ekleme Başarısız!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // ders ekleme
        protected void btnDersEkle_Click(object sender, EventArgs e)
        {
            try
            {
                lblDersOK.Text = "";
                lblDersFAIL.Text = "";

                baglanti.Open();
                SqlCommand select = new SqlCommand("SELECT * FROM Dersler WHERE ders_adi = '" + txtDersAdi.Text + "'", baglanti);

                int varsa = Convert.ToInt32(select.ExecuteScalar());
                if (varsa == 0)
                {
                    try
                    {
                        string sorgu = "INSERT INTO Dersler (ders_adi) VALUES(@ders_adi)";
                        SqlCommand komut = new SqlCommand(sorgu, baglanti);
                        komut.Parameters.AddWithValue("@ders_adi", txtDersAdi.Text);
                        komut.ExecuteNonQuery();
                        baglanti.Close();

                        lblDersOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";
                        GridView2.DataBind(); // dersler
                        GridView1.DataBind(); // sınavlar
                        UpdatePanel3.Update(); // sınavlar
                        UpdatePanel4.Update(); // soru ekle

                        txtDersAdi.Text = "";
                    }
                    catch (Exception)
                    {
                        lblDersFAIL.Text = "Kayıt Ekleme Başarısız!";
                    }
                    finally
                    {
                        baglanti.Close();
                    }
                }
                else
                {
                    lblDersFAIL.Text = "Bu Ders Zaten Kayıtlıdır!";
                }

            }
            catch (Exception)
            {
                lblDersFAIL.Text = "Kayıt Ekleme Başarısız!";
            }
            finally
            {
                baglanti.Close();
            }
        }

        // soru eklemede seçilen derse göre sinavların getirilmesi
        protected void dropDersler_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropSinavlar.Items.Clear();
            dropSinavlar.Items.Add("Sınav Seçiniz");

            try
            {
                SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Sinavlar WHERE ders_id = " + dropDersler.SelectedItem.Value, baglanti);
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

        // soru ekleme
        protected void btnSoruEkle_Click(object sender, EventArgs e)
        {
            lblSoruOK.Text = "";
            lblSoruFAIL.Text = "";

            if (dropDogruCevap.SelectedIndex == 0)
            {
                lblSoruFAIL.Text = "Lütfen Doğru Cevabı Seçiniz!";
            }
            else
            {
                string sekil = "";
                string tarih = DateTime.Now.ToString("yyyyMMddHHmmss");

                if (fileSoruSekil.HasFile)
                {
                    fileSoruSekil.SaveAs(Request.PhysicalApplicationPath + "img\\soru\\" + dropSinavlar.SelectedValue + "-" + tarih + "-" + fileSoruSekil.FileName);
                    sekil = "../img/soru/" + dropSinavlar.SelectedValue + "-" + tarih + "-" + fileSoruSekil.FileName;
                }
                else
                {
                    sekil = "../img/soru/sekil.jpg";
                }
                
                try
                {
                    baglanti.Open();

                    string sorgu = "INSERT INTO Sorular VALUES(@ders_id,@sinav_id,@soru_aciklama,@soru_resim,@soru_cvp1,@soru_cvp2,@soru_cvp3,@soru_cvp4,@dogru_cvp)";
                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@ders_id", dropDersler.SelectedValue);
                    komut.Parameters.AddWithValue("@sinav_id", dropSinavlar.SelectedValue);
                    komut.Parameters.AddWithValue("@soru_aciklama", txtSoru.Text);
                    komut.Parameters.AddWithValue("@soru_resim", sekil);
                    komut.Parameters.AddWithValue("@soru_cvp1", txtCvp1.Text);
                    komut.Parameters.AddWithValue("@soru_cvp2", txtCvp2.Text);
                    komut.Parameters.AddWithValue("@soru_cvp3", txtCvp3.Text);
                    komut.Parameters.AddWithValue("@soru_cvp4", txtCvp4.Text);
                    komut.Parameters.AddWithValue("@dogru_cvp", dropDogruCevap.SelectedItem.Text);
                    komut.ExecuteNonQuery();
                    baglanti.Close();

                    // soru eklenınce soru_var_mi = 1 oluyor
                    baglanti.Open();
                    string sorgu2 = "UPDATE Sinavlar SET soru_var_mi = @soru_var_mi WHERE sinav_id = @sinav_id";
                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                    komut2.Parameters.AddWithValue("@soru_var_mi", 1);
                    komut2.Parameters.AddWithValue("@sinav_id", dropSinavlar.SelectedValue);
                    komut2.ExecuteNonQuery();

                    lblSoruOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";

                    dropDersler.SelectedIndex = 0;
                    dropSinavlar.SelectedIndex = 0;
                    txtSoru.Text = "";
                    txtCvp1.Text = "";
                    txtCvp2.Text = "";
                    txtCvp3.Text = "";
                    txtCvp4.Text = "";
                    dropDogruCevap.SelectedIndex = 0;

                }
                catch (Exception ex)
                {
                    lblSoruFAIL.Text = ex.Message;
                }
                finally
                {
                    baglanti.Close();
                }
            }

        }

        // ayarlar
        protected void btnBilgiGetir_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu1 = "SELECT * FROM Egitmen WHERE kadi = @kadi";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                komut1.Parameters.AddWithValue("@kadi", egitmen);

                baglanti.Open();

                SqlDataReader dr1 = komut1.ExecuteReader();

                if (dr1.Read())
                {
                    // ayarlar
                    txtAyarKadi.Text = dr1["kadi"].ToString();
                    txtAyarAdi.Text = dr1["adi"].ToString();
                    txtAyarSoyadi.Text = dr1["soyadi"].ToString();
                    txtAyarEposta.Text = dr1["eposta"].ToString();
                }
                else
                {
                    txtAyarKadi.Text = "Kayıt Bulunamadı!";
                    txtAyarAdi.Text = "Kayıt Bulunamadı!";
                    txtAyarSoyadi.Text = "Kayıt Bulunamadı!";
                    txtAyarEposta.Text = "Kayıt Bulunamadı!";
                }

            }
            catch (Exception)
            {
                txtAyarKadi.Text = "Hatalı erişim!";
                txtAyarAdi.Text = "Hatalı erişim!";
                txtAyarSoyadi.Text = "Hatalı erişim!";
                txtAyarEposta.Text = "Hatalı erişim!";


            }
            finally
            {
                baglanti.Close();
            }
        }

        // session çıkış
        protected void sessionCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Giris.aspx");
        }

        // ayarları güncelleme
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu2 = "UPDATE Egitmen SET eposta = @eposta, parola = @parola WHERE kadi = @kadi";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                komut2.Parameters.AddWithValue("@kadi", egitmen);
                komut2.Parameters.AddWithValue("@eposta", txtAyarEposta.Text);
                komut2.Parameters.AddWithValue("@parola", MD5Olustur(txtAyarParola.Text));

                baglanti.Open();

                int durum = komut2.ExecuteNonQuery();
                if (durum == 1)
                {
                    lblAyarOK.Text = "Güncelleme işlemi başarıyla gerçekleştirildi.";
                }
                else
                {
                    lblAyarFAIL.Text = "Güncelleme işlemi başarısız!";
                }

                txtAyarParola.Text = "";
                txtAyarParolaTekrar.Text = "";
            }
            catch (Exception ex)
            {
                lblAyarFAIL.Text = "Hata : " + ex;
            }
            finally
            {
                baglanti.Close();
            }
        }

        // md5 şifreleme
        public string MD5Olustur(string input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        // profil resmi yükleme
        protected void btnResimYukle_Click(object sender, EventArgs e)
        {
            lblResimHata.Text = "";
            lblResimOK.Text = "";

            if (FileProfilResim.HasFile)
                try
                {
                    FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + egitmen + "-" + FileProfilResim.FileName);

                    string sorgu2 = "UPDATE Egitmen SET resim = @resim WHERE kadi = @kadi";
                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                    komut2.Parameters.AddWithValue("@kadi", egitmen);
                    komut2.Parameters.AddWithValue("@resim", "../img/profil/" + egitmen + "-" + FileProfilResim.FileName);

                    baglanti.Open();

                    int durum = komut2.ExecuteNonQuery();
                    if (durum == 1)
                    {
                        lblResimOK.Text = "Dosya Yükleme Başarılı";
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        lblResimHata.Text = "Dosya Yükleme Başarısız!";
                    }

                }
                catch (Exception ex)
                {
                    lblResimHata.Text = "Hata : " + ex.Message.ToString();
                }
            else
            {
                lblResimHata.Text = "Lütfen Dosya Seçin!";
            }
        }

        // kullanıcı arama
        protected void btnKulAra_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu2 = "SELECT * FROM Kullanici WHERE adi LIKE '%" + txtKulAra.Text + "%'";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                baglanti.Open();
                SqlDataReader dr2 = komut2.ExecuteReader();
                lstKullanicilar.DataSource = dr2;
                lstKullanicilar.DataBind();

            }
            catch (Exception)
            {

            }
            finally
            {
                baglanti.Close();
            }
        }

        // sorularda seçilen derse göre sinavların getirilmesi
        protected void sorular_ders_SelectedIndexChanged(object sender, EventArgs e)
        {
            sorular_sinav.Items.Clear();
            sorular_sinav.DataBind();
            sorular_sinav.Items.Add("Sınav Seçiniz");

            try
            {
                SqlDataAdapter adptr = new SqlDataAdapter("SELECT * FROM Sinavlar WHERE ders_id = " + sorular_ders.SelectedItem.Value + " AND soru_var_mi = 1", baglanti);
                DataTable tbl = new DataTable();
                adptr.Fill(tbl);
                sorular_sinav.DataSource = tbl;
                sorular_sinav.DataTextField = "sinav_adi";
                sorular_sinav.DataValueField = "sinav_id";
                sorular_sinav.DataBind();
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

        // sorularda seçilen sınava göre soruların getirilmesi
        protected void sorular_sinav_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvSoruListesi.SelectParameters["sinav_id"].DefaultValue = sorular_sinav.SelectedItem.Value.ToString();
            GridView3.DataBind(); // sorular
            UpdatePanel5.Update(); // sorular
        }
    }
}