//
//  FirstViewController.m
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "FirstViewController.h"
#import "PlivoRest.h"
#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)joinConference:(id)sender
{
    if (!buttonToggled) {
        AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        PlivoEndpoint *endpoint = delegate.endpoint;
        PlivoOutgoing *outgoing = [endpoint createOutgoingCall];
        
# warning Enter a valid conference application sip URI
        NSString *callString = @"";
        
        [outgoing call:callString];
        [sender setTitle:@"Disconnect" forState:UIControlStateNormal];
        
        buttonToggled = YES;
    }
    else {
        
        [sender setTitle:@"Disconnect" forState:UIControlStateNormal];
        buttonToggled = NO;
    }
}



@end
