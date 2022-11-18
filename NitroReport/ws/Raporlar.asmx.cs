using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;


namespace NitroReport.ws
{
    /// <summary>
    /// Summary description for Raporlar
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

    [System.Web.Script.Services.ScriptService]
    public class Raporlar : System.Web.Services.WebService
    {

        public class RaporBilgisi
        {
            public int id { get; set; }


        }





        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> PersonelListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("select  K.adi AS personelAdi, COUNT(U.id) AS uygulamaSayisi FROM Uygulamalar U LEFT JOIN Kullanicilar K ON K.id=U.personelid  GROUP By K.adi", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.adi = (dr["personelAdi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }





        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> DurumListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("select bayiyeGidildigindeUygYapilmismi, COUNT(bayiyeGidildigindeUygYapilmismi) AS uygulamaSayisi From Uygulamalar  Group by bayiyeGidildigindeUygYapilmismi", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.bayiyeGidildigindeUygYapilmismi = (dr["bayiyeGidildigindeUygYapilmismi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }








        [WebMethod]

        public List<Noktalar.NoktaBilgisi> ilListele()
        {
            List<Noktalar.NoktaBilgisi> listeNoktaBilgisi = new List<Noktalar.NoktaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("select il, COUNT(U.id) AS uygulamaSayisi From Noktalar N LEFT JOIN Uygulamalar U ON U.noktaid=N.id Group by il", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Noktalar.NoktaBilgisi noktaBilgisi = new Noktalar.NoktaBilgisi();



                    noktaBilgisi.il = (dr["il"]).ToString();
                    noktaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeNoktaBilgisi.Add(noktaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeNoktaBilgisi;
        }





        [WebMethod]

        public List<Noktalar.NoktaBilgisi> ilceListele()
        {
            List<Noktalar.NoktaBilgisi> listeNoktaBilgisi = new List<Noktalar.NoktaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("select ilce, COUNT(U.id) AS uygulamaSayisi From Noktalar N LEFT JOIN Uygulamalar U ON U.noktaid=N.id Group by ilce", conn);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Noktalar.NoktaBilgisi noktaBilgisi = new Noktalar.NoktaBilgisi();



                    noktaBilgisi.ilce = (dr["ilce"]).ToString();
                    noktaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeNoktaBilgisi.Add(noktaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeNoktaBilgisi;
        }

        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> TarihListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                //   SqlCommand cmd = new SqlCommand("select convert(varchar(10), uygulamaTarihi, 104) as tarih, count(*) as uygulamaSayisi from uygulamalar group by convert(varchar(10), uygulamaTarihi, 104)", conn);

                SqlCommand cmd = new SqlCommand(@"select convert(varchar(10), uygulamaTarihi, 104) as tarih,
convert(date, convert(varchar(10), u.uygulamaTarihi, 10)) as tarihFormat,
 (select count(*) from uygulamalar where uygulamalar.uygulamaTarihi < convert(date, convert(varchar(10), u.uygulamaTarihi, 10))) as uygulamaSayisi 
 from uygulamalar u group by convert(varchar(10), uygulamaTarihi, 104), convert(varchar(10), u.uygulamaTarihi, 10) order by tarihFormat



", conn);



                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.uygulamaTarihi = (dr["tarih"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }




        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanOnikiAySansListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanOnikiAySans, COUNT(kaziKazanOnikiAySans) AS uygulamaSayisi From Uygulamalar where uygulamaTarihi between @baslangicTarihi and @bitisTarihi Group by kaziKazanOnikiAySans", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanOnikiAySans = (dr["kaziKazanOnikiAySans"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }








        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanSansDagiListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanSansDagi, COUNT(kaziKazanSansDagi) AS uygulamaSayisi From Uygulamalar where uygulamaTarihi between @baslangicTarihi and @bitisTarihi  Group by kaziKazanSansDagi", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
          

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanSansDagi = (dr["kaziKazanSansDagi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }




        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanAltinListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanAltin, COUNT(kaziKazanAltin) AS uygulamaSayisi From Uygulamalar where uygulamaTarihi between @baslangicTarihi and @bitisTarihi Group by kaziKazanAltin", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanAltin = (dr["kaziKazanAltin"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }

        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> MilliPiyangoKlasikBiletListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select milliPiyangoKlasikBilet, COUNT(milliPiyangoKlasikBilet) AS uygulamaSayisi From Uygulamalar  where @baslangicTarihi and @bitisTarihi  Group by milliPiyangoKlasikBilet", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.milliPiyangoKlasikBilet = (dr["milliPiyangoKlasikBilet"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }


        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> SayisalOyunKuponlariListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select sayisalOyunKuponlari, COUNT(sayisalOyunKuponlari) AS uygulamaSayisi From Uygulamalar  Group by sayisalOyunKuponlari", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.sayisalOyunKuponlari = (dr["sayisalOyunKuponlari"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }




        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanUnite_PlanogramListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanUnite_Planogram, COUNT(kaziKazanUnite_Planogram) AS uygulamaSayisi From Uygulamalar  Group by kaziKazanUnite_Planogram", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanUnite_Planogram = (dr["kaziKazanUnite_Planogram"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> OyunKuponUnitesiListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select oyunKuponUnitesi, COUNT(oyunKuponUnitesi) AS uygulamaSayisi From Uygulamalar  Group by oyunKuponUnitesi", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.oyunKuponUnitesi = (dr["oyunKuponUnitesi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }


        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> BirinciDuyuruCercevesiListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select birinciDuyuruCercevesi, COUNT(birinciDuyuruCercevesi) AS uygulamaSayisi From Uygulamalar  Group by birinciDuyuruCercevesi", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.birinciDuyuruCercevesi = (dr["birinciDuyuruCercevesi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> ikinciDuyuruCercevesiListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select ikinciDuyuruCercevesi, COUNT(ikinciDuyuruCercevesi) AS uygulamaSayisi From Uygulamalar  Group by ikinciDuyuruCercevesi", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.ikinciDuyuruCercevesi = (dr["ikinciDuyuruCercevesi"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> SayisalLotoPosterListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select sayisalLotoPoster, COUNT(sayisalLotoPoster) AS uygulamaSayisi From Uygulamalar  Group by sayisalLotoPoster", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.sayisalLotoPoster = (dr["sayisalLotoPoster"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanPosterListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanPoster, COUNT(kaziKazanPoster) AS uygulamaSayisi From Uygulamalar  Group by kaziKazanPoster", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanPoster = (dr["kaziKazanPoster"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> MilliPiyangoPosterListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select milliPiyangoPoster, COUNT(milliPiyangoPoster) AS uygulamaSayisi From Uygulamalar  Group by milliPiyangoPoster", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.milliPiyangoPoster = (dr["milliPiyangoPoster"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> BayrakListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select bayrak, COUNT(bayrak) AS uygulamaSayisi From Uygulamalar  Group by bayrak", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.bayrak = (dr["bayrak"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> StickerListele()
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select sticker, COUNT(sticker) AS uygulamaSayisi From Uygulamalar  Group by sticker", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.sticker = (dr["sticker"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }





        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanSatisListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand(" select kaziKazanSatis, count(*) as uygulamaSayisi from Uygulamalar where uygulamaTarihi between @baslangicTarihi and @bitisTarihi group by kaziKazanSatis ", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanSatis = (dr["kaziKazanSatis"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }

        [WebMethod]

        public List<Noktalar.NoktaBilgisi> GidilmemisNoktaListele()
        {
            List<Noktalar.NoktaBilgisi> listeNoktaBilgisi = new List<Noktalar.NoktaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select* from  noktalar where id not in(select noktaid from uygulamalar)", conn);


                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Noktalar.NoktaBilgisi noktaBilgisi = new Noktalar.NoktaBilgisi();

                    noktaBilgisi.id = Convert.ToInt32(dr["id"]);
                    noktaBilgisi.bayiid = (dr["bayiid"]).ToString();
                    noktaBilgisi.noktaAdi = (dr["noktaAdi"]).ToString();
                    noktaBilgisi.ilce = (dr["ilce"]).ToString();
                    noktaBilgisi.adres1 = (dr["adres1"]).ToString();
                    noktaBilgisi.adres2 = (dr["adres2"]).ToString();
                    noktaBilgisi.kapiNo = (dr["kapiNo"]).ToString();


                    listeNoktaBilgisi.Add(noktaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeNoktaBilgisi;
        }


        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> KaziKazanSatisSebepListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select kaziKazanSatisSebep, count(*) as uygulamaSayisi from Uygulamalar WHERE uygulamaTarihi between @baslangicTarihi and @bitisTarihi and personelid=@personelid and noktaid in (select id from noktalar where il=@il) group by kaziKazanSatisSebep ", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanSatisSebep = (dr["kaziKazanSatisSebep"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }


        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> SiparisSuresiKirilimiListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand(@"select kaziKazanSiparisZaman , count(*) as uygulamaSayisi  from uygulamalar
               where uygulamaTarihi between @baslangicTarihi and @bitisTarihi and personelid=@personelid and noktaid in (select id from noktalar where il=@il)  group by  kaziKazanSiparisZaman ", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.kaziKazanSiparisZaman = (dr["kaziKazanSiparisZaman"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }



                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }


        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> UygulamaPuaniListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand(@"
select 'Kazı Kazan Ünite Planogram' as baslik, count(*) as uygulamaSayisi from uygulamalar where  kaziKazanUnite_Planogram  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Oyun Kupon Ünitesi', count(*) from uygulamalar where  [oyunKuponUnitesi]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Birinci Duyuru Çerçevesi', count(*) from uygulamalar where  [birinciDuyuruCercevesi]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union

select 'İkinci Duyuru Çerçevesi', count(*) from uygulamalar where  [ikinciDuyuruCercevesi]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)

union
select 'Sayısal Loto Poster', count(*) from uygulamalar where  [sayisalLotoPoster]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi 
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Kazı Kazan Poster', count(*) from uygulamalar where  [kaziKazanPoster]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Milli Piyango Poster', count(*) from uygulamalar where  [milliPiyangoPoster]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi 
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Bayrak', count(*) from uygulamalar where  [bayrak]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
union
select 'Sticker', count(*) from uygulamalar where  [sticker]  not like '%Yapılmadı%' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi
 and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.baslik = (dr["baslik"]).ToString();
                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        [WebMethod]

        public List<Uygulamalar.UygulamaBilgisi> MateryalleriListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand(@" 
use NitroReportSisal
select 
 (
 (case when kaziKazanUnite_Planogram not like '%Yapılmadı%' then 1 else 0 end)+
 (case when oyunKuponUnitesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when birinciDuyuruCercevesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when ikinciDuyuruCercevesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when sayisalLotoPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when kaziKazanPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when milliPiyangoPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when bayrak not like '%Yapılmadı%' then 1 else 0 end)+
 (case when sticker not like '%Yapılmadı%' then 1 else 0 end)
 ) as uygulamaPuani, count(*) as uygulamaSayisi

 from uygulamalar where uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)
 group by 
  (
 (case when kaziKazanUnite_Planogram not like '%Yapılmadı%' then 1 else 0 end)+
 (case when oyunKuponUnitesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when birinciDuyuruCercevesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when ikinciDuyuruCercevesi not like '%Yapılmadı%' then 1 else 0 end)+
 (case when sayisalLotoPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when kaziKazanPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when milliPiyangoPoster not like '%Yapılmadı%' then 1 else 0 end)+
 (case when bayrak not like '%Yapılmadı%' then 1 else 0 end)+
 (case when sticker not like '%Yapılmadı%' then 1 else 0 end)
 )", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);

                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();



                    uygulamaBilgisi.uygulamaPuani = Convert.ToInt32(dr["uygulamaPuani"]);

                    uygulamaBilgisi.uygulamaSayisi = Convert.ToInt32(dr["uygulamaSayisi"]);


                    listeUygulamaBilgisi.Add(uygulamaBilgisi);

                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }

        [WebMethod]

        public TotalBilgisi TotalListele(Filtre data)
        {
            TotalBilgisi totalBilgisi = new TotalBilgisi();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {


                conn.Open();

                SqlCommand cmd = new SqlCommand("Select COUNT(noktaAdi) as toplamNokta From Noktalar ", conn);
                totalBilgisi.toplamNokta = (Int32)cmd.ExecuteScalar();

                cmd = new SqlCommand("Select COUNT(id) as ziyaretEdilenNokta From Uygulamalar ", conn);
                totalBilgisi.ziyaretEdilenNokta = (Int32)cmd.ExecuteScalar();

                cmd = new SqlCommand("Select COUNT(id) as ziyaretEdilenNokta From Uygulamalar  where  uygulamaTarihi between @baslangicTarihi and @bitisTarihi", conn);
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
            
                totalBilgisi.seciliTarihtekiNokta = (Int32)cmd.ExecuteScalar();


                cmd = new SqlCommand("select count(bayiyeGidildigindeUygYapilmismi) as uygYapilanNokta from Uygulamalar where bayiyeGidildigindeUygYapilmismi='Evet'", conn);

                totalBilgisi.uygYapilanNokta = (Int32)cmd.ExecuteScalar();

                cmd = new SqlCommand("select count(adi) as calisanPersonel from kullanicilar", conn);
                totalBilgisi.calisanPersonel = (Int32)cmd.ExecuteScalar();



                cmd = new SqlCommand("select count(N.id) as kaziKazanOlanNoktaSayisi from noktalar N left join Uygulamalar U on N.id=U.noktaid where  uygulamaTarihi between @baslangicTarihi and @bitisTarihi and kaziKazanAltin='Var' and  kaziKazanSansDagi='Var' and kaziKazanSansDagi='Var'  and personelid=@personelid and noktaid in (select id from noktalar where il=@il) ", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
       
       
                totalBilgisi.kaziKazanOlanNoktaSayisi = (Int32)cmd.ExecuteScalar();

                //cmd = new SqlCommand("select count(N.id) as kaziKazanOlmayanNoktaSayisi from noktalar N left join Uygulamalar U on N.id=U.noktaid where uygulamaTarihi between @baslangicTarihi and @bitisTarihi and kaziKazanAltin='Stokta Yok' and  kaziKazanSansDagi='Stokta Yok' and kaziKazanSansDagi='Stokta Yok' ", conn);
                cmd = new SqlCommand("select count(N.id) as herhangiKaziKazanSayisi from noktalar N left join Uygulamalar U on N.id=U.noktaid where (kaziKazanAltin='Var' or kaziKazanOnikiAySans='Var' or kaziKazanSansDagi='Var') and uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                totalBilgisi.herhangiKaziKazanSayisi = (Int32)cmd.ExecuteScalar();

                cmd = new SqlCommand("select count(*) as kaziKazanSatanSayisi from Uygulamalar where  uygulamaTarihi between @baslangicTarihi and @bitisTarihi", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
      
                totalBilgisi.kaziKazanSatanNoktaSayisi = (Int32)cmd.ExecuteScalar();


                cmd = new SqlCommand("select count(*) as kaziKazanSatmayanSayisi from Uygulamalar where  uygulamaTarihi between @baslangicTarihi and @bitisTarihi and kaziKazanSatis='Yok' ", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
          
                totalBilgisi.kaziKazanSatmayanNoktaSayisi = (Int32)cmd.ExecuteScalar();



                cmd = new SqlCommand("select count(*) as milliPiyangoSayisi from  Uygulamalar where milliPiyangoKlasikBilet='Var' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                totalBilgisi.milliPiyangoSayisi = (Int32)cmd.ExecuteScalar();

                cmd = new SqlCommand("select count(*) as altinSayisi from  Uygulamalar where kaziKazanAltin='Var' and  uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                totalBilgisi.altinSayisi = (Int32)cmd.ExecuteScalar();



                cmd = new SqlCommand("select count(*) as kaziKazanSansSayisi from  Uygulamalar where kaziKazanOnikiAySans='Var' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                totalBilgisi.onikiAySansSayisi = (Int32)cmd.ExecuteScalar();


                cmd = new SqlCommand("select count(*) as sansDagiSayisi from  Uygulamalar where kaziKazanSansDagi='Var' and uygulamaTarihi between @baslangicTarihi and @bitisTarihi  and personelid=@personelid and noktaid in (select id from noktalar where il=@il)", conn);

                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                totalBilgisi.sansDagiSayisi = (Int32)cmd.ExecuteScalar();





                conn.Close();


            }

            return totalBilgisi;
        }

     




        [WebMethod(true)]

        public List<Uygulamalar.UygulamaBilgisi> UygulamaListele(Filtre data)
        {
            List<Uygulamalar.UygulamaBilgisi> listeUygulamaBilgisi = new List<Uygulamalar.UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                //SqlCommand cmd = new SqlCommand("Select  U.id, K.adi AS kullaniciAdi, N.noktaAdi AS noktaAdi, N.il, N.ilce, u.* from Uygulamalar U LEFT JOIN Noktalar N ON U.noktaid=N.id LEFT JOIN Kullanicilar K ON K.id=U.personelid " + (Global.kullaniciBilgisi.jsonData["kullaniciTuru"].ToString() == "Personel" ? " where personelid=@personelid" : "") + " order by uygulamaTarihi desc", conn);




                SqlCommand cmd = new SqlCommand("Select  U.id, K.adi AS kullaniciAdi, N.noktaAdi AS noktaAdi, N.bayiid, N.il, N.ilce, u.* from Uygulamalar U LEFT JOIN Noktalar N ON U.noktaid=N.id LEFT JOIN Kullanicilar K ON K.id=U.personelid where uygulamaTarihi between @baslangicTarihi and @bitisTarihi and personelid=@personelid and noktaid in (select id from noktalar where il=@il) order by uygulamaTarihi desc", conn);

                cmd.Parameters.AddWithValue("@personelid", Global.kullaniciBilgisi.jsonData["id"].ToString());
                cmd.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                cmd.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                //cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@il", data.il);
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    Uygulamalar.UygulamaBilgisi uygulamaBilgisi = new Uygulamalar.UygulamaBilgisi();


                    uygulamaBilgisi.id = Convert.ToInt32(dr["id"]);
                    uygulamaBilgisi.uygulamaTarihi = Convert.ToDateTime(dr["uygulamaTarihi"]).ToString("dd-MM-yyyy HH:mm");
                    uygulamaBilgisi.string_date = Convert.ToDateTime(dr["uygulamaTarihi"]).ToString("yyyy-MM-ddTHH:mm");
                    uygulamaBilgisi.personelid = Convert.ToInt32(dr["personelid"]);
                    uygulamaBilgisi.noktaid = Convert.ToInt32(dr["noktaid"]);
                    uygulamaBilgisi.noktaAdi = (dr["noktaAdi"]).ToString();
                    uygulamaBilgisi.adi = (dr["kullaniciAdi"]).ToString();
                    uygulamaBilgisi.kaziKazanOnikiAySans = (dr["kaziKazanOnikiAySans"]).ToString();
                    uygulamaBilgisi.kaziKazanSansDagi = (dr["kaziKazanSansDagi"]).ToString();
                    uygulamaBilgisi.kaziKazanAltin = (dr["kaziKazanAltin"]).ToString();
                    uygulamaBilgisi.milliPiyangoKlasikBilet = (dr["milliPiyangoKlasikBilet"]).ToString();
                    uygulamaBilgisi.sayisalOyunKuponlari = (dr["sayisalOyunKuponlari"]).ToString();
                    uygulamaBilgisi.bayiyeGidildigindeUygYapilmismi = (dr["bayiyeGidildigindeUygYapilmismi"]).ToString();
                    uygulamaBilgisi.il = (dr["il"]).ToString();
                    uygulamaBilgisi.ilce = (dr["ilce"]).ToString();
                    uygulamaBilgisi.kaziKazanUnite_Planogram = (dr["KaziKazanUnite_Planogram"]).ToString();
                    uygulamaBilgisi.oyunKuponUnitesi = (dr["oyunKuponUnitesi"]).ToString();
                    uygulamaBilgisi.birinciDuyuruCercevesi = (dr["birinciDuyuruCercevesi"]).ToString();
                    uygulamaBilgisi.ikinciDuyuruCercevesi = (dr["ikinciDuyuruCercevesi"]).ToString();
                    uygulamaBilgisi.sayisalLotoPoster = (dr["sayisalLotoPoster"]).ToString();
                    uygulamaBilgisi.kaziKazanPoster = (dr["kaziKazanPoster"]).ToString();
                    uygulamaBilgisi.milliPiyangoPoster = (dr["milliPiyangoPoster"]).ToString();
                    uygulamaBilgisi.bayrak = (dr["bayrak"]).ToString();
                    uygulamaBilgisi.sticker = (dr["sticker"]).ToString();
                    uygulamaBilgisi.yorum = (dr["yorum"]).ToString();
                    uygulamaBilgisi.bayiid = Convert.ToInt32(dr["bayiid"]);




                    int sifir = 0;

                    uygulamaBilgisi.televizyon = int.TryParse(dr["televizyon"].ToString(), out sifir) ? Convert.ToInt32(dr["televizyon"]) : 0;
                    uygulamaBilgisi.oyunOynamaAlani = dr["oyunOynamaAlani"] == DBNull.Value ? "Yok" : dr["oyunOynamaAlani"].ToString();
                    uygulamaBilgisi.faaliyetAlani = dr["faaliyetAlani"] == DBNull.Value ? "Diğer" : dr["faaliyetAlani"].ToString();
                    uygulamaBilgisi.isyeriAlani = dr["isyeriAlani"] == DBNull.Value ? "0-30" : dr["isyeriAlani"].ToString();

                    uygulamaBilgisi.kaziKazanSatis = dr["kaziKazanSatis"] == DBNull.Value ? "Satıyor" : dr["kaziKazanSatis"].ToString();
                    uygulamaBilgisi.kaziKazanSatisSebep = dr["kaziKazanSatisSebep"] == DBNull.Value ? "" : dr["kaziKazanSatisSebep"].ToString();
                    uygulamaBilgisi.kaziKazanSiparisZaman = dr["kaziKazanSiparisZaman"] == DBNull.Value ? "Henüz Sipariş Verilmedi" : dr["kaziKazanSiparisZaman"].ToString();
                    uygulamaBilgisi.kaziKazanSiparisVerdinizMi = (dr["kaziKazanSiparisVerdinizMi"]) == DBNull.Value ? "" : (dr["kaziKazanSiparisVerdinizMi"]).ToString();
                    uygulamaBilgisi.termalRulo = (dr["termalRulo"]) == DBNull.Value ? "" : dr["termalRulo"].ToString();
                    uygulamaBilgisi.fotograflar = dr["fotografBilgisi"].ToString();
                    listeUygulamaBilgisi.Add(uygulamaBilgisi);
                }

                dr.Close();
                conn.Close();


            }

            return listeUygulamaBilgisi;
        }



        private string createNewTemplate(string dosyaAdi,string templateAdi)
        {
            //Yeni excel in kayıt yeri
            string fullpath = Server.MapPath("~/dokumanlar/" + dosyaAdi + DateTime.Now.ToString("_dd_MM_yy") + ".xlsx");
            int count = 1;



            //Dosya yolunun , Dosya adı, ve uzantısı şeklinde ayrılması
            string fileNameOnly = Path.GetFileNameWithoutExtension(fullpath);
            string extension = Path.GetExtension(fullpath);
            string path = Path.GetDirectoryName(fullpath);
            string newFullPath = fullpath;



            //Eğer dosya yolu mevcut iste count un bir arttırılak dosya adına eklenmesi ve yeni dosya yolunun oluşturulması
            while (File.Exists(newFullPath))
            {
                string tempFileName = string.Format("{0}({1})", fileNameOnly, count++);
                newFullPath = Path.Combine(path, tempFileName + extension);
            }



            //oluşan dosya oluna template excel in kopyalanarak, yeni dosyanın oluşturulması
            File.Copy(Server.MapPath("~/dokumanlar/templates/"+templateAdi), newFullPath);



            return newFullPath;
        }
        private string ExcelDoldurUygulamar(DataTable dt, string templatePath)
        {



            OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source = " + templatePath + ";Extended Properties='Excel 8.0;HDR=NO';");



            con.Open();



            int colonSayisi = dt.Columns.Count;
            string fields = "";
            string values = "";



            for (int i = 1; i < colonSayisi + 1; i++)
            {
                if (i == 1)
                {
                    fields = fields + "F" + i;
                    values = values + "@F" + i;
                }
                else
                {
                    fields = fields + ",F" + i;
                    values = values + ",@F" + i;
                }
            }



            //Excel sayfalarınlarin alınması 
            DataTable dtSchema = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            string sayfaAdi = dtSchema.Rows[0].Field<string>("TABLE_NAME");



            string query = "Insert into [" + sayfaAdi + "] (" + fields + ") values (" + values + ") ";



            OleDbCommand com = new OleDbCommand(query, con);


            foreach (DataRow row in dt.Rows)
            {
                for (int i = 1; i < colonSayisi + 1; i++)
                {
                    //Tarih Sütünları
                    if (i == 7)
                    {
                        string value = row[i - 1].ToString();



                        if (row[i - 1].ToString() != "")
                        {
                            DateTime time;
                            if (DateTime.TryParse(value, out time))
                            {
                                com.Parameters.AddWithValue("@F" + i, time.ToString("dd.MM.yyyy"));
                            }
                            else
                            {
                                com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                            }
                        }
                        else
                        {
                            com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                        }
                    }
                    else
                    {
                        com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                    }
                }





                com.ExecuteNonQuery();
                com.Parameters.Clear();
            }



            con.Close();



            return templatePath;
        }
        private string createNewTemplateGidilmemis(string dosyaAdi, string templateAdi)
        {
            //Yeni excel in kayıt yeri
            string fullpath = Server.MapPath("~/dokumanlar/" + dosyaAdi + DateTime.Now.ToString("_dd_MM_yy") + ".xlsx");
            int count = 1;



            //Dosya yolunun , Dosya adı, ve uzantısı şeklinde ayrılması
            string fileNameOnly = Path.GetFileNameWithoutExtension(fullpath);
            string extension = Path.GetExtension(fullpath);
            string path = Path.GetDirectoryName(fullpath);
            string newFullPath = fullpath;



            //Eğer dosya yolu mevcut iste count un bir arttırılak dosya adına eklenmesi ve yeni dosya yolunun oluşturulması
            while (File.Exists(newFullPath))
            {
                string tempFileName = string.Format("{0}({1})", fileNameOnly, count++);
                newFullPath = Path.Combine(path, tempFileName + extension);
            }



            //oluşan dosya oluna template excel in kopyalanarak, yeni dosyanın oluşturulması
            File.Copy(Server.MapPath("~/dokumanlar/templates/" + templateAdi), newFullPath);



            return newFullPath;
        }
        private string ExcelDoldurUygulamayaGidilmemisNoktalar(DataTable dt, string templatePath)
        {



            OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source = " + templatePath + ";Extended Properties='Excel 8.0;HDR=NO';");



            con.Open();



            int colonSayisi = dt.Columns.Count;
            string fields = "";
            string values = "";



            for (int i = 1; i < colonSayisi + 1; i++)
            {
                if (i == 1)
                {
                    fields = fields + "F" + i;
                    values = values + "@F" + i;
                }
                else
                {
                    fields = fields + ",F" + i;
                    values = values + ",@F" + i;
                }
            }



            //Excel sayfalarınlarin alınması 
            DataTable dtSchema = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });
            string sayfaAdi = dtSchema.Rows[0].Field<string>("TABLE_NAME");



            string query = "Insert into [" + sayfaAdi + "] (" + fields + ") values (" + values + ") ";



            OleDbCommand com = new OleDbCommand(query, con);


            foreach (DataRow row in dt.Rows)
            {
                for (int i = 1; i < colonSayisi + 1; i++)
                {
                    //Tarih Sütünları
                   //if (i == 6)
                   // {
                   //     string value = row[i - 1].ToString();



                   //     if (row[i - 1].ToString() != "")
                   //     {
                   //         DateTime time;
                   //         if (DateTime.TryParse(value, out time))
                   //         {
                   //             com.Parameters.AddWithValue("@F" + i, time.ToString("dd.MM.yyyy"));
                   //         }
                   //         else
                   //         {
                   //             com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                   //         }
                   //     }
                   //     else
                   //     {
                   //         com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                   //     }
                   // }
                   // else
                   // {
                   //     com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                   // }
                    com.Parameters.AddWithValue("@F" + i, Convert.ToString(row[i - 1]));
                }





                com.ExecuteNonQuery();
                com.Parameters.Clear();
            }



            con.Close();



            return templatePath;
        }

        [WebMethod(true)]
     
        public string UygulamaListeExcel(Filtre data)
        {

            string dosyaYolu = "";
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

           string query=(@"Select K.adi, N.bayiid, N.noktaAdi, N.il, N.ilce, U.bayiyeGidildigindeUygYapilmismi, U.uygulamaTarihi from Uygulamalar U LEFT JOIN Noktalar N ON U.noktaid=N.id LEFT JOIN Kullanicilar K ON K.id=U.personelid where uygulamaTarihi between @baslangicTarihi and @bitisTarihi and personelid=@personelid and noktaid in (select id from noktalar where il=@il) order by uygulamaTarihi desc");

              
                conn.Open();
   
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);

                adp.SelectCommand.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                adp.SelectCommand.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
                adp.SelectCommand.Parameters.AddWithValue("@personelid", data.personelid);
                adp.SelectCommand.Parameters.AddWithValue("@il", data.il);
               

                 adp.Fill(dt);


            conn.Close();


            }

            dosyaYolu= createNewTemplate("uygulama_liste", "Uygulamalar.xlsx");
            ExcelDoldurUygulamar(dt, dosyaYolu);

            return Path.GetFileName(dosyaYolu);
        }


        [WebMethod(true)]

        public string GidilmemisNoktaListeExcel()
        {
            string dosyaYolu = "";
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                string query = (@"select id, noktaAdi, ilce, adres1, adres2, kapiNo from  Noktalar where id not in (select noktaid from Uygulamalar)");

                conn.Open();

                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
    
                //adp.SelectCommand.Parameters.AddWithValue("@baslangicTarihi", data.baslangicTarihi);
                //adp.SelectCommand.Parameters.AddWithValue("@bitisTarihi", data.bitisTarihi);
  
                adp.Fill(dt);

                conn.Close();


                dosyaYolu = createNewTemplateGidilmemis("gidilmemisnoktalar_liste", "UygulamayaGidilmemisNoktalar.xlsx");
                ExcelDoldurUygulamayaGidilmemisNoktalar(dt, dosyaYolu);
            }

            return Path.GetFileName(dosyaYolu);
        }



    }
}
