import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/local_storage_service.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note; // إذا كانت فارغة فنحن نضيف، إذا كانت موجودة فنحن نعدل
  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final DatabaseService _dbService = DatabaseService();

  @override
  void initState() {
    super.initState();
    // إذا كنا في وضع "التعديل"، نملأ الحقول بالبيانات القديمة
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  void _saveNote() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title')),
      );
      return;
    }

    // إنشاء تاريخ تلقائي كما هو مطلوب في التكليف
    String timestamp = DateTime.now().toString().substring(0, 16);

    if (widget.note == null) {
      // إضافة ملاحظة جديدة
      await _dbService.addNote(Note(
        title: _titleController.text,
        content: _contentController.text,
        createdAt: timestamp,
      ));
    } else {
      // تعديل ملاحظة موجودة
      await _dbService.updateNote(Note(
        id: widget.note!.id,
        title: _titleController.text,
        content: _contentController.text,
        createdAt: timestamp,
      ));
    }

    if (mounted) Navigator.pop(context); // العودة للشاشة الرئيسية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add New Note' : 'Edit Note'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _saveNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content', border: OutlineInputBorder()),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
          ],
        ),
      ),
    );
  }
}