import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Icone extends Icon {
  const Icone({super.key}) : super(null);
}

class SvgIcon {
  final String svgAsset;
  final double size;

  const SvgIcon({
    required this.svgAsset,
    this.size = 24,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: SvgPicture.asset(svgAsset),
    );
  }
}
