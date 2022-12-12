import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class XFileToParseFile {
  static Future<String?> xFileToParseFile(
      {required XFile xfile,
      required String className,
      required String objectId,
      required String objectAttribute}) async {
    try {
      String fileName = xfile.name;
      fileName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9]'), '_');
      ParseFileBase? parseFile;
      //print'===> fileName: $fileName');
      if (kIsWeb) {
        //Flutter Web
        parseFile = ParseWebFile(await xfile.readAsBytes(),
            name: fileName); //Name for file is required
      } else {
        //Flutter Mobile/Desktop
        parseFile = ParseFile(File(xfile.path), name: fileName);
      }
      final ParseResponse responseParseFile = await parseFile.save();
      if (responseParseFile.success && responseParseFile.results != null) {
        ParseFileBase parseFileBase =
            kIsWeb ? parseFile as ParseWebFile : parseFile as ParseFile;
        final parseObject = ParseObject(className);
        parseObject.objectId = objectId;
        parseObject.set(objectAttribute, parseFileBase);
        final ParseResponse responseParseObject = await parseObject.save();
        if (responseParseObject.success &&
            responseParseObject.results != null) {
          // objectId =
          //     (responseParseObject.results!.first as ParseObject).objectId!;

          return parseFileBase.url;
        } else {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
  // static Future<ParseFileBase> xFile2ParseFile(XFile xfile) async {
  //   String fileName = xfile.name;
  //   fileName = fileName.replaceAll(RegExp(r'[^A-Za-z0-9]'), '_');
  //   ParseFileBase? parseFile;
  //   //print'===> fileName: $fileName');
  //   if (kIsWeb) {
  //     //Flutter Web
  //     parseFile = ParseWebFile(await xfile.readAsBytes(),
  //         name: fileName); //Name for file is required
  //   } else {
  //     //Flutter Mobile/Desktop
  //     parseFile = ParseFile(File(xfile.path), name: fileName);
  //   }
  //   await parseFile.save();
  //   return kIsWeb ? parseFile as ParseWebFile : parseFile as ParseFile;
  // }
}
