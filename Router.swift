import SwiftUI
import Observation

@Observable
class Router<T: Hashable> {
    var route: [T] = []
    
    func go(to destination: T) {
        self.route.append(destination)
    }
}
