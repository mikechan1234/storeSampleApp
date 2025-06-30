import SwiftUI

struct FilmBookingView: View {
    @Environment(\.filmFormatter) private var filmFormatter: FilmFormatter

    let film: Film
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(film.name).bold()
            HStack {
                Text("Duration: ")
                    .bold()
                Text(filmFormatter.formatDuration(Int(film.duration)))
            }
            Text(film.description)
            HStack {
                Text("Rating: ")
                    .bold()
                Text(filmFormatter.formatRating(Double(film.rating)))
            }
            SeatingList()
        }
        .padding()
        .containerRelativeFrame([.horizontal, .vertical], alignment: .topLeading)
        .navigationTitle(film.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilmBookingView(
        film: Film(id: "1", name: "Avengers Endgame", duration: 180, description: "Final movie of the Infinity Saga", rating: 5, posterURL: URL(string: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg")!))
    .environment(\.filmFormatter, FilmFormatter())
}
