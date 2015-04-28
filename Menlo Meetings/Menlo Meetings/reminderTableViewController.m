//
//  MyTableViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "reminderTableViewController.h"

@implementation reminderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reminders = [[NSMutableArray alloc] init];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"There are %ld elements", self.reminders.count);
    NSLog(@"%p", self.reminders);
    return self.reminders.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"getting cells %ld, %ld", indexPath.row, self.reminders.count);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myTableCell" forIndexPath:indexPath];
    
    cell.textLabel.text = ((ReminderEvent *)self.reminders[indexPath.row]).name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.event = self.reminders[indexPath.row];
    self.edit = true;
    [self performSegueWithIdentifier:@"showEventDetails" sender:self];
    
//    NSLog(@"%ld", indexPath.row);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SaveViewController *svc = (SaveViewController *)[segue destinationViewController];
//    NSLog(@"hi");
    svc.mtvc = self;
//    NSLog(@"bye");
    
    
}

- (void) addElement: (ReminderEvent *)rem {
    [self.reminders addObject:rem];
    NSLog(@"%p", self.reminders);
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
