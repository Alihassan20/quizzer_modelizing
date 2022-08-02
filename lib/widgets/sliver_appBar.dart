import 'package:flutter/material.dart';

class SilverAppBarCustomView extends StatefulWidget {
  const SilverAppBarCustomView({Key? key}) : super(key: key);

  @override
  State<SilverAppBarCustomView> createState() => _SilverAppBarCustomViewState();
}

class _SilverAppBarCustomViewState extends State<SilverAppBarCustomView> {
  ScrollController? _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController =  ScrollController();
    _scrollController!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Stack(
        children: <Widget>[
           CustomScrollView(
            controller: _scrollController,
            slivers: [
               SliverAppBar(
                expandedHeight: 256.0,
                pinned: true,
                flexibleSpace:  FlexibleSpaceBar(
                  title:  Text("SliverFab Example"),
                  background:  Image.asset(
                    "img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               SliverList(
                delegate:  SliverChildListDelegate(
                   List.generate(
                    20,
                        (int index) =>  ListTile(title:  Text("Item $index")),
                  ),
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 256.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 96.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController!.hasClients) {
      double offset = _scrollController!.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return  Positioned(
      top: top,
      right: 16.0,
      child:  Transform(
        transform:  Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child:  FloatingActionButton(
          onPressed: () => {},
          child:  Icon(Icons.add),
        ),
      ),
    );
  }
}
