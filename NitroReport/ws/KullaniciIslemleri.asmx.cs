using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace NitroReport.ws
{
    /// <summary>
    /// Summary description for KullaniciIslemleri
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class KullaniciIslemleri : System.Web.Services.WebService
    {
        public class Bilgi
        {
            public int id { get; set; }
            public string adi { get; set; }
            public string kullaniciAdi { get; set; }
            public string aktif { get; set; }
            public string sifre { get; set; }
            public string kullaniciTuru { get; set; }
            public string GSM { get; set; }
        }
        public class LoginBilgisi
        {
            public string kullanici_adi { get; set; }
            public string sifre { get; set; }
            public string guvenlikkodu { get; set; }

        }



        public class KullaniciBilgisi
        {
            public JObject jsonData { get; set; }


        }

        // Kaydet ve Güncelle
        [WebMethod]
        public Result Kaydet(Bilgi data)
        {
            Result result = new Result();
            result.resultcode = 1;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Kullanicilar SET adi = @adi, kullaniciAdi = @kullaniciAdi, aktif = @aktif, " +
                                                "sifre = @sifre, kullaniciTuru = @kullaniciTuru,GSM = @GSM WHERE id = @id", conn);
                if(data.id == 0)
                {
                    cmd = new SqlCommand(@"INSERT INTO Kullanicilar(adi,kullaniciAdi,aktif,sifre,kullaniciTuru,GSM) VALUES(@adi,@kullaniciAdi,@aktif,@sifre,@kullaniciTuru,@GSM)", conn);
                }
                cmd.Parameters.AddWithValue("@id", data.id);
                cmd.Parameters.AddWithValue("@adi", data.adi);
                cmd.Parameters.AddWithValue("@kullaniciAdi", data.kullaniciAdi);
                cmd.Parameters.AddWithValue("@aktif", data.aktif);
                cmd.Parameters.AddWithValue("@sifre", data.sifre);
                cmd.Parameters.AddWithValue("@kullaniciTuru", "Aktif");
                cmd.Parameters.AddWithValue("@GSM", data.GSM);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            return result;
        }

        [WebMethod(true)]

        public Result Login(LoginBilgisi data)
        {

            Result result = new Result();

            if (HttpContext.Current.Session["captcha"] == null || HttpContext.Current.Session["captcha"].ToString() != data.guvenlikkodu)
            {
                result.resultcode = 0;
                result.resulttext = "Lütfen güvenlik kodunu doğru şekilde giriniz";
                HttpContext.Current.Session["captcha"] = null;
                return result;
            }

            return UserLogin(data);
        }


        private Result UserLogin(LoginBilgisi data)
        {
            Result result = new Result();
            result.resultcode = 0;
            result.resulttext = "Giriş yapılamadı";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {

                SqlCommand cmd = new SqlCommand("select * from Kullanicilar where kullaniciAdi=@kullaniciAdi and sifre=@sifre and aktif='Aktif'", conn);
                cmd.Parameters.AddWithValue("@kullaniciAdi", data.kullanici_adi);
                cmd.Parameters.AddWithValue("@sifre", data.sifre);
                try
                {
                    conn.Open();



                    SqlDataReader oku = cmd.ExecuteReader();
                    if (oku.HasRows)
                    {

                        while (oku.Read())
                        {

                            Bilgi kullaniciBilgisi = new Bilgi();
                            kullaniciBilgisi.id = Convert.ToInt32(oku["id"]);
                            kullaniciBilgisi.adi = oku["adi"].ToString();
                            kullaniciBilgisi.aktif = oku["aktif"].ToString();
                            kullaniciBilgisi.sifre = oku["sifre"].ToString();
                            kullaniciBilgisi.kullaniciAdi = oku["kullaniciAdi"].ToString();

                            kullaniciBilgisi.kullaniciTuru = oku["kullaniciTuru"].ToString();
                            kullaniciBilgisi.GSM = oku["GSM"].ToString();

                            
                            

                            result.resultcode = 1;
                            
                            if (kullaniciBilgisi.kullaniciTuru == "Yönetici")
                                result.resultdata = "raporlar.aspx";
                            else
                                result.resultdata = "uygulamalar.aspx";

                            

                            Global.kullaniciBilgisi = new KullaniciBilgisi() { jsonData = (JObject)JToken.FromObject(kullaniciBilgisi) };

                            result.resulttext = "Giriş başarılı";



                 

                        }


                    }
                    else
                    {
                        result.resultcode = -10;
                        result.resulttext = "Giriş başarısız";

                    }

                    oku.Close();


                    conn.Close();
                }
                catch (Exception ex)
                {
                    result.resulttext = ex.Message;
                    result.resultcode = 0;
                }

            }

            return result;


        }

        [WebMethod]
        //Liste
        public Result Liste()
        {
            Result result = new Result();
            List<Bilgi> liste = new List<Bilgi>();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand(@"SELECT * FROM Kullanicilar  order by id desc", conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Bilgi item = new Bilgi();
                    item.id = Convert.ToInt32(dr["id"]);
                    item.adi = dr["adi"].ToString();
                    item.aktif = dr["aktif"].ToString();
                    item.sifre = dr["sifre"].ToString();
                    item.kullaniciAdi = dr["kullaniciAdi"].ToString();

                    item.kullaniciTuru = dr["kullaniciTuru"].ToString();
                    item.GSM = dr["GSM"].ToString();
                    //  item.tarih = Convert.ToDateTime(dr["tarih"]).ToString("yyyy-MM-dd 00:00:00");
                    liste.Add(item);
                    result.resultcode = 1;
                }
                dr.Close();
                conn.Close();
            }
            result.resultdata = liste;
            return result;
        }

        // Sil
        [WebMethod]
        public Result Sil(int id)
        {
            Result result = new Result();
            result.resultcode = 1;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand(@"DELETE FROM Kullanicilar WHERE id = @id ", conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            return result;
        }
        [WebMethod]
        public Result Detay(int id)
        {
            Result result = new Result();
            Bilgi item = new Bilgi();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                SqlCommand cmd = new SqlCommand(@"SELECT * FROM Kullanicilar where id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    item.id = id;
                    item.adi = dr["adi"].ToString();
                    item.aktif = dr["aktif"].ToString();
                    item.sifre = dr["sifre"].ToString();
                    item.kullaniciAdi = dr["kullaniciAdi"].ToString();

                    item.kullaniciTuru = dr["kullaniciTuru"].ToString();
                    item.GSM = dr["GSM"].ToString();

                    result.resultcode = 1;
                }
                dr.Close();
                conn.Close();
            }
            result.resultdata = item;
            return result;
        }





        public class UpdatePass
        {
            public int id { get; set; }
            public string oldPass { get; set; }

            public string newPass { get; set; }
            public string newPassR { get; set; }

        }
        [WebMethod]
        public Result SifreGuncelleme(UpdatePass data)
        {
            Result result = new Result();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["SqlCS"]))
            {
                try
                {

                 SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Kullanicilar where id=@id and sifre=@password;", conn);
                    cmd.Parameters.AddWithValue("@id", data.id);
                    cmd.Parameters.AddWithValue("@password", data.oldPass);
                    conn.Open();
                    int ct = (int)cmd.ExecuteScalar();

                    if (ct == 1)
                    {
                        cmd = new SqlCommand("UPDATE Kullanicilar SET sifre=@newPassword  where id=@id and sifre=@oldpassword;", conn);
                        cmd.Parameters.AddWithValue("@id", data.id);
                        cmd.Parameters.AddWithValue("@oldpassword", data.oldPass);
                        cmd.Parameters.AddWithValue("@newPassword", data.newPass);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            result.resultcode = 1;
                            result.resulttext = "işlem başarılı";
                        }

                    }
                    else
                    {
                        result.resultcode = 0;
                        result.resulttext = "şifre yanlış";

                    }
                    conn.Close();

                }
                catch (Exception ex)
                {
                    conn.Close();
                    result.resultcode = 0;
                    result.resulttext = ex.Message;
                }

            }
            return result;

        }


    }
}
