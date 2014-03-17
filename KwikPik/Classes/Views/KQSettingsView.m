//
//  KQSettingsView.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQSettingsView.h"
#import "RedditUser.h"

@interface KQSettingsView ()

@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, strong) IBOutletCollection(UITextField) NSArray *loginTextViews;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end

@implementation KQSettingsView

- (void)configureForUser:(RedditUser *)user {
    self.usernameLabel.text = user.username;
}

@end
