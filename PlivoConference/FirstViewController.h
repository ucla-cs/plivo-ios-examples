//
//  FirstViewController.h
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    BOOL buttonToggled;
}

- (IBAction)joinConference:(id)sender;

@end
