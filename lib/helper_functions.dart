import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:taskc/taskc.dart';

Future<Connection> getConnection(BuildContext context) async {
  String certificate = await DefaultAssetBundle.of(context)
      .loadString('fixture/.task/first_last.cert.pem');
  String key = await DefaultAssetBundle.of(context)
      .loadString('fixture/.task/first_last.key.pem');
  String ca = await DefaultAssetBundle.of(context)
      .loadString('fixture/.task/ca.cert.pem');
  return Connection(
    address: Platform.isAndroid ? '10.0.2.2' : 'localhost',
    port: 53589,
    context: SecurityContext()
      ..useCertificateChainBytes(utf8.encode(certificate))
      ..usePrivateKeyBytes(utf8.encode(key))
      ..setTrustedCertificatesBytes(utf8.encode(ca)),
    onBadCertificate: (Platform.isMacOS || Platform.isIOS) ? (_) => true : null,
  );
}

Future<Credentials> getCredentials(BuildContext context) async {
  String taskrc =
      await DefaultAssetBundle.of(context).loadString('fixture/.taskrc');
  return Credentials.fromString(parseTaskrc(taskrc)['taskd.credentials']);
}
