//
//  config.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#ifndef config_h
#define config_h

#define KSCREENWIDTH  UIScreen.mainScreen.bounds.size.width
#define KSCREENHEIGHT  UIScreen.mainScreen.bounds.size.height
// 弱关系
#define WeakSelf __weak typeof(self) weakSelf = self;

//判断iPHoneX、iPHoneXs
#define SCREENSIZE_IS_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define SCREENSIZE_IS_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

//判断iPhoneXs Max
#define SCREENSIZE_IS_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)

#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

//状态栏、导航栏、标签栏高度
#define Height_StatusBar [[UIApplication sharedApplication] statusBarFrame].size.height

#define Height_NavBar 44.0f

#define Height_TopBar (Height_StatusBar + Height_NavBar)

#define Height_TapBar (IS_IPhoneX_All ? 83.0f:49.0f)

#define Height_BottomSafe (IS_IPhoneX_All? 34.0f:0.0f)

#endif /* config_h */
