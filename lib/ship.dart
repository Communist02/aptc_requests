import 'package:flutter/material.dart';
import 'firebase.dart';
import 'global.dart';

Map<String, String> _request = {};

class ShipPage extends StatefulWidget {
  const ShipPage({Key? key}) : super(key: key);

  @override
  _ShipPageState createState() => _ShipPageState();
}

class _ShipPageState extends State<ShipPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Откуда'],
                    decoration: const InputDecoration(
                      labelText: 'Откуда',
                      hintText: 'г. Владивосток',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Откуда'] = value.trim();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Куда'],
                    decoration: const InputDecoration(
                      labelText: 'Куда',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Куда'] = value.trim();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Когда'],
                    decoration: const InputDecoration(
                      labelText: 'Когда',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Когда'] = value.trim();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    minLines: 4,
                    maxLines: 6,
                    initialValue: _request['Комментарий'],
                    decoration: const InputDecoration(
                      labelText: 'Комментарий к заявке',
                      hintText:
                          'Пример комментария: выезд под арку не выше трех метров, ящики грузить не более чем в два яруса...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Комментарий'] = value.trim();
                    },
                  ),
                ),
                const Text(
                    'Указаная здесь информация о необходимости заказа пропуска, записи на отгузку, согласования с отправителем учитываться не будет'),
              ],
            ),
          ),
        ),
        Container(
          height: 70,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),
            onPressed: account.id == null
                ? null
                : () async {
                    final CloudStore cloudStore = CloudStore();
                    await cloudStore.addRequest(
                      'Выделение судна',
                      _request,
                      DateTime.now(),
                    );
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
