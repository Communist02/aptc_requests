import 'package:flutter/material.dart';
import 'firebase.dart';
import 'global.dart';

Map<String, String> _request = {};

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
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
                    initialValue: _request['Самое длинное место'],
                    decoration: const InputDecoration(
                      labelText: 'Самое длинное место, м',
                      hintText: '0.1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Самое длинное место'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Самое широкое место'],
                    decoration: const InputDecoration(
                      labelText: 'Самое широкое место, м',
                      hintText: '0.1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Самое широкое место'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Самое высокое место'],
                    decoration: const InputDecoration(
                      labelText: 'Самое высокое место, м',
                      hintText: '0.1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Самое высокое место'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Самое тяжелое место'],
                    decoration: const InputDecoration(
                      labelText: 'Самое тяжелое место, кг',
                      hintText: '1.0',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Самое тяжелое место'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Количество мест'],
                    decoration: const InputDecoration(
                      labelText: 'Количество мест, шт',
                      hintText: '1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Количество мест'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Общий вес'],
                    decoration: const InputDecoration(
                      labelText: 'Общий вес, кг',
                      hintText: '1.00',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Общий вес'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    initialValue: _request['Общий объем'],
                    decoration: const InputDecoration(
                      labelText: 'Общий объем, м3',
                      hintText: '0.01',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _request['Общий объем'] = value.trim();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: TextFormField(
                    minLines: 2,
                    maxLines: 6,
                    initialValue: _request['Характер груза'],
                    decoration: const InputDecoration(
                      labelText: 'Характер груза',
                      hintText: 'Подробно или указать код ЕТСНГ/ТНВЭД',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _request['Характер груза'] = value.trim();
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
          child: Padding(
            padding: const EdgeInsets.all(14),
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
            onPressed: account.id == null
                ? null
                : () async {
                    final CloudStore cloudStore = CloudStore();
                    await cloudStore.addRequest(
                      'Перевозка контейнера',
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
