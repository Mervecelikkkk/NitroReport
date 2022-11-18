<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="RaporlarLast.aspx.cs" Inherits="NitroReport.Raporlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-col w-100 pb-5">

        <div class="container-fluid">

            <div class="row">
                <div class="col-12 ">


                    <div class="page-baslik">
                        <h2 class="mt-3 mb-3">Raporlar</h2>


                    </div>





                </div>
            </div>

            <div class="row">
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2" ng-init="PersonelListele()">

                        <div class="row card-title-row mb-2 sm-hide">

                            <div class="col-6 col-lg-2">Personel Adı</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-12 ">
                                <hr class="mt-1 mb-0" />
                            </div>

                        </div>


                        <div class="ng-hide" ng-show="personelListe.length">

                            <div class="row" ng-repeat="item in personelListe">

                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>



                            </div>



                        </div>

                        <div class="ng-hide" ng-show="!personelListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>


                        
                            <canvas id="pie" class="chart chart-pie"
                                chart-data="personelChartData" chart-labels="personelChartLabels" chart-options="personelChartOptions"></canvas>



                    </div>
                </div>


                <div class="col-6 col-lg-6">

                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide">

                            <div class="col-6 col-lg-2">Durum</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="durumListe.length" ng-init="DurumListele()">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in durumListe">


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>
                    
                        <div class="ng-hide" ng-show="!durumListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                              <canvas id="pie" class="chart chart-pie"
                                chart-data="durumChartData" chart-labels="durumChartLabels" chart-options="durumChartOptions"></canvas>

                    </div>
                </div>




            </div>

            <div class="row">
                <div class="col-12 ">
                    <div class="card">
                       <div class="card-header">
                               <b> İllere Göre Uygulama Sayısı</b>
                              </div>
                        <div class="card-body">
                            <div class="row">
                   <div class="col-12 col-lg-6">
                                    <div class="card scroll-liste">
                                        <div class="card-header bg-light">
                                              <div class="row card-title-row  sm-hide" ng-init="ilListele()" >

                                                <div class="col-8">İl</div>
                                                <div class="col-4 text-center">Uygulama Sayısı</div>

                                            </div>
                                        </div>
                      <div class="card-body">
                        <div class="ng-hide" ng-show="ilListe.length">

                            <div class="row ng-hide" ng-repeat="item in ilListe" ng-show="item.uygulamaSayisi > 0">


                                <div class="col-6 col-lg-8   mt-1 mb-1">{{item.il}}</div>
                                <div class="col-6 col-lg-4  mt-1 mb-1  text-center">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>
                        </div>
  </div>
                                </div>
                                 <div class="col-12 col-lg-6">
                                     <div class="p-2">
                                         <canvas id="pie" class="chart chart-pie"
                                             chart-data="ilChartData" chart-labels="ilChartLabels" chart-options="ilChartOptions"></canvas>
                                     </div>
                                 </div>
                            </div>
                       </div>
                    </div>
                </div>




                <div class="col-6 col-lg-12">

                    <div class="card  mt-5 mb-5">
                          <div class="card-header">
                               <b> İlçelere Göre Uygulama Sayısı</b>
                              </div>
                        <div class="card-body ">
                        <div class="row">
                            <div class="col-12 col-lg-6">
                                    <div class="card ">
                                        <div class="card-header bg-light">
                                              <div class="row card-title-row  sm-hide" ng-init="ilceListele()" >

                                                <div class="col-8">İlçe</div>
                                                <div class="col-4 text-center">Uygulama Sayısı</div>

                                            </div>
                                        </div>
                      <div class="card-body scroll-liste"  >
                        <div class="ng-hide" ng-show="ilceListe.length">

                            <div class="row ng-hide" ng-repeat="item in ilceListe" ng-show="item.uygulamaSayisi > 0">


                                <div class="col-6 col-lg-8   mt-1 mb-1">{{item.ilce}}</div>
                                <div class="col-6 col-lg-4  mt-1 mb-1  text-center">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>
                        </div>
  </div>
                                </div>
                            <div class="col-12 col-lg-6">
                                  <div class="p-2">
                                    <canvas id="pie" class="chart chart-pie"
                                chart-data="ilceChartData" chart-labels="ilceChartLabels"  chart-options="ilceChartOptions"></canvas>
                                      </div>
                            </div>
                        </div>
                      
                        </div>
                    </div>
              </div>




            </div>

                    <div class="row">
                <div class="col-12 col-lg-12 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="TarihListele()">

                            <div class="col-6 col-lg-2">Uygulama Tarihi</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="tarihListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in tarihListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaTarihi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!tarihListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="line" class="chart chart-line"
                                chart-data="tarihChartData" chart-labels="tarihChartLabels" chart-options="tarihChartOptions"></canvas>

                    </div>
                </div>
</div>




                 <div class="row">
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="KaziKazanOnikiAySansListele()">

                            <div class="col-6 col-lg-2">Kazı Kazan On İki Ay Şans</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="kaziKazanOnikiAySansListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in kaziKazanOnikiAySansListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanOnikiAySans}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!kaziKazanOnikiAySansListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanOnikiAySansChartData" chart-labels="kaziKazanOnikiAySansChartLabels" chart-options="kaziKazanOnikiAySansChartOptions"></canvas>

                    </div>

</div>
                     
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="KaziKazanSansDagiListele()">

                            <div class="col-6 col-lg-2">Kazı Kaza Şans Dağı</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="kaziKazanSansDagiListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in kaziKazanSansDagiListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanSansDagi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!kaziKazanSansDagiListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanSansDagiChartData" chart-labels="kaziKazanSansDagiChartLabels" chart-options="kaziKazanSansDagiChartOptions"></canvas>

                    </div>
                </div>
                     </div>





                   <div class="row">
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2  sm-hide" ng-init="KaziKazanAltinListele()">

                            <div class="col-6 col-lg-2">Kazı Kazan Altın</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="kaziKazanAltinListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in kaziKazanAltinListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanAltin}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!kaziKazanAltinListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanAltinChartData" chart-labels="kaziKazanAltinChartLabels" chart-options="kaziKazanAltinChartOptions"></canvas>

                    </div>

</div>
                     
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="MilliPiyangoKlasikBiletListele()">

                            <div class="col-6 col-lg-2">Milli Piyango Klasik Bilet</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="milliPiyangoKlasikBiletListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in milliPiyangoKlasikBiletListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.milliPiyangoKlasikBilet}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!milliPiyangoKlasikBiletListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="milliPiyangoKlasikBiletChartData" chart-labels="milliPiyangoKlasikBiletChartLabels" chart-options="milliPiyangoKlasikBiletChartOptions"></canvas>

                    </div>
                </div>
                     </div>



            <div class="row">

               <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="KaziKazanUnite_PlanogramListele()">

                            <div class="col-6 col-lg-2">Kazı Kazan Ünite Planogram</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="kaziKazanUnite_PlanogramListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in kaziKazanUnite_PlanogramListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanUnite_Planogram}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!kaziKazanUnite_PlanogramListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanUnite_PlanogramChartData" chart-labels="kaziKazanUnite_PlanogramChartLabels" chart-options="kaziKazanUnite_PlanogramChartOptions"></canvas>

                    </div>
                </div>





                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2  sm-hide" ng-init="OyunKuponUnitesiListele()">

                            <div class="col-6 col-lg-2">Oyun Kupon Ünitesi</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="oyunKuponUnitesiListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in oyunKuponUnitesiListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.oyunKuponUnitesi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!oyunKuponUnitesiListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="oyunKuponUnitesiChartData" chart-labels="oyunKuponUnitesiChartLabels" chart-options="oyunKuponUnitesiChartOptions"></canvas>

                    </div>

</div>
                     
   
                     </div>


                       <div class="row">
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2  sm-hide" ng-init="BirinciDuyuruCercevesiListele()">

                            <div class="col-6 col-lg-2">Birinci Duyuru Çerçevesi</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="birinciDuyuruCercevesiListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in birinciDuyuruCercevesiListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.birinciDuyuruCercevesi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!birinciDuyuruCercevesiListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="birinciDuyuruCercevesiChartData" chart-labels="birinciDuyuruCercevesiChartLabels" chart-options="birinciDuyuruCercevesiChartOptions"></canvas>

                    </div>

</div>
                     
                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="ikinciDuyuruCercevesiListele()">

                            <div class="col-6 col-lg-2">İkinci Duyuru Cercevesi</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="ikinciDuyuruCercevesiListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in ikinciDuyuruCercevesiListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ikinciDuyuruCercevesi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!ikinciDuyuruCercevesiListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="ikinciDuyuruCercevesiChartData" chart-labels="ikinciDuyuruCercevesiChartLabels" chart-options="ikinciDuyuruCercevesiChartOptions"></canvas>

                    </div>
                </div>
                     </div>

            
                   <div class="row">


                   <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="SayisalLotoPosterListele()">

                            <div class="col-6 col-lg-2">Sayısal Loto Poster</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="sayisalLotoPosterListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in sayisalLotoPosterListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.sayisalLotoPoster}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>


                        <div class="ng-hide" ng-show="!sayisalLotoPosterListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="sayisalLotoPosterChartData" chart-labels="sayisalLotoPosterChartLabels" chart-options="sayisalLotoPosterChartOptions"></canvas>

                    </div>
                </div>







                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2  sm-hide" ng-init="KaziKazanPosterListele()">

                            <div class="col-6 col-lg-2">Kazan Kazan Poster</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="kaziKazanPosterListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in kaziKazanPosterListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.kaziKazanPoster}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!kaziKazanPosterListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="kaziKazanPosterChartData" chart-labels="kaziKazanPosterChartLabels" chart-options="kaziKazanPosterChartOptions"></canvas>

                    </div>

</div>
                     
   
                     </div>



               <div class="row">

                   <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="MilliPiyangoPosterListele()">

                            <div class="col-6 col-lg-2">Milli Pİyango Poster</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="milliPiyangoPosterListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in milliPiyangoPosterListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.milliPiyangoPoster}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>


                        <div class="ng-hide" ng-show="!milliPiyangoPosterListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>



                          <canvas id="pie" class="chart chart-pie"
                                chart-data="milliPiyangoPosterChartData" chart-labels="milliPiyangoPosterChartLabels" chart-options="milliPiyangoPosterChartOptions"></canvas>

                    </div>
                </div>





                <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2  sm-hide" ng-init="BayrakListele()">

                            <div class="col-6 col-lg-2">Bayrak</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="bayrakListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in bayrakListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.bayrak}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>

                        <div class="ng-hide" ng-show="!bayrakListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>
                          <canvas id="pie" class="chart chart-pie"
                                chart-data="bayrakChartData" chart-labels="bayrakChartLabels" chart-options="bayrakChartOptions"></canvas>

                    </div>

</div>
                     
   
                     </div>



                <div class="row">

                   <div class="col-6 col-lg-6 ">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide" ng-init="StickerListele()">

                            <div class="col-6 col-lg-2">Sticker</div>
                            <div class="col-6 col-lg-2 ">Uygulama Sayısı</div>

                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />


                            </div>
                        </div>


                        <div class="ng-hide" ng-show="stickerListe.length">

                            <div class="row" ng-click="DetayGetir(item)" ng-repeat="item in stickerListe" >


                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.sticker}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaSayisi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>

                            </div>
                        </div>


                        <div class="ng-hide" ng-show="!stickerListe.length">
                            <div class="text-center" colspan="4">
                                <h5>Henüz hiç kayıt yok.</h5>
                            </div>
                        </div>



                          <canvas id="pie" class="chart chart-pie"
                                chart-data="stickerChartData" chart-labels="stickerChartLabels" chart-options="stickerChartOptions"></canvas>

                    </div>
                </div>

</div>


            <div class="row">
                <div class="col-12 ">


                    <div class="page-baslik">
                        <h2 class="mt-3 mb-3">Uygulamalar</h2>


                    </div>

                </div>
            </div>



            <div class="row ">

                <div class="col-lg-12">
                    <div class="card p-2">

                        <div class="row card-title-row mb-2 sm-hide">

                            <div class="col-6 col-lg-2">Personel Adı</div>
                            <div class="col-6 col-lg-2 ">Nokta Adı</div>
                            <div class="col-6 col-lg-2">İl</div>
                            <div class="col-6 col-lg-2">İlçe</div>
                            <div class="col-6 col-lg-2">Bayiye Gidildiğinde Uygulama Yapılmış mı?</div>
                            <div class="col-6 col-lg-2">Uygulama Tarihi</div>
                            <div class="col-lg-12">
                                <hr class="mt-1 mb-0" />

                            </div>
                        </div>


                        <div class="ng-hide" ng-show="liste.length">

                            <div class="row " ng-click="DetayGetir(item)" ng-repeat="item in liste">

                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.adi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.noktaAdi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.il}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.ilce}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.bayiyeGidildigindeUygYapilmismi}}</div>
                                <div class="col-6 col-lg-2   mt-1 mb-1">{{item.uygulamaTarihi}}</div>
                                <div class="col-12 ">
                                    <hr class="mt-1 mb-0" />
                                </div>
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
                                display: true,
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
                                position:'right'
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
            parent.durumChartData=[]
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
                                  labels: {
                                      fontColor: 'rgb(255, 99, 132)'
                                  },
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
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
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

            parent.kaziKazanOnikiAySansListe = []
            parent.kaziKazanOnikiAySansChartLabels = []
            parent.kaziKazanOnikiAySansChartData = []
            parent.kaziKazanOnikiAySansChartOptions = {}

            parent.KaziKazanOnikiAySansListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanOnikiAySansListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanOnikiAySansListe = data.d;
                        for (var i in data.d) {
                            parent.kaziKazanOnikiAySansChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanOnikiAySansChartLabels.push(data.d[i].kaziKazanOnikiAySans);


                        }
                        kaziKazanOnikiAySansChartOptions = {
                            legend: {
                                display: true,
                                labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
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


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanSansDagiListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanSansDagiListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanSansDagiChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanSansDagiChartLabels.push(data.d[i].kaziKazanSansDagi);


                        }
                        parent.kaziKazanSansDagiChartOptions = {
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


            parent.kaziKazanAltinListe = []
            parent.kaziKazanAltinChartLabels = []
            parent.kaziKazanAltinChartData = []
            parent.kaziKazanAltinChartOptions = {}

            parent.KaziKazanAltinListele = function () {


                var data = {}


                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/KaziKazanAltinListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.kaziKazanAltinListe = data.d;

                        for (var i in data.d) {
                            parent.kaziKazanAltinChartData.push(data.d[i].uygulamaSayisi);
                            parent.kaziKazanAltinChartLabels.push(data.d[i].kaziKazanAltin);


                        }
                        parent.kaziKazanAltinChartOptions = {
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

                                  labels: {
                                    fontColor: 'rgb(255, 99, 132)'
                                },
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





            parent.kaziKazanUnite_PlanogramListe = []
            parent.kaziKazanUnite_PlanogramChartLabels = []
            parent.kaziKazanUnite_PlanogramChartData = []
            parent.kaziKazanUnite_PlanogramChartOptions = {}

            parent.KaziKazanUnite_PlanogramListele = function () {


                var data = {}


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
                                display: true



                            },


                            elements: {
                                line: {
                                    fill: true
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









            parent.UygulamaListele = function () {


                var data = {}






                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Uygulamalar.asmx") %>/Listele",
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








            parent.load();

        });

    </script>

</asp:Content>
