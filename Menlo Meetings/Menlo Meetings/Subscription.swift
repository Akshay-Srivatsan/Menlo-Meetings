//
//  Subscription.swift
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 5/24/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import Foundation

class Subscription : NSObject, NSCoding, Equatable {
    var name: String;
    var teacher: String;
    
    init(name: String, teacher: String) {
        self.name = name;
        self.teacher = teacher;
    }
    
    @objc required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String;
        self.teacher = aDecoder.decodeObjectForKey("teacher") as! String;
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name");
        aCoder.encodeObject(self.teacher, forKey: "teacher");
    }
}

func ==(lhs: Subscription, rhs: Subscription) -> Bool {
    return (lhs.name == rhs.name) && (lhs.teacher == rhs.teacher);
}