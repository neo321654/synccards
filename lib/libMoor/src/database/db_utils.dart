import 'package:moor/moor.dart';
import 'package:undo/undo.dart';

extension TableUtils on GeneratedDatabase {
  Future<void> deleteRow(
    ChangeStack cs,
    TableInfo table,
    Insertable val,
  ) async {
    final _change = Change(
      val,
      () async => await this.delete(table).delete(val) ,
      (Insertable old) async => await this.into(table).insert(old),
    );
     cs.add(_change);
  }

  Future<dynamic> insertRow(
    ChangeStack cs,
    TableInfo table,
    Insertable val,
  ) async {
    final _change = Change(
      val,
      () async => await this.into(table).insert(val),
      (Insertable val) async => await this.delete(table).delete(val),
    );
     cs.add(_change);
  }

  Future<void> updateRow(
    ChangeStack cs,
    TableInfo table,
    Insertable val,
  ) async {
    // final oldVal = await (select(table)..whereSamePrimaryKey(val)).getSingle();

    //todo здесь надо сохранить старое значение , выполнить нормальный select
   // final oldVal = await (select(table)..whereSamePrimaryKey(val)).getSingle();
    final oldVal = "oldVal";
    final _change = Change(
      oldVal,
      () async => await this.update(table).replace(val),
          (val) async => await this.update(table).replace(val as Insertable),
    );
     cs.add(_change);
  }
}

Value<T> addField<T>(T? val, {T? fallback}) {
 late Value<T> _fallback;
  if (fallback != null) {
    _fallback = Value<T>(fallback);
  }
  if (val == null) {
    return _fallback ?? Value.absent();
  }
  if (val is String && (val == 'null' || val == 'Null')) {
    return _fallback ?? Value.absent();
  }
  return Value(val);
}
