//
//  HomeView.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

struct HomeView: View {
    @State private var hideCompletedTasks: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Text("Hide Compeleted Tasks")
                        Toggle("", isOn: $hideCompletedTasks.animation())
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(16.0)
                    .padding([.horizontal], 16.0)
                    
                    Spacer()
                    
                    ZStack {
                        ScrollView(.vertical, showsIndicators: true) {
                            ForEach(0..<10) { index in
                                TaskRow(isSelect: false) {
                                    
                                }
                                .contextMenu {
                                    Button {
                                        print("删除")
                                    } label: {
                                        Text("Delete")
                                    }

                                }
                            }
                        }
                        
                        AddFloatButton {
                            
                        }
                    }
                }
            }
            .navigationTitle("小目标")
        }
    }
}

#Preview {
    HomeView()
}
