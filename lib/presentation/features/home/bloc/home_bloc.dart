import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../domain/entities/home_data.dart';
import '../../../../domain/usecases/get_home_data.dart';

/// Home BLoC events
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load home data event
class LoadHomeData extends HomeEvent {}

/// Home BLoC states
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Home initial state
class HomeInitial extends HomeState {}

/// Home loading state
class HomeLoading extends HomeState {}

/// Home loaded state
class HomeLoaded extends HomeState {
  final HomeData homeData;

  const HomeLoaded({required this.homeData});

  @override
  List<Object?> get props => [homeData];
}

/// Home error state
class HomeError extends HomeState {
  final Failure failure;

  const HomeError({required this.failure});

  @override
  List<Object?> get props => [failure];
}

/// Home BLoC
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await getHomeData();
    result.fold(
      (failure) => emit(HomeError(failure: failure)),
      (homeData) => emit(HomeLoaded(homeData: homeData)),
    );
  }
}
