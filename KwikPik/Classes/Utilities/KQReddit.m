//
//  KQReddit.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-16.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQReddit.h"

static NSString *const RedditBaseUrl = @"https://ssl.reddit.com/";

@implementation KQReddit

+ (void)signInUser:(NSString *)username withPassword:(NSString *)password {
    NSMutableURLRequest *postRequest = [[NSMutableURLRequest alloc] init];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setURL:[NSURL URLWithString:@"https://ssl.reddit.com/api/login"]];
    [postRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *requestString = [NSString stringWithFormat:@"user=%@&passwd=%@&api_type=json&rem=true", username, password];
    NSData *requestData = [NSData dataWithBytes:[requestString UTF8String] length:[requestString length]];
    [postRequest setHTTPBody:requestData];
    
    [NSURLConnection sendAsynchronousRequest:postRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil];
        NSLog(@"%@", responseDictionary);
        
        if (responseDictionary[@"data.error"]) {
            NSLog(@"ERROR: %@", [responseDictionary[@"data.error" ] stringValue]);
        }
    }];
}

+ (void)getUser {
    NSMutableURLRequest *getRequest = [[NSMutableURLRequest alloc] init];
    [getRequest setHTTPMethod:@"GET"];
    [getRequest setURL:[NSURL URLWithString:@"https://ssl.reddit.com/api/me.json"]];
    [getRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [NSURLConnection sendAsynchronousRequest:getRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil];
        NSLog(@"%@", responseDictionary);
        
        if (responseDictionary[@"data.error"]) {
            NSLog(@"ERROR: %@", [responseDictionary[@"data.error" ] stringValue]);
        }
    }];
}

+(void)logoutWithPassword:(NSString *)password {
    NSMutableURLRequest *postRequest = [[NSMutableURLRequest alloc] init];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setURL:[NSURL URLWithString:@"https://ssl.reddit.com/api/clear_sessions"]];
    [postRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *requestString = [NSString stringWithFormat:@"api_type=json&curpass=%@", password];
    NSData *requestData = [NSData dataWithBytes:[requestString UTF8String] length:[requestString length]];
    [postRequest setHTTPBody:requestData];
    
    [NSURLConnection sendAsynchronousRequest:postRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil];
        NSLog(@"%@", responseDictionary);
        
        if (responseDictionary[@"data.error"]) {
            NSLog(@"ERROR: %@", [responseDictionary[@"data.error" ] stringValue]);
        }
    }];
}

@end
