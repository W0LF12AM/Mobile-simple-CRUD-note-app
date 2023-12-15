import 'package:cloud_firestore/cloud_firestore.dart';

class firebase {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('Notes');

  //add
  Future<void> addNote(String note) {
    return notes.add({'Note': note, 'Time Stamp': Timestamp.now()});
  }

  //read
  Stream getNote() {
    final noteStream =
        notes.orderBy('Time Stamp', descending: true).snapshots();
    return noteStream;
  }

  //update
  Future updateNote(String docID, String newNote) {
    return notes
        .doc(docID)
        .update({'Note': newNote, 'Time Stamp': Timestamp.now()});
  }

  //delete
  Future deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
