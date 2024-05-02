import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexsync/main.dart';

final userProfileProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  return supabase.from("Profiles").select('id,name,role');
});
