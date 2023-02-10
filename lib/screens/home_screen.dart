import 'package:flutter/material.dart';
import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/widget/field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'My Notes',
              style: textStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextFieldCustom(),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Column(
                          children: const [
                            ListTile(
                              title: Text('Summer Vacation'),
                              subtitle: Text('6 Aug 2020,07:48 PM'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 16,
                              ),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      index != 10 - 1
                          ? const SizedBox(
                              height: 20,
                            )
                          : const SizedBox(),
                    ],
                  );
                }),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6173ee),
        onPressed: () {
          Navigator.pushNamed(context, 'add_note');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
