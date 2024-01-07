import 'package:logger/logger.dart';

/// Instance of [Logger] class.
Logger logger = Logger();

/// Setup logger.
Future<void> setupLogger() async {
  Logger.level = Level.debug; // Set the desired log level

  logger = Logger(
    printer: PrettyPrinter(),
  );
}
