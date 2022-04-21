//
//  EAExampleOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct EAExampleOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls the size of the circle
    @State private var offset: CGFloat = -200.0
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"

    // Whether to apply the animation
    @State private var useAnimation = false

    // MARK: Computed properties

    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text(typeFace)
                    .font(.custom(typeFace, size: 30.0))
                    .border(Color.blue, width: 1.0)
                    .offset(x: 0, y: offset)
                    .onTapGesture {

                        // Move the text down by whatever the value of "offset" is
                        // This state change will be animated
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 1.0, damping: 0.75, initialVelocity: 10)) {
                            offset += 50
                        }
                        
                        // Change the type face - this won't be animated, because it
                        // is not included in the withAnimation block above
                        typeFace = EAExampleOneView.fontNames.randomElement()!
                        
                    }
                
            }
            .navigationTitle("Example 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct EAExampleOneView_Previews: PreviewProvider {
    static var previews: some View {
        EAExampleOneView(showThisView: .constant(true))
    }
}
