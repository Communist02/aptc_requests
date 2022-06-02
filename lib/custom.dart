import 'package:flutter/material.dart';
import 'firebase.dart';
import 'global.dart';

Map<String, String> _request = {};

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Контактное лицо'],
                    decoration: const InputDecoration(
                      labelText: 'Контактное лицо',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Контактное лицо'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Телефон'],
                    decoration: const InputDecoration(
                      labelText: 'Телефон',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _request['Телефон'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Email'],
                    decoration: const InputDecoration(
                      labelText: 'Email для связи и уведомлений',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _request['Email'] = value.trim();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: 6,
                    initialValue: _request['Заявка'],
                    decoration: const InputDecoration(
                      labelText: 'Текст заявки',
                      hintText: 'Введите вашу заявку',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Заявка'] = value.trim();
                    },
                  ),
                ),
                const Text(
                    'Здесь напишите вашу заяку, что вам необходимо, все возможные условия'),
              ],
            ),
          ),
        ),
        Container(
          height: 70,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: account.id == null
                ? null
                : () async {
                    final CloudStore cloudStore = CloudStore();
                    await cloudStore.addRequest(
                      'Уникальная заявка',
                      _request,
                      DateTime.now(),
                    );
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Заказ создан'),
                      duration: Duration(seconds: 1),
                    ));
                  },
            child: Text(
              account.id != null ? 'ОТПРАВИТЬ' : 'ВОЙДИТЕ В АККАУНТ',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
