//
//  PlivoOutgoing.h
//  PlivoEndpoint
//
//  Copyright (c) 2013 Plivo Inc. All rights reserved.
//  Use of this software is subject to the
//  terms mentioned here, http://plivo.com/terms/

#import "PlivoCall.h"

@interface PlivoOutgoing : NSObject

/* The accId of the registered Endpoint */
@property (nonatomic, readwrite) PlivoAccId accId;

/* The callId of the call */
@property (nonatomic, readwrite) PlivoCallId callId;

/* Whether the call is muted */
@property (nonatomic, readonly) BOOL muted;

/* State of the call */
@property (nonatomic, readwrite) PlivoCallState state;

/* Make an outbound call
 
 Calling this method on the PlivoOutgoing object with the SIP URI
 would initiate an outbound call.
 */
- (void)call:(NSString *)sipURI;

/* Mutes the call
 
 Calling this method on the PlivoOutgoing object would mute the call.
 */
- (void)mute;

/* Unmute the call
 
 Calling this method on the PlivoOutgoing object would unmute the call.
 */
- (void)unmute;

/* Send DTMF
 
 Calling this method on the PlivoOutgoing object with the digits
 would send DTMF on that call.
 */
- (void)sendDigits:(NSString *)digits;

/* Disconnect the call
 
 Calling this method on the PlivoOutgoing object would disconnect the call.
 */
- (void)disconnect;

@end
