import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Color(0xFFE8B3E5),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF7e0c73)),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Color(0xFF7e0c73).withOpacity(0.6)),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.quiz, color: Color(0xFF7e0c73).withOpacity(0.6)),
                title: Text('Quiz'),
                onTap: () {
                  Navigator.pushNamed(context, "/QuizScreen");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Color(0xFF7e0c73).withOpacity(0.6)),
                title: Text('Setting'),
                onTap: () {
                  Navigator.pushNamed(context, "/SettingsScreen");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.people, color: Color(0xFF7e0c73).withOpacity(0.6)),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushNamed(context, "/ProfileScreen");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFE8B3E5),
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Choose Your Quiz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7e0c73),
              ),
            ),
            SizedBox(height: 30),
            QuizButton(
              title: "MAD Quiz",
              icon: Icons.mobile_friendly,
              onTap: () {
                Navigator.pushNamed(context, "/MADquiz");
              },
            ),
            SizedBox(height: 20),
            QuizButton(
              title: "Data Mining Quiz",
              icon: Icons.data_usage,
              onTap: () {
                Navigator.pushNamed(context, "/dmQuiz");
              },
            ),
            SizedBox(height: 20),
            QuizButton(
              title: "AI Quiz",
              icon: Icons.memory,
              onTap: () {
                Navigator.pushNamed(context, "/AIquiz");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuizButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  QuizButton({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF7e0c73),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
