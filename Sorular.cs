using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinavSistemi
{
    public class Sorular
    {
        public String soru, resim;
        public String cvp1, cvp2, cvp3, cvp4, dogru_cvp, secilen_cvp;

        public String SoruTest
        {
            get { return soru; }
        }

        public String SoruResim
        {
            get { return resim; }
        }

        public String Cevap1
        {
            get { return cvp1; }
        }

        public String Cevap2
        {
            get { return cvp2; }
        }

        public String Cevap3
        {
            get { return cvp3; }
        }

        public String Cevap4
        {
            get { return cvp4; }
        }

        public String DogruCevap
        {
            get { return dogru_cvp; }
        }

        public String SecilenCevap
        {
            get { return secilen_cvp; }
        }

        public Sorular(String soru, String resim, String cvp1, String cvp2, String cvp3, String cvp4, String dogru_cvp)
        {
            this.soru = soru;
            this.resim = resim;
            this.cvp1 = cvp1;
            this.cvp2 = cvp2;
            this.cvp3 = cvp3;
            this.cvp4 = cvp4;
            this.dogru_cvp = dogru_cvp;
        }

        public bool DogruMu()
        {
            return secilen_cvp.Equals(dogru_cvp);
        }
    }
}