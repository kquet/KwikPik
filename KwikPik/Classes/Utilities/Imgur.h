//
//  Imgur.h
//  Humane
//
//  Created by Kael Quet on 2/1/2014.
//  Copyright (c) 2014 Kennel Studios Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Imgur : NSObject

+ (void)postImage:(UIImage *)image withTitle:(NSString *)title andDescription:(NSString *)description;

@end
