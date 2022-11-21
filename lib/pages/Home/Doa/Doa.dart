import 'package:doa/data/api/doa_model.dart';
import 'package:doa/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    // TODO: implement initState
    apiService.fecthDataDoa();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Text(
                  ' Assalamualaikum, \n Fikri',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.light_mode,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: FutureBuilder<List<Doa>>(
            future: apiService.fecthDataDoa(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.toString());
                List<Doa> doa = snapshot.data;
                return ListView.builder(
                  itemCount: doa.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 10.0,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              // leading: Icon(Icons.arrow_drop_down_circle),
                              title: Text(
                                doa[index].doa,
                                style: blackAccentTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                doa[index].ayat,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                doa[index].latin,
                                style: greyTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: semiBold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                doa[index].artinya,
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
