import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';

void setTargetPlatformForDesktop({required TargetPlatform platform}) {

  open.overrideFor(OperatingSystem.windows, _openOnLinux);

  final db = sqlite3.openInMemory();
  //db.dispose();

}
DynamicLibrary _openOnLinux() {

  final script = File(Platform.script.toFilePath());
  final libraryNextToScript = File('${script.path}/sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}
