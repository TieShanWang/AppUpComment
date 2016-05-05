//
//  ViewController.m
//  UPDate_Comment
//
//  Created by MR.KING on 16/5/5.
//  Copyright © 2016年 Tmp. All rights reserved.
//

#import "ViewController.h"

#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSString*)appId{
    return @"414245413";
    
}

-(NSString*)fullURLStr{
    // 软件首页
//    return [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",[self appId]];
    
    // 评论
    return [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",[self appId]];
}

- (IBAction)turnToAppStore:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self fullURLStr]]];
}

- (IBAction)InApp:(id)sender {
    //初始化控制器
    
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    
    //设置代理请求为当前控制器本身
    
    storeProductViewContorller.delegate = self;
    
    //加载一个新的视图展示
    
    [storeProductViewContorller loadProductWithParameters: @{SKStoreProductParameterITunesItemIdentifier :[self appId]} completionBlock:^(BOOL result, NSError *error) {
        
        //block回调
        
        if(error){
            
            NSLog(@"Error %@ with userInfo %@",error,[error userInfo]);
            
        }else{
            
        }
        
    }];
    //模态弹出AppStore应用界面
    
    [self presentViewController:storeProductViewContorller animated:YES completion:nil];
}

-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
