//
//  RotatingArrow.swift
//  ComposableViewsAndAnimations
//
//  Created by Winston Wang on 2022-04-28.
//

import SwiftUI

struct RotatingArrow: View {
    //MARK: stored properties
    //1. starting state of rotaion for the arrow
    @State var rotaionAMount = 0.0
    
    //2. create a timer to trgiger the state change after 2.5 secs
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    
    //MARK: computed properties
    var body: some View {
        Image(systemName: "arrow.clockwise")
            .resizable()
            .frame(width: 40, height: 40)
        //using the property to rotate the image
            .rotation3DEffect(.degrees(rotaionAMount), axis: (x:0, y:0, z:1))
        
        //anime the change
            .animation(Animation
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false)
            )
        
        //use the timer
            .onReceive(timer){ input in
                // 3. change the rotation amount of the arrow
                rotaionAMount = 360.0
            }
        
    }
}

struct RotatingArrow_Previews: PreviewProvider {
    static var previews: some View {
        RotatingArrow()
    }
}
