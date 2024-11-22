part of 'splash.dart';

class SplashState extends Equatable {
  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

 const SplashState({this.isLoading = false});

  SplashState copyWith({
    bool? isLoading,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

