import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masak_kuy/Hyperlink/Hyperlink.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class RecipeDetails extends StatelessWidget {

  final String post;

  RecipeDetails(this.post);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.dapurumami.com/resep',
      hidden: true,
      appBar: AppBar(title: const Text("Recipe")),
    );
  }
}
