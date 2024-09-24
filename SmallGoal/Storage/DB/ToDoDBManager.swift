//
//  ToDoDBManager.swift
//  SmallGoal
//
//  Created by qi wang on 2024/9/23.
//

import Foundation
import CoreData
import UIKit

class ToDoDBManager {
    static let shared = ToDoDBManager()
    
    private init() { }
    
//    func addToDo(title: String, detail: String, taskState: TaskState, priority: PriorityType, date: String, time: String, tag: String, list: String) {
//        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
//        guard let newToDo = NSEntityDescription.insertNewObject(forEntityName: "TodoModel", into: context) as? TodoModel else { return }
//        newToDo.title = title
//        newToDo.detail = detail
//        newToDo.taskState = Int16(taskState.rawValue) // taskState 存储为Int类型
//        newToDo.priority = Int16(priority.rawValue) // 将枚举类型转换为 Int16
//        newToDo.date = date
//        newToDo.time = time
//        newToDo.tag = tag
//        newToDo.list = list
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save ToDo: \(error.localizedDescription)")
//        }
//    }
//    
//    func fetchAllToDos() -> [TodoModel] {
//        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return [] }
//        let fetchRequest: NSFetchRequest<TodoModel> = TodoModel.fetchRequest()
//
//        do {
//            let todos = try context.fetch(fetchRequest)
//            return todos
//        } catch {
//            print("Failed to fetch ToDos: \(error.localizedDescription)")
//            return []
//        }
//    }
//    
//    func updateToDo(toDo: TodoModel, title: String, detail: String, taskState: TaskState, priority: PriorityType, date: String, time: String, tag: String, list: String) {
//        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
//        
//        toDo.title = title
//        toDo.detail = detail
//        toDo.taskState = Int16(taskState.rawValue)
//        toDo.priority = Int16(priority.rawValue)
//        toDo.date = date
//        toDo.time = time
//        toDo.tag = tag
//        toDo.list = list
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to update ToDo: \(error.localizedDescription)")
//        }
//    }
//
//    func deleteToDo(toDo: TodoModel) {
//        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
//        context.delete(toDo)
//        do {
//            try context.save()
//        } catch {
//            print("Failed to delete ToDo: \(error.localizedDescription)")
//        }
//    }
}
