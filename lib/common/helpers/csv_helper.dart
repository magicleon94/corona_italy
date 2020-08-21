class CsvHelper {
  static Map<String, dynamic> csvToJson(String csv) {
    final table = csv.split('\n');

    final headers = table.removeAt(0).split(',');
    final json = <String, dynamic>{'data': <Map<String, dynamic>>[]};

    for (final row in table) {
      final map = <String, dynamic>{};
      final fields = row.split(',');
      for (var i = 0; i < fields.length; i++) {
        final header = headers[i];
        var value = fields[i];
        if (value == '') {
          value = null;
        }
        if (value != null) {
          map[header] = int.tryParse(value) ??
              double.tryParse(value) ??
              num.tryParse(value) ??
              value;
        }
      }
      json['data'].add(map);
    }
    return json;
  }
}
