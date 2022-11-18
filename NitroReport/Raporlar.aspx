<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Raporlar.aspx.cs" Inherits="NitroReport.Raporlar" %>

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
    <div class="content-col w-100 pb-5 bg-light">

        <div class="container-fluid pt-3">
            <div class="row ml-n1 mr-n1" ng-init="TotalListele()">
                <div class="col-12 col-md-6 col-lg-3 p-1">
                    <div class="card total-data-box bg-red text-light text-center  border-0 " style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.toplamNokta}}</div>
                                    <div class="sm-text">TOPLAM NOKTA</div>
                                </div>
                                <div class="col-5 align-self-center">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 p-1">
                    <div class="card total-data-box bg-yellow text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.ziyaretEdilenNokta}}</div>
                                    <div class="sm-text">ZİYARET EDİLEN NOKTA</div>
                                </div>
                                <div class="col-5 align-self-center">
                                    <i class="fas fa-street-view"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 p-1">
                    <div class="card total-data-box bg-success text-light text-center  border-0" style="height: 110px">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.ziyaretEdilenNokta}}</div>
                                    <div class="sm-text">UYGULAMA YAPILAN NOKTA</div>
                                </div>
                                <div class="col-5 align-self-center">
                                    <i class="fas fa-flag-checkered"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 p-1">
                    <div class="card total-data-box bg-info text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.calisanPersonel}}</div>
                                    <div class="sm-text">ÇALIŞAN PERSONEL</div>
                                </div>
                                <div class="col-5 align-self-center">
                                    <i class="fas fa-users"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid mt-3">
            <div class="row ml-n1 mr-n1">
                <div class="col-12 col-lg-6 mb-2 px-1">
                    <div class="card">
                        <div class="card-header border-bottom-0  pt-3 pb-3">
                            TARİHE GÖRE UYGULAMA ORANI
                        </div>
                        <div class="card-body pt-0" ng-init="TarihListele()">
                            <div class="">
                                <canvas style="height: 290px; width: 100%;" id="line" class="chart chart-line"
                                    chart-data="tarihChartData" chart-labels="tarihChartLabels" chart-options="tarihChartOptions"></canvas>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 px-1">
                    <div class="card  mb-2">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3 " ng-init="ZiyaretEdilenNoktaListele();ToplamNoktaListele()">
                            PROJENİN TAMAMLANMA ORANI
                        </div>
                        <div class="card-body text-center pt-1">
                            <div class="data-name-lg text-success pb-3">
                                %{{(itemTotal.ziyaretEdilenNokta*100)/(itemTotal.toplamNokta) | number : 0 }}
                            </div>
                            <%--   <progress id="animationProgress" max="1" value="0" style="width: 100%"></progress>--%>
                        </div>
                    </div>
                    <div class="card mb-2" ng-init="DurumListele()">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                            UYGULAMA DURUMU
                        </div>
                        <div class="card-body  pt-1">
                            <div class="row mb-1 " ng-repeat="item in durumListe">
                                <div class="col-9 border-bottom p-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>
                                <div class="col-3  border-bottom  p-1 text-center">
                                    <div class="rounded bg-success text-light d-inline-block px-1">{{item.uygulamaSayisi}}</div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 px-1" ng-init="PersonelListele()">
                    <div class="card  mb-2">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3 ">
                            PERSONELE GÖRE UYGULAMA ORANI
                        </div>
                        <div class="card-body  pt-1" style="height: 299px; overflow-x: hidden; overflow-y: scroll">
                            <div class="">
                                <canvas id="pie" class="chart chart-pie"
                                    chart-data="personelChartData" chart-labels="personelChartLabels" chart-options="personelChartOptions"></canvas>

                            </div>
                            <div class="row mb-1">
                                <div class="col-7 border-bottom p-1"><b>Personel Adı</b></div>
                                <div class="col-5 border-bottom  p-1 text-right"><b>Uygulama Sayısı</b></div>

                            </div>

                            <div class="row mb-1 " ng-repeat="item in personelListe">
                                <div class="col-9 border-bottom p-1">{{item.adi}}</div>
                                <div class="col-3  border-bottom  p-1 text-center">
                                    <div class="rounded bg-success text-light d-inline-block px-1">{{item.uygulamaSayisi}}</div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>

        </div>


        <div class="container-fluid pt-3">
            <div class="row">
                <div class="form-group col-6 col-md-3">
                    <label>Başlangıç Tarihi</label>
                    <input type="date" ng-model="filter.baslangicTarihi" class="form-control form-control-sm" />
                </div>
                <div class="form-group col-6 col-md-3">
                    <label>Bitiş Tarihi</label>
                    <input type="date" ng-model="filter.bitisTarihi" class="form-control form-control-sm" />
                </div>
                <div class="form-group col-6 col-md-3" ng-init="loadPersoneller()">
                    <label>Personel Adı</label>
                    <select ng-model="filter.personelAdi" data-live-search="true" class="selectpicker form-control form-control-sm">

                        <option ng-repeat="item in personelListe" ng-value="item.id">{{item.adi.substr(0,15)}}</option>

                    </select>
                </div>
                <div class="form-group col-6 col-md-2">
                    <label>İl</label>
                    <input type="text" ng-model="filter.il" class="form-control form-control-sm" />
                </div>


                <div class="btn btn-success btn-sm mt-4" style="margin-bottom: 1rem;" ng-click="Filtrele()">Filtrele</div>

            </div>
        </div>


        <div class="container-fluid">
            <div class="row ml-n1 mr-n1" ng-init="TotalListele()">
                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-red text-light text-center  border-0 " style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.kaziKazanOlanNoktaSayisi}}</div>
                                    <div class="sm-text">3 KK BİRLİKTE</div>
                                </div>

                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.kaziKazanOlanNoktaSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-yellow text-light text-center  border-0" style="height: 110px; font-size: ">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.herhangiKaziKazanSayisi}}</div>
                                    <div class="sm-text">HERHANGİ BİR KK</div>
                                </div>

                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.herhangiKaziKazanSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-success text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.milliPiyangoSayisi}}</div>
                                    <div class="sm-text">MİLLİ PİYANGO</div>
                                </div>



                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.milliPiyangoSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-info text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.onikiAySansSayisi}}</div>
                                    <div class="sm-text">12 AY ŞANS</div>
                                </div>

                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.onikiAySansSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-red text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.sansDagiSayisi}}</div>
                                    <div class="sm-text">ŞANS DAĞI</div>
                                </div>


                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.sansDagiSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-2 p-1">
                    <div class="card total-data-box bg-yellow text-light text-center  border-0" style="height: 110px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <div class="lg-text">{{itemTotal.altinSayisi}}</div>
                                    <div class="sm-text">ALTIN</div>
                                </div>

                                <div class="col-5">
                                    <div class="yuzde">% {{itemTotal.altinSayisi * 100 / itemTotal.seciliTarihtekiNokta | number:0}}</div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>






        <div class="container-fluid mt-3">
            <div class="row ml-n1 mr-n1">
                <%--    <div class="col-12 col-lg-3 mb-2 px-1">
                    <div class="card" ng-init="KaziKazanSansDagiListele()">
                        <div class="card-header border-bottom-0  pt-3 pb-3">
                            KAZI KAZAN ŞANS DAĞI
                        </div>
                        <div class="card-body pt-1">
                            <div class="">
                                <canvas id="pie" class="chart chart-pie"
                                    chart-data="kaziKazanSansDagiChartData" chart-labels="kaziKazanSansDagiChartLabels" chart-options="kaziKazanSansDagiChartOptions"></canvas>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 px-1">


                    <div class="card mb-2" ng-init="KaziKazanAltinListele()">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                            KAZI KAZAN ALTIN
                        </div>
                        <div class="card-body  pt-1">
                            <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanAltinChartData" chart-labels="kaziKazanAltinChartLabels" chart-options="kaziKazanAltinChartOptions"></canvas>

                        </div>
                    </div>

                </div>
                <div class="col-12 col-lg-3 px-1">

                    <div class="card mb-2" ng-init="KaziKazanOnikiAySansListele()">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                            KAZI KAZAN ON İKİ AY ŞANS
                        </div>
                        <div class="card-body  pt-1">
                            <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanOnikiAySansChartData" chart-labels="kaziKazanOnikiAySansChartLabels" chart-options="kaziKazanOnikiAySansChartOptions"></canvas>

                        </div>
                    </div>

                </div>--%>
                <%--             <div class="col-12 col-lg-3 px-1">


                    <div class="card mb-2" ng-init="KaziKazanSatisListele()">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                            KAZI KAZAN SATIŞ ORANI
                        </div>
                        <div class="card-body  pt-1">
                            <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanSatisChartData" chart-labels="kaziKazanSatisChartLabels" chart-options="kaziKazanSatisChartOptions"></canvas>

                        </div>
                    </div>

                </div>--%>

                <%--   <div class="col-12 col-lg-4 mb-2 px-1">
                    <div class="card" ng-init="DurumListele()">
                        <div class="card-header border-bottom-0  pt-3 pb-3">
                           UYGULAMA DURUM ORANI
                        </div>
                        <div class="card-body pt-1">
                            <div class="">
                                <canvas id="pie"  style="height:200px;" class="chart chart-pie"
                                    chart-data="durumChartData" chart-labels="durumChartLabels" chart-options="durumChartOptions"></canvas>

                            </div>
                        </div>
                    </div>
                </div>--%>



                <div class="container-fluid mt-3">
                    <div class="row ml-n1 mr-n1">

                        <div class="col-12 col-lg-6 px-1">


                            <div class="card mb-2" ng-init="KaziKazanSatisSebepListele()">
                                <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                                    KAZI KAZAN SİPARİŞ VERMEME SEBEPLERİ
                                </div>
                                <%--<div class="card-body  pt-1">
                      <canvas id="bar" class="chart chart-horizontalBar"
                                chart-data="kaziKazanSatisSebepChartData" chart-labels="kaziKazanSatisSebepChartLabels" chart-options="kaziKazanSatisSebepChartOptions"></canvas>

                        </div>--%>




                                <div class="card-body  pt-1" style="height: 299px; overflow-x: hidden; overflow-y: scroll">

                                    <div class="row mb-1">
                                        <div class="col-7 border-bottom p-1"><b>Açıklama</b></div>
                                        <div class="col-5 border-bottom  p-1 text-right"><b>Nokta Sayısı</b></div>

                                    </div>

                                    <div class="row mb-1 " ng-repeat="item in kaziKazanSatisSebepListe">
                                        <div class="col-9 border-bottom p-1">{{item.kaziKazanSatisSebep}}</div>
                                        <div class="col-3  border-bottom  p-1 text-center">
                                            <div class="rounded bg-success text-light d-inline-block px-1">{{item.uygulamaSayisi}}</div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>

                        <div class="col-12 col-lg-6 px-1">

                            <div class="card mb-2" ng-init="SiparisSuresiKirilimiListele()">
                                <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                                    KAZI KAZAN SİPARİŞ ZAMAN KIRILIMI
                                </div>
                                <div class="card-body  pt-1" style="height: 299px; overflow-x: hidden; overflow-y: scroll">
                                    <canvas id="horizontalBar" class="chart chart-bar"
                                        chart-data="kaziKazanSiparisZamanChartData" chart-labels="kaziKazanSiparisZamanChartLabels" chart-options="kaziKazanSiparisZamanChartOptions"></canvas>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="container-fluid mt-3">
                    <div class="row ml-n1 mr-n1">







                        <%--   <div class="card mb-2" ng-init="UygulamaPuaniListele()">
                        <div class="card-header border-bottom-0 text-center pt-3 pb-3">
                          UYGULAMA PUANI ORANI
                        </div>
                        <div class="card-body  pt-1">
                                  <canvas id="bar" class="chart chart-bar"
                                chart-data="uygulamaPuaniChartData" chart-labels="uygulamaPuaniChartLabels" chart-options="uygulamaPuaniChartOptions"></canvas>

                        </div>
                    </div>--%>

                        <div class="col-12 col-lg-6 px-1">
                            <div class="card  mb-2">
                                <div class="card-header border-bottom-0 text-center pt-3 pb-3" ng-init="UygulamaPuaniListele()">
                                    MATERYAL UYGULAMA DAĞILIMI
                                </div>
                                <div class="card-body  pt-1" style="height: 299px; overflow-x: hidden; overflow-y: scroll">

                                    <div class="row mb-1">
                                        <div class="col-7 border-bottom p-1"><b>Uygulama Puanı</b></div>
                                        <div class="col-5 border-bottom  p-1 text-right"><b>Uygulama Sayısı</b></div>

                                    </div>

                                    <div class="row mb-1 " ng-repeat="item in uygulamaPuaniListe">
                                        <div class="col-9 border-bottom p-1">{{item.baslik}}</div>
                                        <div class="col-3  border-bottom  p-1 text-center">
                                            <div class="rounded bg-success text-light d-inline-block px-1">{{item.uygulamaSayisi}}</div>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>



                        <div class="col-12 col-lg-6 mb-2 px-1">
                            <div class="card" ng-init="MateryalleriListele()">
                                <div class="card-header border-bottom-0  pt-3 pb-3">
                                    MATERYALLERİN UYGULAMA SAYILARI
                                </div>
                                <div class="card-body pt-1">
                                    <div class="">
                                        <canvas id="materyalChart" class="chart chart-bar"
                                            chart-data="materyalChartData" chart-labels="materyalChartLabels" chart-options="materyalChartOptions"></canvas>

                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>

                </div>



                <div class="container-fluid">
                    <div class="row">
                        <div class="ng-hide">

                            <div class="boxes-header pad-b-sm">
                                <div data-toggle="modal" data-target="#uygulamaTanımlamaModal" ng-click="item.fotograflar_array=[];item.id=0" class="add-btn"><a href="#"><i class="fas fa-plus"></i></a></div>

                            </div>
                        </div>
                        <div class="col-12">
                            <h4 class="mt-3 mb-3">Uygulamalar</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card p-2">
                                <div class="card-header">
                                    <div class="row  sm-hide">

                                        <div class="col-6 col-lg-2">Personel Adı</div>
                                        <div class="col-6 col-lg-1">Bayi id</div>
                                        <div class="col-6 col-lg-2 ">Nokta Adı</div>
                                        <div class="col-6 col-lg-1">İl</div>
                                        <div class="col-6 col-lg-2">İlçe</div>
                                        <div class="col-6 col-lg-2">Bayiye Gidildiğinde Uygulama Yapılmış mı?</div>
                                        <div class="col-6 col-lg-2">Uygulama Tarihi</div>

                                    </div>
                                </div>
                                <div class="card-body scroll-liste">
                                    <div class="" ng-show="liste.length">
                                        <div class="row uygList ng-scope" ng-click="UygulamaDetayGetir(item)" ng-repeat="item in liste">

                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adi}}</div>
                                            <div class="col-6 col-lg-1   mt-1 mb-1">{{item.bayiid}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.noktaAdi}}</div>
                                            <div class="col-6 col-lg-1   mt-1 mb-1">{{item.il}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ilce}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaTarihi}}</div>
                                            <div class="col-12 ">
                                                <hr class="mt-1 mb-0">
                                            </div>
                                        </div>




                                    </div>

                                </div>
                                <div class=" row mt-3 mb-2 ">

                                    <div class="col-12 text-right">
                                        <div class="btn btn-sm btn-success" ng-click="UygulamaExcelindir()">Excel Olarak İndir</div>
                                        <div class="btn btn-sm btn-secondary" onclick="$('.card-body').removeClass('scroll-liste')">Tümünü Gör</div>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="ng-hide">

                            <%--     <div class="boxes-header pad-b-sm">
                            <div data-toggle="modal" data-target="#uygulamaTanımlamaModal" class="add-btn"><a href="#"><i class="fas fa-plus"></i></a></div>

                        </div>--%>
                        </div>
                        <div class="col-12" ng-init="GidilmemisNoktaListele()">
                            <h4 class="mt-3 mb-3">Uygulamaya Gidilmemiş Noktalar</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card p-2">
                                <div class="card-header">
                                    <div class="row  sm-hide">

                                        <div class="col-6 col-lg-1">id</div>
                                        <%--     <div class="col-6 col-lg-1">Bayi id</div>--%>
                                        <div class="col-6 col-lg-3">Nokta Adı</div>
                                        <div class="col-6 col-lg-2">İlçe</div>
                                        <div class="col-6 col-lg-2">Adres 1</div>
                                        <div class="col-6 col-lg-2">Adres 2</div>
                                        <div class="col-6 col-lg-2">Kapı No</div>

                                    </div>
                                </div>
                                <div class="card-body scroll-liste">
                                    <div class="" ng-show="gidilmemisNoktaListe.length">
                                        <div class="row uygList ng-scope" ng-click="UygulamaDetayGetir(item)" ng-repeat="item in gidilmemisNoktaListe | filter:item.baslangicTarihi">

                                            <div class="col-6 col-lg-1   mt-1 mb-1">{{item.id}}</div>
                                            <%--   <div class="col-6 col-lg-1   mt-1 mb-1">{{item.bayiid}}</div>--%>
                                            <div class="col-6 col-lg-3   mt-1 mb-1">{{item.noktaAdi}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ilce}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adres1}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adres2}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kapiNo}}</div>
                                            <div class="col-12 ">
                                                <hr class="mt-1 mb-0">
                                            </div>
                                        </div>




                                    </div>

                                </div>
                                <div class=" row mt-3 mb-2 ">

                                    <div class="col-12 text-right">
                                        <div ng-click="GidilmemisNoktalarExcelindir()" class="btn btn-sm btn-success">Excel Olarak İndir</div>
                                        <div class="btn btn-sm btn-secondary" onclick="$('.card-body').removeClass('scroll-liste')">Tümünü Gör</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>



            </div>

        </div>



















    </div>


    <!-- Uygulama Tanımlama Modal -->
    <div class="modal fade" id="uygulamaTanımlamaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" ng-init="loadNoktalar()">
        <div class="modal-dialog max-medium">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="H1" style="font-size: 18px">Uygulama Bilgisi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <style>
                    .list-group-item:hover {
                        background: #fcf9cc !important
                    }

                    .uygList:hover {
                        background: #fcf9cc !important
                    }
                </style>
                <div class="modal-body">

                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action ">
                                    <div class="d-flex w-100 justify-content-between">

                                        <div class="card-header" style="width: 100%; padding: 0px;">
                                            <div class="row  sm-hide">

                                                <div class="col-6 col-lg-2">Personel Adı</div>
                                                <div class="col-6 col-lg-2 ">Nokta Adı</div>
                                                <div class="col-6 col-lg-1">İl</div>
                                                <div class="col-6 col-lg-2">İlçe</div>
                                                <div class="col-6 col-lg-3">Bayiye Gidildiğinde Uygulama Yapılmış mı?</div>
                                                <div class="col-6 col-lg-2">Uygulama Tarihi</div>

                                            </div>
                                        </div>
                                    </div>
                                    <div>

                                        <div class="row  ng-scope mt-2" ng-click="UygulamaDetayGetir(item)">

                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adi}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.noktaAdi}}</div>
                                            <div class="col-6 col-lg-1   mt-1 mb-1">{{item.il}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ilce}}</div>
                                            <div class="col-6 col-lg-3   mt-1 mb-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaTarihi}}</div>

                                        </div>
                                    </div>
                                    <div class="gallery-box mt-2" ng-repeat="items in item.fotograflar_array">

                                        <div class="foto-list">
                                            <img src="{{items.base64Data}}" alt="{{items.dosyaadi}}" />
                                        </div>

                                    </div>


                                </a>

                                <div class="">
                                    <hr />
                                    <h5 class="modal-title" id="H1" style="font-size: 18px">Ürün Bulunurluk</h5>
                                    <hr />

                                </div>

                                <a href="#" class="list-group-item list-group-item-action">

                                    <div class="d-flex w-100 justify-content-between">




                                        <div class="card-header" style="width: 100%; padding: 0px;">
                                            <div class="row  sm-hide">

                                                <div class="col-6 col-lg-3">Kazı Kazan On İki Ay Şans</div>
                                                <div class="col-6 col-lg-2 ">Kazı Kazan Şans Dağı</div>
                                                <div class="col-6 col-lg-2">Kazı Kazan Altın</div>
                                                <div class="col-6 col-lg-2">Milli Piyango Klasik Bilet</div>
                                                <div class="col-6 col-lg-3">Sayısal Oyun Kuponları (sayısal/süper/şans/on numara)</div>

                                            </div>
                                        </div>

                                    </div>
                                    <div>

                                        <div class="row  ng-scope mt-2" ng-click="UygulamaDetayGetir(item)">

                                            <div class="col-6 col-lg-3   mt-1 mb-1">{{item.kaziKazanOnikiAySans}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanSansDagi}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanAltin}}</div>
                                            <div class="col-6 col-lg-2   mt-1 mb-1">{{item.milliPiyangoKlasikBilet}}</div>
                                            <div class="col-6 col-lg-3   mt-1 mb-1">{{item.sayisalOyunKuponlari}}</div>


                                        </div>
                                    </div>
                                </a>
                                <div class="">
                                    <hr />
                                    <h5 class="modal-title" id="H1" style="font-size: 18px">Bayiye Gidildiğinde Uygulama Yapılmış mı?</h5>
                                    <hr />

                                </div>
                                <a href="#" class="list-group-item list-group-item-action">
                                    <div class="d-flex w-100 justify-content-between">
                                        <div class="row  ng-scope mt-2" ng-click="UygulamaDetayGetir(item)">

                                            <div class="col-6 col-lg-12   mt-1 mb-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>


                                        </div>


                                    </div>

                                </a>
                                <div class="">
                                    <hr />
                                    <h5 class="modal-title" id="H1" style="font-size: 18px">POP</h5>
                                    <hr />

                                </div>
                                <a href="#" class="list-group-item list-group-item-action">
                                    <div class="d-flex w-100 justify-content-between">
                                        <div class="card-header" style="width: 100%; padding: 0px;">
                                            <div class="row  sm-hide">

                                                <div class="col-6 col-lg-3">Oyun Kupon Ünitesi</div>
                                                <div class="col-6 col-lg-3 ">Kazı Kazan Ünite(Planogram Uygulanacak)</div>
                                                <div class="col-6 col-lg-2">1. Duyuru Çerçevesi</div>
                                                <div class="col-6 col-lg-2">2. Duyuru Çerçevesi</div>
                                                <div class="col-6 col-lg-2">Kazı Kazan Poster</div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row  ng-scope mt-2" ng-click="UygulamaDetayGetir(item)">

                                        <div class="col-6 col-lg-3   mt-1 mb-1">{{item.oyunKuponUnitesi}}</div>
                                        <div class="col-6 col-lg-3   mt-2 mb-1">{{item.kaziKazanUnite_Planogram}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.birinciDuyuruCercevesi}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ikinciDuyuruCercevesi}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanPoster}}</div>

                                    </div>
                                    <hr />
                                    <div class="card-header" style="width: 100%; padding: 0px;">
                                        <div class="row  sm-hide">
                                            <div class="col-6 col-lg-3">Milli Piyango Poster</div>
                                            <div class="col-6 col-lg-3 ">Sayısal Loto Poster</div>
                                            <div class="col-6 col-lg-2">Sticker</div>
                                            <div class="col-6 col-lg-2">Bayrak</div>
                                            <div class="col-6 col-lg-2">Yorum</div>

                                        </div>
                                    </div>
                                    <div class="row  ng-scope mt-2" ng-click="UygulamaDetayGetir(item)">
                                        <div class="col-6 col-lg-3   mt-1 mb-2">{{item.milliPiyangoPoster}}</div>
                                        <div class="col-6 col-lg-3   mt-1 mb-1">{{item.sayisalLotoPoster}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.sticker}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.bayrak}}</div>
                                        <div class="col-6 col-lg-2   mt-1 mb-1">{{item.yorum}}</div>


                                    </div>
                                </a>

                            </div>






                        </div>
                    </div>
                </div>
                <div class="modal-footer" ng-hide="isLoading">

                    <%--    
                    <div class="btn btn-sm btn-danger" ng-show="item.id > 0" ng-click="Sil(id)">Sil</div>
                    
                    <div class="btn btn-sm btn-outline-secondary" data-dismiss="modal">İptal</div>

                    <div class="btn btn-sm btn-warning text-light" ng-click="Kaydet()">{{item.id > 0 ? 'GÜNCELLE' : 'KAYDET' }}</div>--%>
                </div>

                <div class="modal-footer" ng-show="isLoading">
                    <div class="text-warning text-lg-right">{{loadingText}}</div>
                </div>
            </div>

        </div>



    </div>





    <script>

        var app = angular.module("app", ["chart.js"])
        app.controller("mainController", function ($scope) {


            var parent = $scope;



            parent.load = function () {

                parent.DurumListele();
                parent.UygulamaListele();
            }


            parent.personelListe = []
            parent.personelChartData = []
            parent.personelChartLabels = []
            parent.personelChartOptions = {}

            parent.PersonelListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/PersonelListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.personelListe = data.d;
                        for (i in data.d) {
                            parent.personelChartData.push(data.d[i].uygulamaSayisi);
                            parent.personelChartLabels.push(data.d[i].adi);

                        }

                        parent.personelChartOptions = {
                            legend: {
                                display: false,
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
                                position: 'bottom'
                            }
                        }

                        parent.$apply();
                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }


            parent.durumListe = []
            parent.durumChartData = []
            parent.durumChartLabels = []
            parent.durumChartOptions = {}
            parent.DurumListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/DurumListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.durumListe = data.d;
                        for (i in data.d) {
                            parent.durumChartData.push(data.d[i].uygulamaSayisi);
                            parent.durumChartLabels.push(data.d[i].bayiyeGidildigindeUygYapilmismi);

                        }

                        parent.durumChartOptions = {
                            legend: {
                                display: true,
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
                                position: 'right'
                            },
                            maintainAspectRatio: false
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }



            parent.kaziKazanSatisSebepListe = []
            parent.kaziKazanSatisSebepChartData = []
            parent.kaziKazanSatisSebepChartLabels = []
            parent.kaziKazanSatisSebepChartOptions = {}
            parent.KaziKazanSatisSebepListele = function () {

                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;
                console.log(data)




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanSatisSebepListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanSatisSebepListe = data.d;
                        //for (i in data.d) {
                        //    parent.kaziKazanSatisSebepChartData.push(data.d[i].uygulamaSayisi);
                        //    parent.kaziKazanSatisSebepChartLabels.push(data.d[i].kaziKazanSatisSebep);

                        //}

                        //parent.kaziKazanSatisSebepChartOptions = {
                        //    legend: {
                        //        display: false,
                        //        labels: {

                        //        },
                        //        position: 'right'
                        //    },
                        //    maintainAspectRatio: false
                        //}

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }




            parent.kaziKazanSiparisZamanListe = []
            parent.kaziKazanSiparisZamanChartData = []
            parent.kaziKazanSiparisZamanChartLabels = []
            parent.kaziKazanSiparisZamanChartOptions = {}
            parent.SiparisSuresiKirilimiListele = function () {

                parent.kaziKazanSiparisZamanListe = []
                parent.kaziKazanSiparisZamanChartData = []
                parent.kaziKazanSiparisZamanChartLabels = []
                parent.kaziKazanSiparisZamanChartOptions = {}


                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.il = parent.filter.il;
                data.personelid = parent.filter.personelAdi;
                var param = {};
                param.data = data;
                console.log(data)

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/SiparisSuresiKirilimiListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanSiparisZamanListe = data.d;
                        for (i in data.d) {
                            parent.kaziKazanSiparisZamanChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanSiparisZamanChartLabels.push(data.d[i].kaziKazanSiparisZaman);

                        }

                        parent.kaziKazanSiparisZamanChartOptions = {
                            legend: {
                                display: false,
                                labels: {

                                },
                                position: 'right'
                            },
                            maintainAspectRatio: false
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }


            parent.uygulamaPuaniListe = []
            parent.uygulamaPuaniChartData = []
            parent.uygulamaPuaniChartLabels = []
            parent.uygulamaPuaniChartOptions = {}

            parent.UygulamaPuaniListele = function () {



                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelid;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;



                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/UygulamaPuaniListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.uygulamaPuaniListe = data.d;
                        for (i in data.d) {
                            parent.uygulamaPuaniChartData.push(data.d[i].uygulamaSayisi);
                            parent.uygulamaPuaniChartLabels.push(data.d[i].baslik);

                        }

                        parent.uygulamaPuaniChartOptions = {
                            legend: {
                                display: true,
                                labels: {

                                },
                                position: 'right'
                            },
                            maintainAspectRatio: false
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }





            parent.ilListe = []
            parent.ilChartData = []
            parent.ilChartLabels = []
            parent.ilChartOptions = {}

            parent.ilListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ilListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {



                        parent.ilListe = data.d;
                        for (i in data.d) {
                            parent.ilChartData.push(data.d[i].uygulamaSayisi);
                            parent.ilChartLabels.push(data.d[i].il);

                        }
                        parent.ilChartOptions = {
                            legend: {
                                display: true,
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
                                position: 'right'
                            },
                            maintainAspectRatio: false
                        }

                        parent.$apply();
                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.ilceListe = []

            parent.ilceChartLabels = []
            parent.ilceChartData = []
            parent.ilceChartOptions = {}

            parent.ilceListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ilceListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {

                        parent.ilceListe = data.d;
                        for (var i in data.d) {
                            parent.ilceChartData.push(data.d[i].uygulamaSayisi);
                            parent.ilceChartLabels.push(data.d[i].ilce);


                        }
                        parent.ilceChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'
                            },
                            maintainAspectRatio: false
                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.tarihListe = []
            parent.tarihChartLabels = []
            parent.tarihChartData = []
            parent.tarihChartOptions = {}

            parent.TarihListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/TarihListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.tarihListe = data.d;
                        for (var i in data.d) {
                            parent.tarihChartData.push(data.d[i].uygulamaSayisi);
                            parent.tarihChartLabels.push(data.d[i].uygulamaTarihi);


                        }
                        parent.tarihChartOptions = {
                            legend: {
                                display: false


                            },


                            elements: {
                                line: {
                                    fill: false
                                }
                            },
                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.kaziKazanOnikiAySansListe = []
            parent.kaziKazanOnikiAySansChartLabels = []
            parent.kaziKazanOnikiAySansChartData = []
            parent.kaziKazanOnikiAySansChartOptions = {}

            parent.KaziKazanOnikiAySansListele = function () {

                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                var param = {};
                param.data = data;




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanOnikiAySansListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanOnikiAySansListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanOnikiAySansChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanOnikiAySansChartLabels.push(data.d[i].kaziKazanOnikiAySans);


                        }
                        kaziKazanOnikiAySansChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'
                            }

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.kaziKazanSansDagiListe = []
            parent.kaziKazanSansDagiChartLabels = []
            parent.kaziKazanSansDagiChartData = []
            parent.kaziKazanSansDagiChartOptions = {}


            parent.KaziKazanSansDagiListele = function () {


                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;
                console.log(param)


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanSansDagiListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanSansDagiListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanSansDagiChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanSansDagiChartLabels.push(data.d[i].kaziKazanSansDagi);


                        }
                        parent.kaziKazanSansDagiChartOptions = {
                            legend: {
                                display: true,


                                position: 'right'
                            },


                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }


            parent.kaziKazanAltinListe = []
            parent.kaziKazanAltinChartLabels = []
            parent.kaziKazanAltinChartData = []
            parent.kaziKazanAltinChartOptions = {}

            parent.KaziKazanAltinListele = function () {


                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                var param = {};
                param.data = data;



                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanAltinListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanAltinListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanAltinChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanAltinChartLabels.push(data.d[i].kaziKazanAltin);


                        }
                        parent.kaziKazanAltinChartOptions = {
                            legend: {
                                display: true,
                                position: 'right'


                            },

                            maintainAspectRatio: false


                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }




            parent.milliPiyangoKlasikBiletListe = []
            parent.milliPiyangoKlasikBiletChartLabels = []
            parent.milliPiyangoKlasikBiletChartData = []
            parent.milliPiyangoKlasikBiletChartOptions = {}

            parent.MilliPiyangoKlasikBiletListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/MilliPiyangoKlasikBiletListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.milliPiyangoKlasikBiletListe = data.d;

                        for (var i in data.d) {
                            parent.milliPiyangoKlasikBiletChartData.push(data.d[i].uygulamaSayisi);
                            parent.milliPiyangoKlasikBiletChartLabels.push(data.d[i].milliPiyangoKlasikBilet);


                        }
                        parent.milliPiyangoKlasikBiletChartOptions = {
                            legend: {
                                display: true,

                                //labels: {
                                //    fontColor: 'rgb(255, 99, 132)'
                                //},
                                position: 'right'

                            },
                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }






            parent.sayisalOyunKuponlariListe = []
            parent.sayisalOyunKuponlariChartLabels = []
            parent.sayisalOyunKuponlariChartData = []
            parent.sayisalOyunKuponlariChartOptions = {}

            parent.SayisalOyunKuponlariListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/SayisalOyunKuponlariListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanSansDagiListe = data.d;

                        for (var i in data.d) {
                            parent.sayisalOyunKuponlariChartData.push(data.d[i].uygulamaSayisi);
                            parent.sayisalOyunKuponlariChartLabels.push(data.d[i].sayisalOyunKuponlari);


                        }
                        parent.sayisalOyunKuponlariChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },

                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }





            parent.kaziKazanUnite_PlanogramListe = []
            parent.kaziKazanUnite_PlanogramChartLabels = []
            parent.kaziKazanUnite_PlanogramChartData = []
            parent.kaziKazanUnite_PlanogramChartOptions = {}

            parent.KaziKazanUnite_PlanogramListele = function () {


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanUnite_PlanogramListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanUnite_PlanogramListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanUnite_PlanogramChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanUnite_PlanogramChartLabels.push(data.d[i].kaziKazanUnite_Planogram);


                        }
                        parent.kaziKazanUnite_PlanogramChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },

                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.oyunKuponUnitesiListe = []
            parent.oyunKuponUnitesiChartLabels = []
            parent.oyunKuponUnitesiChartData = []
            parent.oyunKuponUnitesiChartOptions = {}

            parent.OyunKuponUnitesiListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/OyunKuponUnitesiListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.oyunKuponUnitesiListe = data.d;

                        for (var i in data.d) {
                            parent.oyunKuponUnitesiChartData.push(data.d[i].uygulamaSayisi);
                            parent.oyunKuponUnitesiChartLabels.push(data.d[i].oyunKuponUnitesi);


                        }
                        parent.oyunKuponUnitesiChartOptions = {
                            legend: {
                                display: false,
                                position: 'right'


                            },

                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.birinciDuyuruCercevesiListe = []
            parent.birinciDuyuruCercevesiChartLabels = []
            parent.birinciDuyuruCercevesiChartData = []
            parent.birinciDuyuruCercevesiChartOptions = {}

            parent.BirinciDuyuruCercevesiListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/BirinciDuyuruCercevesiListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.birinciDuyuruCercevesiListe = data.d;

                        for (var i in data.d) {
                            parent.birinciDuyuruCercevesiChartData.push(data.d[i].uygulamaSayisi);
                            parent.birinciDuyuruCercevesiChartLabels.push(data.d[i].birinciDuyuruCercevesi);


                        }
                        parent.birinciDuyuruCercevesiChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },
                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }


            parent.ikinciDuyuruCercevesiListe = []
            parent.ikinciDuyuruCercevesiChartLabels = []
            parent.ikinciDuyuruCercevesiChartData = []
            parent.ikinciDuyuruCercevesiChartOptions = {}

            parent.ikinciDuyuruCercevesiListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ikinciDuyuruCercevesiListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.ikinciDuyuruCercevesiListe = data.d;

                        for (var i in data.d) {
                            parent.ikinciDuyuruCercevesiChartData.push(data.d[i].uygulamaSayisi);
                            parent.ikinciDuyuruCercevesiChartLabels.push(data.d[i].ikinciDuyuruCercevesi);

                        }
                        parent.ikinciDuyuruCercevesiChartOptions = {
                            legend: {
                                display: true,
                                position: 'right'


                            },
                            maintainAspectRatio: false


                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.sayisalLotoPosterListe = []
            parent.sayisalLotoPosterChartLabels = []
            parent.sayisalLotoPosterChartData = []
            parent.sayisalLotoPosterChartOptions = {}

            parent.SayisalLotoPosterListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/SayisalLotoPosterListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.sayisalLotoPosterListe = data.d;

                        for (var i in data.d) {
                            parent.sayisalLotoPosterChartData.push(data.d[i].uygulamaSayisi);
                            parent.sayisalLotoPosterChartLabels.push(data.d[i].sayisalLotoPoster);

                        }
                        parent.sayisalLotoPosterChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },
                            maintainAspectRatio: false


                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.kaziKazanPosterListe = []
            parent.kaziKazanPosterChartLabels = []
            parent.kaziKazanPosterChartData = []
            parent.kaziKazanPosterChartOptions = {}

            parent.KaziKazanPosterListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanPosterListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanPosterListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanPosterChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanPosterChartLabels.push(data.d[i].kaziKazanPoster);

                        }
                        parent.kaziKazanPosterChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },
                            maintainAspectRatio: false


                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }
            parent.milliPiyangoPosterListe = []
            parent.milliPiyangoPosterChartLabels = []
            parent.milliPiyangoPosterChartData = []
            parent.milliPiyangoPosterChartOptions = {}

            parent.MilliPiyangoPosterListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/MilliPiyangoPosterListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.milliPiyangoPosterListe = data.d;

                        for (var i in data.d) {
                            parent.milliPiyangoPosterChartData.push(data.d[i].uygulamaSayisi);
                            parent.milliPiyangoPosterChartLabels.push(data.d[i].milliPiyangoPoster);

                        }
                        parent.milliPiyangoPosterChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },
                            maintainAspectRatio: false


                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.bayrakListe = []
            parent.bayrakChartLabels = []
            parent.bayrakChartData = []
            parent.bayrakChartOptions = {}

            parent.BayrakListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/BayrakListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.bayrakListe = data.d;

                        for (var i in data.d) {
                            parent.bayrakChartData.push(data.d[i].uygulamaSayisi);
                            parent.bayrakChartLabels.push(data.d[i].bayrak);

                        }
                        parent.bayrakChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },

                            maintainAspectRatio: false

                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.stickerListe = []
            parent.stickerChartLabels = []
            parent.stickerChartData = []
            parent.stickerChartOptions = {}

            parent.StickerListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/StickerListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.stickerListe = data.d;

                        for (var i in data.d) {
                            parent.stickerChartData.push(data.d[i].uygulamaSayisi);
                            parent.stickerChartLabels.push(data.d[i].sticker);

                        }

                        parent.stickerChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'

                            },


                            maintainAspectRatio: false
                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }





            var ilkTarih = '<%=DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd") %>';
            var sonTarih = '<%=DateTime.Now.ToString("yyyy-MM-dd") %>';

            parent.filter = {

                baslangicTarihi: ilkTarih,
                bitisTarihi: sonTarih,
                personelid: 0,
                il: " "
            }



            parent.UygulamaListele = function () {

                parent.liste = [];
                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;
                console.log(param)



                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/UygulamaListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {
                        console.log(data);

                        parent.liste = data.d;
                        console.log(parent.liste)
                        parent.$apply();

                        //window.location.href = 'dokumanlar/' + ;

                        //<div class="form-group label-top" ng-show="data.butongoster">
                        //    <a class="btn btn-primary" href="dokumanlar/"+"{{ data.base64 }}" download>Dosya İndir</a
                        //        <label>İndirme başlamadıysa buradan indirebilirsiniz...</label>
                        //    </div >

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.UygulamaExcelindir = function () {

                
                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;
              
                console.log(param)



                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/UygulamaListeExcel",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {
                        window.location.href = 'dokumanlar/' + data.d ;
                        console.log(data)
                       

                        //window.location.href = 'dokumanlar/' + ;

                       

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.GidilmemisNoktalarExcelindir = function () {


                //var data = {};
                //data.baslangicTarihi = parent.filter.baslangicTarihi;
                //data.bitisTarihi = parent.filter.bitisTarihi;
                //data.personelid = parent.filter.personelAdi;
                //data.il = parent.filter.il;
                //var param = {};
                //param.data = data;

                //console.log(param)



                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/GidilmemisNoktaListeExcel",
                    contentType: "application/json; charset=utf-8",
            
                    success: function (data) {
                        window.location.href = 'dokumanlar/' + data.d;
                        console.log(data)



                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

                  }

            parent.UygulamaDetayGetir = function (item) {

                //var data = {}

                parent.item = item;
                parent.item.fotograflar_array = eval(parent.item.fotograflar);
                parent.$apply();
                console.log(item)

                $('#uygulamaTanımlamaModal').modal('show');


                $(".selectpicker").selectpicker("refresh");
                parent.$apply();

            }
            parent.itemTotal = {}

            parent.TotalListele = function () {

                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/TotalListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
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

            parent.kaziKazanSatisListe = []
            parent.kaziKazanSatisChartData = []
            parent.kaziKazanSatisChartLabels = []
            parent.kaziKazanSatisChartOptions = {}
            parent.KaziKazanSatisListele = function () {


                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanSatisListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.kaziKazanSatisListe = data.d;
                        for (i in data.d) {
                            parent.kaziKazanSatisChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanSatisChartLabels.push(data.d[i].kaziKazanSatis);

                        }

                        parent.kaziKazanSatisChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'
                            }
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }



            parent.materyalListe = []
            parent.materyalChartData = []
            parent.materyalChartLabels = []
            parent.materyalChartOptions = {}

            parent.MateryalleriListele = function () {

                parent.materyalListe = []
                parent.materyalChartData = []
                parent.materyalChartLabels = []
                parent.materyalChartOptions = {}

                var data = {};
                data.baslangicTarihi = parent.filter.baslangicTarihi;
                data.bitisTarihi = parent.filter.bitisTarihi;
                data.personelid = parent.filter.personelAdi;
                data.il = parent.filter.il;
                var param = {};
                param.data = data;
                console.log(param)


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/MateryalleriListele",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.materyalListe = data.d;
                        for (i in data.d) {
                            parent.materyalChartData.push(data.d[i].uygulamaSayisi);
                            parent.materyalChartLabels.push(data.d[i].uygulamaPuani);


                        }

                        console.log(data.d)


                        parent.materyalChartOptions = {
                            legend: {
                                display: false,

                                position: 'right'

                            }
                            //backgroundColor: 'rgba(0, 0, 0, 0.1)',
                            //borderColor: 'yellow',
                            //hoverBorderWidth:1
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }



            parent.GidilmemisNoktaListele = function () {


                var data = {}






                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/GidilmemisNoktaListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {
                        console.log(data);

                        parent.gidilmemisNoktaListe = data.d;

                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }
           <%--     parent.gidilmemisNoktalListe = []
                parent.gidilmemisNoktalChartData = []
                parent.gidilmemisNoktalChartLabels = []
                parent.gidilmemisNoktalChartOptions = {}
                parent.GidilmemisNoktaListele = function () {


                    var data = {}


                    $.ajax({
                        type: "POST",
                        url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/GidilmemisNoktaListele",
                        contentType: "application/json; charset=utf-8",

                        success: function (data) {


                            parent.gidilmemisNoktaListe = data.d;
                            for (i in data.d) {
                                parent.gidilmemisNoktaChartData.push(data.d[i].uygulamaSayisi);
                                parent.gidilmemisNoktaChartLabels.push(data.d[i].gidilmemisNokta);


                            }

                            parent.gidilmemisNoktaChartOptions = {
                                legend: {
                                    display: false,

                                    position: 'right'

                                }
                                //backgroundColor: 'rgba(0, 0, 0, 0.1)',
                                //borderColor: 'yellow',
                                //hoverBorderWidth:1
                            }

                            parent.$apply();

                        },
                        error: function (data) {

                            console.error(data.responseText)
                        }

                    });

                }--%>

            parent.durumListe = []
            parent.durumChartData = []
            parent.durumChartLabels = []
            parent.durumChartOptions = {}
            parent.DurumListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/DurumListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.durumListe = data.d;
                        for (i in data.d) {
                            parent.durumChartData.push(data.d[i].uygulamaSayisi);
                            parent.durumChartLabels.push(data.d[i].bayiyeGidildigindeUygYapilmismi);

                        }

                        parent.durumChartOptions = {
                            legend: {
                                display: true,
                                //labels: {
                                //    fontColor: 'rgb(255, 99, 132)'
                                //},
                                position: 'right'
                            }
                        }

                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }


            parent.ilListe = []
            parent.ilChartData = []
            parent.ilChartLabels = []
            parent.durumChartOptions = {}

            parent.ilListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ilListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {



                        parent.ilListe = data.d;
                        for (i in data.d) {
                            parent.ilChartData.push(data.d[i].uygulamaSayisi);
                            parent.ilChartLabels.push(data.d[i].il);

                        }
                        parent.ilChartOptions = {
                            legend: {
                                display: true,
                                //labels: {
                                //    fontColor: 'rgb(255, 99, 132)'
                                //},
                                position: 'right'
                            }
                        }

                        parent.$apply();
                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.ilceListe = []

            parent.ilceChartLabels = []
            parent.ilceChartData = []
            parent.ilceChartOptions = {}

            parent.ilceListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ilceListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {

                        parent.ilceListe = data.d;
                        for (var i in data.d) {
                            parent.ilceChartData.push(data.d[i].uygulamaSayisi);
                            parent.ilceChartLabels.push(data.d[i].ilce);


                        }
                        parent.ilceChartOptions = {
                            legend: {
                                display: true,

                                position: 'right'



                            }
                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

            parent.tarihListe = []
            parent.tarihChartLabels = []
            parent.tarihChartData = []
            parent.tarihChartOptions = {}

            parent.TarihListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/TarihListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.tarihListe = data.d;
                        for (var i in data.d) {
                            parent.tarihChartData.push(data.d[i].uygulamaSayisi);
                            parent.tarihChartLabels.push(data.d[i].uygulamaTarihi);


                        }
                        parent.tarihChartOptions = {
                            legend: {
                                display: true



                            },


                            elements: {
                                line: {
                                    fill: false
                                }
                            }
                        }
                        parent.$apply();

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }

<%--            parent.itemUygYapilanNokta = {}

            parent.UygYapilanNoktaListele = function () {


              

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/UygYapilanNoktaListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {
                        console.log(data);

                        parent.itemUygYapilanNokta = data.d;

                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }
            parent.CalisanPersonelListele = function () {--%>


            <%--         var data = {}

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/CalisanPersonelListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {
                        console.log(data);

                        parent.calisanPersonelListe = data.d;

                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }--%>

<%--            parent.ZiyaretEdilenNoktaListele = function () {


                var data = {}

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ZiyaretEdilenNoktaListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {
                        console.log(data);

                        parent.ziyaretEdilenNoktaListe = data.d;

                        parent.$apply();


                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

            }--%>

            parent.Filtrele = function () {


                parent.UygulamaListele();
                parent.MateryalleriListele();
                parent.UygulamaPuaniListele();
                parent.SiparisSuresiKirilimiListele();
                parent.KaziKazanSatisSebepListele();
                parent.KaziKazanAltinListele();
                parent.KaziKazanSansDagiListele();
                parent.KaziKazanOnikiAySansListele();
                parent.KaziKazanSatisListele();
                parent.TotalListele();

            }


            parent.loadPersoneller = function () {


                var data = {}





                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Kullanicilar.asmx") %>/Listele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.personelListe = data.d;
                        console.log(data);
                        parent.$apply();
                        $(".selectpicker").selectpicker("refresh")
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
