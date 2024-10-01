import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildBalanceSection(),
          _buildActionButtons(),
          _buildMenuItems(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade400, Colors.orange.shade300],
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
                backgroundImage: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.366icons.com%2Fmedia%2F01%2Fprofile-avatar-account-icon-16699.png&f=1&nofb=1&ipt=d32cd3665c36e518cb67ad59b645ffd3c73c005fe7dbc47f4292bfae4ff03b7d&ipo=images'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Manish Dahiya',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Code: 1BYCQO',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Copy',
                          style: TextStyle(fontSize: 12, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('LV5',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 5),
                      const Text('0',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Text('Today',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          color: Colors.amber, size: 20),
                      const SizedBox(width: 5),
                      const Text('60',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Text('Balance',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('MY BALANCE',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const Text('TOTAL',
                          style: TextStyle(fontSize: 12, color: Colors.orange)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('₹ 25',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Text('₹ 25',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Withdraw >'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 30),
                    ),
                  ),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(Icons.people, Colors.purple, 'Invite Friends'),
          _buildActionButton(Icons.history, Colors.orange, 'Income History'),
          _buildActionButton(Icons.emoji_events, Colors.blue, 'Ranking List'),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        _buildMenuItem(Icons.message, 'Message', hasNotification: true),
        _buildMenuItem(Icons.help_outline, 'FAQs'),
        _buildMenuItem(Icons.feedback_outlined, 'Feedback'),
        _buildMenuItem(Icons.settings, 'Settings'),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label,
      {bool hasNotification = false}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: hasNotification
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text('10',
                  style: TextStyle(color: Colors.white, fontSize: 10)),
            )
          : const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
