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
@interface MusicPlayViewController ()
@property (nonatomic, strong) MusicManager *musicManager;
@property (nonatomic, strong) BottomView *bottomView;
@property (nonatomic, strong) ShowView *showView;
@property (nonatomic, strong) CrlView *crlView;
@end

@implementation MusicPlayViewController

- (MusicManager *)musicManager{
    if (!_musicManager) {
        _musicManager = [MusicManager shareInstance];
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
    _musicObj = musicObj;
    [self.musicManager playMusicMusicObj:musicObj musicPlayView:self];
    self.crlView.imageName = musicObj.icon;
}



- (void)setUpView
{
    _bottomView = [[BottomView alloc] initWithFrame:CGRectZero];
    _showView = [[ShowView alloc] initWithFrame:CGRectZero];
    _crlView = [[CrlView alloc] initWithFrame:CGRectZero];
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

@end
