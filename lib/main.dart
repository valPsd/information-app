import 'package:flutter/material.dart';
import 'package:information_app/add.dart';
import 'package:information_app/controller/information_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Information App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
      routes: {
        '/new-info':(context) => AddPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final information = Information_Control();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: information.length,
        itemBuilder: (context, index) {
          final info = information.information(atIndex: index);
          return Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Color.fromARGB(255, 11, 74, 124),
                  size: 40.0,
                ),
                title: Text(
                  info!.name + " " + info.surname,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 11, 74, 124),
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(info.phoneNum),
                onTap: () {},
              ),
              const Divider(
                height: 5.0,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).pushNamed('/new-info')
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
