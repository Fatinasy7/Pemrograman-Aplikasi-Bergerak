import 'package:flutter/material.dart';

class WidgetBertingkatScreen extends StatelessWidget {
  const WidgetBertingkatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A7C59), //
        title: const Text('Widget Bertingkat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Cipaww.jpeg',
              width: 600,
              height: 600,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Haii, Saya adalah Fatin Asyifa Nurrizky JenPutri, salah satu mahasiswa prodi Sistem Informasi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}