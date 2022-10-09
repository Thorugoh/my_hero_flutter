import "package:flutter/material.dart";

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onChangeSearch;

  const SearchBar({super.key, required this.onChangeSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60.0,
      title: TextField(
        onChanged: onChangeSearch,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: " Search...",
            hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            )),
        style: const TextStyle(color: Colors.white, fontSize: 15.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
