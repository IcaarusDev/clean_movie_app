import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/entities/results_entity.dart';
import 'package:clean_movie_app/features/presentation/controllers/home_controller.dart';
import 'package:clean_movie_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    store.getMovies(DateTime.parse('2022-02-28'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CLEAN APP'),
      body: ScopedBuilder(
        store: store,
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onError: (context, error) => Center(
          child: Text(
            'An error occurred, try again later.',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white),
          ),
        ),
        onState: (context, MovieEntity movies) {
          return ListView.builder(
            itemCount: movies.results.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(movies.results[index].title),
                subtitle: Text(movies.results[index].overview),
              );
            },
          );
        },
      ),
    );
  }
}
