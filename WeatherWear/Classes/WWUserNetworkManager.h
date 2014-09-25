//
//  WWUserNetworkManager.h
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWNetworkManager.h"

@interface WWUserNetworkManager : WWNetworkManager

+(void)POSTUserWithEmail:(NSString *)email andPassword: (NSString *)password;

@end
