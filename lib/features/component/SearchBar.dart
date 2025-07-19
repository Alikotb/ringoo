import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final void Function(String) onSearchChanged;
  final List<Widget>? actions;
  final String searchHint;
  final Color backgroundColor;

  const CustomSearchAppBar({
    super.key,
    required this.title,
    required this.onSearchChanged,
    this.actions,
    this.searchHint = "Search...",
    this.backgroundColor = Colors.white,
  });

  @override
  _CustomSearchAppBarState createState() => _CustomSearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();

  void _startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      isSearching = false;
      _controller.clear();
      widget.onSearchChanged('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading:
          isSearching
              ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.scrim,
                ),
                onPressed: _stopSearch,
              )
              : IconButton(
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.scrim,
                ),
                onPressed: _startSearch,
              ),
      title:
          isSearching
              ? TextField(
                controller: _controller,
                autofocus: true,
                cursorColor: Theme.of(context).colorScheme.primary,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: widget.onSearchChanged,
              )
              : Text(
                widget.title,
                style: TextStyle(color: Theme.of(context).colorScheme.scrim),
              ),
      actions: isSearching ? [] : widget.actions,
    );
  }
}
