import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';

// ignore: must_be_immutable
class TitleHome extends StatelessWidget {
  TitleHome(
      {super.key,
      required this.title,
      required this.index,
      required this.titleHomePVD});

  String title;
  final int index;
  final TitleHomePVD titleHomePVD;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 255,
          child: Center(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              final titleRenameController = TextEditingController();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Wanna rename $title ?'),
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
                                  titleRenameController.text, index);
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  showCloseIcon: true,
                                  content: Text(
                                    'Enter the name please',
                                  ),
                                  duration: Duration(milliseconds: 1000),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
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
            icon: const Icon(Icons.edit))
      ],
    ));
  }
}
