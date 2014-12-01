//
//  SharedAction.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-28.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "SharedAction.h"
#import "LoginViewController.h"

@implementation SharedAction

+(void)presentLoginViewControllerInViewController:(UIViewController *)viewController{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    UINavigationController *userNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"UserNavController"];
    LoginViewController *loginViewController = userNavigationController.viewControllers.firstObject;
    loginViewController.delegate = (id)viewController;
    [viewController presentViewController:userNavigationController animated:YES completion:nil];
}

+(void)commonActionWithUrl:(NSString *)url andStatus:(NSInteger)status andError:(NSString *)error andJSONModelError:(JSONModelError *)jsonError andObject:(id)object withDone:(doneWithObject)done{
    NSLog(@"status=%d url=%@",status,url);
    if (!jsonError) {
        if (status==2) {
            done(object);
            [SVProgressHUD showSuccessWithStatus:error];
        }else{
            if (error==nil||[error isEqualToString:@""]) {
                [SVProgressHUD dismiss];
            }else{
                [SVProgressHUD showErrorWithStatus:error];
            }
        }
    }else{
        NSLog(@"%@",jsonError);
    }
}
@end
