import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final String _apiKey = "87…f3";

  Map<String, double> _oranlar = {};

  String _secilenKur = "USD";

  double _sonuc = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Kur Dönüştürücü"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: _hesapla,
                  ),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: _secilenKur,
                  icon: Icon(Icons.arrow_downward),
                  underline: Container(),
                  onChanged: (String? yeniDeger) {
                    if (yeniDeger != null) {
                      setState(() {
                        _secilenKur = yeniDeger;
                      });
                    }
                  },
                  items: _oranlar.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "${_sonuc.toStringAsFixed(2)} TL",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Container(
              height: 2,
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _oranlar.keys.length,
                itemBuilder: _buildListItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_oranlar.keys.toList()[index]),
      trailing: Text(
          (1 / _oranlar.values.toList()[index]).toStringAsFixed(2) + " TL"),
    );
  }

  void _hesapla(String girilenDeger) {
    try {
      double? deger = double.tryParse(girilenDeger);
      double? oran = _oranlar[_secilenKur];
      if (deger != null && oran != null) {
        setState(() {
          _sonuc = deger / oran;
        });
      }
    } catch (e) {
      print("Bir hata oluştu");
    }
  }

  void _verileriInternettenCek() async {
    Uri uri = Uri.parse("https://api.exchangeratesapi.io/v1/latest?access_key=$_apiKey&base=TRY");
    http.Response response = await http.get(uri);
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);

    Map<String, dynamic> rates = parsedResponse["rates"];
    for (String ulkeKuru in rates.keys) {
      _oranlar[ulkeKuru] = rates[ulkeKuru] as double;
    }

    setState(() {});
  }
}
