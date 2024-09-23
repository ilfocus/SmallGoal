//
//  AddToDo.swift
//  SwiftUIToDo
//
//  Created by 王齐 on 2024/9/18.
//

import SwiftUI

struct AddToDo: View {
    @State private var name: String = ""
    @State private var notes: String = ""
    
    @State private var priority: PriorityType = .none
    
    @State private var isDeadlineOn: Bool = false
    @State private var date = Date()
    
    @State private var isImportant: Bool = true
    @State private var listName: String = "Inbox"
    @State private var tag: String = "内务"
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    TextField("目标是什么?", text: $name)
                        .font(Font.system(size: 15))
                    TextField("描述", text: $notes)
                        .font(Font.system(size: 12))
                        .foregroundColor(Color.gray)
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
        ToDoDBManager.shared.addToDo(title: name,
                                     detail: notes,
                                     taskState: .plan,
                                     priority: .high,
                                     date: "2024-09-23",
                                     time: "23:45",
                                     tag: "我的任务",
                                     list: "工作")
        
    }
}

#Preview {
    AddToDo()
}
