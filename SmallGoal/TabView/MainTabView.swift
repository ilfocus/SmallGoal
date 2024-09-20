//
//  MainView.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/20.
//

import SwiftUI

enum Tab {
    case home
    case all
    case set
}

struct SearchView: View {
    var body: some View {
        Text("这是搜索页")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("这是个人资料页")
    }
}

struct MainTabView: View {
    @State private var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
               .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }
               .tag(Tab.home)
            
            TDAllView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("搜索")
                }
                .tag(Tab.all)

            NavigationView {
                ProfileView()
            }
           .tabItem {
                Image(systemName: "person")
                Text("个人资料")
            }
           .tag(Tab.set)
        }
    }
}

#Preview {
    MainTabView()
}
