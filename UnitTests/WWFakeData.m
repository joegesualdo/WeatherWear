//
//  WWFakeData.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWFakeData.h"

@implementation WWFakeData

/**
 *  Creates a fake email
 *
 *  @return A String that represents a fake email
 */
+(NSString *)email{
    NSInteger randomNumber = arc4random() % 10000000000;
    NSString *fakeEmail = [NSString stringWithFormat:@"%@%ld@example.com",@"fakeEmail", (long)randomNumber];
    
    return fakeEmail;
}

@end
