//
//  ExplicitAnimationsView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct ExplicitAnimationsView: View {
    
    // MARK: Stored properties
    
    // Controls what example is showing in the pop-up sheet
    @State private var showExampleOne = false

    // MARK: Computed properties
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    // Example 1
                    // Explicit animation, only a change to a specific property is updated
                    Group {

                        Text("Example 1")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        Text("""
                            In this animation, we explicitly identify when a state change should be animated. Notice how when the type face changes, the change in the bounding box is no longer animated, but the position (offset) of the text is.

                            This also illustrates a different animation type (interpolating spring) which means the view will bounce back and forth a few times before reaching it's final position.
                            """)
                        
                        Button("Show Example 1") {
                            showExampleOne = true
                        }

                    }

                    
                }
                .padding(.bottom)

            }

        }
        .padding()
        .navigationTitle("Explicit Animations")
        .sheet(isPresented: $showExampleOne) {
            EAExampleOneView(showThisView: $showExampleOne)
        }

    }
}

struct ExplicitAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExplicitAnimationsView()
        }
    }
}
