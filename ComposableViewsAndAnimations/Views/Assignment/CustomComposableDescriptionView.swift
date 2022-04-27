//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: CGFloat = 0
    @State private var percentComplete: CGFloat = 50.0
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    This view makes a circle roll. Enter an amount of rotation that should occur.
                    """)
                
                Text("Enter rotation degree")
                Slider(value: $percentComplete, in: 0...100, step: 1.0) {
                    Text("Completion amount")
                }
                
            }
            .padding(.bottom)

            List{
                NavigationLink(destination: CustomComposableView( rotationAmount: phrase)){
                    SimpleListItemView(title: "Completion Meter",
                                       caption: "Will illustrate fill to \(String(format: "%.0f", percentComplete))%")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
