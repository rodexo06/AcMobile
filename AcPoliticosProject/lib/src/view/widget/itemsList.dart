import 'package:AcPoliticos/src/controller/DepBloc.dart';
import 'package:AcPoliticos/src/view/DepSumGastos.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  final List<dynamic> items;
  final String filter;
  final DeputadoBloc deputadoBloc;

  const ItemsList({
    Key key,
    this.items,
    this.filter,
    this.deputadoBloc,
  }) : super(key: key);

  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    // Item default
    if (widget.items.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text('Nenhum item para exibir ainda')),
        ],
      );
    }

    // The list after filter apply
    List<dynamic> filteredList = List<dynamic>();

    // There is some filter?
    if (widget.filter.isNotEmpty) {
      for (dynamic item in widget.items) {
        // Check if theres this filter in the current item
        String name = item.nome.toString().toLowerCase();
        if (name.contains(widget.filter.toLowerCase())) {
          filteredList.add(item);
        }
      }
    } else {
      filteredList.addAll(widget.items);
    }

    // Empty after filters
    if (filteredList.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text('Nenhum item encontrado...')),
        ],
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int i) {
        String item = filteredList[i].nome;
        return Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DepSumGastos()),
              );
            },
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(item),
              ),
            ),
          ),
        );
      },
    );
  }
}
