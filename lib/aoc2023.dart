Iterable<List<T>> zip<T>(Iterable<Iterable<T>> iterables) sync* {
  final iterators = iterables.map((iterable) => iterable.iterator).toList();

  while (iterators.every((iterator) => iterator.moveNext())) {
    yield iterators.map((iterator) => iterator.current).toList();
  }
}
