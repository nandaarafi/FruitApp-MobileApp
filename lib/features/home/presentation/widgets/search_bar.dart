import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({
    Key? key,
    required this.text,
    required this.padding,
  }) : super(key: key);

  final String text;

  final EdgeInsets padding;

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        height: 43,
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(

              backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
              textStyle: MaterialStateProperty.all(
                  Theme.of(context).textTheme.bodySmall),
              shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              controller: controller,
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search,color: FColors.primary),
              trailing: <Widget>[
                // Add icon in the right search bar
              ],
              hintText: widget.text,
              hintStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodySmall), // Set hint text
            );
          },
          //  'Search fruits, nuts, and more'
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                  FocusScope.of(context).unfocus();
                },
              );
            });
          },
        ),
      ),
    );
  }
}