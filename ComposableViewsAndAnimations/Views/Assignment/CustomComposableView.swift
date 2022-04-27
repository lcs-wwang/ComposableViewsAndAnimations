
//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Winston Wang on 2022-04-26.
//

import SwiftUI
import UIKit

struct CustomComposableView: View {
    //MARK: stored properties
    
    @State var xOffset = -100.0
    
    // a trigger to start anumation
    let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    @State var rotationAmount = 0.0
    
    //MARK: computed properties
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
            
            
            
            Text("OK")
                .foregroundColor(.white)
                .offset(x: 2)
            
        }
        .rotationEffect(.degrees(rotationAmount), anchor: .center)
        .offset(x: xOffset, y: 0)
        .onReceive(timer) { input in
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true)
            ) {
                
                xOffset = 100.0
                
                //turn once
                rotationAmount = 720.0
            }
            
            //move text and circle to the right
            
            
            
            //turn off it
            timer.upstream.connect().cancel()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider{
    static var previews: some View{
        CustomComposableView(rotationAmount: 3)
    }
}
