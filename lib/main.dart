import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // seedColor: const Color.fromARGB(255, 28, 142, 255),
          brightness: Brightness.light,
        ),
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

      // HOME PAGE FOLLOWS

      SingleChildScrollView(
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
                        Icons.account_circle,
                        size: 36,
                        color: Theme.of(context).colorScheme.primary,
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
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Karte (Platzhalter)',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface, // Farbe angepasst für besseren Kontrast
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
                              color: Theme.of(context).colorScheme.surface, // Heller Hintergrund
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wc, // Toiletten-Icon
                                  size: 36,
                                  color: Colors.blue, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Toiletten bewerten',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue, // Blaue Textfarbe
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
                              color: Theme.of(context).colorScheme.surface, // Heller Hintergrund
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on, // Standort-Icon
                                  size: 36,
                                  color: Colors.blue, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'In der Nähe finden',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.blue, // Blaue Textfarbe
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
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Icon(
                              Icons.leaderboard, // Icon für Leaderboard
                              size: 36,
                              color: Colors.blue,
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
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Icon(
                              Icons.event, // Icon für Klo des Tages
                              size: 36,
                              color: Colors.blue,
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
      const Center(
        child: Text(
          'Suchen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      const Center(
        child: Text(
          'Hinzufügen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      const Center(
        child: Text(
          'Benachrichtigungen Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      const Center(
        child: Text(
          'Profil Seite (Platzhalter)',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: _pages(context)[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 85,
          indicatorColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: NavigationBar(
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