//
//  MusicManager.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicManager.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicManager ()
@property (nonatomic, strong) NSMutableDictionary *avaudionDict;
@end

static MusicManager *manager = nil;
@implementation MusicManager
- (NSMutableDictionary *)avaudionDict
{
    if (!_avaudionDict) {
        _avaudionDict = [NSMutableDictionary dictionary];
    }
    return _avaudionDict;
}

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return manager;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error = nil;
        [session setCategory:AVAudioSessionCategoryPlayback error:&error];
        if (error) {
            NSLog(@"\n error : %@ \n", error);
        }
    }
    return self;
}


/**
 音乐播放

 @param musicObj 传入播放对象
 @param musicVC 直接给 self
 */
- (void)playMusicMusicObj: (MusicOBJ *)musicObj musicPlayView: (MusicPlayViewController *)musicVC
{
    if (musicObj.isPlay) { // 正在播放中
        AVAudioPlayer *play = self.avaudionDict[musicObj.filename];
        if (play) {
            [play pause];
            musicObj.isPlay = false;
        }
        return;
    }
    
    // 判断 play 是否存在
    AVAudioPlayer *play = self.avaudionDict[musicObj.filename];
    if (play) {
        [play play];
    }else{
        NSString *path = [[NSBundle mainBundle] pathForResource:musicObj.filename ofType:nil ];
        // 判断路径是否存在
        if (path == nil) {
            NSLog(@"程序出错了  路径不存在 filename: %@ \n", musicObj.filename);
            return;
        }
        NSURL *fileUrl = [NSURL fileURLWithPath:path];
        NSError *error = nil;
        play = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
        
        [self.avaudionDict setObject:play forKey:musicObj.filename];
    }
    play.delegate = musicVC;
    
}


/**
 音乐暂停 或者播放

 @param musicObj <#musicObj description#>
 */
- (void)pauseMusicMusicObj: (MusicOBJ *)musicObj
{
    if (musicObj == nil) {
        NSLog(@"系统错误: 音乐对象不存在");
        return;
    }
    AVAudioPlayer *play = self.avaudionDict[musicObj.filename];
    if (play == nil) {
        NSLog(@" 没有对应的音乐播放对象 ");
        return;
    }
    if (musicObj.isPlay) {
        [play pause];
        musicObj.isPlay = false;
    }else{
        [play play];
        musicObj.isPlay = true;
    }
}


/**
 停止音乐播放

 @param musicObj <#musicObj description#>
 */
- (void)stopMusicPlayMusicMusicObj: (MusicOBJ *)musicObj
{
    if (musicObj == nil) {
        NSLog(@"系统错误: 音乐对象不存在");
        return;
    }
    AVAudioPlayer *play = self.avaudionDict[musicObj.filename];
    if (play == nil) {
        NSLog(@" 没有对应的音乐播放对象 ");
        return;
    }
    [play stop];
    musicObj.isPlay = false;
}

@end
