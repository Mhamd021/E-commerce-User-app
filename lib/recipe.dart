class Recipe {
String label;
String imageurl;
Recipe(
this.label,
this.imageurl,
);
static List<Recipe> samples = [
Recipe(
 'Spaghetti and Meatballs',
 'assets/a.jpg',
 ),
 Recipe(
 'Tomato Soup',
 'assets/b.jpg',
 ),
 Recipe(
 'Grilled Cheese',
 'assets/d1.jpg',
 ),
 Recipe(
 'Chocolate Chip Cookies',
 'assets/c.jpg',
 ),

Recipe(
 'Taco Salad',
 'assets/a.jpg',
 ),
 Recipe(
 'Hawaiian Pizza',
 'assets/c.jpg',
 ),
];


}// await GetStorage.init();
  //ApiClient.initializeInterceptors();