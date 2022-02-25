class MovieEndpoints {
  static String api(String apiKey) =>
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1";
}
