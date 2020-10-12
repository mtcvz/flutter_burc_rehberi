import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'models/burc.dart';

class BurcDetay extends StatelessWidget {
  int index;

  BurcDetay(this.index);

  Burc secilenBurc;

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.burclar[index];
    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink.shade500,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi + " Burcu ve Ozellikleri"),
              background: Image.asset(
                "images/"+secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  secilenBurc.burcDetay,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
