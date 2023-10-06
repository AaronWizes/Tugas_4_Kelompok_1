import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ListKelompok1 {
  final String name;
  final String nim;
  final String tgl;

  ListKelompok1(this.name, this.nim, this.tgl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo User Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  final List<ListKelompok1> ListAnggota1 = [
    ListKelompok1('Damdy Junaedi', '32210007', '25 November 2003'),
    ListKelompok1('Alvin Saputra', '32210071', '21 Juni 2003'),
    ListKelompok1('Ritter Felix Farand Wijaya', '32210074', '1 Juli 2003')
    // Tambahkan anggota kelompok lainnya sesuai kebutuhan.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kelompok'),
      ),
      body: ListView.builder(
        itemCount: ListAnggota1.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Text('Anggota ${index + 1} - ${ListAnggota1[index].name}'),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AnotherScreen(ListAnggota1[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final ListKelompok1 ListAnggota1;

  AnotherScreen(this.ListAnggota1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data ${ListAnggota1.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NIM: ${ListAnggota1.nim}'),
            Text('Tanggal Lahir: ${ListAnggota1.tgl}'),
            // Tambahkan informasi lainnya tentang anggota kelompok jika diperlukan.
          ],
        ),
      ),
    );
  }
}