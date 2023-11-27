import 'package:intl/intl.dart';

class User {
  String firstName;
  String lastName;
  String accountBalance;
  String virtualAcctNo;
  List<Transaction> transactions;

  User({
    required this.firstName,
    required this.lastName,
    required this.accountBalance,
    required this.virtualAcctNo,
    required this.transactions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        accountBalance: json["account_balance"],
        virtualAcctNo: json["virtual_acct_no"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );
}

class Transaction {
  int id;
  String desc;
  String type;
  int amount;
  String date;

  String get parsedDate =>
      DateFormat('dd MMMM, yyyy').format(DateTime.parse(date));

  Transaction({
    required this.id,
    required this.desc,
    required this.type,
    required this.amount,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        desc: json["desc"],
        type: json["type"],
        amount: json["amount"],
        date: json["date"],
      );
}
