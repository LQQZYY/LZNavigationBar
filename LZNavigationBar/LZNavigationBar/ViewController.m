//
//  ViewController.m
//  LZNavigationBar
//
//  Created by Artron_LQQ on 16/7/19.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZNavigationBar/LZNavigationBar.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    self.title = @"aflajgaogoajgpowajgowejgwoegjpowjgpwajgpowjgpwjegowjogjwogjweoeg";
    self.view.backgroundColor = [UIColor whiteColor];
//
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"按钮按钮ann按钮按钮按钮安娜那你按钮按钮按钮按钮" style:UIBarButtonItemStylePlain target:self action:@selector(left)];
//    return;
    LZNavigationBar *bar = [LZNavigationBar showInViewController:self];
//    bar.backgroundColor = [UIColor redColor];
    bar.leftButton.backgroundColor = [UIColor cyanColor];
    bar.rightButton.backgroundColor = [UIColor cyanColor];
    bar.title = @"title";
    [bar setBlurEffect:YES];
    
//    [bar setBackgroundImage:@"40fe711f9b754b596159f3a6.jpg" isStretch:NO];
    
    [bar showBottomLineWithColor:nil];
    
    [bar leftButtonClickWithBlock:^(UIButton *button) {
        NSLog(@"leftButtonClick");
    }];
    
    [bar rightButtonClickWithBlock:^(UIButton *button) {
        NSLog(@"rightButtonClick");
    }];
    
    
//    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    table.delegate = self;
//    table.dataSource = self;
//    [self.view addSubview:table];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FirstViewController *first = [[FirstViewController alloc]init];
    
    [self.navigationController pushViewController:first animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
