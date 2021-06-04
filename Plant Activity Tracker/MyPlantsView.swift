//
//  MyPlantsView.swift
//  Plant Activity Tracker
//
//  Created by Pavel on 6/1/21.
//

import SwiftUI

struct MyPlantsView: View {
    @State var searchText = ""
    @State var isActive: Bool = false
    
    var plants = [
        Plants(title: ConfigValues.get().MyPlant1.title, image: ConfigValues.get().MyPlant1.image),
        Plants(title: ConfigValues.get().MyPlant2.title, image: ConfigValues.get().MyPlant2.image),
        Plants(title: ConfigValues.get().MyPlant3.title, image: ConfigValues.get().MyPlant3.image)
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            List(plants.filter({ "\($0)".contains(searchText.lowercased()) || searchText.isEmpty })) { plants in
                NavigationLink(
                    destination: DetailedView(rootIsActive: self.$isActive),
                    isActive: self.$isActive,
                    label: {
                        HStack {
                            Image(plants.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(15)
                            
                            Text(plants.title.capitalized)
                        }
                    })
            }
        }
        .navigationTitle("My Plants")
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}


struct Plants: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}
