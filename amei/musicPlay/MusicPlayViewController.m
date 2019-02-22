//
//  MusicPlayViewController.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicPlayViewController.h"

@interface MusicPlayViewController ()
@property (nonatomic, strong) MusicManager *musicManager;
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
    // Do any additional setup after loading the view.
}

-(void)setMusicObj:(MusicOBJ *)musicObj
{
    _musicObj = musicObj;
    [self.musicManager playMusicMusicObj:musicObj musicPlayView:self];
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
