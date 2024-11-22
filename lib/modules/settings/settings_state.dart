part of 'settings.dart';

 class SettingsState extends Equatable {
  final bool showBackgroundVideo;

  @override
  List<Object?> get props => [showBackgroundVideo];

  const SettingsState({this.showBackgroundVideo = false});

  SettingsState copyWith({
    bool? showBackgroundVideo,
  }) {
    return SettingsState(
      showBackgroundVideo: showBackgroundVideo ?? this.showBackgroundVideo,
    );
  }
}
