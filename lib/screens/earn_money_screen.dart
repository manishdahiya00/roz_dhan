import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';

class EarnMoneyScreen extends StatelessWidget {
  const EarnMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen size for responsive design
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600; // Define mobile breakpoint

    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.orange,
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
                        "Today's coins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                      Text(
                        "≈Rs 0.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
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
                        "₹25",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                      Text(
                        "Withdraw",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.bolt,
                          color: Colors.white, size: isMobile ? 24 : 30),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "Energy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        "100",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 20 : 24,
                        ),
                      ),
                      Text(
                        "Get More >",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: isMobile ? 14 : 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Days check-in section.
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CheckInDayWidget(
                      day: 'Day1', coins: '20', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day2', coins: '50', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day3', coins: '20', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day4', coins: '20', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day5', coins: '100', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day6', coins: '300', isMobile: isMobile),
                  CheckInDayWidget(
                      day: 'Day7', coins: '1000', isMobile: isMobile),
                ],
              ),
            ),
            // Check-in button
            ElevatedButton.icon(
              onPressed: () {},
              label: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.015,
                ),
                child: Text(
                  'Check In +100',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 16 : 18,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            // Task list with prime tasks
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prime Tasks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 16 : 18,
                    ),
                  ),
                  TaskItem(
                    title: 'Chamet',
                    description: 'It should be your first time using Chamet.',
                    reward: '+1000',
                    color: Colors.red,
                    isMobile: isMobile,
                    icon: Icons.person,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Angel One: Stocks',
                    description:
                        'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                    reward: '+20000',
                    color: Colors.green,
                    isMobile: isMobile,
                    icon: Icons.stacked_bar_chart,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Speed Ludo - REGISTER',
                    description: 'Register to get rewards.',
                    reward: '+5000',
                    color: Colors.blue,
                    isMobile: isMobile,
                    icon: Icons.gamepad,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Chamet',
                    description: 'It should be your first time using Chamet.',
                    reward: '+1000',
                    color: Colors.red,
                    isMobile: isMobile,
                    icon: Icons.person,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Angel One: Stocks',
                    description:
                        'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                    reward: '+20000',
                    color: Colors.green,
                    isMobile: isMobile,
                    icon: Icons.stacked_bar_chart,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Speed Ludo - REGISTER',
                    description: 'Register to get rewards.',
                    reward: '+5000',
                    color: Colors.blue,
                    isMobile: isMobile,
                    icon: Icons.gamepad,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Chamet',
                    description: 'It should be your first time using Chamet.',
                    reward: '+1000',
                    color: Colors.red,
                    isMobile: isMobile,
                    icon: Icons.person,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Angel One: Stocks',
                    description:
                        'Only for Angel One: Stocks new users! You need to register & complete KYC to get rewards!',
                    reward: '+20000',
                    color: Colors.green,
                    isMobile: isMobile,
                    icon: Icons.stacked_bar_chart,
                    imageUrl: 'assets/images/main1.png',
                  ),
                  TaskItem(
                    title: 'Speed Ludo - REGISTER',
                    description: 'Register to get rewards.',
                    reward: '+5000',
                    color: Colors.blue,
                    isMobile: isMobile,
                    icon: Icons.gamepad,
                    imageUrl: 'assets/images/main1.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
    );
  }
}

class CheckInDayWidget extends StatelessWidget {
  final String day;
  final String coins;
  final bool isMobile;

  const CheckInDayWidget({
    Key? key,
    required this.day,
    required this.coins,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 236, 232, 232),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.monetization_on,
                  color: Colors.orangeAccent,
                ),
                Text(coins,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16)),
              ],
            ),
            SizedBox(height: isMobile ? 5 : 10),
            Text(
              day,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final String reward;
  final Color color;
  final bool isMobile;
  final IconData icon;
  final String imageUrl;

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.reward,
    required this.color,
    required this.isMobile,
    required this.icon,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    Icon(icon, color: color, size: isMobile ? 18 : 24),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
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
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
