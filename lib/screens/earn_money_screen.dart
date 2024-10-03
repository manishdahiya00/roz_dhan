import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:roz_dhan/screens/offer_detail_screen.dart';
import 'package:roz_dhan/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarnMoneyScreen extends StatefulWidget {
  const EarnMoneyScreen({super.key});

  @override
  State<EarnMoneyScreen> createState() => _EarnMoneyScreenState();
}

class _EarnMoneyScreenState extends State<EarnMoneyScreen> {
  String walletBalance = "0";
  int referCount = 0;
  List<dynamic> offers = [];
  bool isLoading = true;

  Future<void> fetchOffers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');
      String? securityToken = prefs.getString('token');

      if (userId != null && securityToken != null) {
        Map<String, String> allInfo = await Utils.collectAllInfo();
        String versionName = allInfo['versionName'] ?? "";
        String versionCode = allInfo['versionCode'] ?? "";
        String url = "${allInfo["baseUrl"]}offers";

        final dio = Dio();
        final response = await dio.post(
          url,
          data: {
            "userId": userId,
            "securityToken": securityToken,
            "versionName": versionName,
            "versionCode": versionCode,
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          setState(() {
            offers = response.data['offers'] ?? [];
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      referCount = prefs.getInt("referCount") ?? 0;
      walletBalance = prefs.getString("walletBalance") ?? "0";
    });
  }

  @override
  void initState() {
    super.initState();
    fetchOffers();
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
                        referCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.money,
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
                        (double.parse(walletBalance) / 100).toString(),
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
            // Render offers or loading indicator
            isLoading
                ? const CircularProgressIndicator() // Show a loading indicator while fetching offers
                : offers.isEmpty
                    ? const Text(
                        'No offers available') // Display message if no offers
                    : Column(
                        children: offers.map((offer) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      OfferDetailScreen(offer: offer),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: isMobile ? 50 : 70,
                                    width: isMobile ? 50 : 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            offer['smallImage'] ??
                                                'assets/images/main1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Title and Description Section
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.task,
                                                color: ColorTheme.primaryColor,
                                                size: isMobile ? 18 : 24),
                                            const SizedBox(width: 5),
                                            Text(
                                              offer['title'],
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
                                          offer['subtitle'],
                                          style: TextStyle(
                                              fontSize: isMobile ? 12 : 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Reward Section
                                  Text(
                                    '+${offer['amount']}',
                                    style: TextStyle(
                                      color: ColorTheme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: isMobile ? 14 : 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
          ],
        ),
      ),
    );
  }
}
