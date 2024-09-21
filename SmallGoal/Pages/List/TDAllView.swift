//
//  AllTodoView.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct TDAllView: View {
    var body: some View {
        NavigationView {
            VStack {
                AllListView()
            }  // 这里将字体大小设置为 18，您可以根据需要调整
            .navigationTitle("全部")
            .navigationBarTitleDisplayMode(.inline)
            .font(Font.system(size: 18))
            .navigationBarItems(trailing: Button("编辑") {
                print("click edit")
            })
        }
    }
}

#Preview {
    TDAllView()
}

struct AllListView: View {
    var body: some View {
        List {
            // Section: Smart Lists
            Section(header: Text("智能列表").font(.caption).foregroundColor(.gray)) {
                NavigationLink(destination: FinishTodoView()) {
                    HStack {
                        Image(systemName: "calendar.circle.fill")
                            .foregroundColor(.red)
                        Text("已计划")
                        Image(systemName: "1.circle.fill")
                            .foregroundColor(.red)
                            .font(.caption)
                        Spacer()
                        Text("2")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "doc.text.fill")
                        .foregroundColor(.blue)
                    Text("全部")
                    Spacer()
                    Text("2")
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.gray)
                    Text("已完成")
                    Spacer()
                    Text("1")
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            
            // Section: My Lists
            Section(header: HStack {
                Text("我的列表").font(.caption).foregroundColor(.gray)
                Spacer()
                Button (action: {
                    print("Add button tapped in smart Lists")
                }) {
                    Text("+")
                        .font(.system(size: 20, weight: .regular)) // 设置字体和大小
                        .foregroundColor(Color.blue) // 使用深蓝色，调整透明度
                }
            }) {
                HStack {
                    Image(systemName: "tray.fill")
                        .foregroundColor(.blue)
                    Text("Inbox")
                    Spacer()
                    Text("1")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image(systemName: "tray.fill")
                        .foregroundColor(.blue)
                    Text("对外事务")
                    Spacer()
                    Text("1")
                        .foregroundColor(.gray)
                }
            }
            
            // Section: My Tags
            Section(header: HStack {
                Text("我的标签").font(.caption).foregroundColor(.gray)
                Spacer()
                Button (action: {
                    print("Add button tapped in smart Lists")
                }) {
                    Text("+")
                        .font(.system(size: 20, weight: .regular)) // 设置字体和大小
                        .foregroundColor(Color.blue) // 使用深蓝色，调整透明度
                }
            }) {
                HStack {
                    Image(systemName: "tag.fill")
                        .foregroundColor(.brown)
                    Text("内务")
                    Spacer()
                    Text("0")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
