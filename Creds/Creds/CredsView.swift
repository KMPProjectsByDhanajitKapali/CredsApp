import SwiftUI
import shared

struct CredsView: View {
    let greet = Greeting().greet()
    
    @StateObject var iCredsViewMdel = ICredsViewModel()
    
    @State private var selectedSegment = 0
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Picker("Segments", selection: $selectedSegment) {
                    Text("Frequent").tag(0)
                    Text("Credit").tag(1)
                    Text("Debit").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(filteredItems, id: \.self) { item in
                        CreditDebitCardView(
                            cardHolderName: item.name,
                            cardNumber: item.number,
                            cardCVV: item.cvv,
                            cardExpiry: item.cardExpiryDate,
                            cardLastUsedDate: item.cardLastUsed,
                            cardLastUsedInterval: Int(item.cardLastUsedInterval) as Int
                        )
                        .cornerRadius(20)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                    }
                }
                .listStyle(PlainListStyle())
                .searchable(text: $searchText) {
                    ForEach(filteredItems, id: \.self) { item in
                        CreditDebitCardView(
                            cardHolderName: item.name,
                            cardNumber: item.number,
                            cardCVV: item.cvv,
                            cardExpiry: item.cardExpiryDate,
                            cardLastUsedDate: item.cardLastUsed,
                            cardLastUsedInterval: Int(item.cardLastUsedInterval) as Int
                        )
                        .cornerRadius(20)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                    }
                }
                .navigationTitle("Creds")
            }
            .onChange(of: selectedSegment) { _ in
                // Handle segment change if needed
            }
        }
    }
    
    private var filteredItems: [CreditDebitModel] {
        if searchText.isEmpty {
            return credList(for: selectedSegment)
        } else {
            return credList(for: selectedSegment).filter { cred in
                return cred.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func credList(for segment: Int) -> [CreditDebitModel] {
        switch segment {
        case 0:
            return iCredsViewMdel.credList.sorted { a, b in
                let dateA = a.cardLastUsedInterval
                let dateB = b.cardLastUsedInterval
                
                return dateA < dateB
            }
        case 1:
            return iCredsViewMdel.credList.filter({$0.type == .credit})
        case 2:
            return iCredsViewMdel.credList.filter({$0.type == .debit})
        default:
            return []
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CredsView()
    }
}
