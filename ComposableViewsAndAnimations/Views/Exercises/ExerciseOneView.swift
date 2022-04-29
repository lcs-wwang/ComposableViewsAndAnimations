//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation
    @State private var useAnimation = false
    
    //find a new position for the circle
    @State private var xOffset: CGFloat = 0.0
    @State private var yOffset: CGFloat = 0.0
    
    //list possible colors
    @State private var possibleColors: [Color] = [.red, .blue, .green, .yellow, .purple]
    @State private var currentColors: Color = .blue
    
    //control size of the circle
    @State private var size: CGFloat = 200.00

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .offset(x: xOffset, y: yOffset)
                    .animation(.default)
                    .onTapGesture {
                        //pick new offset for new position
                        xOffset = CGFloat.random(in: -100...100)
                        
                        
                        //pick new color
                        let lastColor = currentColors
                        repeat{
                            currentColors = possibleColors.randomElement()!
                        } while lastColor == currentColors
                        
                        size = CGFloat.random(in: 50...200)
                    }
                
            }
            .navigationTitle("Exercise 1")
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

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}
