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
      home: const MyHomePage(title: 'go2klo Home Page'),
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

  // Liste der Titel für jede Seite
  final List<String> _pageTitles = const [
    "go2klo",
    "Explore",
    "Rate",
    "Blog",
    "Profile",
  ];

  // Eine Liste von Widgets (Seiten), die angezeigt werden, wenn ein Tab ausgewählt wird
  // Diese Seiten werden dynamisch basierend auf dem _selectedIndex angezeigt.
  List<Widget> _pages(BuildContext context) {
    // Ermittelt die Breite des Bildschirms, da sie in den Seiten-Widgets verwendet wird
    final screenWidth = MediaQuery.of(context).size.width;

    return <Widget>[
  
      // HOME PAGE FOLLOWS

      SingleChildScrollView( // Ermöglicht das Scrollen, wenn der Inhalt zu lang ist
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20), // Abstand nach oben zum Inhalt nach der AppBar
              // Karte (Platzhalter)
              SizedBox(
                width: screenWidth * 0.9,
                child: AspectRatio(
                  aspectRatio: 1.5, // Beispiel: 16:9 Verhältnis (Breite zu Höhe)
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer, // Deine spezifische Farbe (Colors.blue.shade200)
                      // color: Theme.of(context).colorScheme.primaryContainer, // Deine spezifische Farbe (Colors.blue.shade200)
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Karte (Platzhalter)',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryContainer, // Farbe angepasst für besseren Kontrast
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
                              _selectedIndex = 2; // Geht zur "Hinzufügen"-Seite
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
                                  color: Theme.of(context).colorScheme.primary, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Rate toilets",
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
                              _selectedIndex = 1; // Geht zur "Suchen"-Seite
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
                                  color: Theme.of(context).colorScheme.primary, // Blaue Icon-Farbe
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Find nearby",
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
              // Leaderboard und Klo des Tages Sektionen
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
                                  "Compete against other users!",
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
                          Expanded( // Expanded sorgt dafür dafür, dass der Text den restlichen Platz einnimmt
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Toilet of the day",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Visit the toilet of the day.",
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

      // EXPLORE PAGE FOLLOWS
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            width: screenWidth * 0.9,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        hintText: "Enter a search term",
                    
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      print("yo gurt");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.transparent),
                      )
                    ),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      // Seite 3: Hinzufügen Seite (Platzhalter)
      const Center(
        child: Text(
          'Hier kommt die Hinzufügen-Seite hin!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      // Seite 4: Benachrichtigungen Seite (Platzhalter)
      const Center(
        child: Text(
          'Hier kommen die Benachrichtigungen hin!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      // Seite 5: Profil Seite (Platzhalter)
      const Center(
        child: Text(
          'Hier kommt dein Profil hin!',
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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer, // Hintergrundfarbe des Scaffolds
      // --- AppBar für die Top-Leiste mit dynamischem Titel ---
      appBar: AppBar(
        // title: Text(widget.title), // Dies ist der feste Titel aus MyHomePage
        // Dynamischer Titel basierend auf dem ausgewählten Tab
        title: Text(
          _pageTitles[_selectedIndex],
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface, // Farbe des Textes
          ),
        ),
        // Optional: Hintergrundfarbe der AppBar
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer, // Hintergrundfarbe der AppBar
        elevation: 0.0, // Schatten unter der AppBar
        // Aktionen für die AppBar (z.B. Profil-Button)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Abstand rechts vom Button
            child: ElevatedButton(
              onPressed: () {
                print("Profil Button geklickt in AppBar!");
                setState(() {
                  _selectedIndex = 4; // Zum Profil-Tab wechseln
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), // Runde Form für den Button
                padding: EdgeInsets.zero, // Kein internes Padding für den Button
                backgroundColor: Colors.transparent, // Transparenter Hintergrund
                shadowColor: Colors.transparent, // Kein Schatten
                foregroundColor: Theme.of(context).colorScheme.primary, // Icon-Farbe
              ),
              child: Icon(
                Icons.account_circle, // Profil-Icon
                size: 36,
              ),
            ),
          )
        ],
        // Wenn du den "go2klo" Text am linken Rand statt zentriert haben möchtest:
        // centerTitle: false,
      ),
      body: _pages(context)[_selectedIndex], // Zeigt die aktuell ausgewählte Seite an
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 85, // Standardhöhe kann hier belassen oder angepasst werden
          indicatorColor: Colors.transparent, // Indikator unsichtbar, da wir ihn selbst zeichnen
          backgroundColor: Theme.of(context).colorScheme.surface, // Hintergrund der Navigationsleiste
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex, // Der aktuell ausgewählte Tab
          onDestinationSelected: _onDestinationSelected, // Callback für Tab-Taps
          surfaceTintColor: Colors.transparent, // Entfernt den Standard-Surface-Tint
          elevation: 8.0, // Schatten für die Bottom Bar
          // --- Hier sind die Destinationen, die die Icons enthalten ---
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant), // Nicht ausgewählt
              selectedIcon: Icon(Icons.home, color: Theme.of(context).colorScheme.primary), // Ausgewählt
              label: '', // Leeres Label
            ),
            NavigationDestination(
              icon: Icon(Icons.map_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant),
              selectedIcon: Icon(Icons.map, color: Theme.of(context).colorScheme.primary),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_rounded, color: Theme.of(context).colorScheme.onSurfaceVariant),
              selectedIcon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_stories_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant),
              selectedIcon: Icon(Icons.auto_stories, color: Theme.of(context).colorScheme.primary),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant),
              selectedIcon: Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
