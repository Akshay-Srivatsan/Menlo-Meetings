//
//  ReminderEvent.h
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/27/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReminderEvent : NSObject <NSCoding>

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *details;
@property (nonatomic) NSDate *date;


- (void) encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)coder;

@end
