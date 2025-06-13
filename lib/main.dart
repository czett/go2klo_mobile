import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Beibehalten, falls benötigt

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'go2klo App', // Titel aktualisiert
      theme: ThemeData(
        // Den Hex-Wert #1776d6 in ein Color-Objekt umwandeln.
        // Der Präfix 0xFF ist notwendig, um einen 32-Bit ARGB-Wert darzustellen.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1776d6)),
        useMaterial3: true,
        fontFamily: "Gabarito", // Deine Schriftart Gabarito
      ),
      home: const MyHomePage(title: 'go2klo Home Page'), // Titel aktualisiert
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
  // Aktueller Index des ausgewählten Tabs für die NavigationBar
  int _selectedIndex = 0;

  // Eine Liste von Widgets (Seiten), die angezeigt werden, wenn ein Tab ausgewählt wird
  // Diese Seiten werden dynamisch basierend auf dem _selectedIndex angezeigt.
  List<Widget> _pages(BuildContext context) {
    // Ermittelt die Breite des Bildschirms, da sie in den Seiten-Widgets verwendet wird
    final screenWidth = MediaQuery.of(context).size.width;

    return <Widget>[
      // Seite 1: Home-Seite mit deinen Layout-Elementen
      SingleChildScrollView( // Ermöglicht das Scrollen, wenn der Inhalt zu lang ist
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "go2klo",
                      style: TextStyle(height: 1, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Profil Button geklickt!");
                      },
                      child: Icon(
                        Icons.account_circle, // Profil-Icon
                        size: 36,
                        color: Theme.of(context).colorScheme.primary, // Blaue Icon-Farbe aus dem Theme
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Karte (Platzhalter)
              SizedBox(
                width: screenWidth * 0.9,
                child: AspectRatio(
                  aspectRatio: 1.5, // Beispiel: 16:9 Verhältnis (Breite zu Höhe)
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF90CAF9), // Deine spezifische Farbe (Colors.blue.shade200)
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: const Center(
                      child: Text(
                        'Karte (Platzhalter)',
                        style: TextStyle(
                          color: Colors.white, // Farbe angepasst für besseren Kontrast
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Quick Actions von der Startseite
              SizedBox(
                width: screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Erste Schaltfläche: Toiletten bewerten
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 2.0, // Seitenverhältnis
                        child: InkWell( // Macht den Container klickbar
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Heller Hintergrund
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wc, // Toiletten-Icon
                                  size: 36,
                                  color: Theme.of(context).colorScheme.primary, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Toiletten bewerten',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary, // Blaue Textfarbe
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
                        aspectRatio: 2.0, // Seitenverhältnis
                        child: InkWell( // Macht den Container klickbar
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Heller Hintergrund
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on, // Standort-Icon
                                  size: 36,
                                  color: Theme.of(context).colorScheme.primary, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'In der Nähe finden',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary, // Blaue Textfarbe
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
              const SizedBox(height: 20),
              // Leadboard und Klo des Tages Sektionen
              SizedBox(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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
                              Icons.leaderboard, // Icon für Leaderboard
                              size: 36,
                              color: Colors.blue.shade600,
                            ),
                          ),
                          const SizedBox(width: 20), // Abstand zwischen Icon und Text
                          Expanded( // Expanded sorgt dafür, dass der Text den restlichen Platz einnimmt
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Leaderboard",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Miss dich mit anderen Nutzern.",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10), // Vertikaler Abstand
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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
                              Icons.event, // Icon für Klo des Tages
                              size: 36,
                              color: Colors.blue.shade600,
                            ),
                          ),
                          const SizedBox(width: 20), // Abstand zwischen Icon und Text
                          Expanded( // Expanded sorgt dafür, dass der Text den restlichen Platz einnimmt
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Klo des Tages",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Besuche die Toilette des Tages.",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Abstand am Ende der Liste
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Seite 2: Eine Beispielseite
      const Center(
        child: Text(
          'Suchen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      // Seite 3: Eine Beispielseite
      const Center(
        child: Text(
          'Hinzufügen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      // Seite 4: Eine Beispielseite
      const Center(
        child: Text(
          'Benachrichtigungen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      // Seite 5: Eine Beispielseite
      const Center(
        child: Text(
          'Profil Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }

  // Callback-Funktion, die aufgerufen wird, wenn ein Tab getippt wird
  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: _pages(context)[_selectedIndex], // Zeigt die aktuell ausgewählte Seite an
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 85,
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        child: NavigationBar(
          // indicatorShape: CircleBorder(),
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          surfaceTintColor: Colors.transparent,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_rounded),
              selectedIcon: Icon(Icons.add),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_stories_outlined),
              selectedIcon: Icon(Icons.auto_stories),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}