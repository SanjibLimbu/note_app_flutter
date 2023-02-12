import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';
import 'package:note_app/models/note_data.dart';
import 'package:provider/provider.dart';

/////use controller on textformfield

class UpdateNote extends StatelessWidget {
  dynamic data;
  String boxKey;

  UpdateNote({
    super.key,
    required this.boxKey,
    required this.data,
  });
  final _formKey = GlobalKey<FormState>();

  late TextEditingController myTitleController =
      TextEditingController(text: data['title'].toString());
  late TextEditingController myNoteController =
      TextEditingController(text: data['note'].toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                      color: const Color(0xff6173ee),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     
                      Provider.of<NoteData>(context, listen: false).updateNote(
                        boxKey,
                        myTitleController.text,
                        myNoteController.text,
                   
                      );
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              //title
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: myTitleController,
                      cursorColor: Colors.black54,
                      style: textStyle.copyWith(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textCapitalization: TextCapitalization.sentences,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 156, 156, 157),
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0,
                            ),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                    //note
                    TextFormField(
                      controller: myNoteController,
                      cursorColor: Colors.black54,
                      style: textStyle.copyWith(
                        color: primaryColor,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: 'Write something',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 156, 156, 157),
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0,
                            ),
                          ),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
