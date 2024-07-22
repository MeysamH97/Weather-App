part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable {
  final SaveCityStatus saveCityStatus;
  final GetAllCityStatus getAllCityStatus;
  final GetCityStatus getCityStatus;
  final DeleteCityStatus deleteCityStatus;

  const BookmarkState({
    required this.saveCityStatus,
    required this.getAllCityStatus,
    required this.getCityStatus,
    required this.deleteCityStatus,
  });

  BookmarkState copyWith({
    SaveCityStatus? newSaveCityStatus,
    GetAllCityStatus? newGetAllCityStatus,
    GetCityStatus? newGetCityStatus,
    DeleteCityStatus? newDeleteCityStatus,
  }) {
    return BookmarkState(
      saveCityStatus: newSaveCityStatus ?? saveCityStatus,
      getAllCityStatus: newGetAllCityStatus ?? getAllCityStatus,
      getCityStatus: newGetCityStatus ?? getCityStatus,
      deleteCityStatus: newDeleteCityStatus ?? deleteCityStatus,
    );
  }

  @override
  List<Object?> get props => [
        saveCityStatus,
        getAllCityStatus,
        getCityStatus,
        deleteCityStatus,
      ];
}
