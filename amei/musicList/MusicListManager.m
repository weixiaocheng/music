//
//  MusicListManager.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicListManager.h"
static MusicListManager *manager = nil;
@implementation MusicListManager
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

- (NSArray *)musicList
{
    if (!_musicList) {
        _musicList = [self getDataFormPlist];
    }
    return _musicList;
}

- (NSArray *)getDataFormPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Musics.plist" ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"array : %@",array);
    NSMutableArray *musicList = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array)
    {
        MusicOBJ *musicObj = [CommonMethod transforDICToOBJ:dict withClass:[MusicOBJ class] withClassName:@"MusicOBJ"];
        [musicList addObject:musicObj];
    }
    return musicList;
}

#pragma mark -- 上一曲
- (MusicOBJ *)previousMusic: (MusicOBJ *)passmusicObj
{
    if (self.musicList.count == 0) {
        return passmusicObj;
    }else if (self.musicList.count == 1)
    {
        return self.musicList[0];
    }
    
    NSInteger index = -1;
    for (int i = 0; i < self.musicList.count; i ++ ) {
        MusicOBJ *musicObj = self.musicList[i];
        if (musicObj == passmusicObj) {
            index = i;
            break;
        }
    }
    if (index == -1) {
        NSLog(@"见鬼了 不存在正在播放的对象");
        if (self.musicList.count == 0) {
            return passmusicObj;
        }
    }
    if (index == 0) {
        return self.musicList[self.musicList.count - 1];
    }else{
        return self.musicList[index - 1];
    }
    
    return self.musicList[0];
}

- (MusicOBJ *)nextMusic: (MusicOBJ *)passmusicObj{
    if (self.musicList.count == 0) {
        return passmusicObj;
    }else if (self.musicList.count == 1)
    {
        return self.musicList[0];
    }
    
    NSInteger index = -1;
    for (int i = 0; i < self.musicList.count; i ++ ) {
        MusicOBJ *musicObj = self.musicList[i];
        if (musicObj == passmusicObj) {
            index = i;
            break;
        }
    }
    if (index == -1) {
        NSLog(@"见鬼了 不存在正在播放的对象");
        if (self.musicList.count == 0) {
            return passmusicObj;
        }
    }
    if (index == self.musicList.count - 1) {
        return self.musicList[0];
    }else{
        return self.musicList[index + 1];
    }
    
    return self.musicList[0];
}


@end
