import 'package:flutter/material.dart';

Image_(String src) {
  return Image(
    image: NetworkImage(
      src,
    ),
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  );
}
