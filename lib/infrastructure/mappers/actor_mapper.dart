import 'package:movies_app/domain/entitites/actor.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath:
        cast.profilePath != null
            ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
            : "https://img.favpng.com/6/14/19/computer-icons-user-profile-icon-design-png-favpng-vcvaCZNwnpxfkKNYzX3fYz7h2.jpg",
    character: cast.character,
  );
}
