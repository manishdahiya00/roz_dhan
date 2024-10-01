import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarnMoneyScreen extends StatefulWidget {
  const EarnMoneyScreen({super.key});

  @override
  State<EarnMoneyScreen> createState() => _EarnMoneyScreenState();
}

class _EarnMoneyScreenState extends State<EarnMoneyScreen> {
  String walletBalance = "0";
  String referCount = "0";

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      referCount = prefs.getString("referCount") ?? "0";
      walletBalance = prefs.getString("walletBalance") ?? "0";
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorTheme.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.monetization_on,
                          color: Colors.white, size: isMobile ? 24 : 30),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Referrals",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        referCount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: Colors.white, size: isMobile ? 24 : 30),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Income",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        walletBalance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: Colors.white, size: isMobile ? 24 : 30),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Coins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        walletBalance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Prime Tasks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 16 : 18,
                    ),
                  ),
                ),
                TaskItem(
                  title: 'Chamet',
                  description: 'It should be your first time using Chamet.',
                  reward: '+1000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Angel One: Stocks',
                  description:
                      'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                  reward: '+20000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Speed Ludo - REGISTER',
                  description: 'Register to get rewards.',
                  reward: '+5000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Chamet',
                  description: 'It should be your first time using Chamet.',
                  reward: '+1000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Angel One: Stocks',
                  description:
                      'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                  reward: '+20000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Speed Ludo - REGISTER',
                  description: 'Register to get rewards.',
                  reward: '+5000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Chamet',
                  description: 'It should be your first time using Chamet.',
                  reward: '+1000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Angel One: Stocks',
                  description:
                      'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                  reward: '+20000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
                TaskItem(
                  title: 'Speed Ludo - REGISTER',
                  description: 'Register to get rewards.',
                  reward: '+5000',
                  isMobile: isMobile,
                  imageUrl: 'assets/images/main1.png',
                ),
              ],
            ),
          ],
        ),
      ),
      // Bottom navigation bar
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String reward;
  final bool isMobile;
  final String imageUrl;

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    required this.reward,
    required this.isMobile,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          // Image and Icon Section
          Container(
            height: isMobile ? 50 : 70,
            width: isMobile ? 50 : 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          // Title and Description Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.task,
                        color: ColorTheme.primaryColor,
                        size: isMobile ? 18 : 24),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: isMobile ? 14 : 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: isMobile ? 12 : 14),
                ),
              ],
            ),
          ),
          // Reward Section
          Text(
            reward,
            style: TextStyle(
              color: ColorTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
