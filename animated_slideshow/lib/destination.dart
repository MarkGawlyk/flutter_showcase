import 'package:animated_slideshow/image_clipper.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class Destination extends StatelessWidget {
  final String title;
  final bool bottom;
  final String body;
  final String imageLoc;

  const Destination({
    super.key,
    required this.bottom,
    required this.title,
    required this.body,
    required this.imageLoc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: bottom
          ? Column(
              children: [
                Expanded(
                  child: Content(
                    title: title,
                    body: body,
                  ),
                ),
                Expanded(
                  child: ImageClipper(
                    imageLoc: imageLoc,
                    bottom: bottom,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: ImageClipper(
                    imageLoc: imageLoc,
                    bottom: bottom,
                  ),
                ),
                Expanded(
                  child: Content(
                    title: title,
                    body: body,
                  ),
                ),
              ],
            ),
    );
  }
}

class Content extends StatelessWidget {
  final String title;
  final String body;
  const Content({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            width: double.infinity,
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 500),
            from: 20,
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 1000),
            from: 20,
            child: Text(
              body.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 1500),
            from: 20,
            child: const Tags(),
          ),
          const SizedBox(
            height: 20,
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 2000),
            from: 20,
            child: const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget tempor dapibus, nisl velit ultricies nunc, eget ultricies nisl nisl eget dolor.\nDonec euismod, nisl eget tempor dapibus, nisl velit ultricies nunc, eget ultricies nisl nisl eget dolor. Donec euismod, nisl eget tempor dapibus, nisl velit ultricies nunc, eget ultricies nisl nisl eget dolor.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final allTags = [
    'City',
    'Nature',
    'Luxury',
    'Beach',
    'Adventure',
    'Relax',
    'Culture',
    'Food',
    'Shopping',
    'History',
    'Nightlife',
  ];

  List<String> selectedTags = [];

  @override
  void initState() {
    // select 3 random tags
    selectedTags = allTags.toList()..shuffle();
    selectedTags = selectedTags.sublist(0, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var tag in selectedTags) TagCell(tag: tag),
      ],
    );
  }
}

class TagCell extends StatelessWidget {
  final String tag;
  const TagCell({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
