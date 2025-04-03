import SwiftUI

struct FilmListSectionHeader: View {
    var body: some View {
        HStack {
            Text("Films")
                .bold()
            Spacer()
        }
        .padding(.leading)
    }
}
