final Map<SortValue, Sort> homeSorts = {
  SortValue.best: sorts[SortValue.best],
  SortValue.hot: sorts[SortValue.hot],
  SortValue.newer: sorts[SortValue.newer],
  SortValue.top: sorts[SortValue.top],
  SortValue.controversial: sorts[SortValue.controversial],
  SortValue.rising: sorts[SortValue.rising],
};

final Map<SortValue, Sort> sorts = {
  SortValue.best: Sort(
    value: SortValue.best,
    text: '🚀 Best',
  ),
  SortValue.hot: Sort(
    value: SortValue.hot,
    text: '🔥 Hot',
  ),
  SortValue.newer: Sort(
    value: SortValue.newer,
    text: '☀️ New',
  ),
  SortValue.top: Sort(
    value: SortValue.top,
    text: '📊 Top',
  ),
  SortValue.controversial: Sort(
    value: SortValue.controversial,
    text: '⚔️ Controversial',
  ),
  SortValue.rising: Sort(
    value: SortValue.rising,
    text: '📈 Rising',
  ),
};

class Sort {
  final SortValue value;
  final String text;
  const Sort({this.value, this.text});
}

enum SortValue { best, hot, newer, top, controversial, rising }
