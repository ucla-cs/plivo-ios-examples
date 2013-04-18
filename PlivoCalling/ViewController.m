//
//  ViewController.m
//  PlivoCalling
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController


- (IBAction)button0
{
    display.text=[NSString stringWithFormat:@"%@0", display.text];
}

- (IBAction)button1
{
    display.text=[NSString stringWithFormat:@"%@1", display.text];
}

- (IBAction)button2
{
    display.text=[NSString stringWithFormat:@"%@2", display.text];
}

- (IBAction)button3
{
    display.text=[NSString stringWithFormat:@"%@3",display.text];
}

- (IBAction)button4
{
    display.text=[NSString stringWithFormat:@"%@4",display.text];
}

- (IBAction)button5
{
    display.text=[NSString stringWithFormat:@"%@5",display.text];
}

- (IBAction)button6
{
    display.text=[NSString stringWithFormat:@"%@6",display.text];
}

- (IBAction) button7
{
    display.text=[NSString stringWithFormat:@"%@7",display.text];
}

- (IBAction) button8
{
    display.text=[NSString stringWithFormat:@"%@8",display.text];
}

- (IBAction)button9
{
    display.text=[NSString stringWithFormat:@"%@9",display.text];
}

- (IBAction)buttonStar
{
    display.text=[NSString stringWithFormat:@"%@*",display.text];
}

- (IBAction)buttonPound
{
    display.text=[NSString stringWithFormat:@"%@#",display.text];
}

- (IBAction)buttonCall:(id)sender
{
    NSString *val = display.text;
    val = [NSString stringWithFormat:@"sip:%@@phone.plivo.com", val];
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    PlivoEndpoint *endpoint = delegate.endpoint;
    
    UIButton* resultButton = (UIButton*)sender;

    if ([resultButton currentTitle] == @"Disconnect") {
        [newCall disconnect];
        [resultButton setTitle:@"Call" forState:UIControlStateNormal];
    }
    else {
        // Create a new PlivoOutgoing object
        newCall = [endpoint createOutgoingCall];
        
        [newCall call:val];
        
        // Save the callId so we can perform operations
        // like disconnect on it later
        callId = newCall.callId;
        
        [display setText:@""];
        [resultButton setTitle:@"Disconnect" forState:UIControlStateNormal];
        [muteButton setHidden:FALSE];
    }
}

- (IBAction)buttonMute:(id)sender
{
    UIButton* resultButton = (UIButton*)sender;
    
    if ([resultButton currentTitle] == @"Mute") {
        // Fire mute
        [newCall mute];
        [resultButton setTitle:@"UnMute" forState:UIControlStateNormal];
    }
    else {
        // Fire unmute for outgoing call
        [newCall unmute];
        [resultButton setTitle:@"Mute" forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    muteButton.hidden = TRUE;
    
#warning Change to valid plivo endpoint username and password.
    NSString *username = @"";
    NSString *password = @"";
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    PlivoEndpoint *endpoint = delegate.endpoint;
    
    // assigning delegate to self
    endpoint.delegate = self;
    
    [endpoint login:username AndPassword:password];
    
}

- (void)successWithResponse:(NSDictionary *)response andIdentifier:(NSString *)identifier
{
    NSLog(@"Inside App: %@", response);
}

- (void)onIncomingCall:(PlivoIncoming*)incoming
{
    NSLog(@"Call from %@, to %@", incoming.fromContact, incoming.toContact);
    [muteButton setHidden:FALSE];
    [callButton setTitle:@"Disconnect" forState:UIControlStateNormal];
    [callButton setNeedsDisplay];

    // Auto answering the call
    [incoming answer];
    callId = incoming.callId;
}

- (void)onIncomingCallHangup:(PlivoIncoming*)incoming
{
    NSLog(@"Incoming Call hangup");
}

- (void)onIncomingCallRejected:(PlivoIncoming*)incoming
{
    NSLog(@"Incoming Call rejected");
}

- (void)onIncomingDigit:(NSString*)digit
{
    NSLog(@"Digit received, %@", digit);
}

/* Will receive all the successful registration notifications */
- (void)onLogin
{
    NSLog(@"Register Success");
}

/* Will receive all the failed registration notifications */
- (void)onLoginFailure
{
    NSLog(@"Register Failure");
}

- (void)onOutgoingCallRinging:(PlivoOutgoing*)call
{
    NSLog(@"Outgoing Call ringing");
}

/* Will receive all outbound call answered notifications, can be used to 
 change UI elements once the call has been answered.
*/
- (void)onOutgoingCallAnswered:(PlivoOutgoing*)call
{
    [muteButton setHidden:FALSE];
    NSLog(@"Outgoing Call answered");
}

/* Will receive all outbound call disconnected notifications, if the call is
 disconnected before being answered.
 */
- (void)onOutgoingCallRejected:(PlivoOutgoing*)call
{
    NSLog(@"Outgoing Call Disconnected");
}

/* Will receive notifications of calls which are hung up */
- (void)onOutgoingCallHangup:(PlivoOutgoing*)call
{
    NSLog(@"Outgoing Call Hang up");
}

- (IBAction)textFieldShouldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
