import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:service_provider/base/presentation/widgets/edited_spinkit_three_bounce.dart';

class ServiceProviderLoader extends StatelessWidget {
  const ServiceProviderLoader({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EditedSpinKitThreeBounce(color: color ?? context.theme.colorScheme.inversePrimary, size: 24.0),
      ],
    );
  }
}
