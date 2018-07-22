//
//  GlobalConstants.swift
//  SwiftLogging
//
//  Created by Takeshi Kawai on 2015/05/17.
//  Copyright (c) 2015年 Takeshi Kawai. All rights reserved.
//  Modified (c) 2017年 Jun KOBAYASHI. fix swift3

#if DEBUG
    func LOG_METHOD(funcName:String = #function,lineNum:Int = #line,fullFileName:String = #file ){
            // print("\(funcName)","\(lineNum)")
        //        let fileName:String = fullFileName.pregReplace(pattern: ".*¥/", with: "")
        let fileName:String = fullFileName.replacingOccurrences(of: ".*/", with: "", options: String.CompareOptions.regularExpression, range: nil)
            print("[\(fileName)]","- \(funcName)")
    }
    func LOG(msg:Any) {
        print(msg)
    }
    
#else
    func LOG(msg:Any) {}
    func LOG_METHOD() {}
#endif


