import 'package:flutter/material.dart';

void main() {
  runApp(StarCoffeeApp());
}

class StarCoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarCoffee',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/LogoMenu.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings_input_composite_outlined),
              title: Text('Appetizers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Appetizers', products: appetizers)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Salads'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Salads', products: salads)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Entrees'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Entrees', products: entrees)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Seafood'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Seafood', products: seafood)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Desserts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Desserts', products: desserts)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Beverages'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPage(title: 'Beverages', products: beverages)),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('StarCoffee'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome,',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Good day our dear customer!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Center(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      'assets/images/LogoMenuThin.png', // Replace with your image path
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ),
  ),
  ),

            SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text(
                  'Homepage na ginawa ni Gabo',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String title;
  final List<CoffeeCard> products;

  MenuPage({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: products,
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final double rating;

  CoffeeCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(subtitle),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy products for each category
final List<CoffeeCard> appetizers = [
  CoffeeCard(
    image: 'assets/espresso.jpg',
    title: 'Espresso',
    subtitle: 'with milk',
    price: '\$2.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/cappuccino.jpg',
    title: 'Cappuccino',
    subtitle: '2% milk, wet',
    price: '\$5.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/latte.jpg',
    title: 'Latte',
    subtitle: 'with bakery',
    price: '\$3.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/americano.jpg',
    title: 'Americano',
    subtitle: 'with whole milk',
    price: '\$7.00',
    rating: 4.5,
  ),
];

final List<CoffeeCard> salads = [
  CoffeeCard(
    image: 'assets/salad1.jpg',
    title: 'Caesar Salad',
    subtitle: 'with chicken',
    price: '\$4.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/salad2.jpg',
    title: 'Greek Salad',
    subtitle: 'with feta cheese',
    price: '\$5.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/salad3.jpg',
    title: 'Garden Salad',
    subtitle: 'with ranch dressing',
    price: '\$3.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/salad4.jpg',
    title: 'Cobb Salad',
    subtitle: 'with bacon and egg',
    price: '\$7.00',
    rating: 4.5,
  ),
];

final List<CoffeeCard> entrees = [
  CoffeeCard(
    image: 'assets/entree1.jpg',
    title: 'Grilled Chicken',
    subtitle: 'with veggies',
    price: '\$10.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/entree2.jpg',
    title: 'Steak',
    subtitle: 'with fries',
    price: '\$15.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/entree3.jpg',
    title: 'Pasta',
    subtitle: 'with marinara sauce',
    price: '\$8.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/entree4.jpg',
    title: 'BBQ Ribs',
    subtitle: 'with coleslaw',
    price: '\$9.00',
    rating: 4.5,
  ),
];

final List<CoffeeCard> seafood = [
  CoffeeCard(
    image: 'assets/seafood1.jpg',
    title: 'Lobster',
    subtitle: 'with garlic butter',
    price: '\$25.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/seafood2.jpg',
    title: 'Shrimp Scampi',
    subtitle: 'with pasta',
    price: '\$18.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/seafood3.jpg',
    title: 'Crab Cakes',
    subtitle: 'with tartar sauce',
    price: '\$20.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/seafood4.jpg',
    title: 'Clam Chowder',
    subtitle: 'with oyster crackers',
    price: '\$7.00',
    rating: 4.5,
  ),
];

final List<CoffeeCard> desserts = [
  CoffeeCard(
    image: 'assets/dessert1.jpg',
    title: 'Chocolate Cake',
    subtitle: 'with ice cream',
    price: '\$4.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/dessert2.jpg',
    title: 'Cheesecake',
    subtitle: 'with strawberries',
    price: '\$5.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/dessert3.jpg',
    title: 'Tiramisu',
    subtitle: 'with cocoa',
    price: '\$6.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/dessert4.jpg',
    title: 'Apple Pie',
    subtitle: 'with whipped cream',
    price: '\$3.00',
    rating: 4.5,
  ),
];

final List<CoffeeCard> beverages = [
  CoffeeCard(
    image: 'assets/beverage1.jpg',
    title: 'Lemonade',
    subtitle: 'fresh squeezed',
    price: '\$2.50',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/beverage2.jpg',
    title: 'Iced Tea',
    subtitle: 'with lemon',
    price: '\$2.99',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/beverage3.jpg',
    title: 'Smoothie',
    subtitle: 'with berries',
    price: '\$3.20',
    rating: 4.5,
  ),
  CoffeeCard(
    image: 'assets/beverage4.jpg',
    title: 'Hot Chocolate',
    subtitle: 'with marshmallows',
    price: '\$4.00',
    rating: 4.5,
  ),
];
