import 'package:flutter/material.dart';
import 'package:aplikasibaru/pages/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Irigasi Limpok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatusPage(place: 'Limpok'),
    );
  }
}

class StatusPage extends StatelessWidget {
  // Contoh data yang mungkin Anda miliki
  final String place;
  StatusPage({required this.place});
  final List<Map<String, String>> irigasiData = [
    {
      'title': 'Irigasi Limpok',
      'speed': '0.97 m/s²',
      'height': '0.5 m',
      'status': 'Aktif Normal',
    },
    {
      'title': 'Irigasi Limpok',
      'speed': '1.32 m/s²',
      'height': '1.1 m',
      'status': 'Awas',
    },
    {
      'title': 'Irigasi Limpok',
      'speed': '1.18 m/s²',
      'height': '0.8 m',
      'status': 'Waspada',
    },
    {
      'title': 'Irigasi Limpok',
      'speed': '0.85 m/s²',
      'height': '0.3 m',
      'status': 'Aktif Normal',
    },
    {
      'title': 'Irigasi Limpok',
      'speed': '0.99 m/s²',
      'height': '0.4 m',
      'status': 'Aktif Normal',
    },
    {
      'title': 'Irigasi Limpok',
      'speed': '2.34 m/s²',
      'height': '2.2 m',
      'status': 'Berbahaya',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Status'),
      ),
      body: ListView.builder(
        itemCount: irigasiData.length,
        itemBuilder: (context, index) {
          // Mengambil data untuk setiap card
          var data = irigasiData[index];
          return StatusCard(
            title: data['title']!,
            speed: data['speed']!,
            height: data['height']!,
            status: data['status']!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol ditekan
        },
        child: Icon(Icons.refresh),
        tooltip: 'Cek Status',
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final String speed;
  final String height;
  final String status;

  const StatusCard({
    Key? key,
    required this.title,
    required this.speed,
    required this.height,
    required this.status,
  }) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Aktif Normal':
        return Colors.green;
      case 'Awas':
        return Colors.orange;
      case 'Waspada':
        return Colors.yellow;
      case 'Berbahaya':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = _getStatusColor(status);
    return InkWell(
      onTap: () {
        // Navigasi ke halaman detail status
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailStatus(),
          ),
        );
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Kecepatan Air: $speed'),
                Text('Ketinggian Air: $height'),
                Text('Status: $status',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
