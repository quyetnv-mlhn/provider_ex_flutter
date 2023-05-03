import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider_ex1/models/movie_model.dart';

final List<Movie> initialData =
    List.generate(50, (index) => Movie(title: 'Movie $index', duration: '${Random().nextInt(100) + 60} minutes'));

class MovieProvider extends ChangeNotifier {
  final List<Movie> _movies = initialData;

  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];

  List<Movie> get myList => _myList;

  addToList(Movie currentMovie) {
    _myList.add(currentMovie);
    notifyListeners();
  }

  removeToList(Movie currentMovie) {
    _myList.remove(currentMovie);
    notifyListeners();
  }
}
