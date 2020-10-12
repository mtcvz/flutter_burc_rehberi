import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:flutter_burc_rehberi/utils/strings.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> burclar;

  @override
  Widget build(BuildContext context) {
    burclar =  verileriHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burc Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  static List<Burc> verileriHazirla() {
    List<Burc> temp = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = "koc1.png";
      String buyukResim = "koc_buyuk1.png";

      Burc tempBurc = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
      temp.add(tempBurc);
    }

    return temp;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return listeElemani(context, index);
      },
      itemCount: burclar.length,
    );
  }

  Widget listeElemani(BuildContext context, int index) {
    Burc tempBurc = burclar[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          onTap: (){
           Navigator.pushNamed(context, "/burcDetay/$index");
           //Navigator.push(context,MaterialPageRoute(builder:(context)=>BurcDetay(index)));
          },
          leading: Image.asset("images/" + tempBurc.burcKucukResim),
          title: Text(
            tempBurc.burcAdi,
            style: TextStyle(fontSize: 24, color: Colors.pink.shade500),
          ),
          subtitle: Text(
            tempBurc.burcTarihi,
            style: TextStyle(fontSize: 14, color: Colors.black38),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pinkAccent,
          ),
        ),
      ),
    );
  }
}
