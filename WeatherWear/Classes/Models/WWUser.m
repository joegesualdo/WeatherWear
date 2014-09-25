//
//  WWUser.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWUser.h"

static WWUser *currentUser;

@implementation WWUser

+(WWUser *)currentUser{
  return currentUser;
}
+(void)setCurrentUser:(WWUser *)user{
    currentUser = user;
    
}

@end
