import SwiftUI

struct CinemaDetailView: View {
    let cinema: Cinema
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(cinema.name)
                    .bold()
                Text(cinema.location)
                    .italic()
                Text(cinema.description)
                HStack {
                    Text("Has dynamic pricing:")
                    Text(cinema.hasDynamicPricing ? "Yes" : "No")
                        .bold()
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            FilmList(cinemaId: cinema.id)
            Spacer()
        }

        .navigationTitle("Cinema")
    }
}

#Preview {
    CinemaDetailView(cinema: Cinema(id: "1", name: "Vue Finchley Lido", location: "North Finchley", description: "Has facilities nearby such as swimming pool, restaurants and a car park", hasDynamicPricing: false))
        .environment(\.filmStore, FilmStore(filmFetcher: FilmRepository()))
}
