// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:tmdb_movie_app/model/trending_movie_model.dart';
// import 'package:tmdb_movie_app/screen/home/upcoming.dart';
//
// part 'home_event.dart';
// part 'home_state.dart';
//
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final MovieListView movieListView;
//
//   HomeBloc({required this.movieListView}) : super(HomeInitial()) {
//     on<HomeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//     on<GetTrendingMovies>((event, emit) async {
//       await _getTrendingMovie(event, emit);
//     });
//     on<GetPopularMovies>((event, emit) async {
//       await _getPopularMovie(event, emit);
//     });
//     on<GetUpcomingMovies>((event, emit) async {
//       await _getUpcomingMovie(event, emit);
//     });
//     on<GetNowPlayingMovies>((event, emit) async {
//       await _getNowPlayingMovie(event, emit);
//     });
//   }
//
//   Future<void> _getTrendingMovie(
//       GetTrendingMovies event, Emitter<HomeState> emit) async {
//     try {
//       emit(GetTrendingMoviesState as HomeState);
//
//     }
//
//   }
// }
//
// // _getNowPlayingMovie {
// // }
// //
// // _getUpcomingMovie {
// // }
// //
// // _getPopularMovie {
// // }
