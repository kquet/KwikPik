//
//  KQImgur.h
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KQImgurDelegate <NSObject>
@optional

- (void)imagePostedWithImageUrl:(NSString *)imageUrl;

@end

@interface KQImgur : NSObject

@property (nonatomic, strong) id<KQImgurDelegate> delegate;

- (void)postImage:(UIImage *)image withTitle:(NSString *)title andDescription:(NSString *)description;

@end
