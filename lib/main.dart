import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Den Hex-Wert #1776d6 in ein Color-Objekt umwandeln.
        // Der Präfix 0xFF ist notwendig, um einen 32-Bit ARGB-Wert darzustellen.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1776d6)),
        useMaterial3: true,
        fontFamily: "Gabarito",
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Ermittelt die Breite des Bildschirms
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        // top bar with app name and profile logo btn
        child: Column(
          children: [
            const SizedBox(height: 50),
            SizedBox(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "go2klo",
                    style: TextStyle(height: 1, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {print("yo gurt");},
                    child: Icon(
                      Icons.account_circle, // Toiletten-Icon
                      size: 36,
                      color: Colors.blue.shade600, // Blaue Icon-Farbe
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            // map placehodler for now
            SizedBox(
              width: screenWidth * 0.9, // Auch diese Box ist 90% breit
              child: AspectRatio(
                aspectRatio: 1.5, // Beispiel: 16:9 Verhältnis (Breite zu Höhe)
                child: Container(
                  // 'const' zur BoxDecoration hinzugefügt, um den Hinweis zu beheben.
                  // Die Opazität wurde auf 0.8 erhöht, damit der BorderRadius besser sichtbar ist.
                  decoration: const BoxDecoration( // 'const' hinzugefügt
                    color: Color(0xFF90CAF9),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)), // BorderRadius auf Radius.circular(12.0) geändert
                  ),
                  child: const Center( // 'const' hinzugefügt
                    child: Text(
                      'Karte (Platzhalter)', // Text angepasst
                      style: TextStyle(
                        color: Colors.blue, // Textfarbe auf weiß geändert für besseren Kontrast
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // quick actions from start page
            SizedBox(
              width: screenWidth * 0.9, // Die Breite entspricht der vorherigen Boxen
              child: Row(
                // mainAxisAlignment.spaceBetween ist hier auch gut, um die Buttons zu verteilen
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Erste Schaltfläche: Toiletten bewerten
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 2.0, // Seitenverhältnis von 3.0 (Breite zu Höhe)
                      child: InkWell( // Macht den Container klickbar
                        onTap: () {
                          print('Toiletten bewerten geklickt!');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200, // Heller Hintergrund für die Schaltfläche
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wc, // Toiletten-Icon
                                size: 36,
                                color: Colors.blue.shade600, // Blaue Icon-Farbe
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Toiletten bewerten',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue.shade600, // Blaue Textfarbe
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Abstand zwischen den zwei Schaltflächen
                  // Zweite Schaltfläche: In der Nähe finden
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 2.0, // Seitenverhältnis von 3.0 (Breite zu Höhe)
                      child: InkWell( // Macht den Container klickbar
                        onTap: () {
                          print('In der Nähe finden geklickt!');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200, // Heller Hintergrund für die Schaltfläche
                            borderRadius: BorderRadius.all(Radius.circular(12.0))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on, // Standort-Icon
                                size: 36,
                                color: Colors.blue.shade600, // Blaue Icon-Farbe
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'In der Nähe finden',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue.shade600, // Blaue Textfarbe
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth * 0.9, // Die Breite wird hier festgelegt
              // Optional: color: Colors.amber, // Für Debugging, um die Größe zu sehen
              child: Column( // Die Column ist jetzt der Child des Containers
                // Kinder der Column hier
                children: [
                  Row(
                    children: [
                      Text(
                        "Entdecke go2klo!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200, // Heller Hintergrund für die Schaltfläche
                                borderRadius: BorderRadius.all(Radius.circular(12.0))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.leaderboard, // Standort-Icon
                                      size: 36,
                                      color: Colors.blue.shade600, // Blaue Icon-Farbe
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Leaderboard",
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Miss dich mit anderen Nutzern.",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )
                                      ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200, // Heller Hintergrund für die Schaltfläche
                                borderRadius: BorderRadius.all(Radius.circular(12.0))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.event, // Standort-Icon
                                      size: 36,
                                      color: Colors.blue.shade600, // Blaue Icon-Farbe
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Klo des Tages",
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Besuche die Toilette des Tages.",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )
                                      ]
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                          ]
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Main-Funktion zum Ausführen der App (falls nicht bereits vorhanden)
void main() {
  runApp(const MyApp());
}