import 'package:coffee/util/coffee_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CoffeeTypeModel> coffeeTypes = [
    CoffeeTypeModel(name: 'Black', isSelected: true),
    CoffeeTypeModel(name: 'Cappucino', isSelected: false),
    CoffeeTypeModel(name: 'Latte', isSelected: false),
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (var coffeeType in coffeeTypes) {
        coffeeType.isSelected = false;
      }
      coffeeTypes[index].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add your menu button action here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Add your person icon action here
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Find the best coffee for you",
                style: GoogleFonts.bebasNeue(fontSize: 45),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find your coffee",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeTypes.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeTypes[index].name,
                    isSelected: coffeeTypes[index].isSelected,
                    onTap: () => coffeeTypeSelected(index),
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CoffeeTile(
                    coffeeImagePath:
                        'lib/images/nathan-dumlao-nBJHO6wmRWw-unsplash.jpg',
                    coffeeName: 'Black',
                    coffeePrice: '1.99',
                  ),
                  CoffeeTile(
                    coffeeImagePath:
                        'lib/images/david-o-andersen-KD0DYW6qBYQ-unsplash.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '4.99',
                  ),
                  CoffeeTile(
                    coffeeImagePath:
                        'lib/images/nathan-dumlao-c2Y16tC3yO8-unsplash.jpg',
                    coffeeName: 'Cappucino',
                    coffeePrice: '4.99',
                  ),
                  // Add more CoffeeTile widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeTypeModel {
  String name;
  bool isSelected;

  CoffeeTypeModel({required this.name, this.isSelected = false});
}
