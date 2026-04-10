import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NoteController extends GetxController {
  final storage = GetStorage();
  var notes = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  void loadNotes() {
    List? storedNotes = storage.read<List>('notes');
    if (storedNotes != null) {
      notes.assignAll(storedNotes.cast<Map<String, dynamic>>());
    }
  }

  void addNote(String title, String content) {
    if (title.isEmpty && content.isEmpty) return;
    
    final newNote = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'title': title,
      'content': content,
      'date': DateTime.now().toIso8601String(),
    };
    
    notes.add(newNote);
    storage.write('notes', notes.toList());
  }

  void deleteNote(int id) {
    notes.removeWhere((note) => note['id'] == id);
    storage.write('notes', notes.toList());
  }
}
