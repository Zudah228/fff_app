import 'package:fff_app/core/utils/logger.dart';
import 'package:intl/intl.dart';

void setLocale(String languageCode) {
  logger.info('setLocale: $languageCode');
  Intl.defaultLocale = languageCode;
}
