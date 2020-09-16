//
//  RunCaptureViewController.m
//  SlalomCoach
//
//  Created by James Gibbons on 16/09/2020.
//  Copyright © 2020 James Gibbons. All rights reserved.
//

#import "RunCaptureViewController.h"

@interface RunCaptureViewController ()

@end

@implementation RunCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add observers for volume button click events, to start the run timing / video.
    [self initAvCaptureSession];
}

- (BOOL) selectExistingRunVideo {
    
    // default
    return false;
}

- (void) initAvCaptureSession {
    NSLog(@"Starting device capture session.");
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        AVCaptureDeviceDiscoverySession *deviceDiscoverSession = [AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:@[AVCaptureDeviceTypeBuiltInDualCamera, AVCaptureDeviceTypeBuiltInWideAngleCamera] mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
        
        // loop through devices
        NSArray *foundCaptureDevices = [deviceDiscoverSession devices];
        
        if(foundCaptureDevices.count > 0) {
            for(AVCaptureDevice *captureDevice in foundCaptureDevices) {
                if([captureDevice isConnected]) {
                    NSLog(@"Found capture device");
                }
                else {
                    NSLog(@"Cannot use capture device since it is disconected.");
                }
            }
        }
        else {
            // no capture devices hve been found on the device.
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Your device does not seem to have any camera devices enabled. Please try restarting your device and try again." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *returnHomeAction = [UIAlertAction actionWithTitle:@"Return" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:true completion:nil];
                [self dismissViewControllerAnimated:true completion:nil];
            }];
            
            UIAlertAction *loadExistingRunVideoAction = [UIAlertAction actionWithTitle:@"Load Existing" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                bool *selectExistingVideoResult = [self selectExistingRunVideo];
                if(selectExistingVideoResult) {
                    
                }
                else {
                    
                    // we have been unable to load the camera, and now also unable to load existing run video.
                    [alert dismissViewControllerAnimated:true completion:nil];
                    [self dismissViewControllerAnimated:true completion:nil];
                }
            }];
            
            [alert addAction:returnHomeAction];
            [self presentViewController:alert animated:true completion:nil];
            
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
