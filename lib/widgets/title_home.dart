import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TitleHome extends StatefulWidget {
  TitleHome({
    super.key,
    required this.title,
    required this.index,
  });

  String title;
  final int index;

  @override
  State<TitleHome> createState() => _TitleHomeState();
}

class _TitleHomeState extends State<TitleHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<TitleHomePVD>(builder: ((context, titleHomePVD, _) {
        return GestureDetector(
          onDoubleTap: () {
            final titleRenameController = TextEditingController();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Wanna rename ${widget.title} ?'),
                    content: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: titleRenameController,
                        decoration: InputDecoration(
                          hintText: 'Enter a new plan name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (titleRenameController.text != "") {
                            titleHomePVD.rename(
                                titleRenameController.text, widget.index);
                            Navigator.pop(context);
                            setState(() {
                              widget.title = titleRenameController.text;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Enter the name please',
                                ),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );
                          }
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 23,
              ),
            ),
          ),
        );
      })),
    );
  }
}
