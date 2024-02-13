import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findByText(String text) {
  return find.text(text);
}

Finder findByRichText(String text) {
  return find.text(text, findRichText: true);
}

Finder findByTextContaining(String text) {
  return find.textContaining(text);
}

Finder findByType(Type type) {
  return find.byType(type);
}

Finder findByKey(Key key) {
  return find.byKey(key);
}

Finder findByTooltip(String text) {
  return find.byTooltip(text);
}

Finder findByAncestor(Finder child, Finder parent) {
  return find.ancestor(of: child, matching: parent);
}

Finder findByDescendant(Finder parent, Finder child) {
  return find.descendant(of: parent, matching: child);
}

Finder findByTextOnLastIndex(String text) {
  return find.text(text).last;
}

// Finder findByValueKey(String valueKey) {
//   return find.byKey(ValueKey(valueKey));
// }

// Finder findByIcon(IconData iconData) {
//   return find.byIcon(iconData);
// }

// Finder findByToolTip(String toolTipText) {
//   return find.byTooltip(toolTipText);
// }

// Finder findByType<T>() {
//   return find.byType(T);
// }

// Finder findByWidget(Widget widget) {
//   return find.byWidget(widget);
// }

// Finder findByChild(Finder ancestor, Finder child) {
//   return find.descendant(of: ancestor, matching: child);
// }

// Finder findByAncestor(Finder child, Finder ancestor) {
//   return find.ancestor(of: child, matching: ancestor);
// }

// Finder findByWidgetPredicate(String containText) {
//   return find.byWidgetPredicate((Widget widget) =>
//       widget is RichText && widget.text.toPlainText().contains(containText));
// }
