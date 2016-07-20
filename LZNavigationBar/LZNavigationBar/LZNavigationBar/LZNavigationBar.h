//
//  LZNavigationBar.h
//  LZNavigationBar
//
//  Created by Artron_LQQ on 16/7/19.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonClickBlock)(UIButton *button);
@interface LZNavigationBar : UIView
#pragma mark - 属性
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;

#pragma mark - 初始化
+ (instancetype)showInViewController:(UIViewController *) vc;

#pragma mark - 实例方法
- (void)showBottomLine ;
- (void)setBackgroundImage:(NSString*)name isStretch:(BOOL)isStretch;
- (void)setBlurEffect:(BOOL)blur;

#pragma mark - 事件方法
- (void)leftButtonClickWithBlock:(buttonClickBlock)block;
- (void)rightButtonClickWithBlock:(buttonClickBlock)block;
@end
