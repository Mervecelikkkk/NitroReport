<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Noktalar.aspx.cs" Inherits="NitroReport.Noktalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-col w-100 pb-5">

        <div class="container-fluid">

            <div class="row">
                <div class="col-12 ">


                    <div class="page-baslik">
                        <h2 class="mt-3 mb-3">Noktalar</h2>


                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col ">
                    <div class="boxes pad-sm">

                        <div class="boxes-header pad-b-sm">
                            <div data-toggle="modal" data-target="#noktaTanımlamaModal" class="add-btn"><a href="#"><i class="fas fa-plus"></i></a></div>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card p-2">

                                <div class="row card-title-row mb-2  pt-1 pb-1 sm-hide">

                                    <div class="col-6 col-lg-3">Nokta Adı</div>
                                    <div class="col-6 col-lg-2">Adres1</div>
                                    <div class="col-6 col-lg-2">Adres2</div>
                                    <div class="col-6 col-lg-1">İl</div>
                                    <div class="col-6 col-lg-1">İlçe</div>
                                    <div class="col-6 col-lg-1">Bayi Tipi</div>
                                    <div class="col-6 col-lg-1">Kapı No</div>
                                    <div class="col-6 col-lg-1">Yetkili Adı </div>

                                    <div class="col-lg-12">
                                        <hr class="mt-2 mb-0" />

                                    </div>
                                </div>

                                <div class="ng-hide" ng-show="liste.length">
                                    <div class="row pt-1 pb-1" ng-click="DetayGetir(item); ModalShow()" ng-repeat="item in liste">

                                        <div class="col-6 col-lg-3   mt-1 mb-1">{{item.noktaAdi}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adres1}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adres2}}</div>
                                        <div class="col-6 col-lg-1   mt-1 mb-1">{{item.il}}</div>
                                        <div class="col-6 col-lg-1   mt-1 mb-1">{{item.ilce}}</div>
                                        <div class="col-6 col-lg-1   mt-1 mb-1">{{item.bayiTipi}}</div>
                                        <div class="col-6 col-lg-1   mt-1 mb-1">{{item.kapiNo}}</div>
                                        <div class="col-6 col-lg-1   mt-1 mb-1">{{item.yetkiliAdi}}</div>



                                        <div class="col-12 ">
                                            <hr class="mt-2 mb-0" />
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

        </div>
    </div>



    <!-- Nokta Tanımlama Modal -->
    <div class="modal fade" id="noktaTanımlamaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1" style="font-size: 18px">Nokta Bilgisi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>


                <div class="modal-body">

                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="form-group">

                                <div class="form-group col-12 col-md-12">
                                    <label>Nokta Adı</label>
                                    <input type="text" ng-model="item.noktaAdi" class="form-control form-control-sm" />
                                </div>
                                <div class="form-group col-12 col-md-12">
                                    <label>Yetkili Adı</label>
                                    <input type="text" ng-model="item.yetkiliAdi" class="form-control form-control-sm" />
                                </div>
                                   <div class="form-group col-12 col-md-12">
                                    <label>Kapı No</label>
                                    <input type="text" ng-model="item.kapiNo" class="form-control form-control-sm" />
                                </div>
                                <div class="form-group col-12 col-md-6">
                                         <label>Bayi Tipi</label>
                                    <select ng-model="item.bayiTipi" class="custom-select custom-select-sm">
                                  
                                        <option value="REST">REST</option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>


                                    </select>
                                    </div>

                                    <div class="form-group col-12 col-md-12">
                                        <label>İl</label>
                                        <input type="text" ng-model="item.il" class="form-control form-control-sm" />
                                    </div>
                                    <div class="form-group col-12 col-md-12">
                                        <label>İlçe</label>
                                        <input type="text" ng-model="item.ilce" class="form-control form-control-sm" />
                                    </div>
                                    <div class="form-group col-12 col-md-12">
                                        <label>Adres1</label>
                                        <textarea class="form-control" ng-model="item.adres1" rows="3"></textarea>
                                    </div>
                                    <div class="form-group col-12 col-md-12">
                                        <label>Adres2</label>
                                        <textarea class="form-control" ng-model="item.adres2" rows="3"></textarea>
                                    </div>






                                    <div class="col-12">
                                        <div class="px-lg-1 text-left">
                                            <div class="btn btn-sm btn-danger" ng-show="item.id > 0" ng-click="Sil(id)">Sil</div>
                                        </div>


                                    </div>



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

                id: 0, noktaAdi: " ", il: " ", ilce: " ", sifre: " ", adres1: " "
            };

            parent.item = parent.defaultData;






            parent.liste = []

            parent.Kaydet = function () {

                var param = {}

                var data = {}

                data.id = parent.item.id;

                data.noktaAdi = parent.item.noktaAdi;
                data.il = parent.item.il;
                data.ilce = parent.item.ilce;
                data.adres1 = parent.item.adres1;
                data.adres2 = parent.item.adres2;
                data.bayiTipi = parent.item.bayiTipi;
                data.yetkiliAdi = parent.item.yetkiliAdi;
                data.kapiNo = parent.item.kapiNo;

                param.data = data;

                if (parent.item.noktaAdi == " " || parent.item.il == " " || parent.item.ilce == " " || parent.item.adres == " ") {
                    alert("Lütfen gerekli bilgileri doldurun.")
                    return;
                }
                console.log(data);

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Noktalar.asmx") %>/Kaydet",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        $('#noktaTanımlamaModal').modal('hide');
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
                    url: "<%=Page.ResolveUrl("~/ws/Noktalar.asmx") %>/Listele",
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

                $('#noktaTanımlamaModal').modal('show');

            }







            parent.Sil = function (id) {


                var data = {}

                data.id = parent.item.id;

                console.log(data);




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Noktalar.asmx")%>/Sil",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),

                    success: function (data) {


                        parent.Listele();


                        console.log(data);

                        parent.$apply();
                        $('#noktaTanımlamaModal').modal('hide');

                    },

                    error: function (data) {
                        console.error(data)
                    }
                });
            }






            parent.load();






        });

    </script>



























</asp:Content>
