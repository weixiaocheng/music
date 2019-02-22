//
//  CommonMethod.m
//  ALiDaShoping
//
//  Created by apple on 15-1-7.
//  Copyright (c) 2015年 com.anhe. All rights reserved.
//

#import "CommonMethod.h"


@implementation CommonMethod

//将#开头的颜色值转换为UIColor
+(UIColor *)colorWithHexColorString:(NSString *)hexColorString
{
    if ([hexColorString length] <6){//长度不合法
        return [UIColor blackColor];
    }
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0x"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] !=6){
        return [UIColor blackColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location =0;
    range.length =2;
    NSString *rString = [tempString substringWithRange:range];
    range.location =2;
    NSString *gString = [tempString substringWithRange:range];
    range.location =4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:1.0f];
}


//获取sessionkey
+(NSString *)getSessionKey
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *sessionKey = [userDefaults objectForKey:@"SessionKey"];
    [userDefaults synchronize];
    return sessionKey;
    
}

//将json数组转化为数组
+(id)JSONValue:(NSString *)JSONStr
{
    if (JSONStr)
    {
        NSData* data = [JSONStr dataUsingEncoding:NSUTF8StringEncoding];
        __autoreleasing NSError* error = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (error != nil) return nil;
        return result;
        
    }
    return nil;
    
}

//检查字符串是否包含另一字符串
+(BOOL)stringContentString:(NSString *)motherString subString:(NSString *)sonString
{
    if ([motherString rangeOfString:sonString].location!=NSNotFound)
    {
        
        return YES;
    }else {
        return NO;
    }
}

//验证码正则表示式
+(BOOL)isFourNumberCode:(NSString *)verificationCode
{
    /**
     验证码为四位数字
     */
    NSString *fourNumber =@"^\\d{4}$";
    NSPredicate *regextestiFourNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", fourNumber];
    if ([regextestiFourNumber evaluateWithObject:verificationCode])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

+(BOOL)isPassword:(NSString *)pass
{
    NSString *passStr = @"^[^\\s]{6,20}$";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passStr];
    if ([regexEmail evaluateWithObject:pass])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

+(BOOL)isTrueName:(NSString *)name
{
    NSString *emailStr = @"^([\u4e00-\u9fa5]+|([a-z]+\\s?)+)$";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailStr];
    if ([regexEmail evaluateWithObject:name])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

+(BOOL)isIdentityNumber:(NSString *)number
{
    
    NSString *emailStr = @"(^\\d{18}$)|(^\\d{15}$)";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailStr];
    if ([regexEmail evaluateWithObject:number])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
}


+(BOOL)isBankCardNum:(NSString *)bankCardNum
{
    NSString *bankStr = @"^\\d{16}$";
    NSPredicate *regexBank = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankStr];
    if ([regexBank evaluateWithObject:bankCardNum])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}
+(NSString *)clearSpaceAndHuanhangWithStr:(NSString *)str
{
    NSString *clearStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    clearStr = [clearStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    clearStr=[clearStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return clearStr;
    
}

+(BOOL)isTenNumer:(NSString *)num
{
    NSString *bankStr = @"^\\d{10,19}$";
    NSPredicate *regexNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankStr];
    if ([regexNum evaluateWithObject:num])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
}
//Email正则表达式
+ (BOOL)isEmail:(NSString *)mobileNum
{
    NSString *emailStr = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailStr];
    if ([regexEmail evaluateWithObject:mobileNum])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)isPWDCurrect:(NSString *)pwd
{
    //    ^[^\s]{6,20}$
    
    NSString *pwdStr = @"^[^\\s]{6,100}$";
    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pwdStr];
    if ([regexEmail evaluateWithObject:pwd])
    {
        return YES;
    }
    else
    {
        return NO;
    }

}

//判断输入是否是金额
+(BOOL)isMoneyStyle:(NSString *)moneyStr
{    
    NSString *moneyStyle1 = @"^(0|[1-9][0-9]*)$";
    
    NSString *moneyStyle = @"^\\-?[0-9]*\\.[0-9]*$";
    NSPredicate *regexEmail1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",moneyStyle1];

    NSPredicate *regexEmail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",moneyStyle];
    if ([regexEmail evaluateWithObject:moneyStr]||[regexEmail1 evaluateWithObject:moneyStr])
    {
        return YES;
    }
    else
    {
        return NO;
    }

}

//获取当前时间



//nsstring转nsdate
+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}




+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate] ;
    return destinationDateNow;
}
+ (NSString *)stringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss "];

    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
    
}

//手机号码正则表达式
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     29         * 国际长途中国区(+86)
     30         * 区号：+86
     31         * 号码：十一位
     32         */
    NSString * IPH1 = @"^\\+861(3|5|8)\\d{9}$";
    /**
     手机号码前加86
     */
    NSString * IPH2 = @"^861(3|5|8)\\d{9}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestiph1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IPH1];
    NSPredicate *regextestiph2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IPH2];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestiph1 evaluateWithObject:mobileNum] == YES)
        ||([regextestiph2 evaluateWithObject:mobileNum] == YES)
        )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// return a new autoreleased UUID string
+ (NSString*)generateUuidString
{
    
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    
    // transfer ownership of the string
    // to the autorelease pool
    
    // release the UUID
    CFRelease(uuid);
    
    return [uuidString lowercaseString];
    
    
    //    return uuidString;
}



//把对象转换为字典NSDictionary
+ (NSDictionary*)getObjectData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int propsCount;
    
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
    
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        
        id value = [obj valueForKey:propName];
        
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

+ (id)getObjectInternal:(id)obj
{
    
    if([obj isKindOfClass:[NSString class]]
       
       || [obj isKindOfClass:[NSNumber class]]
       
       || [obj isKindOfClass:[NSNull class]])
        
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

//把字典参数排序后加密，再拼接成url
+(NSString *)addUrlWithDic:(NSDictionary *)dic withURLIp:(NSString *)ip withPre:(NSString *)urlPre withUrl:(NSString *)urlNext
{
    NSArray *arr = [dic allKeys];
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:arr.count];
    [string appendString:[NSString stringWithFormat:@"%@/%@/%@?",ip,urlPre,urlNext]];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [array addObject:[NSString stringWithFormat:@"ApiName%@",urlNext]];
    for (int i = 0 ; i < arr.count; i ++)
    {
        NSString *str = [dic objectForKey:arr[i]];
        
        BOOL isNull = [str isKindOfClass:[NSNull class]];
        
        NSString *newstr = [NSString stringWithFormat:@"%@",str];
        if (isNull == YES || newstr == nil||newstr == NULL||[newstr isEqualToString:@""])
        {
        }
        else
        {
            if ([self IsChinese:newstr] == NO)
            {
                [array addObject:[NSString stringWithFormat:@"%@%@",arr[i],str]];
            }
        }
    }
    NSString *sign = [CommonMethod bunbleSortWithArray:array];
    
    for (int j = 0 ; j < arr.count; j ++)
    {
        NSString *str = [dic objectForKey:arr[j]];
        
        BOOL isNull = [str isKindOfClass:[NSNull class]];
        
        if (isNull == YES || str == nil)
        {
            
        }
        else
        {
            [string appendString:[NSString stringWithFormat:@"%@=%@&",arr[j],str]];
        }
    }
    [string appendString:[NSString stringWithFormat:@"Sign=%@",sign]];
    
    return string;
}


/* 获取对象的所有属性 */
+ (NSArray *)getAllPropertiesWithOBJClass:(Class)obj
{
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList(obj, &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    
    return propertiesArray;
}

//将字典转化为对象
+(id)transforDICToOBJ:(NSDictionary *)dic withClass:(Class)OBJ withClassName:(NSString *)className
{
    NSArray *properties = [self getAllPropertiesWithOBJClass:OBJ];
    
    NSBundle *bundle = [NSBundle mainBundle];
    Class aClass = [bundle classNamed:className];
    id anInstance = [[aClass alloc] init];
    
    for (int i = 0 ; i < properties.count; i ++)
    {
        NSString *propertyName = properties[i];
        id value = [dic valueForKey:propertyName];
        if (![value isKindOfClass:[NSNull class]] && value != nil)
        {
            [anInstance setValue:value forKey:propertyName];
        }
        
    }
    return anInstance;
}

//把字典转化为数组
+(NSArray *)dicToArray:(NSDictionary *)dic
{
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    NSArray *keys = [dic allKeys];
    NSArray *values = [dic allValues];
    
    for ( int i =0 ; i < keys.count; i ++)
    {
        NSString *str = [NSString stringWithFormat:@"%@%@",[keys objectAtIndex:i],[values objectAtIndex:i]];
        [array addObject:str];
    }
    return array;
}

//自适应高度
+(CGSize)setLabHeightWithStr:(NSString *)text withFont:(UIFont *)font withMaxHeight:(CGSize)maxSize
{
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    //    CGSize size =CGSizeMake(KSCREENWIDTH ,height);
    //    获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    return actualsize;
}


//判断是否有中文
+(BOOL)IsChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}
//获取签名
+(NSString *)tranfSign:(NSDictionary *)dic withApiName:(NSString *)apiName
{
    NSArray *arr = [dic allKeys];
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    [array addObject:[NSString stringWithFormat:@"ApiName%@",apiName]];
    for (int i = 0 ; i < arr.count; i ++)
    {
        NSString *str = [dic objectForKey:arr[i]];

        BOOL isNull = [str isKindOfClass:[NSNull class]];
        
        NSString *newstr = [NSString stringWithFormat:@"%@",str];
        if (isNull == YES || str == nil||str == NULL||[newstr isEqualToString:@""])
        {
            
        }
        else if([self IsChinese:newstr]){
            
        }
        else
        {
            unichar c = [newstr characterAtIndex:0];
            if (c >=0x4E00 && c <=0x9FA5)
            {
                //如果是中文就不添加此字段
                
            }
         
            else
            {
                [array addObject:[NSString stringWithFormat:@"%@%@",arr[i],str]];
                
            }
 //2016年09月06日17:40:42 去掉这行代码
            /*
            if ([self IsChinese:newstr] == NO)
            {
//                [array addObject:[NSString stringWithFormat:@"%@%@",arr[i],str]];
            }
             */
        }
    }
    
    NSString *sign = [CommonMethod bunbleSortWithArray:array];
    return sign;
}



//判断是否是GUID
+(BOOL)isGuid:(NSString *)uuid
{
    NSString *strRegexPatten = @"[?a-zA-Z0-9]{8}-[?a-zA-Z0-9]{4}-[?a-zA-Z0-9]{4}-[?a-zA-Z0-9]{4}-[?a-zA-Z0-9]{12}";
    
    NSPredicate *regexNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",strRegexPatten];
    if ([regexNum evaluateWithObject:uuid])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}



//印尼钱币 要求千位符 .
+ (NSString *)numberFormatterOfString:(NSString *)number{
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
        [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        NSString *numberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[number longLongValue]]];
        
        NSString *numberStringUser = [numberString stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
        NSString *numberForCell = [NSString stringWithFormat:@"%@",numberStringUser];
        return numberForCell;

    }
//判断是否包含表情
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}
//获取业务的 No
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

+(BOOL)isIncludeSpecialCharact: (NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"︻︼︽︾〒↑↓☉⊙●〇◎¤★☆■▓「」『』◆◇▲△▼▽◣◥◢◣◤ ◥№↑↓→←↘↙Ψ※㊣∑⌒∩【】〖〗＠ξζω□∮〓※》∏卐√ ╳々♀♂∞①ㄨ≡╬╭╮╰╯╱╲ ▂ ▂ ▃ ▄ ▅ ▆ ▇ █ ▂▃▅▆█ ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁~￥#&*<>!.?《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}
+(float)fileSizeForDir:(NSString*)path//计算文件夹下文件的总大小

{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    float size =0;
    
    NSArray* array = [fileManager contentsOfDirectoryAtPath:path error:nil];
    
    for(int i = 0; i<[array count]; i++)
        
    {
        
        NSString *fullPath = [path stringByAppendingPathComponent:[array objectAtIndex:i]];
        
        
        
        BOOL isDir;
        
        if ( !([fileManager fileExistsAtPath:fullPath isDirectory:&isDir] && isDir) )
            
        {
            
            NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath error:nil];
            
            size+= fileAttributeDic.fileSize/ 1024.0/1024.0;
            
        }
        
        else
            
        {
            
            [self fileSizeForDir:fullPath];
            
        }
        
    }
    

    
    return size;
    
}

//根据图片设置验证
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
