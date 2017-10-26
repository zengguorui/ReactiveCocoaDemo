//
//  RACSubjectVC.m
//  ReactiveCocoaDemo
//
//  Created by 曾国锐 on 2017/8/31.
//  Copyright © 2017年 曾国锐. All rights reserved.
//

#import "RACSubjectVC.h"
#import "RACSubjectTwoVC.h"

@interface RACSubjectVC ()

@end

@implementation RACSubjectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // RACSubject使用步骤
    // 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
    // 2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 sendNext:(id)value
    
    // RACSubject:底层实现和RACSignal不一样。
    // 1.调用subscribeNext订阅信号，只是把订阅者保存起来，并且订阅者的nextBlock已经赋值了。
    // 2.调用sendNext发送信号，遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
    
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.订阅信号
    [subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第一个订阅者%@",x);
    }];
    [subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第二个订阅者%@",x);
    }];
    
    // 3.发送信号
    [subject sendNext:@"1"];
    

    //RACSubject替换代理
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.frame = CGRectMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2-22, 80, 44);
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSLog(@"按钮被点击了");
        RACSubjectTwoVC *twoVc = [NSClassFromString(@"RACSubjectTwoVC") new];
        twoVc.title = @"RACSubjectTwoVC";
        // 设置代理信号
        twoVc.delegateSignal = [RACSubject subject];
        
        // 订阅代理信号
        [twoVc.delegateSignal subscribeNext:^(id x) {
            
            NSLog(@"点击了通知按钮");
        }];

        [self.navigationController pushViewController:twoVc animated:YES];
    }];
    
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

@end
