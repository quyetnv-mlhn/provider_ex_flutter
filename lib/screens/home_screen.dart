import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex1/providers/movie_provider.dart';
import 'package:provider_ex1/screens/fav_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var movies = context.watch<MovieProvider>().movies;
    // var myList = context.watch<MovieProvider>().myList;

    return Consumer<MovieProvider>(builder: (context, myMovies, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyListScreen()));
                  },
                  child: Text('Go to my list (${myMovies.myList.length})'),
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: EdgeInsets.symmetric(vertical: 20))),
              SizedBox(height: 15),
              Expanded(
                  child: ListView.builder(
                      itemCount: myMovies.movies.length,
                      itemBuilder: (_, index) {
                        final currentMovie = myMovies.movies[index];
                        return Card(
                          key: ValueKey(currentMovie.title),
                          color: Colors.blue,
                          elevation: 4,
                          child: ListTile(
                            title: Text(currentMovie.title, style: TextStyle(color: Colors.white)),
                            subtitle:
                            Text(currentMovie.duration ?? 'No infomation', style: TextStyle(color: Colors.white)),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: myMovies.myList.contains(currentMovie) ? Colors.red : Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                if (!myMovies.myList.contains(currentMovie)) {
                                  context.read<MovieProvider>().addToList(currentMovie);
                                } else {
                                  context.read<MovieProvider>().removeToList(currentMovie);
                                }
                              },
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      );
    });
  }
}
