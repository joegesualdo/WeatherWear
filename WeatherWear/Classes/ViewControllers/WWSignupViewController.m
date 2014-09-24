//
//  WWSignupViewController.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/24/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWSignupViewController.h"

@interface WWSignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)signupButtonPressed:(UIButton *)sender;

@end

@implementation WWSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupButtonPressed:(UIButton *)sender {
    
    //we need an NSURLSession, so we get the shared session
    // This is shared everywhere in your app
    NSURLSession *session = [NSURLSession sharedSession];
    // create a string that represent the url
    NSString *urlString =[NSString stringWithFormat:@"http://localhost:3000/api/v1/users?user[email]=%@&user[password]=%@",self.emailTextField.text, self.passwordTextField.text];
    // Need to make a url that we can pass to request
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    // Make a request that we can then pass on to our task (NSURLSessionDownloadTask)
    // THis request is mutable because we will be changing things on it like the headers
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    // Set data on the request
    // Change the header 'content-type' to form-urlencode so we can pass our user attributes nested under user
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    // Need to change the request to a POST because we are posting to our server
    [request setHTTPMethod:@"POST"];
    // make an NSURLSessionDataTask to post data to a server
    NSError *error;
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //NSData is just an object that holds raw data. It doesn't interpret it into anything. Like NSString takes the data and turns it into string
        // turn raw data into json
        //NSJSONSerialization is a class for transferting JSON into objective c objectskjj
        // What is kNilOptions??
        // It's just a constant for nil objects
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"JSON: %@",responseDictionary);
        // We can now get the response token from the response
        NSString *responseToken = [responseDictionary valueForKeyPath:@"authentication_token"];
        NSLog(@"Response Token: %@", responseToken);
        
    }];
    // We need to use the task we created. So we call the resume method on the task:
    [postDataTask resume];
}

@end
