import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/character_viewmodel.dart';
import '../../domain/entities/character.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CharacterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Futurama - Clean Architecture")),

      body: vm.loading
          ? Center(child: CircularProgressIndicator())
          : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: vm.paginatedItems.length,
                  itemBuilder: (_, i) {
                    final CharacterEntity c = vm.paginatedItems[i];

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
              ),
              // Controles de paginación
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: vm.currentPage > 1 ? vm.previousPage : null,
                      child: Text("← Anterior"),
                    ),
                    Text(
                      "Página ${vm.currentPage} de ${vm.getTotalPages()}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: vm.currentPage < vm.getTotalPages() ? vm.nextPage : null,
                      child: Text("Siguiente →"),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
