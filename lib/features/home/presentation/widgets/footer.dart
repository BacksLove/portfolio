import 'package:flutter/material.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.black,
      child: Center(
        child: Text(
          l10n.footerRights,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white54),
        ),
      ),
    );
  }
}
