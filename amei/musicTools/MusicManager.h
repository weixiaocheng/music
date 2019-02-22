//
//  MusicManager.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../musicList/MusicOBJ.h"
@class MusicPlayViewController;
NS_ASSUME_NONNULL_BEGIN

@interface MusicManager : NSObject

+ (instancetype)shareInstance;
/**
 音乐播放
 
 @param musicObj 传入播放对象
 @param musicVC 直接给 self
 */
- (void)playMusicMusicObj: (MusicOBJ *)musicObj musicPlayView: (MusicPlayViewController *)musicVC;
/**
 音乐暂停 或者播放
 
 @param musicObj <#musicObj description#>
 */
- (void)pauseMusicMusicObj: (MusicOBJ *)musicObj;
/**
 停止音乐播放
 
 @param musicObj <#musicObj description#>
 */
- (void)stopMusicPlayMusicMusicObj: (MusicOBJ *)musicObj;
@end

NS_ASSUME_NONNULL_END
