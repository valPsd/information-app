// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:information_app/models/information.dart';

import 'models/address.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.address, required this.info})
      : super(key: key);
  Address address;
  Information info;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Address address = widget.address;
    final Information info = widget.info;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15),
            child: Text(
              'Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListTile(
            title: Text('Name'),
            subtitle: Text(info.name),
          ),
          ListTile(
            title: Text('Surname'),
            subtitle: Text(info.surname),
          ),
          ListTile(
            title: Text('Nickname'),
            subtitle: Text(info.nickname),
          ),
          ListTile(
            title: Text('Phone number'),
            subtitle: Text(info.phoneNum),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(info.email),
          ),
          ListTile(
            title: Text('ID card number'),
            subtitle: Text(info.cardID),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 15),
            child: Text(
              'Address from Identification card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text(address.address),
          ),
          ListTile(
            title: Text('Province'),
            subtitle: Text(address.province),
          ),
          ListTile(
            title: Text('Zip code'),
            subtitle: Text(address.zipCode),
          ),
        ],
      ),
    );
  }
}
