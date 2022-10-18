class Result<T> {
  T? _data;
  dynamic _error;

  Result._();

  factory Result.success(T data) {
    return Result._().._data = data;
  }

  factory Result.failed(dynamic error) {
    return Result._().._error = error;
  }

  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(dynamic error) failed,
  }) {
    final data = _data;
    final error = _error;

    if (data != null) {
      return success.call(data);
    } else if (error != null) {
      return failed.call(error);
    }
    return failed.call(error);
  }

  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(dynamic error)? failed,
  }) {
    final data = _data;
    final error = _error;

    if (data != null) {
      return success?.call(data);
    } else if (error != null) {
      failed?.call(error);
    }
    return null;
  }
}
