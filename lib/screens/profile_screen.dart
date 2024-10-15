import 'package:flutter/material.dart';
import 'package:roz_dhan/screens/history_screen.dart';
import 'package:roz_dhan/screens/refer_earn_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  String referCode = "";
  String amount = "";
  String walletBalance = "";
  String image =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.366icons.com%2Fmedia%2F01%2Fprofile-avatar-account-icon-16699.png&f=1&nofb=1&ipt=d32cd3665c36e518cb67ad59b645ffd3c73c005fe7dbc47f4292bfae4ff03b7d&ipo=images";

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      referCode = prefs.getString("referCode") ?? "";
      image = prefs.getString("image") ?? "";
      walletBalance = prefs.getString("walletBalance") ?? "";
      amount = (double.parse(prefs.getString("walletBalance") ?? "0") / 100)
          .toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildBalanceSection(),
          _buildActionButtons(),
          const SizedBox(
            height: 20,
          ),
          _buildMenuItems(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 39, 94, 176),
            Color.fromARGB(255, 56, 118, 211)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      overflow:
                          TextOverflow.ellipsis, // Use ellipsis for overflow
                      maxLines: 1, // Limit to 1 line for ellipsis
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('COINS',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 5),
                      Text(
                        walletBalance,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MY BALANCE',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ $amount',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(Icons.people, Colors.purple, 'Invite Friends',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReferEarnScreen()),
                );
              }),
              _buildActionButton(Icons.history, Colors.orange, 'Income History',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, Color color, String label, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _buildMenuItem(Icons.privacy_tip, 'Privacy Policy', () async {
          const url =
              "https://awin-cash-f8cf3a4624c8.herokuapp.com/privacy.html";
          if (!await launchUrl(Uri.parse(url))) {
            throw 'Could not launch $url';
          }
        }),
        _buildMenuItem(Icons.article, 'Terms And Conditions', () async {
          const url = "https://awin-cash-f8cf3a4624c8.herokuapp.com/terms.html";
          if (!await launchUrl(Uri.parse(url))) {
            throw 'Could not launch $url';
          }
        }),
        _buildMenuItem(Icons.help, 'Contact Us', () async {
          const url =
              "https://awin-cash-f8cf3a4624c8.herokuapp.com/contact.html";
          if (!await launchUrl(Uri.parse(url))) {
            throw 'Could not launch $url';
          }
        }),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String label,
    GestureTapCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
