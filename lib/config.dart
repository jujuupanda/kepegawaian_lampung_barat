import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final apiUrl =  dotenv.env["API_URL"];
  static final apiKey =  dotenv.env["API_KEY"];
  static final environment =  dotenv.env["ENVIRONMENT"];
}