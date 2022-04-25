import 'package:flutter/material.dart';
import 'classes.dart';
import 'firebase.dart';

class RequestPage extends StatelessWidget {
  final Request request;

  const RequestPage(this.request, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> requestView(Map request) {
      List<Widget> requests = [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            this.request.description,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ];
      for (final name in request.keys) {
        requests.add(
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              name + ': ' + request[name],
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      }
      return requests;
    }

    return Scaffold(
      appBar: AppBar(
        title: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  request.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
              ),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Подтверждение удаления'),
                    content: const Text('Вы хотите удалить ваш заказ?'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'true'),
                        child: const Text('Да'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'false'),
                        child: const Text('Нет'),
                      ),
                    ],
                  ),
                ).then((value) async {
                  if (value == 'true') {
                    final CloudStore cloudStore = CloudStore();
                    await cloudStore.removeRequest(request.id);
                    Navigator.pop(context);
                  }
                });
              },
              child: const Text('Удалить')
            ),
          ),
        ],
      ),
      body: ListView(
        children: requestView(request.value),
      ),
    );
  }
}
