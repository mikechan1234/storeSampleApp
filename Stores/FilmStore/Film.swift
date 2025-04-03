struct Film: Identifiable, Decodable, Hashable, Equatable {
    let id: String
    let name: String
    let duration: Double
    let description: String
    let rating: Float
}

