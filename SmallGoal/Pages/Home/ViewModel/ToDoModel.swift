//
//  ToDoModel.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/22.
//

import Foundation

struct ToDoModel {
    var title: String = ""
    var detail: String = ""
    var taskState: TaskState = .plan
    var priority: PriorityType = .none
    var date: String = ""   // format: "YYYY-MM-DD"
    var time: String = ""   // format: "HH:MM:SS"
    var tag: String = ""    // eg. "life"
    var list: String = ""
}


enum PriorityType: Int {
    case high
    case middle
    case low
    case none
}

enum TaskState {
    case plan
    case finish
    case overdue
}
