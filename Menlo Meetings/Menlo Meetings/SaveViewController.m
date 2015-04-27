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

- (IBAction)saveEvent:(id)sender {
    [((reminderTableViewController *)(self.mtvc)) addElement:self.eventName.text];
    reminderTableViewController *vc = ((reminderTableViewController *)(self.mtvc));
    [vc.tableView reloadData];
    [self.navigationController popToViewController:vc animated:YES];
}
@end
