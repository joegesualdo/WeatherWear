//
//  WWUserNetworkManager.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWUserNetworkManager.h"

@implementation WWUserNetworkManager

#pragma mark - Public Methods

/**
 *  Sends a post request to our backend and creates a user
 *
 *  @param email    A string that represents the user's email
 *  @param password A string that represent the user's password
 */
+(void)POSTUserWithEmail:(NSString *)email andPassword: (NSString *)password{
    //we need an NSURLSession, so we get the shared session
    NSURLSession *session        = [self sharedSession];
    NSURL        *url            = [self getPOSTUserURLWithEmail:email andPassword:password];
    NSMutableURLRequest *request = [self getPOSTUserRequestWithURL: url];
    
    NSError *error;
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error){
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"JSON: %@",responseDictionary);
            // We can now get the response token from the response
            NSString *responseToken = [responseDictionary valueForKeyPath:@"authentication_token"];
            NSLog(@"Response Token: %@", responseToken);
        } else {
          NSLog(@"Error: %@ %@", error, [error description]);
        }
    }];
    // We need to use the task we created. So we call the resume method on the task:
    [postDataTask resume];
}

#pragma mark - Private helper methods for creating a user

/**
 *  Creates a NSURL with that represents the url for posting a user to our backend
 *
 *  @param email    A string that represents the user's email
 *  @param password A string that represents the user's password
 *
 *  @return NSURL for posting a user to our backend
 */
+(NSURL *) getPOSTUserURLWithEmail:(NSString *)email andPassword:(NSString *)password{
    NSString *urlPath = [NSString stringWithFormat:@"users?user[email]=%@&user[password]=%@",email, password];
    NSString *urlString =[[self getBaseUrl] stringByAppendingString: urlPath];
  
    return[[NSURL alloc]initWithString:urlString];
}

/**
 *  Creates a NSMutableURLRequest that we use when posting a user to our backend. This is where we
 *  set the things like the HTTP headers for the request
 *
 *  @param url A NSURL that represents the url we use to POST users to our backend
 *
 *  @return A NSMutalbleURLRequest customized for POSTing a user to our backend
 */
+(NSMutableURLRequest *)getPOSTUserRequestWithURL: (NSURL *)url{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
  
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    return request;
}
@end
