//
//  KQSettingsView.h
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RedditUser;

@interface KQSettingsView : UIView

- (void)configureForUser:(RedditUser *)user;

@end
