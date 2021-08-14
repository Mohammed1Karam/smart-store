import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/widget/my_text.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class HeaderText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(text: AppLocalizations.of(context)?.headerFreshText ?? '', fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          MyText(text: AppLocalizations.of(context)?.headerFreshSubText ?? '', fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.COLOR),
        ],
      ),
    );
  }
}
