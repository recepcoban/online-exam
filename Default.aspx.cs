using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SinavSistemi
{
    public partial class Default : System.Web.UI.Page
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

        // session çıkış
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            hyperSession.Text = "";
            btnMenuGiris.Visible = true;
            btnCikis.Visible = false;
        }
    }
}