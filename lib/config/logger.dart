import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 5,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    dateTimeFormat: DateTimeFormat.dateAndTime,
  ),
);

final simpleLogger = Logger(printer: SimplePrinter());

final Logger debugLogger = Logger(
  printer: PrettyPrinter(),
  filter: DevelopmentFilter(),
);
