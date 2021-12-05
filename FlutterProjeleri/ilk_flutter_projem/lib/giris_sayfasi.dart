import 'package:flutter/material.dart';
import 'package:ilk_flutter_projem/karsilama_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GirisSayfasi extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Sayfası"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Giriş Yap"),
              onPressed: () {
                _girisYap(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _girisYap(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("kullaniciAdi", _controller.text);
    _karsilamaSayfasiniAc(context, _controller.text);
  }

  void _karsilamaSayfasiniAc(BuildContext context, String kullaniciAdi) {
    _sayfaAc(context, KarsilamaSayfasi(kullaniciAdi));
  }

  void _sayfaAc(BuildContext context, Widget sayfa) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return sayfa;
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }
}
