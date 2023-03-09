import 'package:flutter/material.dart';
import 'package:expense_tracker/transactions.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<Transactions> transactions = [
    Transactions(id: 't1', title: 'Shoes', amount: 99.9, date: DateTime.now()),
    Transactions(
        id: 't2', title: 'Groceries', amount: 16.9, date: DateTime.now())
  ];
  final titleInput = TextEditingController();
  final amtInput = TextEditingController();

  MyApp({super.key});
  // late String titleInput;
  // late String amtInput;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  child: Text('Button 1'),
                  color: Colors.blue,
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                      controller: titleInput,
                      //onChanged: (val) => {titleInput = val},
                      decoration: InputDecoration(label: Text('Name'))),
                  TextField(
                      controller: amtInput,
                      //onChanged: (value) => {amtInput = value},
                      decoration: InputDecoration(label: Text('Amount'))),
                  TextButton(
                    onPressed: () =>
                        {print(titleInput.text), print(amtInput.text)},
                    child: Text('Add Transaction'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.blue)),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: transactions.map((e) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      child: Text(
                        '\$ ${e.amount}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(e.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
          ]),
    ));
  }
}
