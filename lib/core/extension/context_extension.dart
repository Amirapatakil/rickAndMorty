import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/l10n/generated/l10n.dart';

extension ContextExtension on BuildContext {
  L10n get lang => L10n.of(this);
}
