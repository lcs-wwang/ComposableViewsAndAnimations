
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
    @State var currentColor: Color = .blue

    @State var xOffset: CGFloat = 0.0
    
    @State private var size: CGFloat = 200.00
    var body: some View {
        VStack{
            Image(systemName: "x.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .offset(x: xOffset, y: 0)
                .foregroundColor(currentColor)
            
            
                
                .onTapGesture {
                    withAnimation(
                     Animation
                        .interpolatingSpring(stiffness: 1000, damping: 0.5)
                     
                    ) {
                        xOffset = 5
                        size = 100
                    }
                    currentColor = .red
                    

                }
            
        }
    }
}
struct CustomComposableView_Previews: PreviewProvider{
    static var previews: some View{
        CustomComposableView()
    }
}
