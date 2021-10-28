// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movielist/Models/movie_model.dart';
import 'package:movielist/sizedconfig.dart';

class MovieDetail extends StatefulWidget {
  Movie movieD;
  MovieDetail({Key? key, required this.movieD}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    Movie movieD = widget.movieD;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Media.height! * 40,
              width: double.infinity,
              child: Card(
                elevation: 10,
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
            ),
            Text(
              movieD.name.toString(),
              style: TextStyle(
                fontSize: Media.text! * 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Media.height! * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Year of the Movie",
                  style: TextStyle(fontSize: Media.text! * 3),
                ),
                Text(
                  movieD.year.toString(),
                  style: TextStyle(fontSize: Media.text! * 3),
                )
              ],
            ),
            SizedBox(height: Media.height! * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Director",
                  style: TextStyle(fontSize: Media.text! * 3),
                ),
                Text(
                  movieD.director.toString(),
                  style: TextStyle(fontSize: Media.text! * 3),
                )
              ],
            ),
            SizedBox(height: Media.height! * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stars",
                  style: TextStyle(fontSize: Media.text! * 3),
                ),
                Text(
                  movieD.mainStar.toString(),
                  style: TextStyle(fontSize: Media.text! * 3),
                )
              ],
            ),
            SizedBox(height: Media.height! * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Genres",
                    style: TextStyle(fontSize: Media.text! * 3),
                  ),
                ),
                Flexible(
                  child: Text(
                    movieD.genres.toString(),
                    style: TextStyle(fontSize: Media.text! * 3),
                  ),
                )
              ],
            ),
            SizedBox(height: Media.height! * 3),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                movieD.description.toString(),
                style: TextStyle(fontSize: Media.text! * 2.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
