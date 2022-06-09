import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:service_provider/app/app.dart';
import 'package:service_provider/app/di/injection_container.dart';
import 'package:service_provider/app/viewmodels/app_viewmodel.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await inject(environment: prod.name);

  final AppViewmodel appViewmodel = GetIt.I<AppViewmodel>();

  runApp(App(appViewmodel: appViewmodel,));
}



