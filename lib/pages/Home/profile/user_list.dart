import 'package:doa/data/api/user_api.dart';
import 'package:doa/pages/Home/future_screen.dart';
import 'package:doa/services/user_api_service.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});
//  Function setTheme;
//   ListUser({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  ApiUser apiUser = ApiUser();
  void initState() {
    apiUser.fecthDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            onPressed: (() {
              Navigator.pushNamed(context, '/future');
            }),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'User List',
          style: TextStyle(
            fontSize: 16,
            fontWeight: bold,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: apiUser.fecthDataUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.toString());
              List<User> user = snapshot.data;
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 10.0,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Icon(
                                    Icons.person_pin,
                                    size: 32,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user[index].username,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                    Text('*********'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
