//
//  MyTableViewController.h
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveViewController.h"
#import "ReminderEvent.h"

@interface MyTableViewController : UITableViewController

@property(nonatomic) NSMutableArray *reminders;
@property (nonatomic) Boolean edit;
@property (nonatomic) ReminderEvent *event;

- (void) addElement: (ReminderEvent *)rem;


@end
