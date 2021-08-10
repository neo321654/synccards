import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension takeWordFromDisconary on dynamic {
  AppLocalizations word(context) {
    return AppLocalizations.of(context) ??
        AppLocalizations.delegate as AppLocalizations;
  }
}
