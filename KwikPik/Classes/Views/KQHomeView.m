//
//  KQHomeView.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQHomeView.h"

@interface KQHomeView ()

@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;

@end

@implementation KQHomeView

- (void)configureWithImage:(UIImage *)image {
    self.homeImageView.image = image;
}

@end
