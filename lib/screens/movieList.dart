// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movielist/Models/movie_model.dart';
import 'package:movielist/screens/movie_detail.dart';
import 'package:movielist/services/api_manager.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Future<MovieModel>? response;
  @override
  void initState() {
    response = ApiManager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie App"),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: FutureBuilder<MovieModel>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.data!.movies!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, i) {
                  Movie movieD = snapshot.data!.data!.movies![i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetail(movieD: movieD)));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          movieD.thumbnail.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
