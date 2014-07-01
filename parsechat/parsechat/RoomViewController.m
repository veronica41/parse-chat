//
//  RoomViewController.m
//  parsechat
//
//  Created by Veronica Zheng on 6/30/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "RoomViewController.h"
#import <Parse/Parse.h>

@interface RoomViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)onSend:(id)sender;

@end

@implementation RoomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSend:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"Message"];
    gameScore[@"text"] = self.textField.text;
    gameScore[@"user"] = self.user;
    [gameScore saveInBackground];
}
@end
