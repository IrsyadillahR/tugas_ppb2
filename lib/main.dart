import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final biodata = <String, String>{};

  MyApp({super.key}) {
    biodata['name'] = 'Pirate King (Luffy)';
    biodata['email'] = 'luffy@onepiece.com';
    biodata['phone'] = '087704511975';
    biodata['image'] = 'kilua.png';
    biodata['hobby'] = 'Berlayar dan bertarung';
    biodata['addr'] = 'St. Freeway in side of Moonstad';
    biodata['desc'] = ''' Monkey D. Luffy adalah seorang karakter 
    fiksi dan tokoh protagonis utama dalam serial anime dan manga 
    One Piece karya Eiichiro Oda. Ia merupakan putra kandung dari 
    pemimpin Pasukan Revolusioner, Monkey D. Dragon, cucu kandung dari Angkatan Laut terkenal, Monkey D. Garp, 
    putra angkat dari bandit gunung, Curly Dadan, dan saudara angkat 
    dari Portgas D. Ace si "Tinju Api" dan Sabo. ''';
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              teksKotak(Colors.black, 'Monkey D. Luffy'),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10,),
            Row(
              children: [
                btnContact(Icons.alternate_email, Colors.blue[900],
                    "mailto:${biodata['email']}"),
                btnContact(Icons.mark_email_unread_rounded, Colors.redAccent,
                    "https/wa.me/${biodata['phone']}"),
                btnContact(Icons.phone, Colors.greenAccent,
                    "tel:${biodata['phone']}"),
            ],
          ),
          SizedBox(height: 10),
          textAttribute("Hobby", biodata['hobby'] ?? ''),
          textAttribute("Alamat", biodata['addr'] ?? ''),
          SizedBox(height: 10),
          teksKotak(Colors.black38, 'Deskripsi'),
          SizedBox(height: 10),
          Text(biodata['desc'] ?? '', style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
          )
        ]),
      ),
    ),
  );
  }

  Container teksKotak(Color bgColor, String text) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white),
      ),
      
    );
  }

  Row textAttribute(String judul, String text) {
    return Row(
          children: [
            Container(
              width: 100,
              child: Text("- $judul",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Text(":", style: TextStyle(fontSize: 18)),
            Text(text, style: TextStyle(fontSize: 18))
          ],
        );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: (){
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async{
    if (!await launchUrl(Uri.parse(uri))){
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}