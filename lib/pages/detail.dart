import 'package:flutter/material.dart';
import 'package:aplikasibaru/pages/check.dart';

void main() {
  runApp(MyApp());
}

class DetailStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Status'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Aksi ketika tombol back diklik
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              // child: Text(
              // 'Irigasi Limpok',
              // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // ),
            // Tempatkan widget grafik Anda di sini
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Center(child: Text('Grafik Ketinggian Air')),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Kecepatan Air: 0.92 m/s²',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Ketinggian Air: 0.5 m', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Status: AKTIF normal',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol 'Aktifkan Pompa' diklik
                showPumpActivationDialog(context);
              },
              child: Text('Aktifkan Pompa'),
            ),
          ],
        ),
      ),
    );
  }

  void showPumpActivationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pompa Aktif!'),
          content: Text('Pompa Berhasil Diaktifkan'),
          actions: <Widget>[
            TextButton(
              child: Text('Urungkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Selesai'),
              onPressed: () {
                // Aksi ketika pompa diaktifkan
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
