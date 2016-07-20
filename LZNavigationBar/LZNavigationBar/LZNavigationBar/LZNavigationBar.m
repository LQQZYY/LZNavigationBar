//
//  LZNavigationBar.m
//  LZNavigationBar
//
//  Created by Artron_LQQ on 16/7/19.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZNavigationBar.h"
#import "LZConfigFile_bar.h"

static LZNavigationBar *defaultBar= nil;
static UIView *superView = nil;
static UIViewController *superController = nil;

@interface LZNavigationBar ()

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *centerView;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (strong, nonatomic) UIVisualEffectView *blurEffectView;
@property (copy, nonatomic) buttonClickBlock leftButtonClick;
@property (copy, nonatomic) buttonClickBlock rightButtonClick;
@end

@implementation LZNavigationBar

+ (instancetype)showInViewController:(UIViewController *) vc {
    
    defaultBar = [[self alloc]initWithViewController:vc];
    
    return defaultBar;
}

+ (instancetype)showInView:(UIView *) view {
    
    defaultBar = [[self alloc]initWithSuperView:view];
    
    return defaultBar;
}

+ (instancetype)currentBar {
    
    return defaultBar;
}

+ (void)hiddenFromSupperView {
    
    [defaultBar removeFromSuperview];
}

+ (void)show {
    
    if (superView) {
        [superView addSubview:defaultBar];
    } else if (superController) {
        [superController.view addSubview:defaultBar];
    } else {
        
    }
}

- (instancetype)initWithViewController:(UIViewController *)vc {
    self = [super init];
    if (self) {
        
        superController = vc;
        [vc.view addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(vc.view);
            make.height.mas_equalTo(@(LZNavigationBarHeight_bar));
        }];
        
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithSuperView:(UIView *)view {
    self = [super init];
    if (self) {
        
        superView = view;
        [view addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(view);
            make.height.mas_equalTo(@(LZNavigationBarHeight_bar));
        }];
        
        [self setup];
    }
    
    return self;
}

- (void)showBottomLine {
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    [self.contentView bringSubviewToFront:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.mas_equalTo(self);
        make.height.mas_equalTo(@1);
    }];
}

- (void)setBackgroundImage:(NSString*)name isStretch:(BOOL)isStretch {
    
    UIImage *image = [UIImage imageNamed:name];
    UIImage *newImage = image;
    if (isStretch) {
        newImage = [image stretchableImageWithLeftCapWidth:image.size.width/2.0 topCapHeight:image.size.height/2.0];
    }
    
    self.backgroundImageView.image = image;
}

- (void)setBlurEffect:(BOOL)blur {
    
    self.blurEffectView.hidden = blur;
}

- (void)leftButtonClickWithBlock:(buttonClickBlock)block {
    
    [self.leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftButtonClick = block;
}

- (void)rightButtonClickWithBlock:(buttonClickBlock)block {
    
    [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightButtonClick = block;
}

- (void)setTitle:(NSString *)title {
    
    self.titleLabel.text = title;
}

- (void)setup {
    
//    [self setVibrancyEffect];
//    
//    return;
//    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#warning 待续....
- (void)setVibrancyEffect {
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVibrancyEffect *vibtancy = [UIVibrancyEffect effectForBlurEffect:effect];
    
    UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:vibtancy];
    
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:effect];
    [blurView.contentView addSubview:visualView];
    [self addSubview:blurView];
    
    [blurView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [visualView.contentView addSubview:self.leftButton];
}

- (UIVisualEffectView *)blurEffectView {
    
    if (_blurEffectView == nil) {
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
        
        [self insertSubview:effectView belowSubview:self.contentView];
        
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
   
    return _blurEffectView;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc]init];
    }
    
    return _contentView;
}

- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc]init];
        
        [self insertSubview:_backgroundImageView atIndex:0];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    
    return _backgroundImageView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectZero];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont systemFontOfSize:16];
        titleLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:titleLab];
        _titleLabel = titleLab;
        
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(20);
            make.centerX.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView);
            make.width.mas_lessThanOrEqualTo(@(LZScreenWidth_bar*2/3.0));
        }];
    }
    
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (_leftButton == nil) {
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [leftButton setTitle:@"返回" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self.contentView addSubview:leftButton];
        _leftButton = leftButton;
        
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(self.contentView);
            make.top.mas_equalTo(@23);
            make.width.mas_lessThanOrEqualTo(@(LZScreenWidth_bar/6.0));
            make.width.mas_greaterThanOrEqualTo(@50);
        }];
    }
    
    return _leftButton;
}

- (void)leftButtonClick:(UIButton*)button {
    
    if (self.leftButtonClick) {
        self.leftButtonClick(button);
    }
}

- (UIButton *)rightButton {
    if (_rightView == nil) {
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.contentView addSubview:rightButton];
        _rightButton = rightButton;
        
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(20);
            make.width.mas_lessThanOrEqualTo(@(LZScreenWidth_bar/6.0));
            make.width.mas_greaterThanOrEqualTo(@50);
        }];
    }
    
    return _rightButton;
}

- (void)rightButtonClick:(UIButton *)button {
    
    if (self.rightButtonClick) {
        self.rightButtonClick(button);
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
