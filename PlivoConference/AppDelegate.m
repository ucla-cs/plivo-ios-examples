//
//  AppDelegate.m
//  PlivoConference
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "AppDelegate.h"
#import "Members.h"


@implementation AppDelegate {
    PlivoEndpoint *endpoint;
    NSMutableArray *members;
}

@synthesize endpoint;
@synthesize members;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    endpoint = [[PlivoEndpoint alloc] init];
    
#warning Enter valid plivo auth id and token
    NSString *authID = @"";
    NSString *authToken = @"";
    PlivoRest *restAPI = [[PlivoRest alloc] initWithAuthId:authID andAuthToken:authToken];
    
    restAPI.delegate = self;
    
    // Get the details of the conference name 'ConferenceIOS'
    [restAPI conference:@"ConferenceIOS"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)successWithResponse:(NSDictionary *)response andIdentifier:(NSString *)identifier
{
    members = [NSMutableArray arrayWithCapacity:20];
    NSArray *conferenceMembers = [response objectForKey:@"members"];
    
    NSEnumerator *e = [conferenceMembers objectEnumerator];
    id object;
    while (object = [e nextObject]) {
        Members *member = [[Members alloc] init];
        member.name = [object objectForKey:@"caller_name"];
        member.sipURI = [object objectForKey:@"from"];
        [members addObject:member];
    }
        
}

- (void)failureWithError:(NSError *)error andIdentifier:(NSString *)identifier
{
    members = [NSMutableArray arrayWithCapacity:20];
    Members *member = [[Members alloc] init];
    member.name = @"Conference Empty";
    member.sipURI = @"";
    [members addObject:member];
}

@end
