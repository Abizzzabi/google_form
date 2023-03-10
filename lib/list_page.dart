import 'package:flutter/material.dart';

import 'form_page.dart';
import 'main.dart';


class AddState extends StatefulWidget {
  const AddState({super.key});

  @override
  State<AddState> createState() => _MyAddState();
}

class _MyAddState extends State<AddState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 105, 156, 243),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        const SizedBox(
          height: 80,
        ),
        SizedBox(
          height: 400,
          width: 600,
          child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 130, 171, 243),
                boxShadow: [
                  BoxShadow(
                    //<-- SEE HERE
                    color: Colors.white,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/ticket.png',
                  height: 225,
                  width: 225,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Your product added successfully...",
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontFamily: 'alex'),
                ),
                const SizedBox(height: 10),
                const Text(
                    '   For add another product Please click the below button...',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ])),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 47,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 130, 171, 243),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(width: 3, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ),
                    );
                  },
                  child: const Text('Go to HomePage',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
            const SizedBox(
              width: 200,
            ),
            SizedBox(
                height: 47,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 130, 171, 243),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(width: 3, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormPage(),
                      ),
                    );
                  },
                  child: const Text('Add another Product',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )),
          ],
        ),
      ]),
    ));
  }
}