part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkEvent {}

class GetAllCityEvent extends BookmarkEvent {}

class GetCityByNameEvent extends BookmarkEvent {
  final String cityName;
  GetCityByNameEvent(this.cityName);
}

class SaveCityEvent extends BookmarkEvent {
  final String name;
  SaveCityEvent(this.name);
}

class SaveCityInitialEvent extends BookmarkEvent {}


class DeleteCityEvent extends BookmarkEvent {
  final String name;
  DeleteCityEvent(this.name);
}