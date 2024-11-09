import 'package:flutter/material.dart';

class MCQScreenAI extends StatefulWidget {
  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreenAI> {
  final List<Map<String, dynamic>> mcqList = [
    {
      'question': 'What is Artificial Intelligence?',
      'options': [
        'A type of programming language',
        'A branch of computer science focusing on creating smart machines',
        'A type of hardware',
        'An algorithm for mobile apps'
      ],
      'answer':
          'A branch of computer science focusing on creating smart machines',
    },
    {
      'question':
          'Which programming language is widely used for AI development?',
      'options': ['Python', 'JavaScript', 'HTML', 'CSS'],
      'answer': 'Python',
    },
    {
      'question': 'What does "ML" stand for in AI?',
      'options': [
        'Machine Learning',
        'Multiple Layers',
        'Mathematical Logic',
        'Mechanical Learning'
      ],
      'answer': 'Machine Learning',
    },
    {
      'question': 'Which AI concept allows a machine to learn from past data?',
      'options': [
        'Deep Learning',
        'Reinforcement Learning',
        'Machine Learning',
        'Computer Vision'
      ],
      'answer': 'Machine Learning',
    },
    {
      'question': 'What is a neural network?',
      'options': [
        'A network used for internet connections',
        'A hardware used in AI',
        'A series of algorithms that mimic the human brain',
        'A framework for developing AI software'
      ],
      'answer': 'A series of algorithms that mimic the human brain',
    },
    {
      'question':
          'Which type of AI can perform a specific task better than humans?',
      'options': ['Strong AI', 'Weak AI', 'General AI', 'Reactive AI'],
      'answer': 'Weak AI',
    },
    {
      'question': 'What is deep learning?',
      'options': [
        'A form of machine learning involving multiple layers of algorithms',
        'A hardware tool for AI',
        'An AI technique for defining software architecture',
        'An AI programming language'
      ],
      'answer':
          'A form of machine learning involving multiple layers of algorithms',
    },
    {
      'question': 'Which AI model is used for generating text and images?',
      'options': ['GANs', 'CNNs', 'RNNs', 'SVMs'],
      'answer': 'GANs',
    },
    {
      'question': 'What does NLP stand for in AI?',
      'options': [
        'Natural Language Processing',
        'Neural Learning Processing',
        'Network Level Programming',
        'None of the above'
      ],
      'answer': 'Natural Language Processing',
    },
    {
      'question': 'What is the purpose of reinforcement learning in AI?',
      'options': [
        'To learn from labeled data',
        'To make decisions based on rewards and punishments',
        'To analyze large data sets',
        'To recognize patterns in images'
      ],
      'answer': 'To make decisions based on rewards and punishments',
    },
    {
      'question': 'Which algorithm is commonly used for classification tasks?',
      'options': [
        'Linear Regression',
        'Decision Tree',
        'Random Forest',
        'Both Decision Tree and Random Forest'
      ],
      'answer': 'Both Decision Tree and Random Forest',
    },
    {
      'question':
          'Which component of AI involves pattern recognition in images?',
      'options': [
        'Computer Vision',
        'Machine Learning',
        'Natural Language Processing',
        'Data Science'
      ],
      'answer': 'Computer Vision',
    },
    {
      'question':
          'Which concept involves AI systems improving on their own through experience?',
      'options': [
        'Supervised Learning',
        'Unsupervised Learning',
        'Reinforcement Learning',
        'Autonomous Learning'
      ],
      'answer': 'Reinforcement Learning',
    },
    {
      'question':
          'Which term describes the ability of a machine to simulate human conversation?',
      'options': [
        'Voice Recognition',
        'Chatbot',
        'Speech-to-Text',
        'Language Translation'
      ],
      'answer': 'Chatbot',
    },
    {
      'question': 'What is a common application of AI in healthcare?',
      'options': [
        'Smart TVs',
        'Image analysis for diagnostics',
        'Voice recognition in call centers',
        'Real-time multiplayer gaming'
      ],
      'answer': 'Image analysis for diagnostics',
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
                    "Artificial Intelligence Quiz",
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
