// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../bloc/trending/trending_movies_bloc.dart';
// import '../../bloc/trending/trending_movies_event.dart';
// import '../../bloc/trending/trending_movies_state.dart';
//
// class TopRatedMoviesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => TrendingMoviesBloc()..add(FetchTrendingMovies()),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Top Rated Movies')),
//         body: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
//           builder: (context, state) {
//             if (state is TrendingMoviesLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is TrendingMoviesLoaded) {
//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: state.movies.length,
//                 itemBuilder: (context, index) {
//                   final movie = state.movies[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.network(movie.posterPath),
//                   );
//                   // return ListTile(
//                   //   leading: Image.network(
//                   //     'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
//                   //     width: 100,
//                   //     height: 100,
//                   //   ),
//                   //   title: Text(movie.title),
//                   //   subtitle: Text(movie.overview),
//                   // );
//                   // return Container(
//                   //   child: Image(
//                   //     image: CachedNetworkImageProvider(
//                   //         'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
//                   //     width: 100,
//                   //     height: 100,
//                   //   ),
//                   // );
//                 },
//               );
//             } else if (state is TrendingMoviesError) {
//               return Center(child: Text('Error: ${state.message}'));
//             }
//             return Center(child: Text('No data'));
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/popular/popular_bloc.dart';
import 'package:tmdb_movie_app/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_movie_app/screen/home/selected_movie_screen.dart';

class UpcomingMovieScreen extends StatefulWidget {
  const UpcomingMovieScreen({super.key});

  @override
  State<UpcomingMovieScreen> createState() => _UpcomingMovieScreenState();
}

class _UpcomingMovieScreenState extends State<UpcomingMovieScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UpcomingBloc>().add(FetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (context, state) {
      if (state is PopularLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NoUpcomingMovies) {
        //return Center(child: Text('Error: ${state.error}'));
        return Center(
          child: ElevatedButton(onPressed: _reload, child: Text('Reload')),
        );
      } else if (state is GetUpcomingMovies) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.movies.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final movie = state.movies[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedPopularMovieScreen(
                                selMovie: movie,
                                heroTag: 'upcoming-${movie.id}',
                                initialIndex: state.movies.indexOf(movie),
                                movies: state.movies)),
                      );
                    },
                    child: Hero(
                      tag: 'upcoming-${movie.id}',
                      child: Container(
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('${movie.title}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            );
          },
        );
      }
      return const Center(child: Text('No data'));
    });
  }

  void _reload() {
    context.read<UpcomingBloc>().add(FetchUpcomingMovies());
  }
}
