import 'package:taniku/model/ListModel.dart';
import 'package:taniku/model/ListModelGrid.dart';
import 'package:taniku/model/ListModelVertical.dart';
import 'package:taniku/service/ListApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewModel extends ChangeNotifier {
  final listApi = ListApi();
  List<Data> dataListHorizontal = [];
  List<Data1> dataListVertical = [];
  List<Search> dataListGrid = [];

  ListViewModel(BuildContext context) {
    this.getDataList(context);
    this.getDataList1(context);
    this.getGrid(context);
  }

  //-------------------- ListView Horizontal ---------------------

  void getDataList(BuildContext contex) async {
    final response = await listApi.getList(contex);
    final response1 = await listApi.getListApiVertical(contex);
    if (response.error == null) {
      dataListHorizontal = response.data!;
    } else {
      print(response.error.toString());
      // var snackBar = snackBar(content: Text(response.error.toString()));
      // scaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    notifyListeners();
  }

  //-------------------- ListView Vertical ---------------------

  void getDataList1(BuildContext context) async {
    final response = await listApi.getListApiVertical(context);

    if (response.error == null) {
    dataListVertical = response.data1!;
    } else {
    print(response.error.toString());
    // var snackBar = snackBar(content: Text(response.error.toString()));
    // scaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

  //-------------------- ListView Gridview ---------------------

  void getGrid(BuildContext contex) async {
    final response = await listApi.getGrid(contex);

    if (response.error == null) {
      dataListGrid = response.search!;
    } else {
      print(response.error.toString());
      // var snackBar = snackBar(content: Text(response.error.toString()));
      // scaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    notifyListeners();
  }
  }
