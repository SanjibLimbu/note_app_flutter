import 'package:flutter/material.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/screens/update_note.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Consumer<NoteData>(
        builder: (context, noteData, child) {
          if (noteData.foundNotes.isEmpty) {
            return Center(
              child: Image.asset('assets/images/Empty-bro.png'),
            );
          } else {
            return ListView.builder(
              itemCount: noteData.foundNotes.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        noteData.deleteNote(
                            noteData.foundNotes[index]['key']);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateNote(
                                boxKey: noteData.foundNotes[index]
                                    ['key'],
                                data: noteData.foundNotes[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                                contentPadding:
                                    const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 16,
                                ),
                                title: Text(
                                  noteData.foundNotes[index]
                                              ['title'] ==
                                          ''
                                      ? 'New Note'
                                      : noteData.foundNotes[index]
                                          ['title'],
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                subtitle: Text(
                                  noteData.foundNotes[index]
                                          ['date'] ??
                                      "No date",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  bottom: 10,
                                ),
                                child: Text(
                                  noteData.foundNotes[index]
                                              ['note'] ==
                                          ''
                                      ? 'No addtional text'
                                      : noteData.foundNotes[index]
                                          ['note'],
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    noteData.foundNotes.length == index + 1
                        ? const SizedBox(
                            height: 20,
                          )
                        : const SizedBox(
                            height: 10,
                          )
                  ],
                );
              }),
            );
          }
        },
      ),
    );
  }
}
