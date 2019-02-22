//
//  MusicPlayViewController.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "../musicTools/MusicManager.h"
#import "../musicList/MusicListManager.h"
@class MusicManager;
NS_ASSUME_NONNULL_BEGIN

@interface MusicPlayViewController : UIViewController <AVAudioPlayerDelegate>
@property (nonatomic, strong) MusicOBJ *musicObj;

@end

NS_ASSUME_NONNULL_END
