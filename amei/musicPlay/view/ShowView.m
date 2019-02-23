//
//  ShowView.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "ShowView.h"
#import "../../musicTools/YUTimer.h"
@interface ShowView ()
@property (nonatomic, strong) UIButton *silderBtn; /**< 滑块 做一般状态 和 高亮的状态*/
@property (nonatomic, strong) UIView *progressView; /**< 进度条 */
@property (nonatomic, strong) UILabel *timeLable; /**< 显示时间 */
@property (nonatomic, strong) UIView *progress_backView;
@property (nonatomic, strong) YUTimer *timer_slider_runtime; /**< 关于滑块的运行时*/
@end

@implementation ShowView

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
    self.progress_backView = [[UIView alloc] initWithFrame:CGRectZero];
    self.progress_backView.backgroundColor = [CommonMethod colorWithHexColorString:@"#cccccc"];
    self.silderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.silderBtn setImage:[UIImage imageNamed:@"process_thumb"] forState:UIControlStateNormal];
    self.progressView = [[UIView alloc] initWithFrame:CGRectZero];
    self.progressView.backgroundColor = [CommonMethod colorWithHexColorString:@"#4876FF"];
    self.timeLable = [[UILabel alloc] initWithFrame:CGRectZero];
    self.timeLable.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.progress_backView];
    [self addSubview:self.silderBtn];
    [self.progress_backView addSubview:self.timeLable];
    [self.progress_backView addSubview:self.progressView];
    
    WeakSelf;
    [self.progress_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf).offset(-3);
        make.height.offset(13);
    }];
    [self.silderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.progress_backView);
        make.centerY.equalTo(self.progress_backView);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.progress_backView);
        make.right.equalTo(weakSelf.silderBtn.mas_centerX);
        make.top.bottom.equalTo(weakSelf.progress_backView);
    }];
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-3);
        make.centerY.equalTo(self.progress_backView);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    [self.progress_backView addGestureRecognizer:tap];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.silderBtn addGestureRecognizer:pan];
}

// 搭建tap 事件
- (void)tapView: (UITapGestureRecognizer *)tap
{
    NSLog(@"\ntap : %@ \n",tap);
    CGPoint point = [tap locationInView:self.progress_backView];
    CGPoint silderCenter = self.silderBtn.center;
    if (point.x + self.silderBtn.width/2 > self.progress_backView.width) {
      silderCenter.x = self.progress_backView.width - self.silderBtn.width/2 ;
    }else{
       silderCenter.x = point.x;
    }
    
    self.silderBtn.center = silderCenter;
    self.progressView.width = silderCenter.x;
    double time = point.x/self.progress_backView.width*self.play.duration;
    self.play.currentTime = time;
}

- (void)panView: (UIPanGestureRecognizer *)pan
{
    NSLog(@"\npan : %@ \n",pan);
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"停止 runloop");
        [self holdFire];
    }
    else if (pan.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"开启 runloop");
        // 获取当前的位置 并 将音乐 切换过去
        CGPoint point = [pan locationInView:self.progress_backView];
        double time = point.x/self.progress_backView.width*self.play.duration;
        self.play.currentTime = time;
        [self addCurrentTimer];
    }
    else if (pan.state == UIGestureRecognizerStateChanged)
    {
        CGPoint point = [pan locationInView:self.progress_backView];
        CGPoint silderCenter = self.silderBtn.center;
        if (point.x + self.silderBtn.width/2 > self.progress_backView.width) {
            silderCenter.x = self.progress_backView.width - self.silderBtn.width/2 ;
        }else{
            silderCenter.x = point.x;
        }
        self.silderBtn.center = silderCenter;
        self.progressView.width = silderCenter.x;
    }
}

- (void)setPlay:(AVAudioPlayer *)play
{
    _play = play;
    // 首先移除 再 添加 运行时
    self.timeLable.text = [self stringWithTime: self.play.duration];
    [self addCurrentTimer];
}

- (void)addCurrentTimer{
    if (self.timer_slider_runtime) {
        [self.timer_slider_runtime resume];
    }else{
        self.timer_slider_runtime = [[YUTimer alloc] init];
        [self.timer_slider_runtime startTimerWithSpace:0.1 block:^(BOOL result) {
            if (result) {
                
            }
            [self updateSliderCurrentTimer];
        }];
    }
    
}

- (void)holdFire
{
    [self.timer_slider_runtime suspend];
}

- (void)updateSliderCurrentTimer
{
    double tempx = self.play.currentTime/self.play.duration;
    CGPoint silderCenter = self.silderBtn.center;
    
    silderCenter.x = self.progress_backView.width*tempx;
    self.silderBtn.center = silderCenter;
    self.progressView.width = silderCenter.x;
}

- (NSString *)stringWithTime: (double)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dataformatter = [[NSDateFormatter alloc] init];
    dataformatter.dateFormat = @"mm:ss";
    return [dataformatter stringFromDate:date];
}

@end
