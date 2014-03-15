//
//  KQHomeViewController.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import "KQHomeViewController.h"
#import "KQImagePickerViewController.h"
#import "KQHomeView.h"


@interface KQHomeViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) KQImagePickerViewController *imagePickerController;
@property (strong, nonatomic) IBOutlet KQHomeView *homeView;

@end

@implementation KQHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self enableCamera];
}

#pragma mark - Camera

- (IBAction)retakePhotoButtonTapped:(id)sender {
    [self enableCamera];
}

- (void)enableCamera {
    KQImagePickerViewController *imagePickerController = [[KQImagePickerViewController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.homeView configureWithImage:image];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Unwind Segue

- (IBAction)unwindToHomeView:(UIStoryboardSegue *)unwindSegue {
}

@end
