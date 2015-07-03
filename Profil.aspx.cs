using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinavSistemi
{
    public partial class Profil : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db_sinav_sistemi"].ConnectionString);

        public object kullanici;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanici = Session["kullanici"];

            if (kullanici == null)
            {
                hyperSession.Text = "";
                btnMenuGiris.Visible = true;
                btnCikis.Visible = false;
                Response.Redirect("Giris.aspx");
            }
            else
            {
                hyperSession.NavigateUrl = "Profil.aspx";
                btnMenuGiris.Visible = false;
                btnCikis.Visible = true;

                try
                {
                    string sorgu1 = "SELECT * FROM Kullanici WHERE kadi = @kadi";
                    SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                    komut1.Parameters.AddWithValue("@kadi", kullanici);

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

                        hyperSession.Text = "Hoşgeldin, " + dr1["adi"].ToString() + " " + dr1["soyadi"].ToString();
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

                try
                {
                    string sorgu2 = "SELECT * FROM Sonuclar WHERE kadi = '" + kullanici +"'";
                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                    baglanti.Open();
                    SqlDataReader dr2 = komut2.ExecuteReader();
                    lstSonuclar.DataSource = dr2;
                    lstSonuclar.DataBind();

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

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        // profil resmi yükleme
        protected void btnResimYukle_Click(object sender, EventArgs e)
        {
            lblResimHata.Text = "";
            lblResimOK.Text = "";

            if (FileProfilResim.HasFile)
                try
                {
                    FileProfilResim.SaveAs(Request.PhysicalApplicationPath + "img\\profil\\" + kullanici + "-" + FileProfilResim.FileName);

                    string sorgu2 = "UPDATE Kullanici SET resim = @resim WHERE kadi = @kadi";
                    SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                    komut2.Parameters.AddWithValue("@kadi", kullanici);
                    komut2.Parameters.AddWithValue("@resim", "../img/profil/" + kullanici + "-" + FileProfilResim.FileName);

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

        // ayarlar - bilgi getirme
        protected void btnBilgiGetir_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu1 = "SELECT * FROM Kullanici WHERE kadi = @kadi";
                SqlCommand komut1 = new SqlCommand(sorgu1, baglanti);
                komut1.Parameters.AddWithValue("@kadi", kullanici);

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

        // ayarlar - güncelleme
        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                string sorgu2 = "UPDATE Kullanici SET eposta = @eposta, parola = @parola WHERE kadi = @kadi";
                SqlCommand komut2 = new SqlCommand(sorgu2, baglanti);
                komut2.Parameters.AddWithValue("@kadi", kullanici);
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

    }
}