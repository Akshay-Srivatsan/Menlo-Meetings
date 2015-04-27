//
//  SaveViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "SaveViewController.h"
#import "MyTableViewController.h"

@implementation SaveViewController

- (IBAction)saveEvent:(id)sender {
//    [((MyTableViewController *)(self.mtvc)).reminders addObject: self.eventName.text];
    [((MyTableViewController *)(self.mtvc)) addElement:@"Hi There!"];
    MyTableViewController *vc = ((MyTableViewController *)(self.mtvc));
    NSLog(@"Salve! %ld", vc.reminders.count);
    vc.view = nil;
    [vc viewDidLoad];
}
@end
