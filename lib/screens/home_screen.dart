import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:roz_dhan/screens/earn_money_screen.dart';
import 'package:roz_dhan/screens/history_screen.dart';
import 'package:roz_dhan/screens/profile_screen.dart';
import 'package:roz_dhan/screens/wallet_screen.dart';
import 'package:roz_dhan/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    const WalletScreen(),
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
              icon: Icon(Icons.wallet),
              label: 'Wallet',
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
          backgroundColor: ColorTheme.primaryColor,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  HomeContentState createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  List<dynamic> blogs = [];
  bool _isLoading = true;
  String _errorMessage = '';

  Future<void> _fetchBlogs() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      Map<String, String> allInfo = await Utils.collectAllInfo();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? securityToken = prefs.getString('token');
      String versionName = allInfo['versionName'] ?? "";
      String versionCode = allInfo['versionCode'] ?? "";

      final dio = Dio();
      final response = await dio.post(
        "${allInfo["baseUrl"]}blogs",
        data: {
          "userId": userId,
          "securityToken": securityToken,
          "versionName": versionName,
          "versionCode": versionCode,
        },
      );

      if (response.statusCode == 201 && response.data["status"] == 200) {
        setState(() {
          blogs = response.data['blogs'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to fetch blogs.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error occurred: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryColor,
        title: const Text(
          "Blogs",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(children: [
        const SizedBox(height: 20),
        const IconHorizontalMenu(),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage.isNotEmpty
                  ? Center(child: Text(_errorMessage))
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        final blog = blogs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogDetailScreen(
                                  title: blog['title'],
                                  text: blog['text'],
                                  image: blog['image'],
                                ),
                              ),
                            );
                          },
                          child: OfferCard(
                            title: blog['title'],
                            image: blog['image'],
                          ),
                        );
                      },
                    ),
        ),
      ]),
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
            Image.network(
              image,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
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

class BlogDetailScreen extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const BlogDetailScreen(
      {super.key,
      required this.title,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryColor,
        title: const Text(
          "Blog Detail",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
