
//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI
import UIKit

struct CustomComposableView2: View {
    
    //MARK: computed properties
    @State var currentColor: Color = .blue
    @State var selected = false
    @State private var xOffset: CGFloat = 0.0
    var body: some View {
        VStack{
            Image(systemName: "x.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
                .animation(.default.repeatCount(5))
                
                .onTapGesture {
                    xOffset = CGFloat.random(in: -30...30)
                   let originalColor = currentColor
                    repeat{
                        currentColor = .red
                    } while originalColor == currentColor
                }
            
        }
    }
}

struct CustomComposableView2_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView2()
    }
}
