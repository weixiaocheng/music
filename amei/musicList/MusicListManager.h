//
//  MusicListManager.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicOBJ.h"
NS_ASSUME_NONNULL_BEGIN

@interface MusicListManager : NSObject
@property (nonatomic, strong) NSArray *musicList; /**< <#备注#> */
// 单例
+ (instancetype)shareInstance;

// 获取上一曲
- (MusicOBJ *)previousMusic: (MusicOBJ *)passmusicObj;

// 获取下一曲
- (MusicOBJ *)nextMusic: (MusicOBJ *)passmusicObj;
// 获取一下歌词
- (NSArray *)getLrcsWithMusicObj: (MusicOBJ *)musicObj;
@end

NS_ASSUME_NONNULL_END
