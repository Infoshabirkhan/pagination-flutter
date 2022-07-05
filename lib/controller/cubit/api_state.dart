part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}
class ApiLoading extends ApiState {}
class ApiLoaded extends ApiState {
  final PassengerModel model;

  final bool isToLoadMore;

  ApiLoaded({required this.model, this.isToLoadMore = false});
}
class ApiError extends ApiState {}
