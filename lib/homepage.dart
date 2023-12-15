import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudbasic/firebase/function.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final firebase firestoreService = firebase();

  final TextEditingController textController = TextEditingController();

  void opendialog(String? docID) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      if (docID == null) {
                        firestoreService.addNote(textController.text);
                      } else {
                        firestoreService.updateNote(docID, textController.text);
                      }
                      textController.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Add'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('C R U D')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => opendialog(null),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: StreamBuilder(
            stream: firestoreService.getNote(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List noteList = snapshot.data!.docs;

                return ListView.builder(
                    itemCount: noteList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = noteList[index];
                      String docID = document.id;

                      Map data = document.data() as Map;
                      String noteText = data['Note'] ?? "No Value yet";

                      return ListTile(
                        title: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      spreadRadius: 3,
                                      blurRadius: 1,
                                      offset: Offset(0, 2))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(noteText),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          opendialog(docID);
                                        },
                                        icon: Icon(Icons.update)),
                                    IconButton(
                                        onPressed: () =>
                                            firestoreService.deleteNote(docID),
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ],
                            )),
                      );
                    });
              } else {
                return Center(
                  child: Text('No Data'),
                );
              }
            }),
      ),
    );
  }
}
