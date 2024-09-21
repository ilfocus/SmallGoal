//
//  AddFloatButton.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct AddFloatButton: View {
    private let action: () -> Void
    init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: action) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: .gray, radius: 2.0)
                }
                .offset(x: -32, y: -16)
            }
        }
    }
}

#Preview {
    AddFloatButton()
}
