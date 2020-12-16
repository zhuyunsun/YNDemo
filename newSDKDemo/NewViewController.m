//
//  NewViewController.m
//  sdkTest
//
//  Created by 朱运 on 2020/11/9.
//  Copyright © 2020 Dom. All rights reserved.
//

#import "NewViewController.h"
#import <V168Core/V168Core.h>
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"all = %@",[UIFont familyNames]);
    
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = [UIScreen mainScreen].bounds;
    img.image = [UIImage imageNamed:@"backImage.jpg"];
    [self.view addSubview:img];

    
    NSArray *arr = @[@"登录",@"角色检查",@"支付",@"IM",@"信息登记"];
    for (NSInteger i = 0; i < arr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i + 9900;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blackColor];
        btn.frame = CGRectMake(0, 0, 80, 40);
        btn.center = CGPointMake(self.view.center.x, i *(40 + 20) + 70);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:btn];
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
    }
}
-(void)btnAction:(UIButton *)btn{
    NSInteger i = btn.tag - 9900;
    if (i == 0) {
        [[V168Core V168CoreStart] Jacksonvillewehavehad:NO complete:^(NSString *userID,BOOL isVistor) {
            
            NSLog(@"userid : %@ %d",userID,isVistor);
            
            
        }];
    }
    if (i == 1) {
        
        NSString *rid = @"33111";
        rid = [NSString stringWithFormat:@"%u",arc4random() % 10000 + 10000];
        [[V168Core V168CoreStart] Andinhighspiritsofficers:@"2211" RoleID:rid Block:^(NSDictionary *result, NSString *state, NSString *httpType) {

            NSLog(@"result: %@, state: %@ , httpType : %@",result,state,httpType);

        }];
        
    //    [[V168Core V168CoreStart] showThePersonCenterView:0 roleid:@"2222" serverid:@"11111"];

    }
    if (i == 2) {
        [[V168Core V168CoreStart] Steamboatthatcomesupforcoalbrings:@"com.04fe.ios.3000" orderNum:@"2374893789724" currentMoney:@"4.99" Ctext:nil callBack:@"12333" payBlock:^(NSString *state, NSInteger payBackCode) {
            
            NSLog(@"payCode : %ld,  state: %@",payBackCode,state);
            
            
        }];

    }
    if (i == 3) {
        [[V168Core V168CoreStart] Greatestfearisoffinding];
    }
    if (i == 4) {
        if ([[V168Core V168CoreStart] hadBindMessage] == YES) {
            NSLog(@"信息已经登记");
            return;
        }
        [[NSNotificationCenter defaultCenter] removeObserver:self name:YNNOTI object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAction:) name:YNNOTI object:nil];
        [[V168Core V168CoreStart] showBindMessage];
    }

}
-(void)notiAction:(NSNotification *)noti{
    NSLog(@"noti = %@",noti.userInfo);
//    "is_formal" = 0;是否为正式服：1是，0否
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YNNOTI object:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([[V168Core V168CoreStart] hadBindMessage] == YES) {
        NSLog(@"信息已经登记");
    }else{
        NSLog(@"信息没有登记");
    }

}
@end
