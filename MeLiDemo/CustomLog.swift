//
//  CustomLog.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 20/09/22.
//

import Foundation
import CoreVideo

enum Log {
    
    enum LogLevel {
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .info: return "INFO ℹ️"
            case .warning: return "WARN ⚠️"
            case .error: return "ALERT 🛑"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            return "\((file as NSString).lastPathComponent): \(line) \(function)"
        }
    }
    
    static func info(_ string: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .info, string: string.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func warning(_ string: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .warning, string: string.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func error(_ string: StaticString, shouldLogContext: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Log.handleLog(level: .error, string: string.description, shouldLogContext: shouldLogContext, context: context)
    }
    
    fileprivate static func handleLog(level: LogLevel, string: String, shouldLogContext: Bool, context: Context) {
        
        let logComponents = ["[\(level.prefix)]", string]
        
        var fullString = logComponents.joined(separator: " ")
        if shouldLogContext {
            fullString += " -> \(context.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
    }
}
