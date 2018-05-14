# ZYBXOREncryptDemo
OC 数据异或加密解密工具


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
