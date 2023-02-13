import 'package:flutter/material.dart';
import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/models/note_data.dart';
import 'package:note_app/screens/note_list.dart';

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
              const NoteList()
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
