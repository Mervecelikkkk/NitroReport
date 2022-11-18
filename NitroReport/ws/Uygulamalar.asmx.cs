using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace NitroReport.ws
{
    /// <summary>
    /// Summary description for Uygulamalar
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Uygulamalar : System.Web.Services.WebService
    {

        public class UygulamaBilgisi
        {

            public int id { get; set; }
            public string uygulamaTarihi { get; set; }
            public int personelid { get; set; }
            public int noktaid { get; set; }
            public string adi { get; set; }
            public string noktaAdi { get; set; }
            public int bayiid { get; set; }
            public string kaziKazanSatis { get; set; }
            public string kaziKazanSiparisVerdinizMi { get; set; }
            public string kaziKazanSiparisZaman { get; set; }
            public string kaziKazanSatisSebep { get; set; }
            public string kaziKazanOnikiAySans { get; set; }
            public string kaziKazanSansDagi { get; set; }
            public string kaziKazanAltin { get; set; }
            public string milliPiyangoKlasikBilet { get; set; }
            public string sayisalOyunKuponlari { get; set; }
            public string bayiyeGidildigindeUygYapilmismi { get; set; }
            public string il { get; set; }
            public string ilce { get; set; }
            public string kaziKazanUnite_Planogram { get; set; }
            public string oyunKuponUnitesi { get; set; }
            public string birinciDuyuruCercevesi { get; set; }
            public string ikinciDuyuruCercevesi { get; set; }
            public string sayisalLotoPoster { get; set; }
            public string kaziKazanPoster { get; set; }
            public string milliPiyangoPoster { get; set; }
            public string bayrak { get; set; }
            public string sticker { get; set; }
            public string yorum { get; set; }
            public string fotograflar { get; set; }
            public string string_date { get; set; }
            public int uygulamaSayisi { get; set; }
            public int totalSayi { get; set; }
            public int televizyon { get; set; }
            public string oyunOynamaAlani { get; set; }
            public string isyeriAlani { get; set; }
            public string faaliyetAlani { get; set; }
            public string termalRulo { get; set; }
            public int uygulamaPuani { get; set; }
            public int uygulamaYuzdesi { get; set; }
            public string baslik { get; set; }
     

        }

        //private const int exifOrientationID = 0x112; //274

        //public static void ExifRotate(this Image img)
        //{
        //    if (!img.PropertyIdList.Contains(exifOrientationID))
        //        return;

        //    var prop = img.GetPropertyItem(exifOrientationID);
        //    int val = BitConverter.ToUInt16(prop.Value, 0);
        //    var rot = RotateFlipType.RotateNoneFlipNone;

        //    if (val == 3 || val == 4)
        //        rot = RotateFlipType.Rotate180FlipNone;
        //    else if (val == 5 || val == 6)
        //        rot = RotateFlipType.Rotate90FlipNone;
        //    else if (val == 7 || val == 8)
        //        rot = RotateFlipType.Rotate270FlipNone;

        //    if (val == 2 || val == 4 || val == 5 || val == 7)
        //        rot |= RotateFlipType.RotateNoneFlipX;

        //    if (rot != RotateFlipType.RotateNoneFlipNone)
        //        img.RotateFlip(rot);
        //}

        [WebMethod(true)]

        public Result Kaydet(UygulamaBilgisi data)
        {
            Result result = new Result();


            if (data.kaziKazanSatis == "Yok")
            {
                data.kaziKazanAltin = "Yok";
                data.kaziKazanSansDagi = "Yok";
                data.kaziKazanOnikiAySans = "Yok";

                if (data.kaziKazanSiparisVerdinizMi == "Evet")
                    data.kaziKazanSatisSebep = "";
                else
                    data.kaziKazanSiparisZaman = "";
            }
            else
            {
                data.kaziKazanSiparisVerdinizMi = "";
                data.kaziKazanSatisSebep = "";
                data.kaziKazanSiparisZaman = "";
            }
            string cevap = "Bayi Tarafından Uygulama Yapıldı";

            if (data.bayiyeGidildigindeUygYapilmismi == "9 Materyal Yapılmış")
            {

                    data.oyunKuponUnitesi =
                    data.kaziKazanUnite_Planogram =
                    data.birinciDuyuruCercevesi =
                    data.ikinciDuyuruCercevesi =
                    data.kaziKazanPoster =
                    data.bayrak =
                    data.sticker =
                    data.milliPiyangoPoster =
                    data.sayisalLotoPoster = cevap;
            }
            
            
            data.uygulamaPuani = 0;
            string uygulamaMerch ="Merch Uygulama Yaptı";


            if (data.oyunKuponUnitesi == uygulamaMerch || data.oyunKuponUnitesi == cevap)
                data.uygulamaPuani += 1;


            if (data.kaziKazanUnite_Planogram == uygulamaMerch || data.kaziKazanUnite_Planogram == cevap)
                data.uygulamaPuani += 1;

            if (data.birinciDuyuruCercevesi == uygulamaMerch || data.birinciDuyuruCercevesi == cevap)
                data.uygulamaPuani += 1;

            if (data.ikinciDuyuruCercevesi == uygulamaMerch || data.ikinciDuyuruCercevesi == cevap)
                data.uygulamaPuani += 1;
            if (data.kaziKazanPoster == uygulamaMerch || data.kaziKazanPoster == cevap)
                data.uygulamaPuani += 1;

            if (data.bayrak == uygulamaMerch || data.bayrak == cevap)
                data.uygulamaPuani += 1;

            if (data.sticker == uygulamaMerch || data.sticker == cevap)
                data.uygulamaPuani += 1;

            if (data.milliPiyangoPoster == uygulamaMerch || data.milliPiyangoPoster == cevap)
                data.uygulamaPuani += 1;

            if (data.sayisalLotoPoster == uygulamaMerch || data.sayisalLotoPoster == cevap)
                data.uygulamaPuani += 1;


            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCs"]))



            {
                SqlCommand cmd = new SqlCommand(@"insert into Uygulamalar 
                (ikinciDuyuruCercevesi,uygulamaTarihi, personelid, noktaid, kaziKazanOnikiAySans, kaziKazanSansDagi,
                kaziKazanAltin,milliPiyangoKlasikBilet, sayisalOyunKuponlari, bayiyeGidildigindeUygYapilmismi,
                kaziKazanUnite_Planogram, oyunKuponUnitesi,  birinciDuyuruCercevesi, sayisalLotoPoster, kaziKazanPoster,
                milliPiyangoPoster, bayrak, sticker, fotografBilgisi, yorum, televizyon, oyunOynamaAlani, isyeriAlani, faaliyetAlani, kaziKazanSatis, kaziKazanSiparisZaman,
                kaziKazanSatisSebep, kaziKazanSiparisVerdinizMi, termalRulo, uygulamaPuani) 
                OUTPUT INSERTED.id values (@ikinciDuyuruCercevesi, @uygulamaTarihi,
                @personelid, @noktaid, @kaziKazanOnikiAySans, @kaziKazanSansDagi, @kaziKazanAltin, @milliPiyangoKlasikBilet,
                @sayisalOyunKuponlari, @bayiyeGidildigindeUygYapilmismi, @kaziKazanUnite_Planogram, @oyunKuponUnitesi,
                @birinciDuyuruCercevesi, @sayisalLotoPoster, @kaziKazanPoster, @milliPiyangoPoster, @bayrak, @sticker, @fotografBilgisi, @yorum, 
                @televizyon, @oyunOynamaAlani, @isyeriAlani, @faaliyetAlani, @kaziKazanSatis,@kaziKazanSiparisZaman, @kaziKazanSatisSebep,@kaziKazanSiparisVerdinizMi,@termalRulo, 
                @uygulamaPuani)", conn);
                if (data.id > 0)
                {
                cmd = new SqlCommand(@"update Uygulamalar SET ikinciDuyuruCercevesi=@ikinciDuyuruCercevesi, uygulamaTarihi=@uygulamaTarihi, 
                noktaid=@noktaid, kaziKazanOnikiAySans=@kaziKazanOnikiAySans, kaziKazanSansDagi=@kaziKazanSansDagi,
                kaziKazanAltin=@kaziKazanAltin,milliPiyangoKlasikBilet=@milliPiyangoKlasikBilet, sayisalOyunKuponlari=@sayisalOyunKuponlari, 
                bayiyeGidildigindeUygYapilmismi=@bayiyeGidildigindeUygYapilmismi, kaziKazanUnite_Planogram=@kaziKazanUnite_Planogram, 
                oyunKuponUnitesi=@oyunKuponUnitesi,  birinciDuyuruCercevesi=@birinciDuyuruCercevesi, sayisalLotoPoster=@sayisalLotoPoster, 
                kaziKazanPoster=@kaziKazanPoster, milliPiyangoPoster=@milliPiyangoPoster, bayrak=@bayrak, sticker=@sticker, fotografBilgisi=@fotografBilgisi,
                yorum=@yorum, televizyon=@televizyon,oyunOynamaAlani=@oyunOynamaAlani,isyeriAlani=@isyeriAlani, faaliyetAlani=@faaliyetAlani,
                kaziKazanSatis=@kaziKazanSatis,kaziKazanSiparisZaman=@kaziKazanSiparisZaman, kaziKazanSatisSebep=@kaziKazanSatisSebep, 
                kaziKazanSiparisVerdinizMi=@kaziKazanSiparisVerdinizMi,
                termalRulo=@termalRulo, uygulamaPuani=@uygulamaPuani  WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", data.id);
                }


                cmd.Parameters.AddWithValue("@uygulamaTarihi", Convert.ToDateTime(data.uygulamaTarihi));

                cmd.Parameters.AddWithValue("@personelid", data.personelid);
                cmd.Parameters.AddWithValue("@noktaid", data.noktaid);
                cmd.Parameters.AddWithValue("@kaziKazanOnikiAySans", data.kaziKazanOnikiAySans);
                cmd.Parameters.AddWithValue("@kaziKazanSansDagi", data.kaziKazanSansDagi);
                cmd.Parameters.AddWithValue("@kaziKazanAltin", data.kaziKazanAltin);
                cmd.Parameters.AddWithValue("@milliPiyangoKlasikBilet", data.milliPiyangoKlasikBilet);
                cmd.Parameters.AddWithValue("@sayisalOyunKuponlari", data.sayisalOyunKuponlari);
                cmd.Parameters.AddWithValue("@bayiyeGidildigindeUygYapilmismi", data.bayiyeGidildigindeUygYapilmismi);
                cmd.Parameters.AddWithValue("@kaziKazanUnite_Planogram", data.kaziKazanUnite_Planogram);
                cmd.Parameters.AddWithValue("@oyunKuponUnitesi", data.oyunKuponUnitesi);
                cmd.Parameters.AddWithValue("@birinciDuyuruCercevesi", data.birinciDuyuruCercevesi);
                cmd.Parameters.AddWithValue("@ikinciDuyuruCercevesi", data.ikinciDuyuruCercevesi);
                cmd.Parameters.AddWithValue("@sayisalLotoPoster", data.sayisalLotoPoster);
                cmd.Parameters.AddWithValue("@kaziKazanPoster", data.kaziKazanPoster);
                cmd.Parameters.AddWithValue("@milliPiyangoPoster", data.milliPiyangoPoster);
                cmd.Parameters.AddWithValue("@bayrak", data.bayrak);
                cmd.Parameters.AddWithValue("@sticker", data.sticker);
                cmd.Parameters.AddWithValue("@yorum", data.yorum);
                cmd.Parameters.AddWithValue("@televizyon", data.televizyon);
                cmd.Parameters.AddWithValue("@oyunOynamaAlani", data.oyunOynamaAlani);
                cmd.Parameters.AddWithValue("@isyeriAlani", data.isyeriAlani);
                cmd.Parameters.AddWithValue("@faaliyetAlani", data.faaliyetAlani);
                cmd.Parameters.AddWithValue("@kaziKazanSatis", data.kaziKazanSatis);
                cmd.Parameters.AddWithValue("@kaziKazanSiparisZaman", data.kaziKazanSiparisZaman);
                cmd.Parameters.AddWithValue("@kaziKazanSatisSebep", data.kaziKazanSatisSebep);
                cmd.Parameters.AddWithValue("@kaziKazanSiparisVerdinizMi", data.kaziKazanSiparisVerdinizMi);
                cmd.Parameters.AddWithValue("@termalRulo", data.termalRulo);
                cmd.Parameters.AddWithValue("@uygulamaPuani", data.uygulamaPuani);


                cmd.Parameters.AddWithValue("@fotografBilgisi", "[]");


                int lastID = 0;

                conn.Open();
                if (data.id > 0)
                {
                    cmd.ExecuteNonQuery();
                } else
                {
                    lastID = (Int32)cmd.ExecuteScalar();
                    data.id = lastID;
                }
                if (data.fotograflar != null && data.fotograflar != "")
                {
                    JArray fotograflarDosyaAdlari = new JArray();

                    foreach (JObject item in JArray.Parse(data.fotograflar))
                    {
                        string dosyaadi = item.GetValue("dosyaadi").ToString();
                        string base64Data = item.GetValue("base64Data").ToString();


                        JObject dosyaBilgisi = new JObject();
                        dosyaBilgisi["dosyaadi"] = dosyaadi;
                        if (base64Data.Contains("dokumanlar/"))
                        {
                            dosyaBilgisi["base64Data"] = base64Data;
                            fotograflarDosyaAdlari.Add(dosyaBilgisi);
                            continue;
                        }
                        string kayitadi = "";
                        do
                        {
                            kayitadi = data.id + "-" + StringGenerator.getString() + ".jpeg";
                        } while (File.Exists(Server.MapPath("~/dokumanlar/uygulamalar/resimler/" + kayitadi)));
                        dosyaBilgisi["base64Data"] = "dokumanlar/uygulamalar/resimler/" + kayitadi;

                        fotograflarDosyaAdlari.Add(dosyaBilgisi);

                        var bytes = Convert.FromBase64String(base64Data.Split(',')[1]);
                        using (var imageFile = new FileStream(Server.MapPath("~/dokumanlar/uygulamalar/resimler/" + kayitadi), FileMode.Create))
                        {
                            imageFile.Write(bytes, 0, bytes.Length);
                            imageFile.Flush();
                        }


                    }
                    cmd = new SqlCommand("UPDATE uygulamalar SET fotografBilgisi=@fotograflar WHERE id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", data.id);
                    cmd.Parameters.AddWithValue("@fotograflar", fotograflarDosyaAdlari.ToString());
                    cmd.ExecuteNonQuery();
                }

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
                SqlCommand cmd = new SqlCommand("DELETE from Uygulamalar WHERE id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

            }





            return result;
        }





        [WebMethod(true)]

        public List<UygulamaBilgisi> Listele()
        {
            List<UygulamaBilgisi> listeUygulamaBilgisi = new List<UygulamaBilgisi>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("Select  U.id, K.adi AS kullaniciAdi, N.noktaAdi AS noktaAdi, N.il, N.ilce, u.* from Uygulamalar U LEFT JOIN Noktalar N ON U.noktaid=N.id LEFT JOIN Kullanicilar K ON K.id=U.personelid " + (Global.kullaniciBilgisi.jsonData["kullaniciTuru"].ToString() == "Personel" ? " where personelid=@personelid" : "") + " order by uygulamaTarihi desc", conn);



                cmd.Parameters.AddWithValue("@personelid", Global.kullaniciBilgisi.jsonData["id"].ToString());
          
                conn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    UygulamaBilgisi uygulamaBilgisi = new UygulamaBilgisi();


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













    }
}
