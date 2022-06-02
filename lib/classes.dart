class Account {
  String? id;
  String? email;
  String nickname = '';
  String avatar = '';

  void clear() {
    id = null;
    email = null;
    nickname = '';
    avatar = '';
  }
}

class Request {
  String id;
  String description;
  Map value;
  DateTime dateTime;

  Request(this.description, this.value, this.dateTime, {this.id = ''});
}

class Message {
  String idSender;
  String idRecipient;
  String value;
  DateTime dateTime;

  Message(this.idSender, this.idRecipient, this.value, this.dateTime);
}

class Contact {
  String id;
  String nickname;
  List<Message> chat;

  Contact(this.id, this.nickname, this.chat);

  Message lastMessage() {
    return chat[chat.length - 1];
  }

  addMessage(String idSender, String value) {
    chat.add(Message(idSender, nickname, value, DateTime.now()));
  }

  void sortMessages() {
    chat.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }
}

class Contacts {
  List<Contact> contacts;

  Contacts(this.contacts);

  bool addMessage(Message message, bool isYou) {
    for (Contact contact in contacts) {
      if (isYou && message.idRecipient == contact.id) {
        contact.chat.add(message);
        return true;
      } else if (message.idSender == contact.id) {
        contact.chat.add(message);
        return true;
      }
    }
    return false;
  }

  void addContact(Message message, String id, String name) {
    contacts.add(Contact(id, name, [message]));
  }

  void sortMessages() {
    for (int i = 0; i < contacts.length; i++) {
      contacts[i].chat.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }
    contacts.sort(
        (a, b) => b.lastMessage().dateTime.compareTo(a.lastMessage().dateTime));
  }
}
