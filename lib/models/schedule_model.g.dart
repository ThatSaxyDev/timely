// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduleModelCollection on Isar {
  IsarCollection<ScheduleModel> get scheduleModels => this.collection();
}

const ScheduleModelSchema = CollectionSchema(
  name: r'ScheduleModel',
  id: 453809397327065968,
  properties: {
    r'datesAndTimes': PropertySchema(
      id: 0,
      name: r'datesAndTimes',
      type: IsarType.objectList,
      target: r'DatesAndTimes',
    ),
    r'info': PropertySchema(
      id: 1,
      name: r'info',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleModelEstimateSize,
  serialize: _scheduleModelSerialize,
  deserialize: _scheduleModelDeserialize,
  deserializeProp: _scheduleModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'DatesAndTimes': DatesAndTimesSchema},
  getId: _scheduleModelGetId,
  getLinks: _scheduleModelGetLinks,
  attach: _scheduleModelAttach,
  version: '3.1.0+1',
);

int _scheduleModelEstimateSize(
  ScheduleModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.datesAndTimes.length * 3;
  {
    final offsets = allOffsets[DatesAndTimes]!;
    for (var i = 0; i < object.datesAndTimes.length; i++) {
      final value = object.datesAndTimes[i];
      bytesCount +=
          DatesAndTimesSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.info.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _scheduleModelSerialize(
  ScheduleModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DatesAndTimes>(
    offsets[0],
    allOffsets,
    DatesAndTimesSchema.serialize,
    object.datesAndTimes,
  );
  writer.writeString(offsets[1], object.info);
  writer.writeString(offsets[2], object.title);
}

ScheduleModel _scheduleModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduleModel();
  object.datesAndTimes = reader.readObjectList<DatesAndTimes>(
        offsets[0],
        DatesAndTimesSchema.deserialize,
        allOffsets,
        DatesAndTimes(),
      ) ??
      [];
  object.id = id;
  object.info = reader.readString(offsets[1]);
  object.title = reader.readString(offsets[2]);
  return object;
}

P _scheduleModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DatesAndTimes>(
            offset,
            DatesAndTimesSchema.deserialize,
            allOffsets,
            DatesAndTimes(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduleModelGetId(ScheduleModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduleModelGetLinks(ScheduleModel object) {
  return [];
}

void _scheduleModelAttach(
    IsarCollection<dynamic> col, Id id, ScheduleModel object) {
  object.id = id;
}

extension ScheduleModelQueryWhereSort
    on QueryBuilder<ScheduleModel, ScheduleModel, QWhere> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleModelQueryWhere
    on QueryBuilder<ScheduleModel, ScheduleModel, QWhereClause> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduleModelQueryFilter
    on QueryBuilder<ScheduleModel, ScheduleModel, QFilterCondition> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'datesAndTimes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> infoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> infoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'info',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition> infoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'info',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'info',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      infoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'info',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ScheduleModelQueryObject
    on QueryBuilder<ScheduleModel, ScheduleModel, QFilterCondition> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterFilterCondition>
      datesAndTimesElement(FilterQuery<DatesAndTimes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'datesAndTimes');
    });
  }
}

extension ScheduleModelQueryLinks
    on QueryBuilder<ScheduleModel, ScheduleModel, QFilterCondition> {}

extension ScheduleModelQuerySortBy
    on QueryBuilder<ScheduleModel, ScheduleModel, QSortBy> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> sortByInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info', Sort.asc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> sortByInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info', Sort.desc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ScheduleModelQuerySortThenBy
    on QueryBuilder<ScheduleModel, ScheduleModel, QSortThenBy> {
  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenByInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info', Sort.asc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenByInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'info', Sort.desc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ScheduleModelQueryWhereDistinct
    on QueryBuilder<ScheduleModel, ScheduleModel, QDistinct> {
  QueryBuilder<ScheduleModel, ScheduleModel, QDistinct> distinctByInfo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'info', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduleModel, ScheduleModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleModelQueryProperty
    on QueryBuilder<ScheduleModel, ScheduleModel, QQueryProperty> {
  QueryBuilder<ScheduleModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScheduleModel, List<DatesAndTimes>, QQueryOperations>
      datesAndTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datesAndTimes');
    });
  }

  QueryBuilder<ScheduleModel, String, QQueryOperations> infoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'info');
    });
  }

  QueryBuilder<ScheduleModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DatesAndTimesSchema = Schema(
  name: r'DatesAndTimes',
  id: -1642389218731639745,
  properties: {
    r'beginAt': PropertySchema(
      id: 0,
      name: r'beginAt',
      type: IsarType.dateTime,
    ),
    r'day': PropertySchema(
      id: 1,
      name: r'day',
      type: IsarType.string,
    ),
    r'endAt': PropertySchema(
      id: 2,
      name: r'endAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _datesAndTimesEstimateSize,
  serialize: _datesAndTimesSerialize,
  deserialize: _datesAndTimesDeserialize,
  deserializeProp: _datesAndTimesDeserializeProp,
);

int _datesAndTimesEstimateSize(
  DatesAndTimes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.day.length * 3;
  return bytesCount;
}

void _datesAndTimesSerialize(
  DatesAndTimes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.beginAt);
  writer.writeString(offsets[1], object.day);
  writer.writeDateTime(offsets[2], object.endAt);
}

DatesAndTimes _datesAndTimesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DatesAndTimes();
  object.beginAt = reader.readDateTime(offsets[0]);
  object.day = reader.readString(offsets[1]);
  object.endAt = reader.readDateTime(offsets[2]);
  return object;
}

P _datesAndTimesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DatesAndTimesQueryFilter
    on QueryBuilder<DatesAndTimes, DatesAndTimes, QFilterCondition> {
  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      beginAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beginAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      beginAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beginAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      beginAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beginAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      beginAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beginAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      dayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition> dayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      dayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      dayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      endAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      endAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      endAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DatesAndTimes, DatesAndTimes, QAfterFilterCondition>
      endAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DatesAndTimesQueryObject
    on QueryBuilder<DatesAndTimes, DatesAndTimes, QFilterCondition> {}
