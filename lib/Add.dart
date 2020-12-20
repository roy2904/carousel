class Carousell{
  String title,price,image;
  Carousell(String title,String  image,String price){
this.title = title;
this.price = price;
this.image = image;
  }



  String get getTitle{
    return title;
  } 
  set getTitle(String name){
    this.title = name;
  }

  String get getPrice{
    return price;
  } 
  set getPrice(String p){
    this.price = p;
  }

  String get getImage{
    return image;
  } 
  set getImage(String i){
    this.image = i;
  }

  
}