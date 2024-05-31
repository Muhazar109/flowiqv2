import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF33AAAA),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: DetailStatus(),
      ),
    );
  }
}

class DetailStatus extends StatefulWidget {
  @override
  _DetailStatusState createState() => _DetailStatusState();
}

class _DetailStatusState extends State<DetailStatus> {
  bool isPumpActive = false;

  void activatePump() {
    setState(() {
      isPumpActive = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pompa berhasil diaktifkan'),
      ),
    );
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text(
              'Konfirmasi',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Apakah ingin mengaktifkan pompa?',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Batal',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
                  'Ya',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF33AAAA),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  activatePump();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void deactivatePump() {
    setState(() {
      isPumpActive = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pompa berhasil dimatikan'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF33AAAA),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Halaman Status",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),

      // appBar: AppBar(
      //   backgroundColor: Color(0xFF33AAAA),
      //   iconTheme: IconThemeData(color: Colors.white),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Status Pompa',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Icon(
                              isPumpActive ? Icons.check_circle : Icons.cancel,
                              color: isPumpActive ? Colors.green : Colors.red,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              isPumpActive ? "AKTIF" : "NON-AKTIF",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isPumpActive ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (!isPumpActive) {
                      showConfirmationDialog();
                    } else {
                      deactivatePump();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPumpActive
                        ? Color.fromARGB(255, 151, 42, 34)
                        : Color.fromARGB(255, 44, 155, 48),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text(
                    isPumpActive ? 'Matikan Pompa' : 'Aktifkan Pompa',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
