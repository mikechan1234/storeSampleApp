import SwiftUI

struct FilmListCell: View {
    @Environment(\.cinemaRouter) private var cinemaRouter
    @Environment(\.filmFormatter) private var filmFormatter
    
    let film: Film
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(film.name)
                    .bold()
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
            }
            .padding()
            .containerRelativeFrame(.horizontal, alignment: .leading)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            cinemaRouter.go(to: .booking(film))
        }
    }
}

#Preview {
    FilmListCell(film: Film(id: "1", name: "Avengers Endgame", duration: 200, description: "Final movie of the Infinity Saga", rating: 5, posterURL: URL(string: "https://upload.wikimedia.org/wikipedia/en/0/0d/Avengers_Endgame_poster.jpg")!))
        .environment(\.cinemaRouter, Router<CinemaRoute>())
        .environment(\.filmFormatter, FilmFormatter())
}
