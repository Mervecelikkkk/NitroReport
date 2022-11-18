<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="NitroReport.login" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <%--css file--%>
    <link href="css/stylelogin.css" rel="stylesheet" />
    <link href="css/bootstraplogin.min.css" rel="stylesheet" />
    <link href="fontAsmira/fontasmira.css" rel="stylesheet" />
   <%-- js file--%>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
    <div class="row">
        <div class="col-12  login-bg">
           <div class="login-form-col">
           <div  class="logo-login">
               <img src="img/sisal-sans-logo.png" alt="" />
           </div>
               <%--<div class="caption-box">
                   Devam etmek için giriş yapınız.
               </div>--%>
            <div class="form-group">
                <label>Kullanıcı Adı</label>
               <input class="form-control form-control-sm" autocomplete="off"  id="kullanici" type="text"/>
            </div>
             <div class="form-group">
                <label>Şifre</label>
               <input class="form-control form-control-sm" type="text" autocomplete="off"
 inputmode="numeric" pattern="[0-9]*" id="sifre" />
            </div>
                <div class="form-group captcha">
                    <div class="input-group">
                        <div class="input-group-btn"><img id="captcha" src="captcha.ashx" /></div>
                        <input type="text" autocomplete="off"
 inputmode="numeric" pattern="[0-9]*" id="guvenlikkodu" class="form-control input-lg" placeholder="Güvenlik Kodu Giriniz"/>
                    </div>
                </div>
            <div class="">
                <div id="alertPanel" class="alert alert-danger alert-dismissable small" style="height:30px; padding:6px; display:none;"></div>
                <a href="#"><div class="btn btn-style-1 w-100" onclick="Login()">GİRİŞ YAP</div></a>
                </div>
            </div>
        </div>
       
    </div>
    </div>
         <script>
             $(document).ready()
             {
                 cikis();


             }

             function cikis() {


                 (function () {
                     var cookies = document.cookie.split("; ");
                     for (var c = 0; c < cookies.length; c++) {
                         var d = window.location.hostname.split(".");
                         while (d.length > 0) {
                             var cookieBase = encodeURIComponent(cookies[c].split(";")[0].split("=")[0]) + '=; expires=Thu, 01-Jan-1970 00:00:01 GMT; domain=' + d.join('.') + ' ;path=';
                             var p = location.pathname.split('/');
                             document.cookie = cookieBase + '/';
                             while (p.length > 0) {
                                 document.cookie = cookieBase + p.join('/');
                                 p.pop();
                             };
                             d.shift();
                         }
                     }
                 })();


             }

             $('.login-input').focus(function () {
                 $(this).parents('.login-group').addClass('focused');
             });

             $('.login-input').blur(function () {
                 var inputValue = $(this).val();
                 if (inputValue == "") {
                     $(this).removeClass('filled');
                     $(this).parents('.login-group').removeClass('focused');
                 } else {
                     $(this).addClass('filled');
                 }
             })

             $("#guvenlikkodu").keyup(function (e) {
                 var code = e.which;
                 if (code == 13) e.preventDefault();
                 if (code == 32 || code == 13 || code == 188 || code == 186) {
                     Login();
                 }
             });



             function formControl(array) {
                 var durum = 1;
                 var firstError = -1;
                 for (var i = 0; i < array.length; i++) {
                     if ($('#' + array[i]).hasClass('is-invalid'))
                         $('#' + array[i]).removeClass('is-invalid');
                     if ($('#' + array[i]).val() == null || $('#' + array[i]).val() == undefined || $('#' + array[i]).val().length == 0) {
                         console.log(array[i] + '-' + $('#' + array[i]).val());
                         if (durum)
                             firstError = i;
                         durum = 0;
                         $('#' + array[i]).addClass('is-invalid');
                     }
                 }
                 if (firstError > -1) { 
                     $('#' + array[firstError]).focus();
                 }
                 return durum;
             }

             function Login() {

                 var requiredArray = [
                     "kullanici",
                     "sifre",
                     "guvenlikkodu",
                 ];
                 if (!formControl(requiredArray)) {
                     return;
                 }


                 $(".alert-warning").each(function () { $(this).removeClass("alert-warning"); });
                 $("#alertPanel").hide();

                 var data = {}
                 data.kullanici_adi = $("#kullanici").val();
                 data.sifre = $("#sifre").val();
                 data.guvenlikkodu = $("#guvenlikkodu").val();

                if (data.kullanici == "" || data.sifre == "" || data.guvenlikkodu == "") {
                    console.log('Error when login');
                     if (data.kullanici == "")
                         $("#kullanici").addClass("alert-warning");

                     if (data.sifre == "")
                         $("#sifre").addClass("alert-warning");

                     if (data.guvenlikkodu == "")
                         $("#guvenlikkodu").addClass("alert-warning");


                     return;
                     
                 }
                 else {
                     var param = {}
                     param.data = data;
                     console.log(param.data);

                     $.ajax({
                         type: "POST",
                         url: "<%=Page.ResolveUrl("~/ws/KullaniciIslemleri.asmx") %>/Login",
                     contentType: "application/json; charset=utf-8",
                     data: JSON.stringify(param),
                         success: function (data) {
                             
                             console.log(data.d.resultcode);
                         if (data.d.resultcode == "1") {
                             console.log(data.d);

                             
                             location.href = data.d.resultdata;

                         }
                         else {
                             alert("Giriş bilgileri doğrulanamadı");
                             $("#sifre").val("");
                             $("#guvenlikkodu").val("")
                             $("#captcha").attr("src", "captcha.ashx?" + new Date().getTime());
                         }
                     },
                         error: function (data) {
                             alert("Giriş İşlemi Sırasında Hata İle Karşılaşıldı."); console.error(data); $("#captcha").attr("src", "captcha.ashx?" + new Date().getTime()); 
                         }
                 });



                 }

               
             }

            </script>
    </form>
</body>
</html>

