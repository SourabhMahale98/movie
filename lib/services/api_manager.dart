// ignore_for_file: unused_local_variable, avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movielist/Models/movie_model.dart';
import 'package:movielist/constants/strings.dart';

class ApiManager {
  Future<MovieModel> getData() async {
    var movieD;
    var url = Uri.parse(Constants().moviesUrl);
    var client = http.Client();
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        print(jsonMap);
        movieD = MovieModel.fromJson(jsonMap);
      }
    } catch (e) {
      return movieD;
    }

    return movieD;
  }
}
