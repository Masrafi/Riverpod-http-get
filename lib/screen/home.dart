import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_get_reverpod/data/data_provider.dart';
import 'package:http_get_reverpod/model/model.dart';
import 'package:http_get_reverpod/screen/details_screen.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: data.when(
          data: (data) {
            List<UserModel> userList = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsScreen(e: userList[index]),
                                  ),
                                );
                              },
                              child: Card(
                                color: Colors.blue,
                                elevation: 4,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    userList[index].firstname,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => CircularProgressIndicator()),
    );
  }
}
