import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/local_storage_service.dart';
import 'add_edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];
  final _storageService = LocalStorageService();

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() async {
    final data = await _storageService.getAllNotes();
    setState(() {
      notes = data;
    });
  }

  @override
  Widget build(BuildContext context) { // إضافة الميثود المفقودة
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet! Tap + to add one.'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(notes[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(notes[index].content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _storageService.deleteNote(notes[index].id);
                      _refreshNotes();
                    },
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddEditNoteScreen(note: notes[index])),
                    );
                    _refreshNotes();
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
          _refreshNotes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} // إغلاق الكلاس بشكل صحيح