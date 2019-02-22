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


@end
