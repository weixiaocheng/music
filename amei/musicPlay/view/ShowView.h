//
//  ShowView.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface ShowView : UIView
@property (nonatomic, strong)AVAudioPlayer *play;
- (void)setUpSiger: (NSString *)sigername name: (NSString *)name;
@end

NS_ASSUME_NONNULL_END
