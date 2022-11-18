<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Raporlar_Chart.aspx.cs" Inherits="NitroReport.Raporlar_Chart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-col w-100 pb-5">
    <div class="container-fluid" ng-init="PersonelAdiListele()">

        <canvas id="pie" class="chart chart-bar"
  chart-data="personelChartData" chart-labels="personelChartLabels" chart-options="chartOptions">
</canvas> 

        <div ></div>



    </div>
</div>

    <script>


        var app = angular.module("app", ["chart.js"])
        app.controller("mainController", function ($scope) {


            var parent = $scope;

            $scope.chartLabels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
            $scope.chartData = [300, 500, 100];
            //$scope.chartOptions = {
            //    scales: {
            //        xAxes: [{
            //            display: false,
            //            ticks: {
            //                max: 125,
            //                min: -125,
            //                stepSize: 10
            //            }
            //        }],
            //        yAxes: [{
            //            display: false,
            //            ticks: {
            //                max: 125,
            //                min: -125,
            //                stepSize: 10
            //            }
            //        }]
            //    }
            //}

      




        parent.personelAdiListe = []
            parent.personelChartData = []
            parent.personelChartLabels = []

        parent.PersonelAdiListele = function () {


            var data = {}
          

            $.ajax({
                type: "POST",
                url: "<%=Page.ResolveUrl("~/ws/Raporlar.asmx") %>/ilceListele",
                    contentType: "application/json; charset=utf-8",

                    success: function (data) {


                        parent.personelAdiListe = data.d;
                        

                        for (i in data.d) {
                            parent.personelChartData.push(data.d[i].uygulamaSayisi);
                            parent.personelChartLabels.push(data.d[i].ilce);
                        }

                        parent.$apply();
                        console.log(parent.personelAdiListe);

                    },
                    error: function (data) {

                        console.error(data.responseText)
                    }

                });

        }
        parent.personelUygulamaListe = []

        parent.PersonelUygulamaListele = function () {


            var data = {}


            $.ajax({
                type: "POST",
                url: "<%=Page.ResolveUrl("~/ws/Raporlar_Chart.asmx") %>/PersonelUygulamaListele",
                contentType: "application/json; charset=utf-8",

                success: function (data) {


                    parent.personelUygulamaListe = data.d;


                    parent.$apply();
                    console.log(parent.personelUygulamaListe);

                },
                error: function (data) {

                    console.error(data.responseText)
                }

            });

        }






        });

    </script>













</asp:Content>
