//
//  BottomView.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *previousBtn;
@property (nonatomic, strong) UIButton *nextBtn;
@end

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
    
    [self.previousBtn setImage:[UIImage imageNamed:@"previous"] forState:UIControlStateNormal];
    [self.nextBtn setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    
    
    [self addSubview:self.playBtn];
    [self addSubview:self.previousBtn];
    [self addSubview:self.nextBtn];
    WeakSelf;
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.height.offset(46);
        make.width.offset(72);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [self.previousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.playBtn.mas_left).offset(-15);
        make.centerY.equalTo(weakSelf.playBtn);
        make.width.offset(41);
        make.height.offset(46);
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.playBtn);
        make.left.equalTo(weakSelf.playBtn.mas_right).offset(15);
        make.width.offset(41);
        make.height.offset(46);
    }];
    
    // 添加点击事件
    self.previousBtn.tag = 101;
    self.playBtn.tag = 102;
    self.nextBtn.tag = 103;
    [self.previousBtn addTarget:self action:@selector(buttonTarget:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonTarget: (UIButton *)sender
{
    switch (sender.tag) {
        case 101:
            if ([self.delegate respondsToSelector:@selector(previousBottomView:)]) {
                [self.delegate previousBottomView:self];
            }
            break;
        case 102:
            if ([self.delegate respondsToSelector:@selector(playBottomView:)]) {
                [self.delegate previousBottomView:self];
            }
            break;
        case 103:
            if ([self.delegate respondsToSelector:@selector(nextBottomView:)]) {
                [self.delegate previousBottomView:self];
            }
            break;
        default:
            break;
    }
}

@end
