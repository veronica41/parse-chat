//
//  LoginViewController.m
//  parsechat
//
//  Created by Veronica Zheng on 6/30/14.
//  Copyright (c) 2014 Veronica Zheng. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)onSignup:(id)sender;
- (IBAction)onLogin:(id)sender;
@end

@implementation LoginViewController

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

- (IBAction)onSignup:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.userNameField.text;
    user.password = self.passwordField.text;
    //user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    //user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self onLogin:sender];
        } else {
            NSString *errorString = [error userInfo][@"error"];
             NSLog(@"Error: %@", errorString);
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (IBAction)onLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:self.userNameField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self showChatView];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
}

- (void)showChatView {
    NSLog(@"Login");
    
}
@end
