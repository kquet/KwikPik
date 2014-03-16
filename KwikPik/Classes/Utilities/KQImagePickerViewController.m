//
//  KQImagePickerViewController.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQImagePickerViewController.h"

@interface KQImagePickerViewController ()

@end

@implementation KQImagePickerViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return nil;
}

@end
