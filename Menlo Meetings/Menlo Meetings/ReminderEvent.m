//
//  ReminderEvent.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/27/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "ReminderEvent.h"

@implementation ReminderEvent

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.details = [coder decodeObjectForKey:@"details"];
        self.date = [coder decodeObjectForKey:@"date"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.details forKey:@"details"];
    [coder encodeObject:self.date forKey:@"date"];

}

@end
