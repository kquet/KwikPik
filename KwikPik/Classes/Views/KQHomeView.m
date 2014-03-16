//
//  KQHomeView.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQHomeView.h"

@interface KQHomeView ()

@property (nonatomic, weak) IBOutlet UIImageView *homeImageView;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *postButtons;

@end

@implementation KQHomeView

- (void)setButtonEnabled:(BOOL)enable {
    for (UIButton *button in self.postButtons) {
        button.enabled = enable;
    }
}

- (void)configureWithImage:(UIImage *)image {
    self.homeImageView.image = image;
}

@end
