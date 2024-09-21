//
//  TaskRow.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct TaskRow: View {
    @State var isSelect: Bool = true
    @State var opacity: Double = 0.0
    
    private let onTapCompleted: () -> Void
    
    init(isSelect: Bool, onTapCompleted: @escaping () -> Void) {
        self.isSelect = isSelect
        self.onTapCompleted = onTapCompleted
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 16.0) {
                Image(systemName: isSelect ? "checkmark.square" : "square")
                    .foregroundColor(Color.gray)
                    .imageScale(.large)
                    .onTapGesture {
                        self.isSelect.toggle()
                    }
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("目标")
                        .strikethrough(isSelect, color:.gray)
                        .foregroundColor(isSelect ? Color.gray : Color.black)
                        .font(.subheadline)
                        .lineLimit(1)
                    Text("内容详细说明")
                        .strikethrough(isSelect, color: .gray)
                        .foregroundColor(Color.gray)
                        .font(.footnote)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .layoutPriority(1)
                Spacer()
            }
        }
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

struct StrikethroughText: View {
    var text: String

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Path { path in
                path.move(to: CGPoint(x: 0, y: 10))
                path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 10))
            }
           .stroke(Color.gray, lineWidth: 2)
        }
    }
}

#Preview {
    TaskRow(isSelect: false) {}
}
