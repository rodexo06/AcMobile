import 'package:flutter/material.dart';

class SwitchMesWidget extends StatelessWidget {
  final RadioModel _item;

  SwitchMesWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: _item.isSelected ? _item.corSelect : _item.corContainer,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: new Border.all(width: 1, color: _item.corSelect),
      ),
      height: _item.height,
      width: _item.width,
      // width: size.width * 0.115,
      // color: Color(0XFF1DA838),
      child: Center(
        child: Text(
          _item.texto,
          style: TextStyle(
              color: _item.corTexto, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class RadioModel {
  final double height;
  final double width;
  final Color corContainer;
  final Color corTexto;
  final String texto;
  bool isSelected;
  final Color corSelect;

  RadioModel(this.isSelected, this.height, this.width, this.corContainer,
      this.corTexto, this.texto, this.corSelect);
}
