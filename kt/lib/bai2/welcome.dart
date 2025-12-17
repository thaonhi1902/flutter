import 'package:flutter/material.dart';

class Manhinhdidong extends StatelessWidget {
  const Manhinhdidong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.notifications_none, size: 26),
          SizedBox(width: 10),
          Icon(Icons.settings_outlined, size: 26),
          SizedBox(width: 10),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome,",
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Charlie",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),


              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, color: Colors.blue),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              const Text(
                "Saved Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),


              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                  children: [
                    buildPlaceCard('assets/japan.jpg', " "),
                    buildPlaceCard('assets/barcelona.jpg', " "),
                    buildPlaceCard('assets/budapest.jpg', " "),
                    buildPlaceCard('assets/rome.jpg', " "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPlaceCard(String assetPath, String title) {
    return GestureDetector(
      onTap: () {}, 
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black26,
            ),
          ),

          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}