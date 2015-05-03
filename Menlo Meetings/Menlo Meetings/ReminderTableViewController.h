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

@interface ReminderTableViewController : UITableViewController

@property(nonatomic) NSMutableArray *reminders;
@property (nonatomic) Boolean edit;
@property (nonatomic) ReminderEvent *event;


- (void) enteredBackground: (id)sender;
- (void) addElement: (ReminderEvent *)rem;
- (void) editRow: (long)row;


@end
