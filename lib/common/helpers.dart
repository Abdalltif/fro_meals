
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Helpers {
  static void playClickSound(){
    SystemSound.play(SystemSoundType.click);
  }

  static late ProgressDialog progressDialog;
  static void showProgressDialog( BuildContext context, String msg, bool isDismissible){
    progressDialog = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: isDismissible, showLogs: true);
    progressDialog.style(
      message: msg,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: const Center(child: CircularProgressIndicator()),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
    );
    progressDialog.show();
  }

  static void hideProgressDialog(){
    progressDialog.hide();
  }
}