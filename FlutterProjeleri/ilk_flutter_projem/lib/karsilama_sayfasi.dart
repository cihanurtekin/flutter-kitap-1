import 'package:flutter/material.dart';

class KarsilamaSayfasi extends StatelessWidget {
  String kullaniciAdi;

  KarsilamaSayfasi(this.kullaniciAdi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Karşılama Sayfası"),
      ),
      body: Center(
        child: Text(
          "Hoşgeldin $kullaniciAdi",
          style: TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}