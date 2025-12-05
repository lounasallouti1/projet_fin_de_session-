import 'package:flutter/material.dart';
import '../models/animal.dart';

class DetailsPage extends StatefulWidget {
  final String categoryTitle;
  final String categoryDescription;
  final List<Animal> animals;

  const DetailsPage({
    super.key,
    required this.categoryTitle,
    required this.categoryDescription,
    required this.animals,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.80);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = widget.animals[_index];

    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.categoryTitle,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          SizedBox(
            height: 220,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.animals.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final animal = widget.animals[i];
                final active = i == _index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: active ? 10 : 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFD3A5), Color(0xFFFFA26B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        color: Colors.black26,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      animal.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.animals.length,
              (i) => Container(
                width: i == _index ? 20 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                decoration: BoxDecoration(
                  color: i == _index ? Colors.orange : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.categoryTitle,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      widget.categoryDescription,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text(
                      "Habitat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(current.habitat),

                    const SizedBox(height: 20),
                    const Text(
                      "Alimentation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(current.diet),

                    const SizedBox(height: 20),
                    const Text(
                      "À savoir",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(current.funFact),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
