import SwiftUI

struct FilmListCell: View {
    @Environment(Router<CinemaRoute>.self) private var cinemaRouter
    
    let film: Film
    private let durationFormatter: NumberFormatter = NumberFormatter()
    private let ratingFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(film.name)
                    .bold()
                HStack {
                    Text("Duration: ")
                        .bold()
                    Text("\(durationFormatter.string(for: film.duration)!) minutes")
                }
                Text(film.description)
                HStack {
                    Text("Rating: ")
                        .bold()
                    Text("\(ratingFormatter.string(for: film.rating)!)")
                }
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            cinemaRouter.go(to: .booking(film))
        }
    }
}

#Preview {
    FilmListCell(film: Film(id: "1", name: "Avengers Endgame", duration: 200, description: "Final movie of the Infinity Saga", rating: 5))
        .environment(Router<CinemaRoute>())
}
