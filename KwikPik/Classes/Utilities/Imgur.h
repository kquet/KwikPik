//
//  Imgur.h
//  Humane
//
//  Created by Kael Quet on 2/1/2014.
//  Copyright (c) 2014 Kennel Studios Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImgurDelegate <NSObject>
@optional

- (void)imagePostedWithImageUrl:(NSString *)imageUrl;

@end

@interface Imgur : NSObject

@property (nonatomic, strong) id<ImgurDelegate> delegate;

- (void)postImage:(UIImage *)image withTitle:(NSString *)title andDescription:(NSString *)description;

@end
