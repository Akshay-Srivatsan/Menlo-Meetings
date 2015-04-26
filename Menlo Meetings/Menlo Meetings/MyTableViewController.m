//
//  MyTableViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "MyTableViewController.h"

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reminders = @[@"Hello", @"World"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reminders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myTableCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.reminders[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
}

/*-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = @"Hi";
   // NSLog(@"hi");
    return cell;
}*/

@end
