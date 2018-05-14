//
//  ZYBXOREncryptUtil.m
//  JChainData
//   
//  Created by Rhino on 2018/5/11.
//  Copyright © 2018年 RhinoData. All rights reserved.
//

#import "ZYBXOREncryptUtil.h"

@implementation ZYBXOREncryptUtil
static ZYBXOREncryptUtil *shareInstance =nil;
+(ZYBXOREncryptUtil *)shareInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance =[[self alloc]init];
    });
    return shareInstance;
}
//当使用alloc的时候回调用这个方法    （保证唯一性）
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    if(shareInstance==nil)
    {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            shareInstance=[super allocWithZone:zone];
        });
    }
    return shareInstance;
}
//加密
-(NSString *)xor_encrypWithString:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
    return [data xor_encrypt];
}
//解密
-(NSString *)xor_decryptWithString:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
    return [data xor_decrypt];
}
@end
//秘钥
static NSString const *PWD_MOBILE_V1 = @"UYWIWEHIUHCNOWEA23F3ASD98ASDNLK0230NSDLKCFN20";

@implementation NSData(XOREncrypt)
    
    //解密
    - (NSString *)xor_decrypt
    {
        return [self xor_encrypt];
    }
    
    //加密
    -(NSString *)xor_encrypt
    {
        // 获取key的长度
        NSInteger length = PWD_MOBILE_V1.length;
        
        // 将OC字符串转换为C字符串
        const char *keys = [PWD_MOBILE_V1 cStringUsingEncoding:NSASCIIStringEncoding];
        
        unsigned char cKey[length];
        
        memcpy(cKey, keys, length);
        
        // 数据初始化，空间未分配 配合使用 appendBytes
        NSMutableData *encryptData = [[NSMutableData alloc] initWithCapacity:length];
        
        // 获取字节指针
        const Byte *point = self.bytes;
        
        for (int i = 0; i < self.length; i++) {
            int l = i % length;                     // 算出当前位置字节，要和密钥的异或运算的密钥字节
            char c = cKey[l];
            Byte b = (Byte) ((point[i]) ^ c);       // 异或运算
            [encryptData appendBytes:&b length:1];
        }
        return [[NSString alloc]initWithData:encryptData.copy encoding:NSUTF8StringEncoding];
    }
    
    
    
@end






