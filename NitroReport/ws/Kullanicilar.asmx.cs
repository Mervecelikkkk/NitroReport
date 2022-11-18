using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NitroReport.ws
{
    /// <summary>
    /// Summary description for Kullanicilar
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Kullanicilar : System.Web.Services.WebService
    {
        public class KullaniciBilgisi
        {
            public int id { get; set; }
            public string adi { get; set; }
            public string kullaniciAdi { get; set; }
            public string sifre { get; set; }
            public string aktif { get; set; }
            public string aktifString { get; set; }
            public string kullaniciTuru { get; set; }
            public string GSM { get; set; }
            public string il { get; set; }
            public int totalSayi { get; set; }


        }


        [WebMethod]

        public Result Kaydet(KullaniciBilgisi data)
        {
            Result result = new Result();


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCs"]))



            {
                SqlCommand cmd = new SqlCommand("insert into Kullanicilar (adi, kullaniciAdi, sifre, aktif, kullaniciTuru, GSM, il) values (@adi, @kullaniciAdi, @sifre, @aktif, @kullaniciTuru, @GSM,@il ) ", conn);
                if (data.id > 0)
                {
                    cmd = new SqlCommand("update Kullanicilar SET adi=@adi, kullaniciAdi=@kullaniciAdi, sifre=@sifre, aktif=@aktif,kullaniciTuru=@kullaniciTuru,  GSM=@GSM, il=@il  WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", data.id);
                }
                cmd.Parameters.AddWithValue("@adi", data.adi);
                cmd.Parameters.AddWithValue("@kullaniciAdi", data.kullaniciAdi);
                cmd.Parameters.AddWithValue("@sifre", data.sifre);
                cmd.Parameters.AddWithValue("@aktif", data.aktif);
                cmd.Parameters.AddWithValue("@kullaniciTuru", data.kullaniciTuru);
                cmd.Parameters.AddWithValue("@GSM", data.GSM);
                cmd.Parameters.AddWithValue("@il", data.il);






                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();


            }


            return result;



        }



        [WebMethod]

        public Result Sil(int id)
        {
            Result result = new Result();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("DELETE from Kullanicilar WHERE id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }





            return result;
        }





        [WebMethod]

        public List<KullaniciBilgisi> Listele()
        {
            List<KullaniciBilgisi> listeKullaniciBilgisi = new List<KullaniciBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("Select* from Kullanicilar", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    KullaniciBilgisi kullaniciBilgisi = new KullaniciBilgisi();

                    kullaniciBilgisi.id = Convert.ToInt32(dr["id"]);
                    kullaniciBilgisi.adi = (dr["adi"]).ToString();
                    kullaniciBilgisi.kullaniciAdi = (dr["kullaniciAdi"]).ToString();
                    kullaniciBilgisi.sifre = (dr["sifre"]).ToString();
                    kullaniciBilgisi.aktif = (dr["aktif"].ToString());
                    kullaniciBilgisi.kullaniciTuru = (dr["kullaniciTuru"]).ToString();
                    kullaniciBilgisi.GSM =(dr["GSM"]).ToString();
                    kullaniciBilgisi.il =(dr["il"]).ToString();
                    listeKullaniciBilgisi.Add(kullaniciBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeKullaniciBilgisi;
        }



        [WebMethod]
        public KullaniciBilgisi DetayGetir(int id)
        {

            KullaniciBilgisi kullaniciBilgisi = new KullaniciBilgisi();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("Select* from Kullanicilar WHERE id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {



                    kullaniciBilgisi.id = Convert.ToInt32(dr["id"]);
                    kullaniciBilgisi.adi = (dr["adi"]).ToString();
                    kullaniciBilgisi.kullaniciAdi = (dr["kullaniciAdi"]).ToString();
                    kullaniciBilgisi.sifre = (dr["sifre"]).ToString();
                    //kullaniciBilgisi.aktif =(dr["aktif"].ToString());
                    kullaniciBilgisi.kullaniciTuru = (dr["kullaniciTuru"]).ToString();
                  

                }
                dr.Close();
                conn.Close();
            }

            return kullaniciBilgisi;
        }



    }
}








