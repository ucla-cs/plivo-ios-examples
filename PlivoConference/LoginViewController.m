//
//  LoginViewController.m
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "LoginViewController.h"
#import "PlivoEndpoint.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (IBAction)loginButton:(id)sender
{
    #warning Change to valid plivo endpoint username and password
    NSString *usernameEndpoint = @"";
    NSString *passwordEndpoint = @"";
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    PlivoEndpoint *endpoint = delegate.endpoint;
    endpoint.delegate = self;

    [endpoint login:usernameEndpoint AndPassword:passwordEndpoint];
    UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"conferenceTab"];
    tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tabBarController animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLogin
{
    NSLog(@"Register Success");

}

- (void)onLoginFailure
{
    NSLog(@"Register Failure");
}

@end
