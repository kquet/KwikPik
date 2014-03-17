//
//  KQReddit.h
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KQReddit : NSObject

+ (void)signInUser:(NSString *)username withPassword:(NSString *)password;
+ (void)getUser;
+(void)logoutWithPassword:(NSString *)password;

@end
