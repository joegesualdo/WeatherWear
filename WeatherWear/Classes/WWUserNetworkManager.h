//
//  WWUserNetworkManager.h
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWNetworkManager.h"

@interface WWUserNetworkManager : WWNetworkManager

+(void)POSTCreateUserWithEmail:(NSString *)email andPassword: (NSString *)password thenSignIn:(BOOL)signIn completionHandler: (void (^)(BOOL))completed;
+(void)POSTSignInUserWithEmail:(NSString *)email andPassword: (NSString *)password completionHandler: (void (^)(BOOL))completed;

@end
