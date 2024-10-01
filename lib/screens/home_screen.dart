import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:roz_dhan/screens/earn_money_screen.dart';
import 'package:roz_dhan/screens/games_screen.dart';
import 'package:roz_dhan/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const EarnMoneyScreen(),
    const GamesScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _pages[_currentIndex],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorTheme.appBarColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.7),
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Earn Money',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Game',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarWithSearch extends StatelessWidget {
  const TopBarWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.language),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
          ),
          const Row(
            children: [
              Icon(Icons.notifications),
              SizedBox(width: 10),
              Icon(Icons.card_giftcard),
            ],
          ),
        ],
      ),
    );
  }
}

class IconHorizontalMenu extends StatelessWidget {
  const IconHorizontalMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: [
          buildIconColumn(Icons.monetization_on, "Earning Tips"),
          buildIconColumn(Icons.card_giftcard, "Free Gifts"),
          buildIconColumn(Icons.access_time, "Lucky Time"),
          buildIconColumn(Icons.wallet, "Trial Winning"),
          buildIconColumn(Icons.sports_cricket, "T20 World Cup"),
          buildIconColumn(Icons.cake, "Candy Burst"),
          buildIconColumn(Icons.local_atm, "Lucky Market"),
          buildIconColumn(Icons.gif_outlined, "Surprise Game"),
        ],
      ),
    );
  }

  Widget buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.orange,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        TopBarWithSearch(),
        IconHorizontalMenu(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "For You",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        OfferCard(
          title: "Get Free Fire Diamonds for FREE.",
          image: "assets/images/main1.png",
        ),
        OfferCard(
          title: "Best Tips to Earn Money Online",
          image: "assets/images/main2.png",
        ),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String image;

  const OfferCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
