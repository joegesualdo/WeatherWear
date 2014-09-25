//
//  WWNetworkManager.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWNetworkManager.h"

@implementation WWNetworkManager

+ (NSString *)getBaseUrl{
   return @"http://localhost:3000/api/v1/";
}

+(NSURLSession *)sharedSession{
    return [NSURLSession sharedSession];
}

@end
