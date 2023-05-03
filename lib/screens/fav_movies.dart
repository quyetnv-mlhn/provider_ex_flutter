import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex1/providers/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {

    return Consumer<MovieProvider>(builder: (context, myMovies, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My List ${myMovies.myList.length}'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: myMovies.myList.length,
            itemBuilder: (_, index) {
              final currentMovie = myMovies.myList[index];
              return Card(
                key: ValueKey(currentMovie.title),
                elevation: 4,
                child: ListTile(
                  title: Text(currentMovie.title),
                  subtitle: Text(currentMovie.duration ?? ''),
                  trailing: TextButton(
                    child: Text('Remove', style: TextStyle(color: Colors.red)),
                    onPressed: () {
                      context.read<MovieProvider>().removeToList(currentMovie);
                    },
                  ),
                ),
              );
            }),
      );
    });
  }
}
