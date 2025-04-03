import SwiftUI

//{
//    "id": "1",
//    "name": "Vue Finchley Lido",
//    "location": "North Finchley"
//    "description": "Has facilities nearby such as swimming pool, restaurants and a car park",
//    "hasDynamicPricing": false
//},
struct Cinema: Identifiable, Decodable, Equatable, Hashable {
    let id: String
    let name: String
    let location: String
    let description: String
    let hasDynamicPricing: Bool
}
