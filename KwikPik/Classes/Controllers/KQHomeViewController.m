//
//  KQHomeViewController.m
//  KwikPik
//
//  Created by Kael Quet on 2014-03-15.
//  Copyright (c) 2014 Kael Quet. All rights reserved.
//

#import <MessageUI/MessageUI.h>
#import "KQHomeViewController.h"
#import "KQImagePickerViewController.h"
#import "KQHomeView.h"
#import "Imgur.h"

@interface KQHomeViewController () <UINavigationControllerDelegate,
                                    UIImagePickerControllerDelegate,
                                    ImgurDelegate,
                                    MFMessageComposeViewControllerDelegate,
                                    MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet KQHomeView *homeView;

@property (nonatomic, strong) KQImagePickerViewController *imagePickerController;
@property (nonatomic, strong) Imgur *imgurController;
@property (nonatomic, strong) NSString *imageUrl;

@property (nonatomic, strong) MFMailComposeViewController *mailController;
@property (nonatomic, strong) MFMessageComposeViewController *smsController;

@end

@implementation KQHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imgurController = [[Imgur alloc] init];
    self.imgurController.delegate = self;
    
    [self.homeView setButtonEnabled:NO];
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
    if (image != nil) {
        [self.imgurController postImage:image withTitle:nil andDescription:nil];
        [self.homeView configureWithImage:image];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - ImgurProtocol

- (void)imagePostedWithImageUrl:(NSString *)imageUrl {
    self.imageUrl = imageUrl;
    NSLog(@"%@", self.imageUrl);
    [self.homeView setButtonEnabled:YES];
    
}

#pragma mark - Clipboard

- (IBAction)clipboardButtonTapped:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.imageUrl];
    
    [[[UIAlertView alloc] initWithTitle:@"Copied To Clipboard!"
                               message:self.imageUrl
                              delegate:nil
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil] show];
}

#pragma mark - SMS

- (IBAction)smsButtonTapped:(id)sender {
    self.smsController = [[MFMessageComposeViewController alloc] init];
    self.smsController.messageComposeDelegate = self;
    
    self.smsController.body = self.imageUrl;
    
    [self presentViewController:self.smsController animated:YES completion:nil];
}

#pragma mark - Email

- (IBAction)emailButtonTapped:(id)sender {
    self.mailController = [[MFMailComposeViewController alloc] init];
    self.mailController.mailComposeDelegate = self;
    
    [self.mailController setSubject:@"Check This Out!"];
    [self.mailController setMessageBody:self.imageUrl isHTML:NO];
    
    [self presentViewController:self.mailController animated:YES completion:nil];
}

#pragma mark - MFMessageComposeViewControllerDelegate

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result) {
        case MessageComposeResultCancelled:
            break;
        case MessageComposeResultSent:
            break;
        case MessageComposeResultFailed:
            break;
        default:
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
            break;
        case MFMailComposeResultFailed:
            break;
        default:
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Unwind Segue

- (IBAction)unwindToHomeView:(UIStoryboardSegue *)unwindSegue {
}

@end
