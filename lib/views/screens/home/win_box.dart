import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/home/rotated_light.dart';

import 'package:shadat_pubg/views/themes/colors.dart';

class WinBox extends StatefulWidget {
  final String value;
  const WinBox({
    super.key,
    required this.value,
  });

  @override
  State<WinBox> createState() => _WinBoxState();
}

class _WinBoxState extends State<WinBox> {
  final AudioPlayer _audioPlayer = AudioPlayer(), _moneyPlayer = AudioPlayer();

  @override
  void initState() {
    _audioPlayer.play(
      AssetSource(
        AssetsManager.getAudio("win"),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          const Center(
            child: RotatedLight(
              size: 600,
              color: PubgColors.whiteColor,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 4, color: PubgColors.yellowColor),
                color: PubgColors.orangeColor,
              ),
              height: 280,
              padding: const EdgeInsets.all(
                10,
              ),
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AssetsManager.getImage("money"),
                  ),
                  Text(
                    widget.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: PubgColors.whiteColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _moneyPlayer
                          .play(
                        AssetSource(
                          AssetsManager.getAudio("coin_add"),
                        ),
                      )
                          .then(
                        (value) {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1DEBD),
                        borderRadius: BorderRadius.circular(35),
                        border:
                            Border.all(width: 4, color: PubgColors.yellowColor),
                      ),
                      child: const Center(
                        child: Text(
                          "يجمع",
                          style: TextStyle(
                            fontSize: 15,
                            color: PubgColors.orangeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
