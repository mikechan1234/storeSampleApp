import SwiftUI

struct CinemaListCell: View {
//    @Environment(Router<CinemaRoute>.self) private var cinemaRouter
    @Environment(\.cinemaRouter) private var cinemaRouter
    let cinema: Cinema
    
    init(cinema: Cinema) {
        self.cinema = cinema
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(cinema.name).bold()
                Text(cinema.description)
            }
            .padding()
            .containerRelativeFrame(.horizontal, alignment: .leading)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            cinemaRouter.go(to: .details(cinema))
        }
    }
}

#Preview {
    CinemaListCell(cinema: Cinema(id: "1", name: "Vue Finchley Lido", location: "North Finchley", description: "Has facilities nearby such as swimming pool, restaurants and a car park", hasDynamicPricing: false))
//        .environment(Router<CinemaRoute>())
        .environment(\.cinemaRouter, Router<CinemaRoute>())
}
