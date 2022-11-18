<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Uygulamalar.aspx.cs" Inherits="NitroReport.Uygulamalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-col w-100 pb-5">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12 ">


                    <div class="page-baslik">
                        <h2 class="mt-3 mb-3">Uygulamalar</h2>


                    </div>

                </div>
            </div>

            <div class="row ">


                <div class="boxes-header pad-b-sm">

                    <div data-toggle="modal" data-target="#uygulamaTanımlamaModal" ng-click="item.fotograflar_array=[];item.id=0" class="add-btn"><a href="#"><i class="fas fa-plus"></i></a></div>

                </div>


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
                                <div class="col-12 col-lg-2   mt-1 mb-1">Uygulama Durumu: {{item.bayiyeGidildigindeUygYapilmismi}}</div>
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


                <div class="modal-body">

                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="form-group">

                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label>Nokta Adı Seçiniz:</label>
                                        <select ng-model="item.noktaid" id="noktaAdiselect" data-live-search="true" class="selectpicker form-control form-control-sm">

                                            <option ng-repeat="item in noktaListe" ng-value="item.id">{{item.bayiid}} - {{item.noktaAdi.substr(0,15)}}</option>



                                        </select>
                                    </div>

                                    <div class="form-group col-12 col-md-6">
                                        <label>Uygulama Tarihi</label>
                                        <input type="datetime-local" id="inputDate" ng-model="item.uygulamaTarihi" class="form-control form-control-sm" />
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label>Televizyon</label>
                                        <input type="number" ng-model="item.televizyon" class="form-control form-control-sm" name="quantity">
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Termal Rulo</label>
                                        <select ng-model="item.termalRulo" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Yok">Yok</option>


                                        </select>
                                    </div>


                                </div>

                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label>İş Yeri Alanı m^2</label>
                                        <select ng-model="item.isyeriAlani" class="custom-select custom-select-sm">

                                            <option value="0-30">0-30</option>
                                            <option value="30-60">30-60</option>
                                            <option value="60-90">60-90</option>
                                            <option value="90 üstü">90 Üstü</option>


                                        </select>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Faaliyet Alanı</label>
                                        <select ng-model="item.faaliyetAlani" class="custom-select custom-select-sm">

                                            <option value="Parfümeri">Parfümeri</option>
                                            <option value="SADECE Oyun Salonu (İdda ve Sayısal, Ganyan)">SADECE Oyun Salonu (İdda ve Sayısal, Ganyan)</option>
                                            <option value="Bakkal / Market">Bakkal / Market	</option>
                                            <option value="Büfe">Büfe</option>
                                            <option value="Gazete Bayi">Gazete Bayi</option>
                                            <option value="Fırın">Fırın</option>
                                            <option value="Şarküteri">Şarküteri</option>
                                            <option value="Tobacco Shop">Tobacco Shop</option>
                                            <option value="Telefon Bilgisayar Dükkanı">Telefon Bilgisayar Dükkanı</option>
                                            <option value="Benzin İstasyonu">Benzin İstasyonu</option>
                                            <option value="Kuruyemişci">Kuruyemişci</option>
                                            <option value="Tuhafiye">Tuhafiye</option>
                                            <option value="Kıraathane">Kıraathane</option>
                                            <option value="Kırtasiye">Kırtasiye</option>
                                            <option value="Süpermarket">Süpermarket</option>
                                            <option value="Emlak Dükkanı">Emlak Dükkanı</option>
                                            <option value="Diğer">Diğer</option>



                                        </select>
                                    </div>



                                </div>
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label>Oyun Oynama Alanı</label>
                                        <select ng-model="item.oyunOynamaAlani" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Yok">Yok</option>


                                        </select>
                                    </div>
                                </div>


                                <div class="row">

                                    <div class="form-group col-12">
                                        <label>Fotoğraflar</label>
                                        <div class="images">
                                            <div class="pic" onclick="$(this).next().click()">Resim Ekle</div>
                                            <input type="file" accept="image/*" class="ng-hide" multiple ng-model="item.fotograflar" ng-file-select="onFileSelect($files)" />
                                        </div>
                                        <div class="gallery-box" ng-repeat="items in item.fotograflar_array">
                                            <span class="remove" ng-click="resimSil($index,0)">x</span>
                                            <a href="{{items.base64Data.length < 100 ? items.base64Data : '#'}}" target="{{items.base64Data.length < 100 ? '_blank' : ''}}">
                                                <div class="foto-list">
                                                    <img src="{{items.base64Data}}" alt="{{items.dosyaadi}}" />
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <hr />


                                <h5 class="modal-title" id="H1" style="font-size: 18px">Ürün Bulunurluk</h5>
                                <hr />

                                <div class="row">

                                    <div class="form-group col-12 col-md-4">
                                        <label>Kazı Kazan var mı?</label>
                                        <select ng-model="item.kaziKazanSatis" class="custom-select custom-select-sm">
                                            <option value="Var">Var</option>
                                            <option value="Yok">Yok</option>
                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-4 ng-hide" ng-show="item.kaziKazanSatis==='Yok'">
                                        <label>Sipariş Verdiniz mi?</label>
                                        <select ng-model="item.kaziKazanSiparisVerdinizMi" class="custom-select custom-select-sm">
                                            <option value="Evet">Evet</option>
                                            <option value="Hayır">Hayır</option>
                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-4 ng-hide" ng-show="item.kaziKazanSiparisVerdinizMi==='Hayır'">

                                        <label>Satmıyorsa Sebebi:</label>
                                        <select ng-model="item.kaziKazanSatisSebep" class="custom-select custom-select-sm">

                                            <option value="Stoklama için yeterli alan bulunmamakta">Stoklama için yeterli alan bulunmamakta</option>
                                            <option value="Yetersiz kredi limit">Yetersiz kredi limit</option>
                                            <option value="Oyunlar arasında kredi limit dağılım sorunu">Oyunlar arasında kredi limit dağılım sorunu</option>
                                            <option value="Finansal takip zorluğu">Finansal takip zorluğu</option>
                                            <option value="Terminal ile ilgili sorunlar">Terminal ile ilgili sorunlar</option>
                                            <option value="Sipariş için Sisal'e ulaşmıyor">Sipariş için Sisal'e ulaşmıyor</option>
                                            <option value="Sevkiyat gecikme sorunu">Sevkiyat gecikme sorunu</option>
                                            <option value="Tüketici bilinirliğin artması bekleniyor">Tüketici bilinirliğin artması bekleniyor</option>
                                            <option value="Ön yargı/Ürün ile ilgili negatif düşünce ">Ön yargı/Ürün ile ilgili negatif düşünce </option>
                                            <option value="Diğer">Diğer</option>
                                        </select>

                                    </div>


                                    <div class="form-group col-12 col-md-4 ng-hide" ng-show="item.kaziKazanSiparisVerdinizMi =='Evet' && item.kaziKazanSatis == 'Yok'">
                                        <div>
                                            <label>Sipariş Ne Zaman Verildi? </label>
                                            <select ng-model="item.kaziKazanSiparisZaman" id="kaziKazanSiparisZaman" class="custom-select custom-select-sm">

                                                <option value="1 Gün">1 Gün</option>
                                                <option value="2 Gün">2 Gün</option>
                                                <option value="3 Gün">3 Gün</option>
                                                <option value="4 Gün">4 Gün</option>
                                                <option value="5 Gün ve Üzeri">5 Gün ve Üzeri</option>

                                            </select>
                                        </div>
                                    </div>


                                </div>

                                <div class="row ng-hide" ng-show="item.kaziKazanSatis==='Var'">
                                    <div class="form-group col-12 col-md-4">
                                        <label>Kazı Kazan Altın</label>
                                        <select ng-model="item.kaziKazanAltin" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Stokta Yok">Stokta Yok</option>


                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-4 ">
                                        <label>Kazı Kazan On İki Ay Şans</label>
                                        <select ng-model="item.kaziKazanOnikiAySans" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option selected="selected" value="Stokta Yok">Stokta Yok</option>


                                        </select>
                                    </div>



                                    <div class="form-group col-12 col-md-4">
                                        <label>Kazı Kazan Şans Dağı</label>
                                        <select ng-model="item.kaziKazanSansDagi" ng-model="show" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Stokta Yok">Stokta Yok</option>

                                        </select>
                                    </div>

                                </div>
                                <div class="row">

                                    <div class="form-group col-12 col-md-4">
                                        <label>Sayısal Oyun Kuponları (sayısal/süper/şans/on numara)</label>
                                        <select ng-model="item.sayisalOyunKuponlari" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Yok">Yok</option>


                                        </select>
                                    </div>
                                </div>

                                <div class="row">


                                    <div class="form-group col-12 col-md-4">
                                        <label>Milli Piyango Klasik Bilet</label>
                                        <select ng-model="item.milliPiyangoKlasikBilet" class="custom-select custom-select-sm">

                                            <option value="Var">Var</option>
                                            <option value="Yok">Yok</option>


                                        </select>
                                    </div>







                                </div>

                                <hr />
                                <h5 class="modal-title" id="H1" style="font-size: 18px">Bayiye Gidildiğinde Uygulama Yapılmış mı?</h5>
                                <hr />
                                <div class="row">

                                    <div class="form-group col-12 col-md-6">

                                        <select ng-model="item.bayiyeGidildigindeUygYapilmismi" class="custom-select custom-select-sm">
                                            <option value="Bayide Eksik Uygulama Yapılmış">Bayide Eksik Uygulama Yapılmış</option>
                                            <option value="Hiç Uygulama Yapılmamış">Hiç Uygulama Yapılmamış</option>
                                            <option value="Bayiye POP Kit Gitmemiş">Bayiye POP Kit Gitmemiş</option>
                                            <option value="9 Materyal Yapılmış">9 Materyal Yapılmış</option>


                                        </select>
                                    </div>
                                </div>
                                <hr />
                                <h5 class="modal-title" ng-hide ng-show="item.bayiyeGidildigindeUygYapilmismi != '9 Materyal Yapılmış'" id="H1" style="font-size: 18px">POP</h5>
                                <hr />

                                <div class="row" ng-hide ng-show="item.bayiyeGidildigindeUygYapilmismi != '9 Materyal Yapılmış'">

                                    <div class="form-group col-12 col-md-6">
                                        <label>Oyun Kupon Ünitesi</label>
                                        <select ng-model="item.oyunKuponUnitesi" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>


                                        </select>
                                    </div>

                                    <div class="form-group col-12 col-md-6">


                                        <label>Kazı Kazan Ünite(Planogram Uygulanacak)</label>
                                        <select ng-model="item.kaziKazanUnite_Planogram" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>

                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-6">
                                        <label>1. Duyuru Çerçevesi</label>
                                        <select ng-model="item.birinciDuyuruCercevesi" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>


                                        </select>
                                    </div>

                                    <div class="form-group col-12 col-md-6">
                                        <label>2. Duyuru Çerçevesi</label>
                                        <select ng-model="item.ikinciDuyuruCercevesi" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>

                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-6">
                                        <label>Kazı Kazan Poster</label>
                                        <select ng-model="item.kaziKazanPoster" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>

                                        </select>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Milli Piyango Poster</label>
                                        <select ng-model="item.milliPiyangoPoster" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>
                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-6">
                                        <label>Sayısal Loto Poster</label>
                                        <select ng-model="item.sayisalLotoPoster" class="custom-select custom-select-sm">
                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>



                                        </select>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label>Sticker</label>
                                        <select ng-model="item.sticker" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>
                                        </select>
                                    </div>


                                    <div class="form-group col-12 col-md-6">
                                        <label>Bayrak</label>
                                        <select ng-model="item.bayrak" class="custom-select custom-select-sm">

                                            <option value="Merch Uygulama Yaptı">Merch Uygulama Yaptı</option>
                                            <option value="Bayi Tarafından Uygulama Yapıldı">Bayi Tarafından Uygulama Yapıldı</option>
                                            <option value="Uygulama Yapılmadı - Bayi İzin vermedi">Uygulama Yapılmadı - Bayi İzin vermedi</option>
                                            <option value="Uygulama Yapılmadı - Yeterli Alan Yok">Uygulama Yapılmadı - Yeterli Alan Yok</option>

                                        </select>
                                    </div>
                                    <div class="form-group col-12 col-md-12">
                                        <label>Yorum</label>
                                        <textarea class="form-control" ng-model="item.yorum" id="exampleFormControlTextarea1" rows="3"></textarea>
                                    </div>


                                </div>







                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer" ng-hide="isLoading">



                    <div class="btn btn-sm btn-danger" ng-show="item.id > 0" ng-click="Sil(id)">Sil</div>

                    <div class="btn btn-sm btn-outline-secondary" data-dismiss="modal">İptal</div>

                    <div class="btn btn-sm btn-warning text-light" ng-click="Kaydet()">{{item.id > 0 ? 'GÜNCELLE' : 'KAYDET' }}</div>

                </div>

                <div class="modal-footer" ng-show="isLoading">
                    <div class="text-warning text-lg-right">{{loadingText}}</div>
                </div>
            </div>

        </div>



    </div>








    <script>

        var app = angular.module("app", [])
        app.controller("mainController", function ($scope) {

            $scope.show = false;
            var parent = $scope;

            parent.isLoading = false;
            parent.loadingText = "Lütfen Bekleyin...";

            parent.load = function () {
                parent.Listele();
                if (parent.id > 0)
                    parent.DetayGetir();


            }




            parent.defaultData = {
                id: 0, kaziKazanOnikiAySans: "Var", kaziKazanSansDagi: "Var", kaziKazanAltin: "Var", milliPiyangoKlasikBilet: "Yok", milliPiyangoPoster: "Merch Uygulama Yaptı",
                sayisalOyunKuponlari: "Yok", bayiyeGidildigindeUygYapilmismi: "Bayide Eksik Uygulama Yapılmış", oyunKuponUnitesi: "Merch Uygulama Yaptı", birinciDuyuruCercevesi: "Merch Uygulama Yaptı",
                ikinciDuyuruCercevesi: "Merch Uygulama Yaptı", kaziKazanUnite_Planogram: "Merch Uygulama Yaptı", oyunKuponUnitesiPlanogram: "Merch Uygulama Yaptı", sayisalLotoPoster: "Merch Uygulama Yaptı", kaziKazanPoster: "Merch Uygulama Yaptı", sticker: "Merch Uygulama Yaptı",
                bayrak: "Merch Uygulama Yaptı", yorum: " ", bayiid: " ", uygulamaTarihi: "<%=DateTime.Now.ToString("yyyy-MM-ddTHH:mm")%>", televizyon: "Yok", oyunOynamaAlani: "Yok",
                isyeriAlani: "0-30", faaliyetAlani: "Diğer", kaziKazanSiparisZaman: "Henüz Sipariş Verilmedi", televizyon: 0, kaziKazanSatis: "Satıyor", kaziKazanSatisSebep: "Diğer", termalRulo: "Var"
            };

            parent.item = parent.defaultData;






            parent.resimSil = function (id) {
                parent.item.fotograflar_array.splice(id, 1);
            }



            parent.liste = []

            parent.Kaydet = function () {



                var param = {}

                var data = {}

                data.id = parent.item.id;

                data.noktaid = parent.item.noktaid;

                data.yorum = parent.item.yorum;
                data.uygulamaTarihi = parent.item.uygulamaTarihi;
                data.oncekiFotograf = {};
                data.sonrakiFotograf = {};

                data.kaziKazanSiparisVerdinizMi = parent.item.kaziKazanSiparisVerdinizMi;

                data.kaziKazanOnikiAySans = parent.item.kaziKazanOnikiAySans;
                data.kaziKazanSansDagi = parent.item.kaziKazanSansDagi;
                data.kaziKazanAltin = parent.item.kaziKazanAltin;
                data.milliPiyangoKlasikBilet = parent.item.milliPiyangoKlasikBilet;
                data.milliPiyangoPoster = parent.item.milliPiyangoPoster;
                data.sayisalOyunKuponlari = parent.item.sayisalOyunKuponlari;
                data.bayiyeGidildigindeUygYapilmismi = parent.item.bayiyeGidildigindeUygYapilmismi;
                data.oyunKuponUnitesi = parent.item.oyunKuponUnitesi;
                data.birinciDuyuruCercevesi = parent.item.birinciDuyuruCercevesi;
                data.ikinciDuyuruCercevesi = parent.item.ikinciDuyuruCercevesi;
                data.kaziKazanUnite_Planogram = parent.item.kaziKazanUnite_Planogram;
                data.sayisalLotoPoster = parent.item.sayisalLotoPoster;
                data.kaziKazanPoster = parent.item.kaziKazanPoster;

                data.sticker = parent.item.sticker;
                data.bayrak = parent.item.bayrak;
                data.personelid = "<%=NitroReport.Global.kullaniciBilgisi.jsonData["id"].ToString() %>";
                data.televizyon = parent.item.televizyon;
                data.termalRulo = parent.item.termalRulo;
                data.oyunOynamaAlani = parent.item.oyunOynamaAlani;
                data.isyeriAlani = parent.item.isyeriAlani;
                data.faaliyetAlani = parent.item.faaliyetAlani;
                data.kaziKazanSatis = parent.item.kaziKazanSatis;
                data.kaziKazanSiparisZaman = parent.item.kaziKazanSiparisZaman;
                data.kaziKazanSatisSebep = parent.item.kaziKazanSatisSebep;
                data.fotograflar = JSON.stringify(parent.item.fotograflar_array);

                param.data = data;
                console.log(data);

                if ((parent.item.noktaid == 0)) {
                    alert("Lütfen Nokta Adını Seçin.");

                    return;
                }

                parent.isLoading = true;

                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Uygulamalar.asmx") %>/Kaydet",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(param),
                    success: function (data) {


                        parent.$apply();
                        //$('#uygulamaTanımlamaModal').modal('hide');
                        location.reload();

                    },
                    error: function (data) {
                        parent.loadingText = "Kayıt işlemi sırasında hata oluştu. " + data.responseText;
                        parent.$apply();
                        console.error(data)

                    }
                });
            }



            parent.FotografBilgisiEkle = function () {

                var item = {}

                item.oncekiFotograf = parent.fotografBilgisi.oncekiFotograf;
                item.sonrakiFotograf = parent.fotografBilgisi.sonrakiFotograf;


                parent.fotografListesi.push(item);
                console.log(item);
            }






            parent.Listele = function () {


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


            parent.loadNoktalar = function () {


                var data = {}





                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Noktalar.asmx") %>/Listele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.noktaListe = data.d;
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



            parent.DetayGetir = function (item) {

                //var data = {}

                parent.item = item;
                parent.item.fotograflar_array = eval(parent.item.fotograflar);

                console.log(item)

                parent.$apply();

                $('#uygulamaTanımlamaModal').modal('show');

                $("#noktaAdiselect").val(item.noktaid).selectpicker("refresh");
                $("#inputDate").val(item.string_date);



            }






            parent.Sil = function (id) {


                var data = {}

                data.id = parent.item.id;

                console.log(data);




                $.ajax({
                    type: "POST",
                    url: "<%=Page.ResolveUrl("~/ws/Uygulamalar.asmx")%>/Sil",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),

                    success: function (data) {


                        parent.Listele();


                        console.log(data);

                        parent.$apply();

                        $('#uygulamaTanımlamaModal').modal('hide');
                    },

                    error: function (data) {
                        console.error(data)
                    }
                });
            }

            //$(document).ready(function () {

            //        $(".gizle").hide();

            //    //$("#kaziKazanSiparisZamanGoster1").click(function () {
            //    //    if (item.kaziKazanOnikiAySans.val == "Stokta Yok")
            //    //    $(".gizle").show();
            //    //});
            //});




            parent.load();






        });

    </script>































</asp:Content>
