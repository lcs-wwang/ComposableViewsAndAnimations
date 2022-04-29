
//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Winston Wang on 2022-04-26.
//

import SwiftUI
import UIKit

struct CustomComposableView: View {
    //MARK: computed properties
    @State var currentColor: Color = .black
    @State var xOffset: CGFloat = 0.0
    @State var scaleFactor = 1.0
    @State var fillImageOpacity = 0.0
    @State var unfillImageOpacity = 1.0
    var body: some View {
        ZStack{
            
            // filled image
            Image(systemName: "x.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .offset(x: xOffset, y: 0)
                .scaleEffect(scaleFactor)
                .foregroundColor(currentColor)
            
                .onTapGesture {
                    withAnimation(
                        Animation
                            .interpolatingSpring(stiffness: 2000, damping: 6)
                    ) {
                        xOffset = 5
                        unfillImageOpacity = 1.0
                        fillImageOpacity = 0.0
                    }
                    currentColor = .red
                    scaleFactor = 2.0
                    
                }
            // unfilled image
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .offset(x: xOffset, y: 0)
                .scaleEffect(scaleFactor)
                .foregroundColor(currentColor)
                .opacity(unfillImageOpacity)
            onTapGesture {
                withAnimation(
                    Animation
                        .interpolatingSpring(stiffness: 2000, damping: 6)
                ) {
                    xOffset = 5
                    unfillImageOpacity = 0.0
                    fillImageOpacity = 1.0
                }
                currentColor = .red
                scaleFactor = 2.0
                
            }
        }
    }
}
struct CustomComposableView_Previews: PreviewProvider{
    static var previews: some View{
        CustomComposableView()
    }
}
