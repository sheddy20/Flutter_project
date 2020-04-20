import 'package:expense/widgets/Loginpage.dart';
import 'package:expense/widgets/dash.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transactions.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    'users': (context) => DashBoard(),
    Login.tag: (context) => Login(),
    MyHomePage.tag: (context) => MyHomePage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        errorColor: Colors.red,
      ),
      home: Login(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String tag = '';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'qwerty keyboard',
    //   title: 'Hp Hewlett Packard',
    //   amount: 400,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'D macbook pro',
    //   title: 'Apple Inc',
    //   amount: 900,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'Samsung Galaxy s20 pro',
    //   title: 'Samsung electronics',
    //   amount: 600,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
            _addNewTransaction,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () => _startAddTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(
              _userTransactions,
              _deleteTransaction,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.purpleAccent,
        onPressed: () => _startAddTransaction(context),
      ),
    );
  }
}
