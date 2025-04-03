import SwiftUI

protocol CinemaFetchable {
    func cinema() async throws -> [Cinema] 
}

struct CinemaRepository: CinemaFetchable {
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func cinema() async throws -> [Cinema] {        
        guard let fileUrl = Bundle.main.url(forResource: "Cinemas", withExtension: "json") else { 
            fatalError("Can't load the JSON")
        }
        let data = try! Data(contentsOf: fileUrl)
        do {
            return try decoder.decode([Cinema].self, from: data)
        } catch {
            print(error)
            return []
        }
    }   
}
