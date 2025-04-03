protocol FilmFetchable {
    func getFilms(at cinemaID: String) async throws -> [Film]
}
struct FilmRepository: FilmFetchable {
    func getFilms(at cinemaID: String) async throws -> [Film] {
//        try await Task.sleep(until: .now + .seconds(1))
        return [
            Film(id: "1", name: "Avengers Endgame", duration: 200, description: "Final movie of the Infinity Saga", rating: 5),
            Film(id: "2", name: "The Dark Knight", duration: 120, description: "First movie in a trilogy of Batman movies directed by Christopher Nolan", rating: 4.5),
            Film(id: "3", name: "Spiderman: No Way Home", duration: 180, description: "Spiderman's first outing in a school trip to Europe", rating: 4)
        ]
    }
}

