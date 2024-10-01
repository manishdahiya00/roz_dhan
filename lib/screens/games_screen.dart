import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryRow(),
              SizedBox(height: 16),
              Text(
                'Games You Might Like',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GameGrid(itemCount: 8),
              SizedBox(height: 16),
              Text(
                'Mostly Played Games',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GameGrid(itemCount: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryIcon(title: 'Lucky Draw', icon: Icons.casino),
        CategoryIcon(title: 'Fantasy Tips', icon: Icons.tips_and_updates),
        CategoryIcon(title: 'New Games', icon: Icons.new_releases),
        CategoryIcon(title: 'Play Quiz', icon: Icons.quiz),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 40, color: Colors.orange.shade800),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class GameGrid extends StatelessWidget {
  final int itemCount;

  const GameGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 0.6,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GameTile(
          image: 'assets/images/game.png',
          title: 'Game ${index + 1}',
        );
      },
    );
  }
}

class GameTile extends StatelessWidget {
  final String image;
  final String title;

  const GameTile({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageSize = constraints.maxWidth - 4; // Subtracting padding
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  image,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 2),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: double.infinity,
                height: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Play', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
