import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tahafoz_e_namaz/core/providers.dart';
import 'package:tahafoz_e_namaz/features/prayers/presentation/edit_prayer_page.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/features/settings/settings_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final db = ref.read(databaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tahafooz-e-Namaz'), actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsPage())),
        ),
      ]),
      body: FutureBuilder(
        future: db.select(db.prayers).get(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
          final rows = List<Prayer>.from(snap.data ?? <Prayer>[]);
          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (context, i) {
              final p = rows[i];
              final timeStr = '${(p.timeMinutes ~/ 60).toString().padLeft(2, '0')}:${(p.timeMinutes % 60).toString().padLeft(2, '0')}';
              return ListTile(
                title: Text(p.displayName),
                subtitle: Text('$timeStr • ${p.durationMinutes} min'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final changed = await Navigator.of(context).push<bool?>(MaterialPageRoute(builder: (_) => EditPrayerPage(prayerKey: p.key)));
                    if (changed == true) setState(() {});
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
