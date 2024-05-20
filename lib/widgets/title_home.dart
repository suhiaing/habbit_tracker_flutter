import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/home_provider/title_provider_home.dart';
import 'package:habbit_tracker_flutter/widgets/popupmenu_item_home.dart';
import 'package:popover/popover.dart';
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
      child: Consumer<HomePVD>(builder: ((context, homePVD, _) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              IconButton(
                  alignment: Alignment.bottomLeft,
                  onPressed: () {
                    final titleRenameController = TextEditingController();
                    showPopover(
                      barrierColor: Colors.transparent,
                      transitionDuration: const Duration(milliseconds: 100),
                      width: 120,
                      height: 100,
                      direction: PopoverDirection.right,
                      context: context,
                      bodyBuilder: ((context) {
                        return PopUpMenuItem(
                          title: widget.title,
                          index: widget.index,
                          titleHomePVD: homePVD,
                          titleRenameController: titleRenameController,
                        );
                      }),
                    );
                  },
                  icon: const Icon(Icons.more_vert_outlined))
            ],
          ),
        );
      })),
    );
  }
}
