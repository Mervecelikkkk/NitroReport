using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NitroReport
{
    public class TotalBilgisi
    {
        public int toplamNokta { get; set; }
        public int calisanPersonel { get; set; }
        public int uygYapilanNokta { get; set; }
        public int ziyaretEdilenNokta { get; set; }
        public int kaziKazanOlanNoktaSayisi{ get; set; }
        public int kaziKazanOlmayanNoktaSayisi{ get; set; }
        public int kaziKazanSatanNoktaSayisi{ get; set; }
        public int kaziKazanSatmayanNoktaSayisi{ get; set; }
        public int herhangiKaziKazanSayisi { get; set; }
        public int milliPiyangoSayisi { get; set; }
        public int onikiAySansSayisi { get; set; }
        public int sansDagiSayisi { get; set; }
        public int altinSayisi { get; set; }

        public int seciliTarihtekiNokta { get; set; }

    }
}