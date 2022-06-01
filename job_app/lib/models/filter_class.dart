class FilterClass{

  List<String> category (Map<String, dynamic> data){
    final List<String> category = [];
    for(int i = 0; i < data.keys.length; i++){
      category.add(data.keys.elementAt(i));
    }
    return category;
  }

  List<String> subCategory (Map<String, dynamic> data, int index){
    final List<String> subCategory = [];
    for(int i = 0; i < data.values.elementAt(index).length; i++){
      subCategory.add(data.values.elementAt(index)[i]);
    }
    return subCategory;
  }

  List<String> location (List<dynamic> data){
    final List<String> location = [];
    for(int i = 0; i < data.length; i++){
      location.add(data[i].toString());
    }
    return location;
  }

}