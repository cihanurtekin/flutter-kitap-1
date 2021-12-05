import 'package:flutter/material.dart';
import 'package:ilk_flutter_projem/giris_sayfasi.dart';
import 'package:ilk_flutter_projem/karsilama_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _veriOku(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text(
          "Flutter",
          style: TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }

  void _veriOku(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? kullaniciAdi = prefs.getString("kullaniciAdi");

    if (kullaniciAdi == null) {
      _girisSayfasiniAc(context);
    } else {
      _karsilamaSayfasiniAc(context, kullaniciAdi);
    }
  }

  void _girisSayfasiniAc(BuildContext context) {
    _sayfaAc(context, GirisSayfasi());
  }

  void _karsilamaSayfasiniAc(BuildContext context, String kullaniciAdi) {
    _sayfaAc(context, KarsilamaSayfasi(kullaniciAdi));
  }

  void _sayfaAc(BuildContext context, Widget sayfa) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context) {
          return sayfa;
        },
      );
      Navigator.pushReplacement(context, sayfaYolu);
    });
  }
}
