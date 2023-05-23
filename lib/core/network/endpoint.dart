class Endpoint {
  static const baseUrl = 'https://rickandmortyapi.com/api/';

  static characters(int pageNo) => '$baseUrl/character?page=$pageNo';
}
