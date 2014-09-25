//
//  WWUserNetworkManager.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWUserNetworkManager.h"
#import "WWUser.h"

@implementation WWUserNetworkManager

#pragma mark - Public Methods

/**
 *  Sends a post request to our backend and creates a user. Optionally it will also set the current
 *  user as this user.
 *
 *  @param email    A string that represents the user's email
 *  @param password A string that represent the user's password
 *  @param signIn   A boolean that indicated whether or not you want to set the 'current user' as
 *                    this user you are creating
 */
+(void)POSTCreateUserWithEmail:(NSString *)email andPassword: (NSString *)password thenSignIn:(BOOL)signIn completionHandler: (void (^)(BOOL))completed{
    //we need an NSURLSession, so we get the shared session
    NSURLSession *session        = [self sharedSession];
    NSURL        *url            = [self getPOSTCreateUserURLWithEmail:email andPassword:password];
    NSMutableURLRequest *request = [self getPOSTCreateUserRequestWithURL: url];
    
    NSError *error;
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error){
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            // We can now get the response token from the response
            NSString *responseToken = [responseDictionary valueForKeyPath:@"authentication_token"];
            if (signIn){
              [self setUserAuthFromSignUpResponse:responseDictionary];
            }
            completed(YES);
        } else {
          // TODO: create an appropriate error alert
          NSLog(@"Error: %@ %@", error, [error description]);
        }
    }];
    // We need to use the task we created. So we call the resume method on the task:
    [postDataTask resume];
}

+(void)POSTSignInUserWithEmail:(NSString *)email andPassword: (NSString *)password completionHandler: (void (^)(BOOL))completed{
    //we need an NSURLSession, so we get the shared session
    NSURLSession *session        = [self sharedSession];
    NSURL        *url            = [self getPOSTSignInUserURLWithEmail:email andPassword:password];
    NSMutableURLRequest *request = [self getPOSTSignInUserRequestWithURL: url];
    
    NSError *error;
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error){
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            // We can now get the response token from the response
            NSString *responseToken = [responseDictionary valueForKeyPath:@"auth_token"];
            WWUser *user = [[WWUser alloc]init];
            user.authToken = responseToken;
            [WWUser setCurrentUser:user];
            completed(YES);
        } else {
          // TODO: create an appropriate error alert
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
+(NSURL *) getPOSTCreateUserURLWithEmail:(NSString *)email andPassword:(NSString *)password{
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
+(NSMutableURLRequest *)getPOSTCreateUserRequestWithURL: (NSURL *)url{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
  
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    return request;
}

/**
 *  Will set the current user with auth token. Used after POSTing a new user to our backend
 *
 *  @param signUpResponse A NSDictionary of a POST request reponse of signinup up a user
 */
+(void)setUserAuthFromSignUpResponse:(NSDictionary *)signUpResponse{
  NSString *responseToken = [signUpResponse valueForKeyPath:@"authentication_token"];
  WWUser *user            = [[WWUser alloc]init];
    
  user.authToken = responseToken;
    
  [WWUser setCurrentUser:user];
}

#pragma mark - Private helper methods for Signing In a user

+(NSURL *) getPOSTSignInUserURLWithEmail:(NSString *)email andPassword:(NSString *)password{
    NSString *urlPath = [NSString stringWithFormat:@"sign_in?email=%@&password=%@",email, password];
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
+(NSMutableURLRequest *)getPOSTSignInUserRequestWithURL: (NSURL *)url{
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
  
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    return request;
}

+(void)setUserAuthFromSignInResponse:(NSDictionary *)signUpResponse{
  NSString *responseToken = [signUpResponse valueForKeyPath:@"auth_token"];
  WWUser *user            = [[WWUser alloc]init];
    
  user.authToken = responseToken;
    
  [WWUser setCurrentUser:user];
}

@end
