//
//  SaveViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "SaveViewController.h"
#import "ReminderTableViewController.h"

@implementation SaveViewController

-(void)viewWillAppear:(BOOL)animated {
    ReminderTableViewController *vc = ((ReminderTableViewController *)(self.mtvc));
    if (vc.edit)
    {
        ReminderEvent *rem = vc.event;
        self.eventName.text = rem.name;
        self.eventDescription.text = rem.details;
        self.datePicker.date = rem.date;
    }
}

- (IBAction)saveEvent:(id)sender {
    ReminderTableViewController *vc = ((ReminderTableViewController *)(self.mtvc));
    if (!vc.edit)
    {
        ReminderEvent *rem = [[ReminderEvent alloc] init];
        rem.name = self.eventName.text;
        rem.details = self.eventDescription.text;
        rem.date = self.datePicker.date;
        [((ReminderTableViewController *)(self.mtvc)) addElement: rem];
    }
    else
    {
        ReminderEvent *rem = vc.event;
        rem.name = self.eventName.text;
        rem.details = self.eventDescription.text;
        rem.date = self.datePicker.date;
        vc.event = nil;
        vc.edit = false;
    }
    [vc.tableView reloadData];
    [self.navigationController popToViewController:vc animated:YES];
}
@end
