class Recipe {
  int servings;
  List<Ingredient> ingredients;
  String label; String imageUrl;
  // TODO: Add servings and ingredients here
  Recipe(this.label, this.imageUrl, this.servings, this.ingredients,);
  // TODO: Add List<Recipe> here
  static List<Recipe> samples = [
    Recipe( 'Spaghetti and Meatballs', 'assets/2126711929_ef763de2b3_w.png',4,
      [
        Ingredient(1.0, 'box', 'Spaghetti'),
        Ingredient(4.0, '', 'Frozen Meatballs'),
        Ingredient(0.5, 'jar', 'sauce'),
      ], ),
  Recipe( 'Tomato Soup', 'assets/27729023535_a57606c1be.png',2,
    [
      Ingredient(1.0, 'can', 'Tomato Soup'),
    ], ),
  Recipe( 'Grilled Cheese', 'assets/3187380632_5056654a19_b.png', 1,
    [
      Ingredient(2.0, 'slices', 'Cheese'),
      Ingredient(2.0, 'slices', 'Bread'),
    ],),
  Recipe( 'Chocolate Chip Cookies', 'assets/15992102771_b92f4cc00a_b.png', 24,
    [
      Ingredient(4.0, 'cups', 'flour'),
      Ingredient(2.0, 'cups', 'sugar'),
      Ingredient(0.5, 'cups', 'chocolate chips'),
    ],),
    Recipe(
      'Taco Salad',
      'assets/8533381643_a31a99e8a6_c.png', 1,
      [
        Ingredient(4.0, 'oz', 'nachos'),
        Ingredient(3.0, 'oz', 'taco meat'),
        Ingredient(0.5, 'cup', 'cheese'),
        Ingredient(0.25, 'cup', 'chopped tomatoes'),
      ],
    ),
    Recipe(
      'Hawaiian Pizza',
      'assets/15452035777_294cefced5_c.png', 4,
      [
        Ingredient(1.0, 'item', 'pizza'),
        Ingredient(1.0, 'cup', 'pineapple'),
        Ingredient(8.0, 'oz', 'ham'),
      ],
    ),
  ];
}
class Ingredient {
  double quantity;
  String measure;
  String name;
  Ingredient(this.quantity, this.measure, this.name);
}

