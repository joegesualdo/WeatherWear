//
//  WWNetworkManager.h
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWNetworkManager : NSObject

+(NSString *)getBaseUrl;

+(NSURLSession *)sharedSession;

@end
