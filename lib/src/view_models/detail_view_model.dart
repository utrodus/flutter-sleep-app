import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sleep/src/utils/globals.dart';

import '../models/progress_bar_model.dart';

class DetailViewModel {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(
    ButtonState.paused,
  );
  static String url = '';

  late AudioPlayer _audioPlayer;
  DetailViewModel() {
    _init();
  }
  showSnackbar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.black87,
    );
  }

  void _init() async {
    try {
      _audioPlayer = AudioPlayer();
      await _audioPlayer.setUrl(url);

      _audioPlayer.setVolume(1);

      _audioPlayer.playerStateStream.listen((playerState) {
        final isPlaying = playerState.playing;
        final processingState = playerState.processingState;

        if (processingState == ProcessingState.buffering ||
            processingState == ProcessingState.loading) {
          buttonNotifier.value = ButtonState.loading;
        } else if (!isPlaying) {
          buttonNotifier.value = ButtonState.paused;
        } else if (processingState != ProcessingState.completed) {
          buttonNotifier.value = ButtonState.playing;
        } else {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.pause();
        }
      });

      _audioPlayer.positionStream.listen((position) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: position,
          buffered: oldState.buffered,
          total: oldState.total,
        );
      });

      _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: bufferedPosition,
          total: oldState.total,
        );
      });

      _audioPlayer.durationStream.listen((totalDuration) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: oldState.buffered,
          total: totalDuration ?? Duration.zero,
        );
      });
    } catch (e) {
      snackbarKey.currentState?.showSnackBar(showSnackbar(e.toString()));
    }
  }

  void play() {
    try {
      _audioPlayer.play();
      snackbarKey.currentState?.showSnackBar(showSnackbar("Playing"));
    } catch (e) {
      snackbarKey.currentState?.showSnackBar(showSnackbar(e.toString()));
    }
  }

  void pause() {
    try {
      _audioPlayer.pause();
      snackbarKey.currentState?.showSnackBar(showSnackbar("Paused"));
    } catch (e) {
      snackbarKey.currentState?.showSnackBar(showSnackbar(e.toString()));
    }
  }

  void seek(Duration position) {
    try {
      _audioPlayer.seek(position);
    } catch (e) {
      snackbarKey.currentState?.showSnackBar(showSnackbar(e.toString()));
    }
  }

  void dispose() {
    try {
      _audioPlayer.dispose();
      _audioPlayer.stop();
    } catch (e) {
      snackbarKey.currentState?.showSnackBar(showSnackbar(e.toString()));
    }
  }
}
