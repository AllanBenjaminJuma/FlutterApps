//this will contain our modal class that will have the properties, methods and
//constructors for the ToDo objects. We don't import anything here.
class Todo {
  int _id; //underscore to mark this private
  String _title;
  String _descritption;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._descritption]);
  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._descritption]);
  int get id => _id;
  String get title => _title;
  int get priority => _priority;
  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String description) {
    if (description.length <= 255) {
      _title = description;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _descritption;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    this._id = o["id"];
    this._title = o["title"];
    this.description = o["description"];
    this.date = o["date"];
    
  }
}
