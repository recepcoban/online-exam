using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinavSistemi.egitmen
{
    public partial class Giris : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db_sinav_sistemi"].ConnectionString);

        public object egitmen;

        // page load
        protected void Page_Load(object sender, EventArgs e)
        {
            egitmen = Session["egitmen"];
            if (egitmen != null)
            {
                Response.Redirect("Default.aspx");
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

        // yönetici giriş işlemi
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            lblGirisOK.Text = "";
            lblGirisFAIL.Text = "";

            if (txtKadi.Text.Equals("") || txtParola.Text.Equals(""))
            {
                lblGirisFAIL.Text = "Boş Alan Bırakmayınız!";
            }
            else
            {
                try
                {
                    String sorgu = "SELECT * FROM Egitmen WHERE kadi = @kadi AND parola = @parola";
                    SqlCommand komut = new SqlCommand(sorgu, baglanti);
                    komut.Parameters.AddWithValue("@kadi", txtKadi.Text);
                    komut.Parameters.AddWithValue("@parola", MD5Olustur(txtParola.Text));

                    baglanti.Open();

                    SqlDataReader dr = komut.ExecuteReader();
                    if (dr.Read())
                    {
                        Session.Timeout = 20;
                        Session.Add("egitmen", dr["kadi"].ToString());
                        lblGirisOK.Text = "Giriş Başarılı, Yönlendiriliyorsunuz...";

                        txtKadi.Text = "";
                        txtParola.Text = "";

                        Response.Redirect("Default.aspx");

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

    }
}