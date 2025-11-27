import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/character_viewmodel.dart';
import '../../domain/entities/character.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CharacterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Rick and Morty - Clean Architecture")),

      body: vm.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.items.length,
        itemBuilder: (_, i) {
          final CharacterEntity c = vm.items[i];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(c.image),
              ),
              title: Text(c.name),
              subtitle: Text("${c.status} • ${c.species}"),
            ),
          );
        },
      ),
    );
  }
}
