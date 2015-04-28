//
//  SaveViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "SaveViewController.h"
#import "reminderTableViewController.h"

@implementation SaveViewController

-(void)viewWillAppear:(BOOL)animated {
    MyTableViewController *vc = ((MyTableViewController *)(self.mtvc));
    if (vc.edit)
    {
        ReminderEvent *rem = vc.event;
        self.eventName.text = rem.name;
        self.eventDescription.text = rem.details;
    }
}

- (IBAction)saveEvent:(id)sender {
<<<<<<< HEAD
    MyTableViewController *vc = ((MyTableViewController *)(self.mtvc));
    if (!vc.edit)
    {
        ReminderEvent *rem = [[ReminderEvent alloc] init];
        rem.name = self.eventName.text;
        rem.details = self.eventDescription.text;
        [((MyTableViewController *)(self.mtvc)) addElement: rem];
    }
    else
    {
        ReminderEvent *rem = vc.event;
        rem.name = self.eventName.text;
        rem.details = self.eventDescription.text;
        vc.event = nil;
        vc.edit = false;
    }
=======
    [((reminderTableViewController *)(self.mtvc)) addElement:self.eventName.text];
    reminderTableViewController *vc = ((reminderTableViewController *)(self.mtvc));
>>>>>>> origin/master
    [vc.tableView reloadData];
    [self.navigationController popToViewController:vc animated:YES];
}
@end
