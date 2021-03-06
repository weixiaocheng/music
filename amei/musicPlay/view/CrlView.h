//
//  CrlView.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../musicList/MusicLrcOBJ.h"
#import <AVFoundation/AVFoundation.h>
@class CrlView;
@protocol CrlViewDelegate <NSObject>

// 点击了返回按钮
- (void)backCrlView: (CrlView *)crlview;

@end
NS_ASSUME_NONNULL_BEGIN

@interface CrlView : UIView
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, strong) NSArray<MusicLrcOBJ*> *datasoure;
@property (nonatomic, weak)id<CrlViewDelegate>delegate;
@property (nonatomic, strong)AVAudioPlayer *play;
@end

NS_ASSUME_NONNULL_END
