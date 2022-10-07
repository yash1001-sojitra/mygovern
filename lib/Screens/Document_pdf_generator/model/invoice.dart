class Invoice {
  final String customer;
  final String address;
  final String name;
  final List<LineItem> items;
  Invoice({
    required this.customer,
    required this.address,
    required this.items,
    required this.name,
  });
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}

class requireddataforpdf {
  final String name;
  final String address;
  final int familymambercount;
  final int getincome;
  final int lightbill;
  final int income;
  final String phonenumber;
  final String dateofbirth;
  final String documentname;
  final String place;
  final String date;
  // final List<LineItem> items;
  requireddataforpdf({
    required this.dateofbirth,
    required this.address,
    required this.phonenumber,
    required this.familymambercount,
    required this.getincome,
    required this.income,
    required this.lightbill,
    required this.place,
    required this.date,
    required this.documentname,
    required this.name,
  });
}
