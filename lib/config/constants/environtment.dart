import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environtment {
  static String theMovieDBKey = dotenv.env["THE_MOVIEDB_KEY"] ?? "";
}
