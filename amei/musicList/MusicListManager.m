//
//  MusicListManager.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicListManager.h"
#import "MusicLrcOBJ.h"
static MusicListManager *manager = nil;

@interface MusicListManager ()
@property (nonatomic, strong) NSMutableDictionary *lrcDict;
@end

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

- (NSMutableDictionary *)lrcDict
{
    if (!_lrcDict) {
        _lrcDict = [NSMutableDictionary dictionary];
    }
    return _lrcDict;
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


#pragma mark -- 获取歌词
- (NSArray *)getLrcsWithMusicObj: (MusicOBJ *)musicObj
{
    if (musicObj == nil) {
        NSLog(@"见鬼le 为空");
        return nil;
    }
    if ([self.musicList containsObject:musicObj] == false) {
        NSLog(@"不存在歌曲");
        return nil;
    }
    
    NSArray *lrcList = self.lrcDict[musicObj.lrcname];
    if (lrcList) {
        
    }else{
        lrcList = [self getLrcWithMusicFileName:musicObj.lrcname];
        if (lrcList) {
            [self.lrcDict setValue:lrcList forKey:musicObj.lrcname];
        }
    }
    return lrcList;
}

- (NSArray *)getLrcWithMusicFileName: (NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    if (path == nil) {
        NSLog(@"路径错误");
        return nil;
    }
    NSError *error;
    NSString *conten = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"error : %@",error);
        return nil;
    }
    
    if (conten == nil) {
        NSLog(@"文本信息为空");
        return nil;
    }
    
    NSArray *lrcList = [conten componentsSeparatedByString:@"\n"];
    NSMutableArray *mLrclist = [NSMutableArray array];
    for (NSString *string in lrcList)
    {
        MusicLrcOBJ *lrcObj = [[MusicLrcOBJ alloc] initWithString:string];
        [mLrclist addObject:lrcObj];
        NSLog(@"\n时间 : %@\n歌词: %@\n",lrcObj.time, lrcObj.word);
    }
    
    return [mLrclist copy];
}

@end
