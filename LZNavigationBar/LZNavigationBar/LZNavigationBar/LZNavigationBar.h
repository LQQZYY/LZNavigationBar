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
/*使用控制器初始化,初始化后即直接添加到视图,不需要单独add*/
+ (instancetype)showInViewController:(UIViewController *) vc;
/*使用视图初始化,初始化后即直接添加到视图,不需要单独add*/
+ (instancetype)showInView:(UIView *) view;

/*获取当前的bar*/
+ (instancetype)currentBar;
/*隐藏,和+ (void)show 配对使用*/
+ (void)hiddenFromSupperView;
+ (void)show;
#pragma mark - 实例方法
- (void)showBottomLineWithColor:(UIColor *)color;
- (void)setBackgroundImage:(NSString*)name isStretch:(BOOL)isStretch;
/*添加毛玻璃效果*/
- (void)setBlurEffect:(BOOL)blur;

#pragma mark - 事件回调方法
/*可以使用此方法回调点击事件,也可以通过属性按钮绑定方法*/
- (void)leftButtonClickWithBlock:(buttonClickBlock)block;
- (void)rightButtonClickWithBlock:(buttonClickBlock)block;
@end
