import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_list.dart';
import 'add_note.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});

  final NoteController controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Notebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink,
        elevation: 2,
      ),
      body: Obx(
        () => controller.notes.isEmpty
            ? const Center(
                child: Text(
                  "No notes yet.\nTap + to add one!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  final note = controller.notes[index];
                  return NoteList(
                    title: note['title'] ?? "",
                    content: note['content'] ?? "",
                    onDelete: () => _showDeleteDialog(context, note['id']),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => Get.to(() => const AddNote()),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int id) {
    Get.defaultDialog(
      title: "Delete Note",
      middleText: "Are you sure you want to delete this note?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: Colors.pink,
      onConfirm: () {
        controller.deleteNote(id);
        Get.back();
      },
    );
  }
}
