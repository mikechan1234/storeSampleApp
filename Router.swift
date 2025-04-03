import SwiftUI
import Observation

@Observable
//class Router<T: Hashable> {
class Router<T: Hashable>: ObservableObject {
    var route: [T] = []
    
    func go(to destination: T) {
        self.route.append(destination)
    }
}
