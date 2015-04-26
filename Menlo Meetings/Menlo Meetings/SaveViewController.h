//
//  SaveViewController.h
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewController.h"

@interface SaveViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextView *eventDescription;
- (IBAction)saveEvent:(id)sender;
@property (nonatomic, copy) MyTableViewController *mtvc;

@end
