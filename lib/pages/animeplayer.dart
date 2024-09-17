import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;

  const Player({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Anitube'),
        elevation: 50,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Image.network(
                image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
            Center(
              child: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
