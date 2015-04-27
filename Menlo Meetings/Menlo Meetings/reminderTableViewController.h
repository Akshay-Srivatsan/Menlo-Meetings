//
//  MyTableViewController.h
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveViewController.h"

@interface reminderTableViewController : UITableViewController

@property(nonatomic) NSMutableArray *reminders;

- (void) addElement: (NSString *)str;


@end
