import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  State<PredictionPage> createState() => _PredictionState();
}

class _PredictionState extends State<PredictionPage> {
  bool escuchando = false;
  String _text = 'PALABRA TRANSCRITA';
  final sugerenciaController = TextEditingController();
  static String newValue = "";

  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        // backgroundColor: const Color(0xFF0D0D17),
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
            // color: const Color(0xFF14141E),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            const Text(
              'GENERACION DE SUGERENCIA',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontFamily: 'Dosis'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  enabled: true,
                  filled: true,
                  labelText: 'TRANSCRIPCION DEL SISTEMA',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                initialValue: "Dog",
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  enabled: true,
                  filled: true,
                  labelText: 'SUGERENCIA DEL SISTEMA',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 50),
                  primary: escuchando ? Colors.red : Color(0xFF476BF6),
                  onPrimary: Colors.black),
              onPressed: () {},
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'INICIAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(175, 50),
                  primary: escuchando ? Colors.red : Color(0xFF476BF6),
                  onPrimary: Colors.black),
              onPressed: () {
                reproducirPalabra();
              },
              icon: Icon(escuchando ? Icons.stop : Icons.mic, size: 30),
              label: Text(
                escuchando ? 'DETENER' : 'ESCUCHAR',
                style: TextStyle(fontSize: 25, fontFamily: 'Dosis'),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> reproducirPalabra() async {
    FlutterTts flutterTts = FlutterTts();
    var result = await flutterTts.speak("Dog");
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.3);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(0.5);

    await flutterTts.isLanguageAvailable("en-US");
  }
}
