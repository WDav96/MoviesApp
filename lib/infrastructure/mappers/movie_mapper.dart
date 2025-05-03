import 'package:movies_app/domain/entitites/movie.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/movie_details.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/movie_the_moviedb.dart';

class MovieMapper {
  static Movie theMovieDBToEntity(MovieTheMovieDB theMovieDb) => Movie(
    adult: theMovieDb.adult,
    backdropPath:
        (theMovieDb.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${theMovieDb.backdropPath}"
            : "https://furntech.org.za/wp-content/uploads/2017/05/placeholder-image.png",
    genreIds: theMovieDb.genreIds.map((e) => e.toString()).toList(),
    id: theMovieDb.id,
    originalLanguage: theMovieDb.originalLanguage,
    originalTitle: theMovieDb.originalTitle,
    overview: theMovieDb.overview,
    popularity: theMovieDb.popularity,
    posterPath:
        (theMovieDb.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${theMovieDb.backdropPath}"
            : "https://furntech.org.za/wp-content/uploads/2017/05/placeholder-image.png",
    releaseDate: theMovieDb.releaseDate,
    title: theMovieDb.title,
    video: theMovieDb.video,
    voteAverage: theMovieDb.voteAverage,
    voteCount: theMovieDb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails theMovieDb) => Movie(
    adult: theMovieDb.adult,
    backdropPath:
        (theMovieDb.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${theMovieDb.backdropPath}"
            : "https://furntech.org.za/wp-content/uploads/2017/05/placeholder-image.png",
    genreIds: theMovieDb.genres.map((e) => e.name).toList(),
    id: theMovieDb.id,
    originalLanguage: theMovieDb.originalLanguage,
    originalTitle: theMovieDb.originalTitle,
    overview: theMovieDb.overview,
    popularity: theMovieDb.popularity,
    posterPath:
        (theMovieDb.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${theMovieDb.backdropPath}"
            : "https://furntech.org.za/wp-content/uploads/2017/05/placeholder-image.png",
    releaseDate: theMovieDb.releaseDate,
    title: theMovieDb.title,
    video: theMovieDb.video,
    voteAverage: theMovieDb.voteAverage,
    voteCount: theMovieDb.voteCount,
  );
}
