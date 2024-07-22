import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/presentation/ui/main_wrapper.dart';
import 'package:weather_app/features/bookmarks_feature/presentation/bloc/bookmark_bloc.dart';
import 'package:weather_app/features/weather__feature/presentation/bloc/home_bloc.dart';
import 'package:weather_app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// init locator
  await setup();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => locator<HomeBloc>(),
          ),
          BlocProvider(
            create: (_) => locator<BookmarkBloc>(),
          ),
        ],
        child:  const MainWrapper(),
      ),
    ),
  );
}
