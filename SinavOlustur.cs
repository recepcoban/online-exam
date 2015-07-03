using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SinavSistemi
{
    public class SinavOlustur
    {
        public String kadi;
        public int ders_id;
        public int sinav_id;
        public int dogru_sayisi;
        public List<Sorular> sorular;
        public int soru_sayisi = 0;
        public DateTime baslama_zamani;
        public int soru_no = 0;

        public SinavOlustur(String kadi, int ders_id, int sinav_id)
        {
            this.kadi = kadi;
            this.ders_id = ders_id;
            this.sinav_id = sinav_id;
            baslama_zamani = DateTime.Now;
        }

        public void SoruGetir()
        {
            SqlConnection baglanti = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["db_sinav_sistemi"].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Sorular WHERE ders_id = " + ders_id + " AND sinav_id = " + sinav_id + "", baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds, "sinav");

            soru_sayisi = ds.Tables[0].Rows.Count;

            sorular = new List<Sorular>();
            DataRow dr;
            Sorular sr;
            for (int i = 0; i < soru_sayisi; i++)
            {
                dr = ds.Tables[0].Rows[i];
                sr = new Sorular(dr["soru_aciklama"].ToString(), dr["soru_resim"].ToString(), dr["soru_cvp1"].ToString(), dr["soru_cvp2"].ToString(), dr["soru_cvp3"].ToString(), dr["soru_cvp4"].ToString(), dr["dogru_cvp"].ToString());
                sorular.Add(sr);
            }

        }
    }
}