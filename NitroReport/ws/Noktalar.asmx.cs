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
    /// Summary description for Noktalar
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Noktalar : System.Web.Services.WebService
    {

        public class NoktaBilgisi
        {

            public int id { get; set; }
            public string noktaAdi { get; set; }
            public string il { get; set; }
            public string ilce { get; set; }
            public string adres1 { get; set; }
            public string adres2 { get; set; }
            public string bayiid { get; set; }
            public string bayiTipi { get; set; }
            public string yetkiliAdi { get; set; }
            public string kapiNo { get; set; }
            public int uygulamaSayisi { get; set; }
            public int totalSayi { get; set; }
        }





        [WebMethod]

        public Result Kaydet(NoktaBilgisi data)
        {
            Result result = new Result();


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCs"]))



            {
                SqlCommand cmd = new SqlCommand("insert into Noktalar (noktaAdi, il, ilce, adres1, adres2, bayiTipi, yetkiliAdi, kapiNo) values (@noktaAdi, @il, @ilce, @adres1,@adres2, @bayiTipi, @yetkiliAdi, @kapiNo) ", conn);
                if (data.id > 0)
                {
                    cmd = new SqlCommand("update Noktalar SET noktaAdi=@noktaAdi, il=@il, ilce=@ilce, adres1=@adres1, adres2=@adres2,bayiTipi=@bayiTipi, yetkiliAdi=@yetkliAdi, kapiNo=@kapiNo  WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", data.id);
                }
                cmd.Parameters.AddWithValue("@noktaAdi",data.noktaAdi);
                cmd.Parameters.AddWithValue("@il", data.il);
                cmd.Parameters.AddWithValue("@ilce", data.ilce);
                cmd.Parameters.AddWithValue("@adres1", data.adres1);
                cmd.Parameters.AddWithValue("@adres2", data.adres2);
                cmd.Parameters.AddWithValue("@bayiTipi", data.bayiTipi);
                cmd.Parameters.AddWithValue("@yetkiliAdi", data.yetkiliAdi);
                cmd.Parameters.AddWithValue("@kapiNo", data.kapiNo);
                






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
                SqlCommand cmd = new SqlCommand("DELETE from Noktalar WHERE id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }





            return result;
        }





        [WebMethod]

        public List<NoktaBilgisi> Listele()
        {
            List<NoktaBilgisi> listeNoktaBilgisi = new List<NoktaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("Select* from Noktalar order by noktaadi", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    NoktaBilgisi noktaBilgisi = new NoktaBilgisi();

                    noktaBilgisi.id = Convert.ToInt32(dr["id"]);
                    noktaBilgisi.noktaAdi = (dr["noktaAdi"]).ToString();
                    noktaBilgisi.il = (dr["il"]).ToString();
                    noktaBilgisi.ilce = dr["ilce"].ToString();
                    noktaBilgisi.adres1 = dr["adres1"].ToString();
                    noktaBilgisi.adres2 = dr["adres2"].ToString();
                    noktaBilgisi.bayiid = dr["bayiid"].ToString();
                    noktaBilgisi.yetkiliAdi = dr["yetkiliAdi"].ToString();
                    noktaBilgisi.bayiTipi = dr["bayiTipi"].ToString();
                    noktaBilgisi.kapiNo = dr["kapiNo"].ToString();


                    listeNoktaBilgisi.Add(noktaBilgisi);
                }

                dr.Close();
                conn.Close();


            }

            return listeNoktaBilgisi;
        }



        [WebMethod]
        public NoktaBilgisi DetayGetir(int id)
        {

            NoktaBilgisi noktaBilgisi= new NoktaBilgisi();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("Select* from Firmalar WHERE id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {


                    noktaBilgisi.id = Convert.ToInt32(dr["id"]);
                    noktaBilgisi.noktaAdi = (dr["noktaAdi"]).ToString();
                    noktaBilgisi.il = (dr["il"]).ToString();
                    noktaBilgisi.ilce = dr["ilce"].ToString();
                    noktaBilgisi.adres1 = dr["adres1"].ToString();

                }
                dr.Close();
                conn.Close();
            }

            return noktaBilgisi;
        }



    }
}







