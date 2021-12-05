class Ulke {
  late String ulkeKodu;
  late String isim;
  late String baskent;
  late String bolge;
  late int nufus;
  late String bayrak;
  late String dil;

  Ulke.fromMap(Map<String, dynamic> ulkeMap) {
    this.ulkeKodu = ulkeMap["alpha2Code"];
    this.isim = ulkeMap["name"];
    this.baskent = ulkeMap["capital"];
    this.bolge = ulkeMap["region"];
    this.nufus = ulkeMap["population"];
    this.bayrak = ulkeMap["flag"];
    this.dil = ulkeMap["languages"][0]["name"];
  }
}
