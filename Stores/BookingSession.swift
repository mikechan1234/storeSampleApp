import Observation

@Observable
class BookingSession {
    let film: Film
    
    init(film: Film) {
        self.film = film
    }
}
