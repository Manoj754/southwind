import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:southwind/data/providers/auth_provider.dart';
import 'package:southwind/data/providers/library_provider.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthNotifier());
final libraryNotifier = ChangeNotifierProvider((_ref) => LibraryNotifier(_ref));
