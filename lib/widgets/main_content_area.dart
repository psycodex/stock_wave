import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_wave/widgets/side_bar.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:macos_ui/macos_ui.dart' as macos;

class MainContentArea extends StatefulWidget {
  final SideBar? sidebar;
  final SideBar? endSidebar;

  final Widget child;

  const MainContentArea(
      {super.key, required this.sidebar, required this.child, this.endSidebar});

  @override
  State<MainContentArea> createState() => _MainContentAreaState();
}

class _MainContentAreaState extends State<MainContentArea> {
  int _sidebarSlideDuration = 0;
  bool _showSidebar = true;
  bool _showEndSidebar = true;
  double defaultWidthSideBar = 200;
  double _sidebarWidth = 0.0;
  double _sidebarDragStartWidth = 0.0;
  double _sidebarDragStartPosition = 0.0;
  double _endSidebarWidth = 0.0;
  double _endSidebarDragStartWidth = 0.0;
  double _endSidebarDragStartPosition = 0.0;
  SystemMouseCursor _sidebarCursor = SystemMouseCursors.resizeColumn;
  SystemMouseCursor _endSidebarCursor = SystemMouseCursors.resizeLeft;

  @override
  void initState() {
    super.initState();
    _sidebarWidth =
        (widget.sidebar?.startWidth ?? widget.sidebar?.defaultWidth) ??
            _sidebarWidth;
    _endSidebarWidth =
        (widget.endSidebar?.startWidth ?? widget.endSidebar?.defaultWidth) ??
            _endSidebarWidth;
  }

  @override
  Widget build(BuildContext context) {
    const curve = Curves.linearToEaseOut;
    final duration = Duration(milliseconds: _sidebarSlideDuration);

    final sidebar = widget.sidebar;
    final endSidebar = widget.endSidebar;
    final ThemeData theme = Theme.of(context);
    Color dividerColor = theme.dividerColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final visibleSidebarWidth = _sidebarWidth;
        final visibleEndSidebarWidth = _endSidebarWidth;

        return Stack(
          children: [
            // SideBar
            if (sidebar != null)
              AnimatedPositioned(
                curve: curve,
                duration: duration,
                height: height,
                width: _sidebarWidth,
                child: AnimatedContainer(
                  duration: duration,
                  curve: curve,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: width - _endSidebarWidth,
                  ).normalize(),
                  child: widget.sidebar,
                ),
              ),
            // Main Content Area
            AnimatedPositioned(
              curve: curve,
              duration: duration,
              left: visibleSidebarWidth,
              width: width - visibleSidebarWidth - visibleEndSidebarWidth,
              height: height,
              child: ClipRect(
                child: widget.child ?? const SizedBox.shrink(),
              ),
            ),
            // Sidebar resizer
            if (sidebar?.isResizable ?? false)
              AnimatedPositioned(
                curve: curve,
                duration: duration,
                left: visibleSidebarWidth - 4,
                width: 7,
                height: height,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onDoubleTap: () {
                    setState(() {
                      _sidebarWidth = sidebar!.defaultWidth;
                    });
                  },
                  onHorizontalDragStart: (details) {
                    _sidebarDragStartWidth = _sidebarWidth;
                    _sidebarDragStartPosition = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      var newWidth = _sidebarDragStartWidth +
                          details.globalPosition.dx -
                          _sidebarDragStartPosition;

                      _sidebarWidth = math.min(
                        width - _endSidebarWidth,
                        newWidth,
                      );

                      if (_sidebarWidth == sidebar!.defaultWidth) {
                        _sidebarCursor = SystemMouseCursors.resizeRight;
                      } else if (_sidebarWidth == (width - _endSidebarWidth)) {
                        _sidebarCursor = SystemMouseCursors.resizeLeft;
                      } else {
                        _sidebarCursor = SystemMouseCursors.resizeColumn;
                      }
                    });
                  },
                  child: MouseRegion(
                    cursor: _sidebarCursor,
                    child: Align(
                      alignment: Alignment.center,
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                        color: dividerColor,
                      ),
                    ),
                  ),
                ),
              ),
            // End sidebar
            if (endSidebar != null)
              AnimatedPositioned(
                key: endSidebar.key,
                left: width - visibleEndSidebarWidth,
                curve: curve,
                duration: duration,
                height: height,
                width: _endSidebarWidth,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: height,
                    maxHeight: height,
                  ).normalize(),
                  child: widget.endSidebar,
                ),
              ),
            if (endSidebar?.isResizable ?? false)
              AnimatedPositioned(
                curve: curve,
                duration: duration,
                right: visibleEndSidebarWidth - 4,
                width: 7,
                height: height,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onDoubleTap: () {
                    setState(() {
                      _endSidebarWidth = endSidebar!.defaultWidth;
                    });
                  },
                  onHorizontalDragStart: (details) {
                    _endSidebarDragStartWidth = _endSidebarWidth;
                    _endSidebarDragStartPosition = details.globalPosition.dx;
                  },
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      var newWidth = _endSidebarDragStartWidth -
                          details.globalPosition.dx +
                          _endSidebarDragStartPosition;

                      _endSidebarWidth = math.min(
                        width - _sidebarWidth,
                        newWidth,
                      );

                      if (_endSidebarWidth == endSidebar!.defaultWidth) {
                        _endSidebarCursor = SystemMouseCursors.resizeLeft;
                      } else if (_endSidebarWidth ==
                          (width - _endSidebarWidth)) {
                        _endSidebarCursor = SystemMouseCursors.resizeRight;
                      } else {
                        _endSidebarCursor = SystemMouseCursors.resizeColumn;
                      }
                    });
                  },
                  child: MouseRegion(
                    cursor: _endSidebarCursor,
                    child: Align(
                      alignment: Alignment.center,
                      child: VerticalDivider(
                        thickness: 1,
                        width: 1,
                        color: dividerColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
