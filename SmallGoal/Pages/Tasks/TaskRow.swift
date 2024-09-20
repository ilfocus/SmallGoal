//
//  TaskRow.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct TaskRow: View {
    @State var isSelect: Bool = false
    @State var opacity: Double = 0.0
    
    private let onTapCompleted: () -> Void
    
    init(isSelect: Bool, onTapCompleted: @escaping () -> Void) {
        self.isSelect = isSelect
        self.onTapCompleted = onTapCompleted
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 16.0) {
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("目标")
                        .font(.headline)
                        .lineLimit(1)
                    Text("内容详细说明")
                        .font(.footnote)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .layoutPriority(1)
                
                Spacer()
                
                Image(systemName: isSelect ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .onTapGesture {
                        self.isSelect.toggle()
                    }
            }
        }
        .padding()
        .background(Color.green)
        .cornerRadius(16.0)
        .padding([.horizontal], 16.0)
        .padding([.bottom], 8.0)
        .opacity(opacity)
        .onAppear {
            withAnimation {
                self.opacity = 1.0
            }
        }
    }
}

#Preview {
    TaskRow(isSelect: false) {}
}
