import SwiftUI

struct FilmBookingView: View {
    let film: Film 
    var body: some View {
        Text(film.name)
            .navigationTitle(film.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}
