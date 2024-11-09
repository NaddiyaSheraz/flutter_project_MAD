import 'package:flutter/material.dart';

class MCQScreenMAD extends StatefulWidget {
  @override
  _MCQScreenMADState createState() => _MCQScreenMADState();
}

class _MCQScreenMADState extends State<MCQScreenMAD> {
  final List<Map<String, dynamic>> mcqList = [
    {
      'question': 'What is Flutter?',
      'options': [
        'A programming language',
        'A framework',
        'An IDE',
        'A plugin'
      ],
      'answer': 'A framework',
    },
    {
      'question': 'What is Dart?',
      'options': [
        'A programming language',
        'A framework',
        'An IDE',
        'A database'
      ],
      'answer': 'A programming language',
    },
    {
      'question': 'Which company developed Flutter?',
      'options': ['Microsoft', 'Google', 'Apple', 'Facebook'],
      'answer': 'Google',
    },
    {
      'question': 'Which widget is used for layout in Flutter?',
      'options': ['Column', 'Button', 'Slider', 'Checkbox'],
      'answer': 'Column',
    },
    {
      'question': 'What is the file extension for Dart files?',
      'options': ['.java', '.dart', '.swift', '.js'],
      'answer': '.dart',
    },
    {
      'question': 'Which widget is used to capture user touch interactions?',
      'options': ['GestureDetector', 'Container', 'Column', 'Text'],
      'answer': 'GestureDetector',
    },
    {
      'question': 'What does the Navigator widget do in Flutter?',
      'options': [
        'Manage routing and navigation',
        'Add animations',
        'Provide styling',
        'Connect to a database'
      ],
      'answer': 'Manage routing and navigation',
    },
    {
      'question':
          'Which layout widget allows stacking of elements on top of each other?',
      'options': ['Stack', 'Row', 'Column', 'GridView'],
      'answer': 'Stack',
    },
    {
      'question': 'What is the purpose of a Scaffold widget in Flutter?',
      'options': [
        'Define the app’s basic structure',
        'Apply animations',
        'Optimize performance',
        'Connect to a server'
      ],
      'answer': 'Define the app’s basic structure',
    },
    {
      'question':
          'Which widget displays a scrollable list of items in Flutter?',
      'options': ['ListView', 'Column', 'Container', 'GridView'],
      'answer': 'ListView',
    },
    {
      'question': 'How do you create a new Flutter project?',
      'options': [
        'Using the flutter create command',
        'Using the new project command in Dart',
        'Using the Flutter IDE',
        'By downloading from GitHub'
      ],
      'answer': 'Using the flutter create command',
    },
  ];

  // Add more questions here as needed

  Map<int, String> selectedAnswers = {}; // Stores selected answers
  Map<int, String> results = {}; // Stores results for each question
  int score = 0; // Track the score

  void _submitAnswers() {
    setState(() {
      score = 0;
      results.clear();
      for (int i = 0; i < mcqList.length; i++) {
        if (selectedAnswers[i] == mcqList[i]['answer']) {
          results[i] = "Correct!";
          score++;
        } else {
          results[i] = "Incorrect! Correct answer: ${mcqList[i]['answer']}";
        }
      }
    });
    _showScoreDialog();
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed!'),
          content: Text('Your score: $score / ${mcqList.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7e0c73), Color(0xFFc94b4b)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Custom header with title
            // Padding(
            //   padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            //   child: Text(
            //     "Mobile App Development Quiz",
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "Mobile App Development Quiz",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mcqList.length,
                itemBuilder: (context, index) {
                  final mcq = mcqList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${mcq['question']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...mcq['options'].map<Widget>((option) {
                            return ListTile(
                              title: Text(option),
                              leading: Radio<String>(
                                value: option,
                                groupValue: selectedAnswers[index],
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswers[index] = value!;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                          if (results[index] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                results[index]!,
                                style: TextStyle(
                                  color: results[index]!.startsWith("Correct")
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Submit Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: _submitAnswers,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF7e0c73),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Submit Answers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
