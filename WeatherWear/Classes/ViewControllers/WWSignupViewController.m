//
//  WWSignupViewController.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/24/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWSignupViewController.h"
#import "WWUserNetworkManager.h"
#import "WWUser.h"

@interface WWSignupViewController ()

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

#pragma mark - IBActions

- (IBAction)signupButtonPressed:(UIButton *)sender;

@end

@implementation WWSignupViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBActions

- (IBAction)signupButtonPressed:(UIButton *)sender {
    [WWUserNetworkManager POSTCreateUserWithEmail:self.emailTextField.text andPassword: self.passwordTextField.text thenSignIn:YES completionHandler:^(BOOL completed) {
        if (completed) {
            NSLog(@"Inside block");
            if ([WWUser currentUser]) {
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }];
}

@end
