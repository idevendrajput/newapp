import 'package:flutter/material.dart';

// typedef FutureCallBack = Future<bool> Function();
//
class LoadMore extends StatefulWidget {

  Function isLoadMore;
  ListView child;

  LoadMore({
    super.key,
    required this.isLoadMore,
    required this.child,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return NotificationListener<ScrollNotification>(
  //     onNotification: (ScrollNotification scrollInfo) {
  //       if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
  //         isLoadMore(true);
  //       }
  //       return false;
  //     },
  //     child: child,
  //   );
  // }

  @override
  State<StatefulWidget> createState() => LoadMoreState();
}

class LoadMoreState extends State<LoadMore> {

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
         widget.isLoadMore();
        }
        return false;
      },
      child: widget.child,
    );
  }

}
