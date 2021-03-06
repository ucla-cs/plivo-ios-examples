//
//  AppDelegate.h
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import <UIKit/UIKit.h>
#import "PlivoEndpoint.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) PlivoEndpoint *endpoint;
@property (nonatomic, retain) NSMutableArray *members;

@end
