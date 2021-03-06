//
//  MyTableViewController.m
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import "ReminderTableViewController.h"

@implementation ReminderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInstance];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self save];
}

-(NSString *)filePath {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"reminders"];
}

-(void)enteredBackground: (id)sender {
    [self save];
}

-(void)loadInstance {
    NSData *decoded = [[NSData alloc] initWithContentsOfFile:[self filePath]];
    if (decoded != nil)
    {
        self.reminders = [NSKeyedUnarchiver unarchiveObjectWithData:decoded];
        [[self tableView] reloadData];
    }
    else
    {
        self.reminders = [[NSMutableArray alloc] init];
    }
}

-(void)save {
    NSData *encoded = [NSKeyedArchiver archivedDataWithRootObject:self.reminders];
    [encoded writeToFile:[self filePath] atomically:YES];
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
    
    cell.textLabel.text = ((ReminderEvent *)self.reminders[indexPath.row]).name;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM/dd";
    cell.detailTextLabel.text = [formatter stringFromDate:((ReminderEvent *)self.reminders[indexPath.row]).date];
    
    return cell;
}



- (void)editRow: (long)row {
    self.event = self.reminders[row];
    self.edit = true;
    [self performSegueWithIdentifier:@"showEventDetails" sender:self];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self editRow:indexPath.row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    SaveViewController *svc = (SaveViewController *)[segue destinationViewController];
    svc.mtvc = self;
    
    
}

- (void) addElement: (ReminderEvent *)rem {
    [self.reminders addObject:rem];
    self.reminders = [[NSMutableArray alloc] initWithArray:[self.reminders sortedArrayUsingComparator:^NSComparisonResult(ReminderEvent *event1, ReminderEvent *event2){
        return [event1.date compare:event2.date];
    }]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.reminders removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
