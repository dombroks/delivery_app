class Result<T> {
  Status status;
  T data;
  String message;
  
Result.loading(this.message) : status = Status.LOADING;
Result.completed(this.data) : status = Status.COMPLETED;
Result.error(this.message) : status = Status.ERROR;
  
@override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
