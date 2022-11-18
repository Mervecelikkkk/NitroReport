<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Kullanicilar.aspx.cs" Inherits="NitroReport.Kullanicilar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .card-header {
            font-weight: 700;
            font-size: 14px;
            background: none
        }

        .bg-yellow {
            background: #fec107 !important
        }

        .bg-red {
            background: #ff2a00 !important
        }

        .yuzde {
            font-size: 18px;
            opacity: 0.7;
            padding-top: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-col w-100 pb-5">

        <div class="container-fluid">
              <div class="col-12">
            <div class="row">
                 
                <div class="col-12 col-lg-10">


                    <div class="page-baslik">
                        <h2 class="mb-3 mt-3">Kullanıcılar</h2>
                        

                    </div>


                </div>
                       <div class="col-12 col-md-2 col-lg-2 p-1">
                    <div class="card total-data-box bg-success text-light text-right  border-0 " >
                        <div class="card-body" ng-init="TotalListele()">
                            <div class="row">
                             
                                <div class="col-7">
                                    <div class="md-text">{{itemTotal.toplamNokta}}</div>
                                    <div class="sm-text">TOPLAM NOKTA</div>
                                </div>
                                <div class="col-5 align-self-center">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
            </div>



            <div class="row">
                <div class="col-lg-12 ">

                    <div class="card p-2">
                         <div class="boxes-header pad-b-sm">
                            <div data-toggle="modal" data-target="#kullaniciTanimlamaModal" class="add-btn"><a href="#"><i class="fas fa-plus"></i></a></div>

                        </div>
                        <div class="row card-title-row mb-2 sm-hide">

                            <div class="col-6 col-lg-2">Adı</div>
                            <div class="col-6 col-lg-2 ">Kullanıcı Adı</div>
                            <div class="col-6 col-lg-2">Şifre</div>
                            <div class="col-6 col-lg-2">Aktif</div>
                            <div class="col-6 col-lg-1">Kullanıcı Türü</div>
                            <div class="col-6 col-lg-1">İl</div>
                            <div class="col-6 col-lg-2">GSM</div>
                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />

                            </div>
                        </div>


                        <div class="ng-hide" ng-show="liste.length">
                            <div class="row" ng-click="DetayGetir(item); ModalShow()" ng-repeat="item in liste">


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kullaniciAdi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.sifre}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.aktif}}</div>
                                <div class="col-6 col-lg-1   mt-1 mb-1">{{item.kullaniciTuru}}</div>
                                <div class="col-6 col-lg-1   mt-1 mb-1">{{item.il}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.GSM}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>


                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!liste.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>








    <!-- Nokta Tanımlama Modal -->
    <div class="modal fade" id="kullaniciTanimlamaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1" style="font-size: 18px">Kullanıcı Bilgisi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>


                <div class="modal-body">

                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="form-group">

                                <div class="row">

                                    <div class="form-group col-12 col-md-6">
                                        <label>Adı</label>
                                        <input type="text" ng-model="item.adi" class="form-control form-control-sm" />
                                    </div>

                                    <div class="form-group col-12 col-md-6">
                                        <label>Kullanıcı Adı</label>
                                        <input type="text" ng-model="item.kullaniciAdi" class="form-control form-control-sm" />
                                    </div>

                                </div>


                                <div class="row">

                                    <div class="form-group col-12 col-md-6">
                                        <label>Şifre</label>
                                        <input type="text" ng-model="item.sifre" class="form-control form-control-sm" />
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>GSM</label>
                                        <input type="text" ng-model="item.GSM" class="form-control form-control-sm" />
                                    </div>
                                </div>


                                <div class="row">

                                    <div class="form-group col-12 col-md-6">
                                        <label>Kullanıcı Türü</label>
                                        <select ng-model="item.kullaniciTuru" class="custom-select custom-select-sm">
                                          
                                            <option value="Yönetici">Yönetici</option>
                                            <option value="Personel">Personel</option>


                                        </select>
                                    </div>

                                            <div class="form-group col-12 col-md-6">
                                                <label>Aktiflik Durumu</label>
                                            <select ng-model="item.aktif" class="custom-select custom-select-sm">                               
                                            <option value="Aktif">Aktif</option>
                                            <option value="Aktif Değil">Aktif Değil</option>


                                        </select>
                                    </div>
                         <%--           <div class="form-group col-12 col-md-6 ">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" ng-model="item.aktif">
                                            <label class="form-check-label" for="aktif">
                                                Aktif
                                            </label>
                                        </div>
                                    </div>--%>


                                </div>
                                <div class="row">
                                    
                                   <div class="form-group col-12 col-md-6">
                                        <label>İl</label>
                                        <input type="text" ng-model="item.il" class="form-control form-control-sm" />
                                    </div>
                                </div>






<%--

                                <div class="col-12">
                                    <div class="px-lg-1 text-left">
                                        <div class="btn btn-sm btn-danger" ng-show="item.id > 0" ng-click="Sil(id)">Sil</div>
                                    </div>


                                </div>--%>



                                <div class="col-12">
                                    <div class="px-lg-1 text-right">
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">



                    <div class="btn btn-sm btn-outline-secondary" data-dismiss="modal">İptal</div>

                    <div class="btn btn-sm btn-warning text-light" ng-click="Kaydet()">{{item.id > 0 ? 'GÜNCELLE' : 'KAYDET' }}</div>

                </div>
            </div>

        </div>



    </div>








    <script>

        var app = angular.module("app", [])
        app.controller("mainController", function ($scope) {


            var parent = $scope;



            parent.load = function () {
                parent.Listele();
                if (parent.id > 0)
                    parent.DetayGetir();


            }


            parent.defaultData = {

                id: 0, adi: "", kullaniciAdi: "", sifre: "", aktif: "Aktif", GSM: 0, kullaniciTuru: "Personel", il:""
            };

            parent.item = parent.defaultData;





            parent.liste = []

            parent.Kaydet = function () {

                var param = {}

                var data = {}

                data.id = parent.item.id;

                data.adi = parent.item.adi;
                data.kullaniciAdi = parent.item.kullaniciAdi;
                data.sifre = parent.item.sifre;
                data.aktif = parent.item.aktif;

                data.kullaniciTuru = parent.item.kullaniciTuru;
                data.il = parent.item.il;
                data.GSM = parent.item.GSM;

                param.data = data;
                console.log(data);

                if (parent.item.adi == "" || parent.item.kullaniciAdi == "" || parent.item.sifre == "") {
                    alert("Lütfen gerekli bilgileri doldurun.")
                    return;
                }


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Kullanicilar.asmx") %>/Kaydet",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        $('#kullaniciTanimlamaModal').modal('hide');
                        parent.$apply();


                    },
                    error: function (data) {
                        console.error(data)
                    }
                });
            }





            parent.Listele = function () {


                var data = {}





                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Kullanicilar.asmx") %>/Listele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {
                        console.log(data);

                        parent.liste = data.d;

                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }





            parent.DetayGetir = function (item) {


                //var data = {}



                parent.item = item;


            
                console.log(item)

                $('#kullaniciTanimlamaModal').modal('show');

       
            }





            parent.Sil = function (id) {


                var data = {}

                data.id = parent.item.id;

                console.log(data);




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Kullanicilar.asmx")%>/Sil",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),

                    success: function (data) {


                        parent.Listele();


                        console.log(data);

                        parent.$apply();

                        $('#kullaniciTanimlamaModal').modal('hide');
                    },

                    error: function (data) {
                        console.error(data)
                    }
                });
            }

            parent.itemTotal = {}

            parent.TotalListele = function () {

                //var data = {};
                //data.baslangicTarihi = parent.filter.baslangicTarihi;
                //data.bitisTarihi = parent.filter.bitisTarihi;
                //data.personelid = parent.filter.personelAdi;
                //data.il = parent.filter.il;
                //var param = {};
                //param.data = data;

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/TotalListele",
                    contentType: "application/json; charset=utf-8",
                    //data: JSON.stringify(param),
                    success: function (data) {
                        console.log(data);

                        parent.itemTotal = data.d;
                        console.log(parent.itemTotal)
                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }




            parent.load();






        });

    </script>






























</asp:Content>
