import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Видатні футболісти',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      home: const Lab10Page(),
    );
  }
}

// Модель
class Footballer {
  final String name;
  final String description;
  final String imagePath;

  Footballer({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class Lab10Page extends StatefulWidget {
  const Lab10Page({super.key});

  @override
  State<Lab10Page> createState() => _Lab10PageState();
}

class _Lab10PageState extends State<Lab10Page> {
  Footballer? _selectedFootballer;

  final List<Footballer> footballers = [
    Footballer(
      name: "Андрій Шевченко",
      description: "Легенда українського футболу, володар «Золотого м'яча» 2004 року. Грав за «Динамо» (Київ), «Мілан» та «Челсі». Один з найрезультативніших бомбардирів в історії єврокубків.",
      imagePath: "images/shevchenko.jpg",
    ),
    Footballer(
      name: "Ліонель Мессі",
      description: "Аргентинський футболіст, один з найкращих гравців усіх часів. Багаторазовий володар «Золотого м'яча», чемпіон світу 2022. Легенда «Барселони».",
      imagePath: "images/messi.jpg",
    ),
    Footballer(
      name: "Кріштіану Роналду",
      description: "Португальський нападник, відомий своїми фізичними даними та рекордною кількістю голів. П'ятиразовий володар «Золотого м'яча», чемпіон Європи 2016.",
      imagePath: "images/ronaldo.jpg",
    ),
    Footballer(
      name: "Дієго Марадона",
      description: "Аргентинський футболіст, визнаний одним з найкращих в історії. Привів Аргентину до перемоги на ЧС-1986. Відомий своїм «голом століття» та «рукою Бога».",
      imagePath: "images/maradona.jpg",
    ),
    Footballer(
      name: "Пеле",
      description: "Бразильський «Король футболу», єдиний футболіст, який тричі ставав чемпіоном світу як гравець. Забив понад 1000 голів за кар'єру.",
      imagePath: "images/pele.jpg",
    ),
    Footballer(
      name: "Зінедін Зідан",
      description: "Французький півзахисник, чемпіон світу та Європи. Відомий своєю елегантною технікою та баченням поля. Нині успішний тренер.",
      imagePath: "images/zidane.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Легенди Футболу",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          // список
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              itemCount: footballers.length,
              itemBuilder: (context, index) {
                final item = footballers[index];
                final isSelected = _selectedFootballer == item;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: isSelected ? 6 : 2,
                  shadowColor: isSelected ? Colors.amber.withOpacity(0.4) : Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: isSelected 
                        ? const BorderSide(color: const Color.fromARGB(255, 119, 70, 174), width: 2) // фіолетова рамка
                        : BorderSide.none,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() {
                        _selectedFootballer = item;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'avatar_${item.name}',
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected ? const Color.fromARGB(255, 119, 70, 174) : Colors.indigo.shade100,
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage: AssetImage(item.imagePath),
                                onBackgroundImageError: (_, __) {},
                                child: null,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Текст
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? Colors.indigo[900] : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isSelected ? "Обрано" : "Детальніше...",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                    color: isSelected ? const Color.fromARGB(255, 119, 70, 174) : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Стрілочка / Галочка
                          Icon(
                            isSelected ? Icons.done : Icons.arrow_forward_ios_rounded,
                            color: isSelected ? const Color.fromARGB(255, 119, 70, 174) : Colors.grey[300],
                            size: isSelected ? 28 : 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Детальний опис
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastOutSlowIn,
            height: _selectedFootballer != null ? 320 : 0, 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.2),
                  blurRadius: 25,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: _selectedFootballer == null
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Декоративна смужка
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 8),
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Велике фото
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 12,
                                      offset: const Offset(2, 6),
                                    ),
                                  ],
                                  border: Border.all(color: Colors.white, width: 3),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset(
                                    _selectedFootballer!.imagePath,
                                    width: 130,
                                    height: 190,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 130,
                                        height: 190,
                                        color: Colors.grey[200],
                                        child: const Icon(Icons.sports_soccer, size: 50, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 22),
                              
                              // Опис
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _selectedFootballer!.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.indigo[900], // Темний заголовок
                                        height: 1.1,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 2,
                                      width: 40,
                                      color: const Color.fromARGB(255, 119, 70, 174),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      _selectedFootballer!.description,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey[800],
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}