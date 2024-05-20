//required String title, TitleHomePVDtitleHomePVD

import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';

// ignore: must_be_immutable
class PopUpMenuItem extends StatelessWidget {
  PopUpMenuItem(
      {super.key,
      required this.title,
      required this.index,
      required this.titleHomePVD,
      required this.titleRenameController});
  String title;
  final int index;
  final HomePVD titleHomePVD;
  final TextEditingController titleRenameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: GestureDetector(
            onTap: () {
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
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.edit_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Edit Name",
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: GestureDetector(
            onTap: () {
              print(index);
              titleHomePVD.deletePlan(constants[index]);
            },
            child: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Dele Plan",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
