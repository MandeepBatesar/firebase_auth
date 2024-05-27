import 'package:flutter/material.dart';

class AppData {
  static List<Map<String, dynamic>> BudgetData = [
    {
      "icon": Icons.food_bank_rounded,
      "title": "Travel & Food",
      "Date": "12 July 1965",
      "price": "13.44",
    },
    {
      "icon": Icons.flight,
      "title": "Air Travel Expense",
      "Date": "19 July 1965",
      "price": "103.44",
    },
    {
      "icon": Icons.work,
      "title": "Office Supplies",
      "Date": "19 July 1965",
      "price": "103.44",
    },
    {
      "icon": Icons.shopping_bag,
      "title": "Shopping",
      "Date": "19 July 1965",
      "price": "103.44",
    },
    {
      "icon": Icons.monetization_on,
      "title": "Other",
      "Date": "19 July 1965",
      "price": "103.44",
    },
  ];
  static List<Map<String, dynamic>> filtercategory = [
    {"bool": false, "title": "Uncategorized"},
    {"bool": false, "title": "Labour"},
    {"bool": false, "title": "Material"},
    {"bool": false, "title": "Transport"},
    {"bool": false, "title": "Tools"},
    {"bool": false, "title": "Salary"},
    {"bool": false, "title": "Fuel"},
  ];
  static List<Map<String, dynamic>> expensedata = [
    {
      "Category": "Category",
      "SubCategory": "SubCategory",
      "Amount": "-\u{20B9}00",
      "DataTime": "30 Decomber 1996",
      "Note":
          "Every bite is a symphony of flavors, a dance of spices, and a canvas of culinary artistry.",
      "Paymentmethod": "Card",
      "Image": Icons.car_crash,
    },
    {
      "Category": "Category",
      "SubCategory": "SubCategory",
      "Amount": "-\u{20B9}00",
      "DataTime": "30 Decmbr 1996",
      "Note":
          "Every bite is a symphony of flavors, a dance of spices, and a canvas of culinary artistry.",
      "Paymentmethod": "UPI",
      "Image": Icons.car_crash,
    },
  ];
}
