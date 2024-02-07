
import 'package:flutter/material.dart';
import 'package:flutter_application_23/services/app_location_service.dart';
import 'package:flutter_application_23/widgets/app_location_loading.dart';
import 'package:flutter_application_23/widgets/home_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
          child: FutureBuilder(
                future: AppLocationService.getAppLocation(ref),
                builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePageContent();
          } else if (snapshot.hasError) {
            return const HomePageContent();
          } else {
            return const AppLocationLoadingContent();
          }
                },
              ),
        ));
  }
}
