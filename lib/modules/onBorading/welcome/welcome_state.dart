part of 'welcome.dart';


 class WelcomeState extends Equatable {
  final VideoPlayerController? videoPlayerController;
  final bool isLoading;
  @override
  List<Object?> get props => [videoPlayerController,isLoading];
  const WelcomeState({this.videoPlayerController,this.isLoading = true});

  WelcomeState copyWith({
    VideoPlayerController? videoPlayerController,
    bool? isLoading,
  }) {
    return WelcomeState(
      videoPlayerController: videoPlayerController ?? this.videoPlayerController,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

