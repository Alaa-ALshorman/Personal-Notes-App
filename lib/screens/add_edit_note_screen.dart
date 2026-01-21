import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/local_storage_service.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() async {
    if (_titleController.text.isNotEmpty) {
      final newNote = Note(
        id: DateTime.now().toString(),
        title: _titleController.text,
        content: _contentController.text,
        createdDate: DateTime.now(),
      );

      // تفعيل الحفظ الفعلي وانتظار اكتماله
      await LocalStorageService().insertNote(newNote); 
      
      if (mounted) Navigator.pop(context); // العودة بعد الحفظ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _saveNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}