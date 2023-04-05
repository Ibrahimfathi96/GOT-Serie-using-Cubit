import 'package:breaking_bad_bloc/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BloCBreakingBad(appRouter: AppRouter(),));
}
class BloCBreakingBad extends StatelessWidget {
  final AppRouter appRouter;

  const BloCBreakingBad({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}


