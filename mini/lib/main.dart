import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WelCome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/หน้าปก.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
              child: Text('สั่งเครื่องดื่ม'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<int> hotItemCounts = [0, 0, 0, 0];
  List<int> iceItemCounts = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotPage(itemCounts: hotItemCounts)),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text('เมนูร้อน'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IcePage(itemCounts: iceItemCounts)),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text('เมนูเย็น'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderPage(
                hotItemNames: ['ชาเขียวร้อน', 'คาปูชิโนร้อน', 'โกโก้ร้อน', 'กาแฟดำ'],
                hotItemPrices: [40, 50, 50, 50],
                hotItemQuantities: hotItemCounts,
                iceItemNames: ['ชาไทยเย็น', 'น้ำมะนาวผสมน้ำผึ้งเย็น', 'โอรีโอ้สมูทตี้', 'โกโก้เย็น'],
                iceItemPrices: [50, 55, 50, 50],
                iceItemQuantities: iceItemCounts,
              ),
            ),
          );
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

class HotPage extends StatefulWidget {
  final List<int> itemCounts;

  HotPage({required this.itemCounts});

  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Hot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMenuItem(context, 'ชาเขียวร้อน', 40, 0, 'assets/images/ชาเขียวร้อน.png', widget.itemCounts),
          buildMenuItem(context, 'คาปูชิโนร้อน', 50, 1, 'assets/images/คาปู.png', widget.itemCounts),
          buildMenuItem(context, 'โกโก้ร้อน', 50, 2, 'assets/images/โกโก้ร้อน.png', widget.itemCounts),
          buildMenuItem(context, 'กาแฟดำ', 50, 3, 'assets/images/กาแฟ.png', widget.itemCounts),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, int price, int index, String imagePath, List<int> itemCounts) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text('ราคา: $price ฿'),
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (itemCounts[index] > 0) {
                    itemCounts[index]--;
                  }
                });
              },
              icon: Icon(Icons.remove),
            ),
            Text('${itemCounts[index]}'),
            IconButton(
              onPressed: () {
                setState(() {
                  itemCounts[index]++;
                });
              },
              icon: Icon(Icons.add),
            ),
            
          ],
        ),
      ),
    );
  }
}

class IcePage extends StatefulWidget {
  final List<int> itemCounts;

  IcePage({required this.itemCounts});

  @override
  _IcePageState createState() => _IcePageState();
}

class _IcePageState extends State<IcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Cool'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildMenuItem(context, 'ชาไทยเย็น', 50, 0, 'assets/images/ชาไทย.png', widget.itemCounts),
          buildMenuItem(context, 'น้ำมะนาวผสมน้ำผึ้งเย็น', 55, 1, 'assets/images/ผึ้งมะนาว.png', widget.itemCounts),
          buildMenuItem(context, 'โอรีโอ้สมูทตี้', 50, 2, 'assets/images/โอริโอ้.png', widget.itemCounts),
          buildMenuItem(context, 'โกโก้เย็น', 50, 3, 'assets/images/โกโก้.png', widget.itemCounts),
        ],
      ),
    );
  }
  Widget buildMenuItem(BuildContext context, String title, int price, int index, String imagePath, List<int> itemCounts) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text('ราคา: $price ฿'),
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (itemCounts[index] > 0) {
                    itemCounts[index]--;
                  }
                });
              },
              icon: Icon(Icons.remove),
            ),
            Text('${itemCounts[index]}'),
            IconButton(
              onPressed: () {
                setState(() {
                  itemCounts[index]++;
                });
              },
              icon: Icon(Icons.add),
            ),
            
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  final List<String> hotItemNames;
  final List<int> hotItemQuantities;
  final List<int> hotItemPrices;
  final List<String> iceItemNames;
  final List<int> iceItemQuantities;
  final List<int> iceItemPrices;

  OrderPage({
    required this.hotItemNames,
    required this.hotItemQuantities,
    required this.hotItemPrices,
    required this.iceItemNames,
    required this.iceItemQuantities,
    required this.iceItemPrices,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total hot items and total hot price
    int totalHotItems = hotItemQuantities.reduce((value, element) => value + element);
    int totalHotPrice = calculateTotalPrice(hotItemQuantities, hotItemPrices);

    // Calculate total ice items and total ice price
    int totalIceItems = iceItemQuantities.reduce((value, element) => value + element);
    int totalIcePrice = calculateTotalPrice(iceItemQuantities, iceItemPrices);

    // Calculate total items and total price
    int totalItems = totalHotItems + totalIceItems;
    int totalPrice = totalHotPrice + totalIcePrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('All Order'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildOrderSection('เครื่องดื่มร้อน', hotItemNames, hotItemQuantities, hotItemPrices),
            buildOrderSection('เครื่องดื่มเย็น', iceItemNames, iceItemQuantities, iceItemPrices),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'สรุปรวม',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text('จำนวน'),
                    trailing: Text('$totalItems'),
                  ),
                  ListTile(
                    title: Text('รวมราคา'),
                    trailing: Text('$totalPrice ฿'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement order confirmation logic
              },
              child: Text('ยืนยันการสั่งซื้อ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderSection(String title, List<String> itemNames, List<int> itemQuantities, List<int> itemPrices) {
    List<String> selectedItems = [];
    List<int> selectedQuantities = [];
    List<int> selectedPrices = [];

    for (int i = 0; i < itemNames.length; i++) {
      if (itemQuantities[i] > 0) {
        selectedItems.add(itemNames[i]);
        selectedQuantities.add(itemQuantities[i]);
        selectedPrices.add(itemPrices[i]);
      }
    }

    return selectedItems.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(selectedItems[index]),
                      subtitle: Text('จำนวน: ${selectedQuantities[index]}'),
                      trailing: Text('ราคา: ${selectedPrices[index] * selectedQuantities[index]} ฿'),
                    );
                  },
                ),
                Divider(),
              ],
            ),
          )
        : SizedBox();
  }

  int calculateTotalPrice(List<int> quantities, List<int> prices) {
    int total = 0;
    for (int i = 0; i < quantities.length; i++) {
      total += quantities[i] * prices[i];
    }
    return total;
  }
}

