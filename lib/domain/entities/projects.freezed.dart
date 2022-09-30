// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'projects.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Projects {
  String get name => throw _privateConstructorUsedError;
  FileSystemEntity get entity => throw _privateConstructorUsedError;
  bool get isFolder => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get hasYaml => throw _privateConstructorUsedError;
  bool? get isDone => throw _privateConstructorUsedError;
  int? get extracts => throw _privateConstructorUsedError;
  int? get extractsDone => throw _privateConstructorUsedError;
  int? get wordCound => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsCopyWith<Projects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsCopyWith<$Res> {
  factory $ProjectsCopyWith(Projects value, $Res Function(Projects) then) =
      _$ProjectsCopyWithImpl<$Res>;
  $Res call(
      {String name,
      FileSystemEntity entity,
      bool isFolder,
      DateTime? updatedAt,
      bool? hasYaml,
      bool? isDone,
      int? extracts,
      int? extractsDone,
      int? wordCound});
}

/// @nodoc
class _$ProjectsCopyWithImpl<$Res> implements $ProjectsCopyWith<$Res> {
  _$ProjectsCopyWithImpl(this._value, this._then);

  final Projects _value;
  // ignore: unused_field
  final $Res Function(Projects) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? entity = freezed,
    Object? isFolder = freezed,
    Object? updatedAt = freezed,
    Object? hasYaml = freezed,
    Object? isDone = freezed,
    Object? extracts = freezed,
    Object? extractsDone = freezed,
    Object? wordCound = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      isFolder: isFolder == freezed
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasYaml: hasYaml == freezed
          ? _value.hasYaml
          : hasYaml // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      extracts: extracts == freezed
          ? _value.extracts
          : extracts // ignore: cast_nullable_to_non_nullable
              as int?,
      extractsDone: extractsDone == freezed
          ? _value.extractsDone
          : extractsDone // ignore: cast_nullable_to_non_nullable
              as int?,
      wordCound: wordCound == freezed
          ? _value.wordCound
          : wordCound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectsCopyWith<$Res> implements $ProjectsCopyWith<$Res> {
  factory _$$_ProjectsCopyWith(
          _$_Projects value, $Res Function(_$_Projects) then) =
      __$$_ProjectsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      FileSystemEntity entity,
      bool isFolder,
      DateTime? updatedAt,
      bool? hasYaml,
      bool? isDone,
      int? extracts,
      int? extractsDone,
      int? wordCound});
}

/// @nodoc
class __$$_ProjectsCopyWithImpl<$Res> extends _$ProjectsCopyWithImpl<$Res>
    implements _$$_ProjectsCopyWith<$Res> {
  __$$_ProjectsCopyWithImpl(
      _$_Projects _value, $Res Function(_$_Projects) _then)
      : super(_value, (v) => _then(v as _$_Projects));

  @override
  _$_Projects get _value => super._value as _$_Projects;

  @override
  $Res call({
    Object? name = freezed,
    Object? entity = freezed,
    Object? isFolder = freezed,
    Object? updatedAt = freezed,
    Object? hasYaml = freezed,
    Object? isDone = freezed,
    Object? extracts = freezed,
    Object? extractsDone = freezed,
    Object? wordCound = freezed,
  }) {
    return _then(_$_Projects(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      isFolder: isFolder == freezed
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasYaml: hasYaml == freezed
          ? _value.hasYaml
          : hasYaml // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      extracts: extracts == freezed
          ? _value.extracts
          : extracts // ignore: cast_nullable_to_non_nullable
              as int?,
      extractsDone: extractsDone == freezed
          ? _value.extractsDone
          : extractsDone // ignore: cast_nullable_to_non_nullable
              as int?,
      wordCound: wordCound == freezed
          ? _value.wordCound
          : wordCound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Projects implements _Projects {
  const _$_Projects(
      {required this.name,
      required this.entity,
      required this.isFolder,
      this.updatedAt,
      this.hasYaml,
      this.isDone,
      this.extracts,
      this.extractsDone,
      this.wordCound});

  @override
  final String name;
  @override
  final FileSystemEntity entity;
  @override
  final bool isFolder;
  @override
  final DateTime? updatedAt;
  @override
  final bool? hasYaml;
  @override
  final bool? isDone;
  @override
  final int? extracts;
  @override
  final int? extractsDone;
  @override
  final int? wordCound;

  @override
  String toString() {
    return 'Projects(name: $name, entity: $entity, isFolder: $isFolder, updatedAt: $updatedAt, hasYaml: $hasYaml, isDone: $isDone, extracts: $extracts, extractsDone: $extractsDone, wordCound: $wordCound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Projects &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.isFolder, isFolder) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.hasYaml, hasYaml) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality().equals(other.extracts, extracts) &&
            const DeepCollectionEquality()
                .equals(other.extractsDone, extractsDone) &&
            const DeepCollectionEquality().equals(other.wordCound, wordCound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(isFolder),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(hasYaml),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(extracts),
      const DeepCollectionEquality().hash(extractsDone),
      const DeepCollectionEquality().hash(wordCound));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectsCopyWith<_$_Projects> get copyWith =>
      __$$_ProjectsCopyWithImpl<_$_Projects>(this, _$identity);
}

abstract class _Projects implements Projects {
  const factory _Projects(
      {required final String name,
      required final FileSystemEntity entity,
      required final bool isFolder,
      final DateTime? updatedAt,
      final bool? hasYaml,
      final bool? isDone,
      final int? extracts,
      final int? extractsDone,
      final int? wordCound}) = _$_Projects;

  @override
  String get name;
  @override
  FileSystemEntity get entity;
  @override
  bool get isFolder;
  @override
  DateTime? get updatedAt;
  @override
  bool? get hasYaml;
  @override
  bool? get isDone;
  @override
  int? get extracts;
  @override
  int? get extractsDone;
  @override
  int? get wordCound;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsCopyWith<_$_Projects> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectsSnapshot {
  String get name => throw _privateConstructorUsedError;
  FileSystemEntity get entity => throw _privateConstructorUsedError;
  bool get isFolder => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool? get hasYaml => throw _privateConstructorUsedError;
  bool? get isDone => throw _privateConstructorUsedError;
  int? get extracts => throw _privateConstructorUsedError;
  int? get extractsDone => throw _privateConstructorUsedError;
  int? get wordCound => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsSnapshotCopyWith<ProjectsSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsSnapshotCopyWith<$Res> {
  factory $ProjectsSnapshotCopyWith(
          ProjectsSnapshot value, $Res Function(ProjectsSnapshot) then) =
      _$ProjectsSnapshotCopyWithImpl<$Res>;
  $Res call(
      {String name,
      FileSystemEntity entity,
      bool isFolder,
      DateTime? updatedAt,
      bool? hasYaml,
      bool? isDone,
      int? extracts,
      int? extractsDone,
      int? wordCound});
}

/// @nodoc
class _$ProjectsSnapshotCopyWithImpl<$Res>
    implements $ProjectsSnapshotCopyWith<$Res> {
  _$ProjectsSnapshotCopyWithImpl(this._value, this._then);

  final ProjectsSnapshot _value;
  // ignore: unused_field
  final $Res Function(ProjectsSnapshot) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? entity = freezed,
    Object? isFolder = freezed,
    Object? updatedAt = freezed,
    Object? hasYaml = freezed,
    Object? isDone = freezed,
    Object? extracts = freezed,
    Object? extractsDone = freezed,
    Object? wordCound = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      isFolder: isFolder == freezed
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasYaml: hasYaml == freezed
          ? _value.hasYaml
          : hasYaml // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      extracts: extracts == freezed
          ? _value.extracts
          : extracts // ignore: cast_nullable_to_non_nullable
              as int?,
      extractsDone: extractsDone == freezed
          ? _value.extractsDone
          : extractsDone // ignore: cast_nullable_to_non_nullable
              as int?,
      wordCound: wordCound == freezed
          ? _value.wordCound
          : wordCound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProjectsSnapshotCopyWith<$Res>
    implements $ProjectsSnapshotCopyWith<$Res> {
  factory _$$_ProjectsSnapshotCopyWith(
          _$_ProjectsSnapshot value, $Res Function(_$_ProjectsSnapshot) then) =
      __$$_ProjectsSnapshotCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      FileSystemEntity entity,
      bool isFolder,
      DateTime? updatedAt,
      bool? hasYaml,
      bool? isDone,
      int? extracts,
      int? extractsDone,
      int? wordCound});
}

/// @nodoc
class __$$_ProjectsSnapshotCopyWithImpl<$Res>
    extends _$ProjectsSnapshotCopyWithImpl<$Res>
    implements _$$_ProjectsSnapshotCopyWith<$Res> {
  __$$_ProjectsSnapshotCopyWithImpl(
      _$_ProjectsSnapshot _value, $Res Function(_$_ProjectsSnapshot) _then)
      : super(_value, (v) => _then(v as _$_ProjectsSnapshot));

  @override
  _$_ProjectsSnapshot get _value => super._value as _$_ProjectsSnapshot;

  @override
  $Res call({
    Object? name = freezed,
    Object? entity = freezed,
    Object? isFolder = freezed,
    Object? updatedAt = freezed,
    Object? hasYaml = freezed,
    Object? isDone = freezed,
    Object? extracts = freezed,
    Object? extractsDone = freezed,
    Object? wordCound = freezed,
  }) {
    return _then(_$_ProjectsSnapshot(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      isFolder: isFolder == freezed
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasYaml: hasYaml == freezed
          ? _value.hasYaml
          : hasYaml // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      extracts: extracts == freezed
          ? _value.extracts
          : extracts // ignore: cast_nullable_to_non_nullable
              as int?,
      extractsDone: extractsDone == freezed
          ? _value.extractsDone
          : extractsDone // ignore: cast_nullable_to_non_nullable
              as int?,
      wordCound: wordCound == freezed
          ? _value.wordCound
          : wordCound // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ProjectsSnapshot implements _ProjectsSnapshot {
  const _$_ProjectsSnapshot(
      {required this.name,
      required this.entity,
      required this.isFolder,
      this.updatedAt,
      this.hasYaml,
      this.isDone,
      this.extracts,
      this.extractsDone,
      this.wordCound});

  @override
  final String name;
  @override
  final FileSystemEntity entity;
  @override
  final bool isFolder;
  @override
  final DateTime? updatedAt;
  @override
  final bool? hasYaml;
  @override
  final bool? isDone;
  @override
  final int? extracts;
  @override
  final int? extractsDone;
  @override
  final int? wordCound;

  @override
  String toString() {
    return 'ProjectsSnapshot(name: $name, entity: $entity, isFolder: $isFolder, updatedAt: $updatedAt, hasYaml: $hasYaml, isDone: $isDone, extracts: $extracts, extractsDone: $extractsDone, wordCound: $wordCound)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectsSnapshot &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.isFolder, isFolder) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.hasYaml, hasYaml) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality().equals(other.extracts, extracts) &&
            const DeepCollectionEquality()
                .equals(other.extractsDone, extractsDone) &&
            const DeepCollectionEquality().equals(other.wordCound, wordCound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(isFolder),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(hasYaml),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(extracts),
      const DeepCollectionEquality().hash(extractsDone),
      const DeepCollectionEquality().hash(wordCound));

  @JsonKey(ignore: true)
  @override
  _$$_ProjectsSnapshotCopyWith<_$_ProjectsSnapshot> get copyWith =>
      __$$_ProjectsSnapshotCopyWithImpl<_$_ProjectsSnapshot>(this, _$identity);
}

abstract class _ProjectsSnapshot implements ProjectsSnapshot {
  const factory _ProjectsSnapshot(
      {required final String name,
      required final FileSystemEntity entity,
      required final bool isFolder,
      final DateTime? updatedAt,
      final bool? hasYaml,
      final bool? isDone,
      final int? extracts,
      final int? extractsDone,
      final int? wordCound}) = _$_ProjectsSnapshot;

  @override
  String get name;
  @override
  FileSystemEntity get entity;
  @override
  bool get isFolder;
  @override
  DateTime? get updatedAt;
  @override
  bool? get hasYaml;
  @override
  bool? get isDone;
  @override
  int? get extracts;
  @override
  int? get extractsDone;
  @override
  int? get wordCound;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectsSnapshotCopyWith<_$_ProjectsSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}
