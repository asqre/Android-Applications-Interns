import 'package:chatgpt/left_sidebar/button_widget.dart';
import 'package:flutter/material.dart';



class LeftSideBar extends StatelessWidget {
  const LeftSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 10),
            child: SizedBox(
              height: 50,
              child: OutlinedButton(
                  onPressed: () {
                    debugPrint('Reloading to open new chat');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(width: 0.3, color: Colors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          size: 17,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'New chat',
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 300,
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.3,
            height: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 0),
            child: ButtonWidget(
              icon: Icon(Icons.delete, size: 17),
              buttonName: 'Clear conversation',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 0),
            child: ButtonWidget(
              icon: Icon(Icons.person, size: 17),
              buttonName: 'Upgrade to Plus',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 0),
            child: ButtonWidget(
              icon: Icon(Icons.dark_mode, size: 17),
              buttonName: 'Dark mode',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 0),
            child: ButtonWidget(
              icon: Icon(
                Icons.browser_updated_outlined,
                size: 17,
              ),
              buttonName: 'Updates & FAQ',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 7, right: 7, bottom: 0),
            child: ButtonWidget(
              icon: Icon(
                Icons.logout,
                size: 17,
              ),
              buttonName: 'Log out',
            ),
          ),
        ],
      ),
    );
  }
}
