//
//  KQSettingsViewController.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQSettingsViewController.h"
#import "KQReddit.h"

@interface KQSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation KQSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [KQReddit getUser];
    
}

- (IBAction)loginButtonTapped:(id)sender {
    [KQReddit signInUser:self.usernameTextField.text withPassword:self.passwordTextField.text];
}

- (IBAction)logoutButtonTapped:(id)sender {
    [KQReddit logoutWithPassword:@"qwer"];
}

# pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.usernameTextField]) {
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]){
        [self.passwordTextField resignFirstResponder];
    }
    return NO;
}

- (IBAction)dismissKeyboardTouch:(id)sender {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

@end
