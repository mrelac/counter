class Counter {
  String title;
  int value;
  String input;
  String output;

  Counter({
    this.title: 'title',
    this.value: 0,
    this.input: '0',
    this.output: '0',
  });
  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Counter &&
      other.title == title &&
      other.value == value &&
      other.input == input &&
      other.output == output;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      value.hashCode ^
      input.hashCode ^
      output.hashCode;
  }
}
