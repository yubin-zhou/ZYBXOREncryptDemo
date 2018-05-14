//
//  ZYBXOREncryptUtil.h
//  JChainData
//  异或加密解密工具
//  Created by Rhino on 2018/5/11.
//  Copyright © 2018年 RhinoData. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYBXOREncryptUtil : NSObject
    +(ZYBXOREncryptUtil * )shareInstance;
    //加密
    -(NSString *)xor_encrypWithString:(NSString *)str;
    
    //解密
    -(NSString *)xor_decryptWithString:(NSString *)str;

@end

@interface NSData(XOREncrypt)
    /**  加密  */
    - (NSString *)xor_encrypt;
    
    /**  解密 */
    - (NSString *)xor_decrypt;
    
@end
