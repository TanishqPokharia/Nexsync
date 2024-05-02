import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController feedbackTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            child: TextField(
              controller: feedbackTextEditingController,
              maxLines: null,
              textAlign: TextAlign.start,
              expands: true,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "      Feedback",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.purple, blurRadius: 10)],
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Submit Feedback",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
