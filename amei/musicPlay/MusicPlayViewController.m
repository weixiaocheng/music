//
//  MusicPlayViewController.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicPlayViewController.h"
#import "view/BottomView.h"
#import "view/CrlView.h"
#import "view/ShowView.h"
@interface MusicPlayViewController ()<BottomViewDelegate,CrlViewDelegate>
@property (nonatomic, strong) MusicManager *musicManager;
@property (nonatomic, strong) BottomView *bottomView;
@property (nonatomic, strong) ShowView *showView;
@property (nonatomic, strong) CrlView *crlView;
@property (nonatomic, strong) MusicListManager *listManager;
@end

@implementation MusicPlayViewController

- (MusicManager *)musicManager{
    if (!_musicManager) {
        _musicManager = [MusicManager shareInstance];
        _listManager = [MusicListManager shareInstance];
    }
    return _musicManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUpView];
}

-(void)setMusicObj:(MusicOBJ *)musicObj
{
    if (musicObj == nil) {
        return;
    }
    
    if (_musicObj == musicObj) {
        return;
    }
    if (_musicObj) {
        
        [self.musicManager stopMusicPlayMusicMusicObj:_musicObj];
        
    }
    _musicObj = musicObj;
    self.showView.play = [self.musicManager playMusicMusicObj:musicObj musicPlayView:self];
    self.crlView.imageName = musicObj.icon;
    self.bottomView.isPlay = true;
    _musicObj.isPlay = true;
    [self.showView setUpSiger:musicObj.singer name:musicObj.name];
}



- (void)setUpView
{
    _bottomView = [[BottomView alloc] initWithFrame:CGRectZero];
    _bottomView.delegate = self;
    _showView = [[ShowView alloc] initWithFrame:CGRectZero];
    _crlView = [[CrlView alloc] initWithFrame:CGRectZero];
    _crlView.delegate = self;
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.crlView];
    [self.view addSubview:self.showView];
    WeakSelf;
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-Height_BottomSafe);
        make.height.offset(80);
    }];
    
    [self.crlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.bottomView.mas_top);
    }];
    
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.height.offset(50);
        make.bottom.equalTo(weakSelf.bottomView.mas_top).offset(5);
    }];
}

#pragma mark -- delegate
- (void)backCrlView:(CrlView *)crlview
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)playBottomView:(BottomView *)bottomView
{
    NSLog(@"点击了 播放 暂停 ");
    NSLog(@"self.musicManager : %@", self.musicManager);
    [self.musicManager pauseMusicMusicObj:self.musicObj];
}

- (void)nextBottomView:(BottomView *)bottimView
{
    NSLog(@"点击了 下一首");
    self.musicObj = [self.listManager nextMusic:self.musicObj];
}

- (void)previousBottomView:(BottomView *)bottomView
{
    NSLog(@"点击了上一首");
    self.musicObj = [self.listManager previousMusic:self.musicObj];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    // 下一曲
    self.musicObj = [self.listManager nextMusic:self.musicObj];
}

@end
