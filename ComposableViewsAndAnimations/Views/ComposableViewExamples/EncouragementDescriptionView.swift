//
//  EncouragementDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct EncouragementDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
    // MARK: Computed properties
    var body: some View {
        
        List {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("""
                        Many games or apps include reactions to how a player is faring.

                        This is an example of a fun animation to encourage a user.

                        Type a short phrase, like "Wow!" or "Super!" and try it out.
                        """)
                    .minimumScaleFactor(0.5)
                    
                    TextField("Enter some encouragement", text: $phrase)
                    
                }
                .padding(.bottom)
                
            }
            
            NavigationLink(destination: EncouragementView(message: phrase)) {
                SimpleListItemView(title: "Encouragement",
                                   caption: "The animation will say: \(phrase)")
            }
            
        }
        .padding()
        .navigationTitle("Encouragement")
        
    }
}

struct EncouragementDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EncouragementDescriptionView()
        }
    }
}
