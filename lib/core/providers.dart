import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tahafoz_e_namaz/features/prayers/data/local/database.dart';
import 'package:tahafoz_e_namaz/core/services/dnd_method_channel.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final dndProvider = Provider<MethodChannelDnd>((ref) => MethodChannelDnd());
