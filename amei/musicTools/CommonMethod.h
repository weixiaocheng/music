//
//  CommonMethod.h
//  ALiDaShoping
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 com.anhe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CommonMethod : NSObject
{
}

//将以#开头的颜色色值改变为UIColor型的
+(UIColor *)colorWithHexColorString:(NSString *)hexColorString;
//是否联网
+ (BOOL)isNetEnable;
//获取sessionkey
+(NSString *)getSessionKey;
//将json数据转化为数组或字典
+(id)JSONValue:(NSString *)JSONStr;

+ (void)showAlertViewWithTitle:(NSString *)titleStr withMessage:(NSString *)messageStr;
//判断一个字符串是否包含另一个字符串
+(BOOL)stringContentString:(NSString *)motherString subString:(NSString *)sonString;

+(BOOL)isFourNumberCode:(NSString *)verificationCode;

+(BOOL)isPassword:(NSString *)pass;
+(BOOL)isTrueName:(NSString *)name;

+(BOOL)isIdentityNumber:(NSString *)number;

//判断有没有网络
+(BOOL) isConnectionAvailable;



//+(void)deleteFile;
//判断是否是银行卡号
+(BOOL)isBankCardNum:(NSString *)bankCardNum;
//清空空格和换行符（包括中间的）
+(NSString *)clearSpaceAndHuanhangWithStr:(NSString *)str;
+(BOOL)isTenNumer:(NSString *)num;
//判断是否是邮箱
+ (BOOL)isEmail:(NSString *)mobileNum;
//UTC 时间转换
+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;
+ (NSDate *)dateFromString:(NSString *)dateString;
+ (NSString *)stringFromDate:(NSDate *)date;
+(NSString *)getNowDateOfDate:(NSString *)datestring;
//判断电话号码是否正确
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//获取guid值
+ (NSString*)generateUuidString;
//冒泡排序
+(NSString *)bunbleSortWithArray:(NSArray *)aData;
//把对象转换为字典
+ (NSDictionary*)getObjectData:(id)obj;

//拼接url
+(NSString *)addUrlWithDic:(NSDictionary *)dic withURLIp:(NSString *)ip withPre:(NSString *)urlPre withUrl:(NSString *)urlNext;

//获取对象的所有属性
+ (NSArray *)getAllPropertiesWithOBJClass:(Class)obj;
//将字典转换为对象
+(id)transforDICToOBJ:(NSDictionary *)dic withClass:(Class)OBJ withClassName:(NSString *)className;
//lab自适应高度
+(CGSize)setLabHeightWithStr:(NSString *)text withFont:(UIFont *)font withMaxHeight:(CGSize)maxSize;
//把字典转化为数组
+(NSArray *)dicToArray:(NSDictionary *)dic;

+(id)getLanguageForUI:(NSString *)key;

+(NSString *)tranfSign:(NSDictionary *)dic withApiName:(NSString *)apiName;

+ (UIActivityIndicatorView *)indicatorViewAddTo:(UIView *)view;

//从本地取language的值
+(NSString *)getLanguage;

//判断是否是GUID
+(BOOL)isGuid:(NSString *)uuid;
//tf获取响应，改变view当前的高度
+(void)animationUpHeight:(float)height changeView:(UIView *)view;

//购物车是否需要重新刷新
+(void)isRefreshShopCarWith:(BOOL)isRefresh;

//判断当前的密码格式
+(BOOL)isPWDCurrect:(NSString *)pwd;

//判断输入的金额格式
+(BOOL)isMoneyStyle:(NSString *)moneyStr;
//获取前台网站
+(NSString*)getWebsiteld;
//印度尼西亚 货币添加千位符
+ (NSString *)numberFormatterOfString:(NSString *)number;
//判断是否包含 表情
+ (BOOL)stringContainsEmoji:(NSString *)string;
//输入的UTC 日期格式
+(NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate;
//判断字符串纯数字
+ (BOOL)isPureInt:(NSString*)string;
//判断是否包含特殊字符
+(BOOL)isIncludeSpecialCharact: (NSString *)str;
//判断是否有中文
+(BOOL)IsChinese:(NSString *)str;
//获取沙盒文件的大小
+(float)fileSizeForDir:(NSString*)path;
//时间转换
+(NSString *)TimeshiftWithTime:(NSString *)time;
//根据图片设置验证
+ (UIImage *)imageWithColor:(UIColor *)color;


///判断是否加入收藏
+(void)isFavoritesOfProductId:(NSString *)ProductId returnCode:(void(^)(bool isFavorites))cellBack;
@end

