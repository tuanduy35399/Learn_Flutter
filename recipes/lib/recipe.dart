class Recipe {
  String label;
  String imageURL;
  Recipe(this.label, this.imageURL); //Đây là hàm khởi tạo
//this.label,.. là cách viết ngắn gọn để yêu cầu khi gọi hàm này thì cần truyền đủ 2 tham số trên

//Tao 1 list cac thuc don
static List<Recipe> dsThucDon = [
  Recipe("Spaghetti and Meatballs", "../assets/Spaghetti and Meatballs.png"),
  Recipe("Tomato Soup", "../assets/Tomato Soup.png"),
  Recipe("Grilled Cheese", "../assets/Grilled Cheese.png"),
];
}