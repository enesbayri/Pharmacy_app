import 'package:flutter/material.dart';
import 'package:flutter_application_23/widgets/loading_widget.dart';

class AppLocationLoadingContent extends StatelessWidget {
  const AppLocationLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: LoadingWidget(
      label: "Konumunuz Belirleniyor...!",
    ));
  }
}
