//
//  RotatingArrow.swift
//  ComposableViewsAndAnimations
//
//  Created by Winston Wang on 2022-04-28.
//

import SwiftUI

struct RotatingArrow: View {
    var body: some View {
        Image(systemName: "arrow.clockwise")
            .resizable()
            .frame(width: 40, height: 40)
    }
}

struct RotatingArrow_Previews: PreviewProvider {
    static var previews: some View {
        RotatingArrow()
    }
}
