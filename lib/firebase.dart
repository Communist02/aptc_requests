import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'classes.dart';
import 'global.dart';
import 'dart:convert';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> signEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
    if (_auth.currentUser == null) return false;
    account.id = _auth.currentUser?.uid;
    account.email = _auth.currentUser?.email;
    final CollectionReference accounts = firestore.collection('accounts');
    final acc = await accounts.doc(account.id).get();
    account.nickname = acc['nickname'];
    return true;
  }

  Future<bool> registerEmailPassword(
      String email, String password, String nickname) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
    if (_auth.currentUser == null) return false;
    account.id = _auth.currentUser?.uid;
    account.email = _auth.currentUser?.email;

    final CollectionReference accounts = firestore.collection('accounts');
    accounts.doc(account.id).set({'nickname': nickname});
    account.nickname = nickname;
    return true;
  }

  Future<bool> resetPassword(String email) async {
    _auth.sendPasswordResetEmail(email: email);
    return true;
  }

  void sign() async {
    if (_auth.currentUser != null) {
      account.id = _auth.currentUser!.uid;
      account.email = _auth.currentUser!.email;
      final CollectionReference accounts = firestore.collection('accounts');
      final acc = await accounts.doc(account.id).get();
      account.nickname = acc['nickname'];
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }

  bool checkSign() {
    return _auth.currentUser != null;
  }

  String? getId() {
    return _auth.currentUser?.uid;
  }
}

class CloudStore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> addRequest(String description, Map<String, String> request,
      DateTime dateTime) async {
    final CollectionReference requestsBase = firestore.collection('requests');
    requestsBase.add({
      'idAccount': account.id,
      'nickname': account.nickname,
      'description': description,
      'value': jsonEncode(request),
      'dateTime': dateTime,
    });
    return true;
  }

  Future<List<Request>> getMyRequests() async {
    final CollectionReference requestsBase = firestore.collection('requests');
    final result = await requestsBase
        .where('idAccount', isEqualTo: account.id.toString())
        .get();
    List<Request> requests = [];
    for (var request in result.docs) {
      requests.add(Request(
        request['description'],
        jsonDecode(request['value']),
        DateTime.fromMillisecondsSinceEpoch(request['dateTime'].seconds * 1000),
        id: request.id,
      ));
    }
    requests.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return requests;
  }

  Future<bool> removeRequest(String id) async {
    final CollectionReference requestsBase = firestore.collection('requests');
    requestsBase.doc(id).delete();
    return true;
  }

  Future<Contacts> getContacts() async {
    final CollectionReference chatsBase = firestore.collection('messages');
    final CollectionReference accountsBase = firestore.collection('accounts');
    final firstMessagesResult = await chatsBase
        .where('idSender', isEqualTo: account.id.toString())
        .get();
    final secondMessagesResult = await chatsBase
        .where('idRecipient', isEqualTo: account.id.toString())
        .get();
    Contacts contacts = Contacts([]);
    for (final message in firstMessagesResult.docs) {
      final messageTMP = Message(
        message['idSender'],
        message['idRecipient'],
        message['value'],
        DateTime.fromMillisecondsSinceEpoch(message['dateTime'].seconds * 1000),
      );
      if (!contacts.addMessage(messageTMP, true)) {
        final acc = await accountsBase.doc(messageTMP.idRecipient).get();
        contacts.addContact(
            messageTMP, messageTMP.idRecipient, acc['nickname']);
      }
    }
    for (final message in secondMessagesResult.docs) {
      final messageTMP = Message(
        message['idSender'],
        message['idRecipient'],
        message['value'],
        DateTime.fromMillisecondsSinceEpoch(message['dateTime'].seconds * 1000),
      );
      if (!contacts.addMessage(messageTMP, false)) {
        final acc = await accountsBase.doc(messageTMP.idSender).get();
        contacts.addContact(messageTMP, messageTMP.idSender, acc['nickname']);
      }
    }
    contacts.sortMessages();
    return contacts;
  }

  Future<Contact> getContact(String idContact) async {
    final CollectionReference chatsBase = firestore.collection('messages');
    final CollectionReference accountsBase = firestore.collection('accounts');
    final acc = await accountsBase.doc(idContact).get();
    Contact contact = Contact(idContact, acc['nickname'], []);
    final firstMessagesResult = await chatsBase
        .where('idSender', isEqualTo: account.id.toString())
        .where('idRecipient', isEqualTo: idContact)
        .get();
    final secondMessagesResult = await chatsBase
        .where('idSender', isEqualTo: idContact)
        .where('idRecipient', isEqualTo: account.id.toString())
        .get();
    for (final message in firstMessagesResult.docs) {
      final messageTMP = Message(
        message['idSender'],
        message['idRecipient'],
        message['value'],
        DateTime.fromMillisecondsSinceEpoch(message['dateTime'].seconds * 1000),
      );
      contact.chat.add(messageTMP);
    }
    for (final message in secondMessagesResult.docs) {
      final messageTMP = Message(
        message['idSender'],
        message['idRecipient'],
        message['value'],
        DateTime.fromMillisecondsSinceEpoch(message['dateTime'].seconds * 1000),
      );
      contact.chat.add(messageTMP);
    }
    contact.sortMessages();
    return contact;
  }

  Future<bool> addMessage(Message message) async {
    final CollectionReference messagesBase = firestore.collection('messages');
    messagesBase.add({
      'idSender': message.idSender,
      'idRecipient': message.idRecipient,
      'value': message.value,
      'dateTime': message.dateTime,
    });
    return true;
  }
}
