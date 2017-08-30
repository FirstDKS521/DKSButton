//
//  ViewController.m
//  DKSButton
//
//  Created by aDu on 2017/8/30.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "ViewController.h"
#import "DKSButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //图片在左
    UIImage *image = [UIImage imageNamed:@"123"];
    DKSButton *button = [DKSButton buttonWithType:UIButtonTypeCustom withSpace:10];
    button.buttonStyle = DKSButtonImageLeft;
    button.padding = 5;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:@"图片在左" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.titleLabel.backgroundColor = [UIColor redColor];
    button.backgroundColor = [UIColor brownColor];
    button.frame = CGRectMake(100, 50, 150, 40);
    [self.view addSubview:button];
    
    //图片在右
    UIImage *image1 = [UIImage imageNamed:@"111"];
    DKSButton *button1 = [DKSButton buttonWithType:UIButtonTypeCustom withSpace:10];
    button1.buttonStyle = DKSButtonImageRight;
    [button1 setImage:image1 forState:UIControlStateNormal];
    [button1 setTitle:@"图片在右" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:15];
    button1.titleLabel.backgroundColor = [UIColor redColor];
    button1.backgroundColor = [UIColor brownColor];
    button1.frame = CGRectMake(100, 110, 150, 40);
    [self.view addSubview:button1];
    
    //图片在上
    UIImage *image2 = [UIImage imageNamed:@"123"];
    DKSButton *button2 = [DKSButton buttonWithType:UIButtonTypeCustom withSpace:10];
    button2.buttonStyle = DKSButtonImageTop;
    button.padding = 5;
    [button2 setImage:image2 forState:UIControlStateNormal];
    [button2 setTitle:@"图片在上" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:15];
    button2.titleLabel.backgroundColor = [UIColor redColor];
    button2.backgroundColor = [UIColor brownColor];
    button2.frame = CGRectMake(100, 170, 150, 60);
    [self.view addSubview:button2];
    
    //图片在下
    UIImage *image3 = [UIImage imageNamed:@"111"];
    DKSButton *button3 = [DKSButton buttonWithType:UIButtonTypeCustom withSpace:10];
    button3.buttonStyle = DKSButtonImageBottom;
    [button3 setImage:image3 forState:UIControlStateNormal];
    [button3 setTitle:@"图片在下" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:15];
    button3.titleLabel.backgroundColor = [UIColor redColor];
    button3.backgroundColor = [UIColor brownColor];
    button3.frame = CGRectMake(100, 250, 150, 60);
    [self.view addSubview:button3];
}

@end
