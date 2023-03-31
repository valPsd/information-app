import 'package:flutter/material.dart';
import 'package:information_app/add.dart';
import 'package:information_app/controller/address_control.dart';
import 'package:information_app/controller/information_control.dart';
import 'package:information_app/detail.dart';
import 'package:information_app/models/address.dart';
import 'package:information_app/models/information.dart';

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
        '/new-info': (context) => AddPage(),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All contacts',
              ),
              Tab(
                text: 'Contacts filter',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          //all contacts
          ValueListenableBuilder(
              valueListenable: Information_Control(),
              builder: (context, value, child) {
                final infos = value as List<Information>;
                final addresses = Address_Control().value;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: infos.length,
                  itemBuilder: (context, index) {
                    final info = infos[index];
                    final address = addresses[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 11, 74, 124),
                            size: 40.0,
                          ),
                          title: Text(
                            info.name + " " + info.surname,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 11, 74, 124),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(info.phoneNum),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      title: const Text('Please Confirm'),
                                      content: const Text(
                                          'Are you sure to remove this information?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                Information_Control()
                                                    .value
                                                    .remove(info);
                                                Address_Control()
                                                    .value
                                                    .remove(address);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Yes')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('No'))
                                      ],
                                    );
                                  });
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        address: address, info: info)));
                          },
                        ),
                        const Divider(
                          height: 5.0,
                        ),
                      ],
                    );
                  },
                );
              }),
          //sort by province
          ValueListenableBuilder(
              valueListenable: Information_Control(),
              builder: (context, value, child) {
                final infos = value as List<Information>;
                final addresses = Address_Control().value;
                List<String> allProvince =
                    addresses.map((a) => a.province).toList();
                allProvince = allProvince.toSet().toList();

                List<List<Address>> showAddress = [];
                List<List<Information>> showInfo = [];
                late List<Address> listTemp;
                late List<Information> listInfoTemp;
                for (var province in allProvince) {
                  listTemp = [];
                  listInfoTemp = [];
                  int i = 0;
                  for (var a in addresses) {
                    if (a.province == province) {
                      listTemp.add(a);
                      listInfoTemp.add(infos[i]);
                    }
                    i++;
                  }
                  showAddress.add(listTemp);
                  showInfo.add(listInfoTemp);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: showAddress.length,
                  itemBuilder: (context, index) {
                    final addressProvince = showAddress[index];
                    final infos = showInfo[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 25),
                          child: Text(
                            addressProvince[0].province,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: addressProvince.length,
                            itemBuilder: (context, index) {
                              final address = addressProvince[index];
                              final info = infos[index];
                              return Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                      Icons.account_circle,
                                      color: Color.fromARGB(255, 11, 74, 124),
                                      size: 40.0,
                                    ),
                                    title: Text(
                                      info.name + " " + info.surname,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 11, 74, 124),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(info.phoneNum),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext ctx) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Please Confirm'),
                                                content: const Text(
                                                    'Are you sure to remove this information?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          Information_Control()
                                                              .value
                                                              .remove(info);
                                                          Address_Control()
                                                              .value
                                                              .remove(address);
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('Yes')),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('No'))
                                                ],
                                              );
                                            });
                                      },
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  address: address,
                                                  info: info)));
                                    },
                                  ),
                                  const Divider(
                                    height: 5.0,
                                  ),
                                ],
                              );
                            }),
                      ],
                    );
                  },
                );
              }),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.of(context).pushNamed('/new-info')},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
