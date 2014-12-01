//
//  Index0ViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "Index0ViewController.h"
#import "LoginViewController.h"
#import "LoginService.h"
#import "Login.h"
@interface Index0ViewController ()<LoginViewControllerDelegate>

@end

@implementation Index0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SharedData *sharedData = [SharedData sharedInstance];
    if (![[sharedData loginStatus] isEqualToString:@"yes"]) {
        [SharedAction presentLoginViewControllerInViewController:self];
    }else{
        //需要重新加载userDefaults的数据（可能数据库的数据会经常变化）
        LoginService *loginService = [[LoginService alloc] init];
        [loginService member_loginWithLoginname:sharedData.loginname andPassword:sharedData.password withDone:^(LoginInfo *info){
            [loginService setSharedDataWithUser:info andUserName:sharedData.loginname andPassWord:sharedData.password];
            [self loadIndex0DataInView];
        }];
    }
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


#pragma LoginViewControllerDelegate
-(void)loginSuccessedInLoginViewController:(UIViewController *)loginViewController{
    [self loadIndex0DataInView];
}

/*
    在这里把所有加载好的数据，开始呈现在界面上
 */
-(void)loadIndex0DataInView{
    NSLog(@"loadIndex0DataInView");
}

@end
