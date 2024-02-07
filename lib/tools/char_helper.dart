class TextToEnglishChar {
  static String from(String from) {
    from = from.replaceAll('Ö', 'O');
    from = from.replaceAll('Ü', 'U');
    from = from.replaceAll('Ğ', 'G');
    from = from.replaceAll('Ş', 'S');
    from = from.replaceAll('İ', 'I');
    from = from.replaceAll('Ç', 'C');
    from = from.toLowerCase();
    from = from.replaceAll('ö', 'o');
    from = from.replaceAll('ü', 'u');
    from = from.replaceAll('ğ', 'g');
    from = from.replaceAll('ş', 's');
    from = from.replaceAll('ı', 'i');
    from = from.replaceAll('ç', 'c');

    return from;
  }
}
