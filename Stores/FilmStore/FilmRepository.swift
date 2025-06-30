import Foundation

protocol FilmFetchable {
    func getFilms(at cinemaID: String) async throws -> [Film]
}

struct FilmRepository: FilmFetchable {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func getFilms(at cinemaID: String) async throws -> [Film] {
        guard let fileUrl = Bundle.main.url(forResource: "Films", withExtension: "json") else {
            fatalError("Cannot load JSON")
        }
        
        do {
            let data = try Data(contentsOf: fileUrl)
            return try decoder.decode([Film].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

