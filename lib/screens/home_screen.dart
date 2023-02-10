import 'package:flutter/material.dart';
import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/widget/field.dart';
import 'package:provider/provider.dart';

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
              child: Consumer<NoteData>(
                builder: (context, noteData, child) {
                  return ListView.builder(
                    itemCount: noteData.noteCount,
                    itemBuilder: ((context, index) {
                      return noteData.noteCount != 0
                          ? Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(
                                            noteData.getNotes[index]['title']),
                                        subtitle:
                                            const Text('6 Aug 2020,07:48 PM'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          bottom: 16,
                                        ),
                                        child: Text(
                                          noteData.getNotes[index]['note'],
                                          textAlign: TextAlign.left,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const Text('Empty hehe');
                    }),
                  );
                },
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
