using NitroReport.ws;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Security;
using System.Web.SessionState;

namespace NitroReport
{
    public class Global:System.Web.HttpApplication
    {


        public static KullaniciIslemleri.KullaniciBilgisi kullaniciBilgisi
        {
            get
            {

                KullaniciIslemleri.KullaniciBilgisi kullaniciBilgisi = new KullaniciIslemleri.KullaniciBilgisi();

                if (HttpContext.Current.Request.Cookies["KullaniciBilgisi"] != null && HttpContext.Current.Request.Cookies["KullaniciBilgisi"].Value != "" && HttpContext.Current.Request.Cookies["KullaniciBilgisi"].Value != "null")
                {
                    QuerySecurity cryptor = new QuerySecurity();

                    string cryptedData = HttpContext.Current.Request.Cookies["KullaniciBilgisi"].Value;
                    string serializedData = cryptor.Decrypt(cryptedData);

                    kullaniciBilgisi = JsonConvert.DeserializeObject<KullaniciIslemleri.KullaniciBilgisi>(serializedData);

                    if (HttpContext.Current.Session["KullaniciBilgisi"] == null && kullaniciBilgisi != null)
                    {
                        KullaniciIslemleri kullaniciIslemleri = new KullaniciIslemleri();

                        KullaniciIslemleri.LoginBilgisi loginBilgisi = new KullaniciIslemleri.LoginBilgisi();

                        loginBilgisi.kullanici_adi = kullaniciBilgisi.jsonData["kullaniciAdi"].ToString();
                        loginBilgisi.sifre = kullaniciBilgisi.jsonData["sifre"].ToString();
                        int captcha = new Random().Next(1000, 9999);
                        HttpContext.Current.Session["captcha"] = captcha.ToString();
                        loginBilgisi.guvenlikkodu = captcha.ToString();

                        if (kullaniciIslemleri.Login(loginBilgisi).resultcode == 1)
                            kullaniciBilgisi = HttpContext.Current.Session["KullaniciBilgisi"] as KullaniciIslemleri.KullaniciBilgisi;
                        else
                            HttpContext.Current.Response.Redirect("login.aspx");
                    }
                }
                else
                    HttpContext.Current.Response.Redirect("login.aspx");
                    

                return kullaniciBilgisi;
            }

            set
            {
                if (HttpContext.Current.Request.Cookies["KullaniciBilgisi"] != null)
                {
                    var c = new HttpCookie("KullaniciBilgisi");
                    c.Expires = DateTime.Now.AddDays(-1);
                    
                }



                HttpCookie cookie = new HttpCookie("KullaniciBilgisi");
                cookie.Name = "KullaniciBilgisi";

                if (HttpContext.Current.Request.Cookies["KullaniciBilgisi"] != null)
                    HttpContext.Current.Request.Cookies.Remove("KullaniciBilgisi");

                string serializedValue = JsonConvert.SerializeObject(value);

                QuerySecurity cryptor = new QuerySecurity();
                string cryptedValue = cryptor.Encrypt(serializedValue);

                cookie.Value = cryptedValue;
                cookie.Expires = DateTime.Now.AddHours(12);
                HttpContext.Current.Response.Cookies.Add(cookie);

                HttpContext.Current.Session["KullaniciBilgisi"] = value;
            }


        }


        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["KullaniciBilgisi"] == null)
                HttpContext.Current.Response.Redirect("login.aspx");
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {



        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }



}