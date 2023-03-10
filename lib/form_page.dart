import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'list_page.dart';


class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<FormPage> {
  String val = 'type';
  String valu = 'currency';
  final _formKey = GlobalKey<FormState>();
  late String _product, _rate, _amount, _remark, _profit;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _pcontroller = TextEditingController();
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _rcontroller = TextEditingController();
  final TextEditingController _ppcontroller = TextEditingController();
  final fieldText = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  getProduct(product) {
    _product = product;
  }

  getRate(rate) {
    _rate = rate;
  }

  getAmount(amount) {
    _amount = amount;
  }

  getRemark(remark) {
    _remark = remark;
  }

  getProfit(profit) {
    _profit = profit;
  }

  void clearForm() {
    _acontroller.clear();
    _controller.clear();
    _controller.clear();
    _pcontroller.clear();
    _rcontroller.clear();
    _ppcontroller.clear();
  }

  createData() {
    const Text('created....');
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("products").doc(_product);
    Map<String, dynamic> students = {
      "Product": _product,
      "Rate": _rate,
      "Amount": _amount,
      "Remark": _remark,
      "Profit": _profit
    };
    documentReference.set(students).whenComplete(() {
      Text('$_product  created');
      Text('$_rate  created');
      Text('$_amount  created');
      Text('$_remark  created');
      Text('$_profit  created');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage('assets/images/currency.jpg'),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 250,
                        width: 690,
                        child: Container(
                          margin: const EdgeInsetsDirectional.all(20),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 76, 97, 189),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const SizedBox(
                              height: 240,
                              child: Card(
                                  margin: EdgeInsetsDirectional.only(top: 20),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  elevation: 5,
                                  child: TextField())),
                        )),
                    SizedBox(
                        height: 260,
                        width: 690,
                        child: Card(
                          margin: const EdgeInsets.all(15),
                          elevation: 5,
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.blueAccent),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                const Text('Trade Type',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16)),
                                ListTile(
                                  title: const Text('Buy'),
                                  leading: Radio(
                                    value: 'buy',
                                    groupValue: val,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blueAccent),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as String;
                                      });
                                    },
                                    activeColor: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Sell'),
                                  leading: Radio(
                                    value: 'sell',
                                    groupValue: val,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blueAccent),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as String;
                                      });
                                    },
                                    activeColor: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Escrow'),
                                  leading: Radio(
                                    value: 'escrow',
                                    groupValue: val,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blueAccent),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as String;
                                      });
                                    },
                                    activeColor: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Free Money'),
                                  leading: Radio(
                                    value: 'freemoney',
                                    groupValue: val,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => Colors.blueAccent),
                                    onChanged: (value) {
                                      setState(() {
                                        val = value as String;
                                      });
                                    },
                                    activeColor: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 150,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Product Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              TextFormField(
                                controller: _pcontroller,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    hintText: '   Your answer'),
                                onChanged: (String product) {
                                  getProduct(product);
                                },
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      _pcontroller.clear();
                                    },
                                    child: const Text(
                                      'Clear Selection',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ]))),
                    SizedBox(
                        height: 150,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Rate',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              TextFormField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    hintText: '   Your answer'),
                                onChanged: (String rate) {
                                  getRate(rate);
                                },
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      _controller.clear();
                                    },
                                    child: const Text(
                                      'Clear Selection',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ]))),
                    const SizedBox(height: 5),
                    SizedBox(
                        height: 200,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Currency',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              ListTile(
                                title: const Text('USDT'),
                                leading: Radio(
                                  value: 'usdt',
                                  groupValue: valu,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.blueAccent),
                                  onChanged: (value) {
                                    setState(() {
                                      valu = value as String;
                                    });
                                  },
                                  activeColor: Colors.black,
                                ),
                              ),
                              ListTile(
                                title: const Text('SGD'),
                                leading: Radio(
                                  value: 'sgd',
                                  groupValue: valu,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.blueAccent),
                                  onChanged: (value) {
                                    setState(() {
                                      valu = value as String;
                                    });
                                  },
                                  activeColor: Colors.black,
                                ),
                              )
                            ]))),
                    SizedBox(
                        height: 150,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Amount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              TextFormField(
                                controller: _acontroller,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintText: '   Your answer',
                                ),
                                onChanged: (String amount) {
                                  getAmount(amount);
                                },
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      _acontroller.clear();
                                    },
                                    child: const Text(
                                      'Clear Selection',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ]))),
                    SizedBox(
                        height: 150,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Remark',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              TextFormField(
                                controller: _rcontroller,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintText: '   Your answer',
                                ),
                                onChanged: (String remark) {
                                  getRemark(remark);
                                },
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      _rcontroller.clear();
                                    },
                                    child: const Text(
                                      'Clear Selection',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ]))),
                    SizedBox(
                        height: 150,
                        width: 690,
                        child: Card(
                            margin: const EdgeInsets.all(15),
                            elevation: 5,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(height: 10),
                              const Text('Profit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              TextFormField(
                                controller: _ppcontroller,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                    hintText: '   Your answer'),
                                onChanged: (String profit) {
                                  getProfit(profit);
                                },
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      _ppcontroller.clear();
                                    },
                                    child: const Text(
                                      'Clear Selection',
                                      style: TextStyle(color: Colors.black),
                                    )),
                              )
                            ]))),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                _controller.value.text.isNotEmpty
                                    ? createData()
                                    : null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddState(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 76, 153, 189),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                side: const BorderSide(
                                    width: 3, color: Colors.white),
                              ),
                              child: const Text('Submit',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17)),
                            )),
                        const SizedBox(width: 150),
                        SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                clearForm();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 76, 97, 189),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                side: const BorderSide(
                                    width: 3, color: Colors.white),
                              ),
                              child: const Text('Clear Form',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17)),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ), // s trailing comma makes auto-formatting nicer for build methods.
              ),
            )));
  }
}