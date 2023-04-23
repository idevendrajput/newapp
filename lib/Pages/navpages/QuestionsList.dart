import 'package:flutter/material.dart';

class QuestionsList extends StatelessWidget {
  final List<Map<String, String>> questionsAndAnswers;

  QuestionsList({required this.questionsAndAnswers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questionsAndAnswers.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              title: Text(
                questionsAndAnswers[index]['question']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    questionsAndAnswers[index]['answer']!,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}