import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/audio_service.dart';

class MusicButton extends StatelessWidget {
  final String assetPath;
  const MusicButton({required this.assetPath, super.key});

  @override
  Widget build(BuildContext context) {
    final audioService = Provider.of<AudioService>(context);
    return GestureDetector(
      onTap: () => audioService.togglePlay(assetPath),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          audioService.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
