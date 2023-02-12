import 'package:flutter/material.dart';
import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/screens/update_note.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<NoteData>(context, listen: false).setFoundNotes();
    Provider.of<NoteData>(context, listen: false).firstCallValue();
    print(Provider.of<NoteData>(context, listen: false).foundNotes);
    super.initState();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Notes',
                style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: const Color(0xff6173ee)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (value) {
                  Provider.of<NoteData>(context, listen: false)
                      .changeSearchString(value.toLowerCase());
                },
                cursorColor: Colors.black54,
                style: textStyle.copyWith(
                  color: primaryColor,
                ),
                decoration: InputDecoration(
                  // border: InputBorder.none,

                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff6a6c6d),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  hintText: 'Search anything',
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 156, 156, 157),
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        4,
                      ),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
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
              )
            ],
          ),
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
