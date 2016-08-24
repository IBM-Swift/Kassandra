//
//  Student.swift
//  Kassandra
//
//  Created by Aaron Liberatore on 8/12/16.
//
//

import Foundation
import Kassandra

public final class Student {
    var id: UUID?
    var name: String
    var school: String
    
    init(id: UUID?, name: String, school: String) {
        self.id = id
        self.name = name
        self.school = school
    }
}
extension Student: Model, CustomStringConvertible {
    
    public enum Field : String {
        case id     = "id"
        case name   = "name"
        case school = "school"
    }
    
    public static var fieldTypes: [Field: DataType] {
        return [.id     : .uuid,
                .name   : .text,
                .school : .text ]
    }

    public var description: String {
        return "id: \(id!), name: \(name), school: \(school)"
    }
    public static var tableName: String = "student"
    
    public static var primaryKey: Field = Field.id
    
    public var key: UUID? {
        get { return self.id }
        set { id = newValue }
    }
    
    public convenience init(row: Row) {
        let id = row["id"] as? UUID
        let name = row["name"] as! String
        let school = row["school"] as! String
        
        self.init(id: id, name: name, school: school)
    }
    
}
public class TodoItem: Table {
    public enum Field: String {
        case type = "type"
        case userID = "userID"
        case title = "title"
        case pos = "pos"
        case completed = "completed"
    }
    
    public static var tableName: String = "todoitem"
    
}

public class BreadShop: Table {
    public enum Field: String {
        case type = "type"
        case userID = "userID"
        case time = "time"
        case bread = "bread"
        case cost = "cost"
        case rate = "rate"
    }
    
    public static var tableName: String = "breadshop"
    
}