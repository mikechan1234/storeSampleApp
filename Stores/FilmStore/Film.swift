//{
//    "id": "1",
//    "name": "Avengers Endgame",
//    "duration": 200,
//    "description": "Final movie of the Infinity Saga",
//    "rating": 5,
//    "posterURL": "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg"
//}

import Foundation

struct Film: Identifiable, Decodable, Hashable, Equatable {
    let id: String
    let name: String
    let duration: Double
    let description: String
    let rating: Float
    let posterURL: URL
}

