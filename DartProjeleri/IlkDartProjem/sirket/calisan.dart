enum Departman { Yazilim, Tasarim, Pazarlama }

class Calisan {
  late String ad;
  late String soyad;
  late String adres;
  late int maas;
  late int telefon;
  Departman? departman;

  Calisan(this.ad, this.soyad, this.adres, this.maas, this.telefon);
}
