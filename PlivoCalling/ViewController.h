//
//  ViewController.h
//  PlivoCalling
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "PlivoEndpoint.h"

@interface ViewController : UIViewController {
    
    IBOutlet UITextField *display;
    IBOutlet UIButton *callButton;
    IBOutlet UIButton *muteButton;
    NSString *storage;
    PlivoOutgoing* newCall;
    PlivoCallId callId;
}

- (IBAction)button1;
- (IBAction)button2;
- (IBAction)button3;
- (IBAction)button4;
- (IBAction)button5;
- (IBAction)button6;
- (IBAction)button7;
- (IBAction)button9;
- (IBAction)button0;
- (IBAction)buttonStar;
- (IBAction)buttonPound;
- (IBAction)buttonCall:(id)sender;
- (IBAction)buttonMute:(id)sender;
- (IBAction)textFieldShouldReturn:(id)sender;

@end