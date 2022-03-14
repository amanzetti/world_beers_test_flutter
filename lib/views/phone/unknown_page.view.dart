import 'package:flutter/material.dart';

class UnknowPage extends StatelessWidget {
  const UnknowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  _buildAppBar() {
    return AppBar();
  }

  _buildBody() {
    return const Center(
      child: Text('404')
    );
  }
}
