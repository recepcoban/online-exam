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
    public partial class Giris : System.Web.UI.Page
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
            }
            else
            {
                hyperSession.Text = "Hoşgeldin, " + kullanici.ToString();
                hyperSession.NavigateUrl = "Profil.aspx";
                btnMenuGiris.Visible = false;
                btnCikis.Visible = true;
                kullanici_islemleri.Enabled = false;
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

        // kullanıcı girişi
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            lblGirisOK.Text = "";
            lblGirisFAIL.Text = "";

            if (txtGirisKadi.Text.Equals("") || txtGirisParola.Text.Equals(""))
            {
                lblGirisFAIL.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {

                try
                {

                    String sorgu = "SELECT * FROM Kullanici WHERE kadi = @kadi AND parola = @parola";
                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@kadi", txtGirisKadi.Text);
                    komut.Parameters.AddWithValue("@parola", MD5Olustur(txtGirisParola.Text));

                    baglanti.Open();

                    SqlDataReader dr = komut.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 20;
                        Session.Add("kullanici", dr["kadi"].ToString());

                        kullanici = Session["kullanici"];
                        hyperSession.Text = "Hoşgeldin, " + kullanici.ToString();
                        hyperSession.NavigateUrl = "Profil.aspx";
                        btnMenuGiris.Visible = false;
                        btnCikis.Visible = true;
                    
                        Response.Redirect("Profil.aspx");
                        kullanici_islemleri.Enabled = false;

                        txtGirisKadi.Text = "";
                        txtGirisParola.Text = "";

                    }
                    else
                    {
                        lblGirisFAIL.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                    }

                }
                catch (Exception)
                {
                    lblGirisFAIL.Text = "Hatalı giriş, lütfen bilgileri kontrol ediniz!";
                }
                finally
                {
                    baglanti.Close();
                }

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

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            kullanici_islemleri.Enabled = true;
            hyperSession.Text = "";
            btnCikis.Visible = false;
            btnMenuGiris.Visible = true;            
        }

        // kullanıcı kayıt
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            lblKayitOK.Text = "";
            lblKayitFAIL.Text = "";

            if (txtKayitKadi.Text.Equals("") || txtKayitAdi.Text.Equals("") || txtKayitSoyadi.Text.Equals("") || txtKayitEposta.Text.Equals("") || txtKayitParola.Text.Equals("") || txtKayitParolaTekrar.Text.Equals(""))
            {
                lblKayitFAIL.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {
                try
                {
                    baglanti.Open();
                    SqlCommand select = new SqlCommand("SELECT * FROM Kullanici WHERE kadi = '" + txtKayitKadi.Text + "'", baglanti);

                    int varsa = Convert.ToInt32(select.ExecuteScalar());
                    if (varsa == 0)
                    {
                        try
                        {
                            string sorgu = "INSERT INTO Kullanici VALUES(@kadi,@adi,@soyadi,@eposta,@parola,@resim)";
                            SqlCommand komut = new SqlCommand(sorgu, baglanti);
                            komut.Parameters.AddWithValue("@kadi", txtKayitKadi.Text);
                            komut.Parameters.AddWithValue("@adi", txtKayitAdi.Text);
                            komut.Parameters.AddWithValue("@soyadi", txtKayitSoyadi.Text);
                            komut.Parameters.AddWithValue("@eposta", txtKayitEposta.Text);
                            komut.Parameters.AddWithValue("@parola", MD5Olustur(txtKayitParola.Text));
                            komut.Parameters.AddWithValue("@resim", "../img/profil/userfoto.jpg");
                            komut.ExecuteNonQuery();
                            baglanti.Close();

                            lblKayitOK.Text = "Kayıt Başarıyla Gerçekleştirildi.";

                            txtKayitKadi.Text = "";
                            txtKayitAdi.Text = "";
                            txtKayitSoyadi.Text = "";
                            txtKayitEposta.Text = "";
                            txtKayitParola.Text = "";
                            txtKayitParolaTekrar.Text = "";
                        }
                        catch (Exception)
                        {
                            lblKayitFAIL.Text = "Kayıt Ekleme Başarısız!";
                        }
                    }
                    else
                    {
                        lblKayitFAIL.Text = "Bu Kullanıcı Adı Zaten Kullanılmaktadır!";
                    }
                }
                catch (Exception)
                {
                    lblKayitFAIL.Text = "Kayıt Ekleme Başarısız!";
                }
                finally
                {
                    baglanti.Close();
                }

            }
        }

    }
}