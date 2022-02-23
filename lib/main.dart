import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget yang nilai state nya tidak bisa berubah/lebih statis dan iterasi terbatas
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Widget yang nilai state nya bisa berubah dan bersifat dinamis/bisa berubah rubah
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Untuk mengupdate build/tampilan dari state
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // Kotak
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ini Mencoba menggunakan Stateless",
              textAlign: TextAlign.left,
            ),
            heading(text: "Memanggil fungsi heading"),
            Text(
              "Ini Mencoba menggunakan Statefull",
              textAlign: TextAlign.left,
            ),
            BiggerText(
              text:'Ini menggunakan Stateful, Jumlah kamu menekan tombol loh: $_counter',
            ),
          ],
        ),
      ),

      // Wadah / tempat untuk menambahkan button
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add), //Ini untuk gambar
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Test untuk implementasi Stateless
class heading extends StatelessWidget {
  final String text;

  const heading({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ));
  }
}

class BiggerText extends StatefulWidget {
  // Variabel untuk menampung data text
  final String text;

  BiggerText({required this.text});

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  // Variabel untuk menampung data variabel ukuran
  // '_' berarti dia bersifat private
  double _textSize = 16.0;

  // Fungsi untuk membesarkan text
  void _perbesarText() {
    setState(() {
      _textSize += 6.0;
    });
  }

  // Fungsi untuk membesarkan text
  void _perkecilText() {
    setState(() {
      _textSize -= 6.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: _textSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: _perbesarText,
          child: Icon(Icons.add),
          // Text('Perbesar loh'),
        ),
        ElevatedButton(
          onPressed: _perkecilText, 
          child: Icon(Icons.remove)
        )
      ],
    );
  }
}
