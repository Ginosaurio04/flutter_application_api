import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

class AudioService extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  AudioService() {
    _audioPlayer.playerStateStream.listen((state) {
      final playing = state.playing;
      if (_isPlaying != playing) {
        _isPlaying = playing;
        notifyListeners();
      }
    });
    _audioPlayer.setLoopMode(LoopMode.off);
  }

  Future<void> togglePlay(String assetPath) async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.setAsset(assetPath);
      await _audioPlayer.play();
    }
  }

  @override
  Future<void> dispose() async {
    await _audioPlayer.dispose();
    super.dispose();
  }
}
