import 'package:flutter/material.dart';
import 'ScanQr.dart';

void main() {
  runApp(const MyApp());
}

class AttendanceRecord {
  final String name;
  final String registrationNumber;
  final String time;
  final bool isPresent;

  AttendanceRecord({
    required this.name,
    required this.registrationNumber,
    required this.time,
    required this.isPresent,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vivaan',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(primary: Colors.black87),
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
  TextEditingController _textController = TextEditingController();

  List<AttendanceRecord> attendanceRecords = [
    AttendanceRecord(
      name: "Teegireddy Pradeep",
      registrationNumber: "21BCE11079",
      time: "7:00 PM",
      isPresent: true,
    ),
    AttendanceRecord(
      name: "Raghav",
      registrationNumber: "21BCE11317",
      time: "7:30 PM",
      isPresent: false,
    ),
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addAttendanceRecord() {
    String enteredText = _textController.text.trim();
    if (enteredText.isNotEmpty) {
      AttendanceRecord newRecord = AttendanceRecord(
        name: enteredText,
        registrationNumber: "21BCEXXXXX",
        time: "Time",
        isPresent: true,
      );

      setState(() {
        attendanceRecords.add(newRecord);
      });
      _textController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Display Image
              Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQyYwscUPOH_qPPe8Hp0HAbFNMx-TxRFubpg&usqp=CAU")),

              //First Button
              Container(
                margin: EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanQR()));
                  },
                  child: Text("Scan QR Code",style: TextStyle(color: Colors.indigo[900]),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Manual Entry")),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter text',
                    labelText: 'Enter text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Attendee List")),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: attendanceRecords.length,
                  itemBuilder: (context, index) {
                    AttendanceRecord record = attendanceRecords[index];
                    return Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      color: Colors.grey.shade900,
                      child: ListTile(
                        title: Text(record.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reg No: ${record.registrationNumber}"),
                            Text("Time: ${record.time}"),
                          ],
                        ),
                        trailing: Text(record.isPresent ? 'Present' : 'Absent'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}

