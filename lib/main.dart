import 'package:flutter/material.dart';
import 'ScanQr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivaan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          width: 500,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Display Image
              Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU")),

              //First Button
              TextButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
                },
                child: Text("Scan QR Code",style: TextStyle(color: Colors.indigo[900]),),
              ),
              SizedBox(height: 10),
            ],
          ),
        )
    );
  }
}

