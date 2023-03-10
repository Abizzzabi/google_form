import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'form_page.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text(
          "Products List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 102, 157, 252),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                
              }), //IconButton
        ],
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.grey,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.grey,
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('products').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map((doc) {
                        return SizedBox(
                          height: 120,
                          width: 200,
                          child: Card(
                            margin: const EdgeInsets.only(
                                right: 30, left: 30, top: 30),
                            elevation: 5,
                            shadowColor: Colors.black,
                            color: const Color.fromARGB(255, 130, 171, 243),
                            child: ListTile(
                              title: Text(
                                doc['Product'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              subtitle: Text(doc['Rate']),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            color: Colors.grey,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 130, 171, 243),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormPage(),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          )),
    );
  }
}