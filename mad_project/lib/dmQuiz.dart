import 'package:flutter/material.dart';

class MCQScreenDM extends StatefulWidget {
  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreenDM> {
  final List<Map<String, dynamic>> mcqList = [
    {
      'question': 'What is Data Mining?',
      'options': [
        'A process of extracting useful patterns from large data sets',
        'Creating a database for storing data',
        'A type of programming language',
        'An algorithm for sorting data'
      ],
      'answer': 'A process of extracting useful patterns from large data sets',
    },
    {
      'question': 'Which programming language is commonly used in Data Mining?',
      'options': ['Python', 'HTML', 'CSS', 'JavaScript'],
      'answer': 'Python',
    },
    {
      'question': 'What is "Clustering" in data mining?',
      'options': [
        'Grouping similar data points into clusters',
        'A technique for enhancing data privacy',
        'Deleting unwanted data',
        'Compressing data'
      ],
      'answer': 'Grouping similar data points into clusters',
    },
    {
      'question':
          'Which data mining technique is used to predict future outcomes?',
      'options': ['Classification', 'Prediction', 'Association', 'Clustering'],
      'answer': 'Prediction',
    },
    {
      'question': 'What does "KDD" stand for in data mining?',
      'options': [
        'Knowledge Discovery in Databases',
        'Knowledge Development and Design',
        'Key Data Detection',
        'Kernel Data Division'
      ],
      'answer': 'Knowledge Discovery in Databases',
    },
    {
      'question': 'What is "Classification" in data mining?',
      'options': [
        'Organizing data into predefined groups',
        'Collecting data from multiple sources',
        'Randomly sampling data',
        'Improving data quality'
      ],
      'answer': 'Organizing data into predefined groups',
    },
    {
      'question': 'Which of the following is an example of data mining?',
      'options': [
        'Predicting customer purchases based on previous transactions',
        'Creating a spreadsheet',
        'Building a website',
        'Writing an email'
      ],
      'answer': 'Predicting customer purchases based on previous transactions',
    },
    {
      'question': 'What is a "Decision Tree"?',
      'options': [
        'A tool used to map out decisions and their possible consequences',
        'A tool to calculate data size',
        'A storage device',
        'A type of clustering technique'
      ],
      'answer':
          'A tool used to map out decisions and their possible consequences',
    },
    {
      'question': 'What is "Association Rule Mining"?',
      'options': [
        'Finding relationships between variables in large data sets',
        'Sorting data in ascending order',
        'Building decision trees',
        'Organizing data by clusters'
      ],
      'answer': 'Finding relationships between variables in large data sets',
    },
    {
      'question': 'What is "Data Preprocessing"?',
      'options': [
        'Preparing raw data for further analysis',
        'Extracting data from other databases',
        'Creating charts and graphs',
        'Designing user interfaces'
      ],
      'answer': 'Preparing raw data for further analysis',
    },
    {
      'question':
          'Which technique is used to reduce the dimensionality of data?',
      'options': [
        'PCA (Principal Component Analysis)',
        'Clustering',
        'Regression',
        'Association'
      ],
      'answer': 'PCA (Principal Component Analysis)',
    },
    {
      'question': 'What is the purpose of data mining in business?',
      'options': [
        'To discover hidden patterns for informed decision-making',
        'To replace database administrators',
        'To store data in the cloud',
        'To create web applications'
      ],
      'answer': 'To discover hidden patterns for informed decision-making',
    },
    {
      'question':
          'Which algorithm is often used for classification tasks in data mining?',
      'options': ['Decision Tree', 'K-means', 'Apriori', 'PCA'],
      'answer': 'Decision Tree',
    },
    {
      'question': 'What is "Anomaly Detection" in data mining?',
      'options': [
        'Identifying unusual data patterns or outliers',
        'Calculating data averages',
        'Classifying data into clusters',
        'Filtering irrelevant data'
      ],
      'answer': 'Identifying unusual data patterns or outliers',
    },
    {
      'question': 'What is a data warehouse in the context of data mining?',
      'options': [
        'A large database used for storing and managing data for analysis',
        'A physical location for storing hard drives',
        'A type of computer',
        'A programming tool for mining data'
      ],
      'answer':
          'A large database used for storing and managing data for analysis',
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
                    "Data Mining Quiz",
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
