import 'package:doa/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:doa/theme/theme.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  // ApiService apiService = ApiService();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   apiService.fecthDataDoa();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
