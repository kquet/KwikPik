//
//  KQRedditUser.h
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditUser : NSObject

@property (nonatomic, strong) NSString *username;

- (void)configureUserWithResponse:(NSDictionary *)responseDictionary;

@end
