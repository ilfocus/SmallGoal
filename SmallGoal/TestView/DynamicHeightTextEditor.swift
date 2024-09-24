//
//  DynamicHeightTextEditor.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/24.
//

import SwiftUI

struct DynamicHeightTextEditor: View {
    @State private var text: String = ""
    @State private var textEditorHeight: CGFloat = 30 // 初始高度，单行高度
    let placeholder: String = "请输入内容..."
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.gray)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 8)
                }
                
                TextEditor(text: $text)
                    .frame(height: textEditorHeight)
                    .padding(4)
                    .opacity(text.isEmpty ? 0.5 : 1)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                    .onChange(of: text) { _ in
                        updateHeightForTextEditor()
                    }
            }
            .padding()
            .border(Color.gray, width: 1)
        }
        .padding()
        .background(GeometryReader { geometry in
            Color.clear.onAppear {
                updateHeightForTextEditor()
            }
        })
    }

    private func updateHeightForTextEditor() {
        // 使用隐藏的 Text 来计算内容高度
        let textHeight = text.boundingRect(
            with: CGSize(width: UIScreen.main.bounds.width - 32, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 17)],
            context: nil
        ).height

        // 给 textEditorHeight 加上一些额外的 padding 以适应多行
        textEditorHeight = max(30, textHeight + 16)
    }
}


#Preview {
    DynamicHeightTextEditor()
}
