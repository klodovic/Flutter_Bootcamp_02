// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Beer _$BeerFromJson(Map<String, dynamic> json) {
  return _Beer.fromJson(json);
}

/// @nodoc
mixin _$Beer {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerCopyWith<Beer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerCopyWith<$Res> {
  factory $BeerCopyWith(Beer value, $Res Function(Beer) then) =
      _$BeerCopyWithImpl<$Res, Beer>;
  @useResult
  $Res call({int id, String name, String description, String imageUrl});
}

/// @nodoc
class _$BeerCopyWithImpl<$Res, $Val extends Beer>
    implements $BeerCopyWith<$Res> {
  _$BeerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerCopyWith<$Res> implements $BeerCopyWith<$Res> {
  factory _$$_BeerCopyWith(_$_Beer value, $Res Function(_$_Beer) then) =
      __$$_BeerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String description, String imageUrl});
}

/// @nodoc
class __$$_BeerCopyWithImpl<$Res> extends _$BeerCopyWithImpl<$Res, _$_Beer>
    implements _$$_BeerCopyWith<$Res> {
  __$$_BeerCopyWithImpl(_$_Beer _value, $Res Function(_$_Beer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_Beer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Beer implements _Beer {
  const _$_Beer(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl});

  factory _$_Beer.fromJson(Map<String, dynamic> json) => _$$_BeerFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'Beer(id: $id, name: $name, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Beer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerCopyWith<_$_Beer> get copyWith =>
      __$$_BeerCopyWithImpl<_$_Beer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerToJson(
      this,
    );
  }
}

abstract class _Beer implements Beer {
  const factory _Beer(
      {required final int id,
      required final String name,
      required final String description,
      required final String imageUrl}) = _$_Beer;

  factory _Beer.fromJson(Map<String, dynamic> json) = _$_Beer.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_BeerCopyWith<_$_Beer> get copyWith => throw _privateConstructorUsedError;
}
