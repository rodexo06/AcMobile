import 'package:flutter/material.dart';

class CustomCircleImageWidget extends StatelessWidget {
  final String caminhoImagem;
  final double width;
  final double height;

  const CustomCircleImageWidget(
      {Key key, this.caminhoImagem, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(caminhoImagem),
        ),
      ),
    );
  }
}
