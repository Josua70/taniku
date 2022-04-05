import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:taniku/model/ListModel.dart';
import 'package:taniku/model/ListModelGrid.dart';
import 'package:taniku/model/ListModelVertical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ListApi{
  var client = http.Client();
  var baseUrl = "https://reqres.in/";
  var baseUrl1 = "https://";

  Future<ListModel> getList(BuildContext context) async {
    print("getDataListApi");
    var uri = Uri.parse(baseUrl + "api/users?per_page=15").replace();
    try {
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return ListModel.fromJson(jsonDecode(response.body));
      } else {
        return ListModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return ListModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
  Future<apiVertical> getListApiVertical(BuildContext context) async {
    print("getDataListApi");
    var uri = Uri.parse(baseUrl + "api/unknown").replace();
    try {
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return apiVertical.fromJson(jsonDecode(response.body));
      } else {
        return apiVertical.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return apiVertical.withError("Waktu habis, silahkan coba kembali");
    }
  }
  Future<apiGridview> getGrid(BuildContext context) async {
    print("getDataListApi");
    var uri = Uri.parse(baseUrl1 + "fake-movie-database-api.herokuapp.com/api?s=batman").replace();
    try {
      final response = await http
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return apiGridview.fromJson(jsonDecode(response.body));
      } else {
        return apiGridview.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return apiGridview.withError("Waktu habis, silahkan coba kembali");
    }
  }
}