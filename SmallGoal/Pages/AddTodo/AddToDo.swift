//
//  AddToDo.swift
//  SwiftUIToDo
//
//  Created by 王齐 on 2024/9/18.
//

import SwiftUI

struct AddToDo: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name: String = ""
    @State private var notes: String = ""
    
//    @State private var priority: PriorityType = .none
    @State private var priority: Int = 0
    
    @State private var isDeadlineOn: Bool = false
    @State private var date = Date()
    
    @State private var isImportant: Bool = true
    @State private var listName: String = "Inbox"
    @State private var tag: String = "内务"
    
    let placeholder: String = "请输入描述..."
    let textWidth = UIScreen.main.bounds.width - 60
    @State private var textEditorHeight: CGFloat = 16 // 初始高度，单行高度
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    TextField("目标是什么?", text: $name)
                        .font(Font.system(size: 15))
//                        .frame(width: textWidth)
                    TextField("描述", text: $notes)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color.gray)
//                    ZStack(alignment: .topLeading) {
//                        if notes.isEmpty {
//                            VStack {
//                                Spacer().frame(height: 2.0)
//                                Text(placeholder)
//                                   .foregroundColor(.gray.opacity(0.6))
//                                   .font(Font.system(size: 12.0))
//                                   .padding(.horizontal, 3)
//                                Spacer().frame(height: 2.0)
//                            }
//                        }
//                        
//                        TextEditor(text: $notes)
//                            .frame(width: textWidth, height: textEditorHeight)
//                            .opacity(notes.isEmpty ? 0.5 : 1)
//                            .font(Font.system(size: 12.0))
//                            .foregroundColor(Color.gray)
//                            .onChange(of: notes) { _ in
//                                updateHeightForTextEditor()
//                            }
//                    }
                }
                
                Section(header: Text("详细信息")) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(.red)
                        Text("优先级")
                            .font(Font.system(size: 15))
                        Picker(selection: $priority, label: Text("优先级")) {
                            Text("高").tag(0)
                            Text("中").tag(1)
                            Text("低").tag(2)
                            Text("无").tag(4)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                        
                    Toggle(isOn: $isDeadlineOn) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.blue)
                            Text("截止日期")
                        }
                        
                    }
                    
                    if isDeadlineOn {
                        DatePicker(selection: $date,
                                   displayedComponents: .date) {
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.blue)
                                Text("日期")
                            }
                            
                        }
                    }
                    
                    HStack {
                        Image(systemName: "tag")
                            .foregroundColor(.brown)
                        Text("标签")
                        Spacer()
                        Text(tag)
                    }
                    
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.orange)
                        Text("分类")
                        Spacer()
                        Text(listName)
                    }
                }
            }
            .navigationBarTitle("添加目标", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                addToListClick()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("添加")
            })
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("取消")
            })
        }
    }
}

// MARK: click fuction
extension AddToDo {
    func addToListClick() {
//        ToDoDBManager.shared.addToDo(title: name,
//                                     detail: notes,
//                                     taskState: .plan,
//                                     priority: .high,
//                                     date: "2024-09-23",
//                                     time: "23:45",
//                                     tag: "我的任务",
//                                     list: "工作")
        let model = TodoModel(context: viewContext)
        model.title = name
        model.detail = notes
        model.taskState = Int16(TaskState.plan.rawValue)
        model.priority = Int16(PriorityType.high.rawValue)
        model.date = "2024-09-23"
        model.time = "23:45"
        model.tag = "我的任务"
        model.list = "我的工作"
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
//    private func updateHeightForTextEditor() {
//        // 使用隐藏的 Text 来计算内容高度
//        let textHeight = notes.boundingRect(
//            with: CGSize(width: textWidth, height: .greatestFiniteMagnitude),
//            options: .usesLineFragmentOrigin,
//            attributes: [.font: UIFont.systemFont(ofSize: 12)],
//            context: nil
//        ).height
//
//        // 给 textEditorHeight 加上一些额外的 padding 以适应多行
//        textEditorHeight = max(16, textHeight + 18)
//    }
}

#Preview {
    AddToDo()
}
