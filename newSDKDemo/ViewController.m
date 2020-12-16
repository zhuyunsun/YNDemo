//
//  ViewController.m
//  newSDKDemo
//
//  Created by Douglas on 2018/6/29.
//  Copyright © 2018年 Dom. All rights reserved.
//

#import "ViewController.h"
#import <V168Core/V168Core.h>
@interface ViewController ()

@property (nonatomic)BOOL vistorHandle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"allfont = %@",[UIFont familyNames]);
    self.view.backgroundColor = [UIColor blackColor];
}

- (IBAction)login:(id)sender {
    
    [[V168Core V168CoreStart] Jacksonvillewehavehad:NO complete:^(NSString *userID,BOOL isVistor) {
        
        NSLog(@"userid : %@",userID);
        self.vistorHandle = isVistor; //记录当前账号是否为游客账号
    }];
    
}

- (IBAction)userDetail:(id)sender {
    
    [[V168Core V168CoreStart] Andinhighspiritsofficers:@"2211" RoleID:@"33111" Block:^(NSDictionary *result, NSString *state, NSString *httpType) {
        
        NSLog(@"result: %@, state: %@ , httpType : %@",result,state,httpType);
        
    }];
    
}

- (IBAction)pay:(id)sender {
    
    [[V168Core V168CoreStart] Steamboatthatcomesupforcoalbrings:@"com.04fe.ios.3000" orderNum:@"2374893789724" currentMoney:@"4.99" Ctext:nil callBack:@"12333" payBlock:^(NSString *state, NSInteger payBackCode) {
        
        NSLog(@"payCode : %ld,  state: %@",payBackCode,state);
        
        
    }];
    
    //五星评价
    [[V168Core V168CoreStart] Greatestfearisoffinding];
}

- (IBAction)bindAction:(id)sender {
    
    //账号绑定设定
    int count;
    if (self.vistorHandle) {
        count = 2;
    }else{
        count = 0;
    }
    [[V168Core V168CoreStart] showThePersonCenterView:count roleid:@"33111" serverid:@"2211"];
    
}

@end
