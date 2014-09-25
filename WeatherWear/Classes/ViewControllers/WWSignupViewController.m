//
//  WWSignupViewController.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/24/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWSignupViewController.h"
#import "WWUserNetworkManager.h"

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

- (IBAction)signupButtonPressed:(UIButton *)sender {
    [WWUserNetworkManager POSTUserWithEmail:self.emailTextField.text andPassword: self.passwordTextField.text];
}

@end
