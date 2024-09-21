//
//  HomeView.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct HomeView: View {
    @State private var hideCompletedTasks: Bool = true
    @State private var showAddToDo: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("是否隐藏已完成")
                        Toggle("", isOn: $hideCompletedTasks.animation())
                            .tint(Color.blue)
                    }
                    .background(Color.white)
                    .cornerRadius(16.0)
                    .padding([.horizontal], 16.0)
                    
                    Spacer()
                    
                    ZStack {
                        ScrollView(.vertical, showsIndicators: true) {
                            VStack(alignment: .leading) {
                                Text("当前目标")
                                    .padding([.horizontal], 16)
                                    .foregroundColor(Color.gray)
                                Divider()
                                ForEach(0..<3) { index in
                                    TaskRow(isSelect: false) {
                                        
                                    }
                                }
                            }
                            
                            if !hideCompletedTasks {
                                VStack(alignment: .leading) {
                                    Text("完成目标")
                                        .padding([.horizontal], 16)
                                        .foregroundColor(Color.gray)
                                    Divider()
                                    ForEach(0..<3) { index in
                                        TaskRow(isSelect: true) {
                                            
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        
                        AddFloatButton {
                            self.showAddToDo = true
                        }
                    }
                }
            }
            .navigationTitle("小目标")
        }
        .sheet(isPresented: $showAddToDo) {
            AddToDo()
        }
    }
}

#Preview {
    HomeView()
}
