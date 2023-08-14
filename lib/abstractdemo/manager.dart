import 'package:flutter/material.dart';

import 'abstractfirstExample.dart';

class DataManaager {
  final AbStractDemo abstractManager;
  DataManaager(this.abstractManager);

  void displayData() {
    String data = abstractManager.fetchData();
    debugPrint('getdata - $data');
  }
}
