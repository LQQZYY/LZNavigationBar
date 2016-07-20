//
//  FirstViewController.m
//  LZNavigationBar
//
//  Created by Artron_LQQ on 16/7/19.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "FirstViewController.h"
#import "LZNavigationBar.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    LZNavigationBar *bar = [LZNavigationBar showInViewController:self];
    bar.titleLabel.text = @"aaaaaa";
    
    
    [bar leftButtonClickWithBlock:^(UIButton *button) {
        NSLog(@"leftButtonClick");
        
        [self.navigationController popViewControllerAnimated:YES];

    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
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
