# DYFCryptoUtils
 iOS crypto，includes Base64, MD5, DES, AES, RSA.
 
 # 安装
 支持通过 CocoaPods 安装。
 ```pod
 pod 'DYFCryptoUtils', '~> 1.0.0'
```

# 使用说明
1. 原文
```ObjC
#define PlainText @"Objective-C，通常写作ObjC或OC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。GCC与Clang含Objective-C的编译器，Objective-C可以在GCC以及Clang运作的系统上编译。Swift是苹果于2014年WWDC（苹果开发者大会）发布的一种新的编程语言，用于编写 iOS 和 macOS 应用。Swift 结合了 C 和 Objective-C 的优点并且不受C兼容性的限制。Swift 采用安全的编程模式并添加了很多新特性，这将使编程更简单，更灵活，也更有趣。Swift 是基于成熟而且倍受喜爱的 Cocoa 和 Cocoa Touch 框架，他的降临将重新定义软件开发。"
```

2. Base64
```ObjC
- (void)testBase64 {
    NSString *encodedText = [DYFCryptoUtils base64EncodedStringWithString:PlainText];
    NSLog(@"[Base64] Encoded text: %@", encodedText);
    NSString *decodedText = [DYFCryptoUtils base64DecodedStringWithString:encodedText];
    NSLog(@"[Base64] Decoded text: %@", decodedText);
}
```

3. MD5
```ObjC
- (void)testMD5 {
    NSString *hash = [DYFCryptoUtils MD5EncodedStringWithString:PlainText];
    NSLog(@"[MD5] Hash: %@", hash);
    NSString *hash16Bit = [DYFCryptoUtils MD5EncodedStringFor16BitWithString:PlainText];
    NSLog(@"[MD5] 16 bit hash: %@", hash16Bit);
}
```

4. DES
```ObjC
- (void)testDES {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    // iv为nil.
    NSString *encryptedText = [DYFCryptoUtils DESEncrypt:PlainText key:key];
    NSLog(@"[DES] Encrypted text: %@", encryptedText);
    NSString *decryptedText = [DYFCryptoUtils DESDecrypt:encryptedText key:key];
    NSLog(@"[DES] Decrypted text: %@", decryptedText);
}
```

5. AES
```ObjC
- (void)testAES {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    // iv为nil.
    NSString *encryptedText = [DYFCryptoUtils AESEncrypt:PlainText key:key];
    NSLog(@"[AES] Encrypted text: %@", encryptedText);
    NSString *decryptedText = [DYFCryptoUtils AESDecrypt:encryptedText key:key];
    NSLog(@"[AES] Decrypted text: %@", decryptedText);
}
```

6. RSA
```ObjC
// RSA公钥
static NSString *rsaPubKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmPW2SwJFldGVB1SM82VYvSZYRF1H5DREUiDK2SLnksxHAV/roC1uB44a4siUehJ9AKeV/g58pVrjhX3eSiBh9Khom/S2hEWF2n/6+lqqiwQi1W5rjl86v+dI2F6NgbPFpfesrRjWD9uskT2VX/ZJuMRLz8VPIyQOM9TW3PkMYBQIDAQAB";
// RSA私钥
static NSString *rsaPrivKey = @"MIICXAIBAAKBgQCmPW2SwJFldGVB1SM82VYvSZYRF1H5DREUiDK2SLnksxHAV/roC1uB44a4siUehJ9AKeV/g58pVrjhX3eSiBh9Khom/S2hEWF2n/6+lqqiwQi1W5rjl86v+dI2F6NgbPFpfesrRjWD9uskT2VX/ZJuMRLz8VPIyQOM9TW3PkMYBQIDAQABAoGAK2VVuT1ztxxPYoQVEslZaja3afbAe1ch4k47jsIlZMIqHB/ba7+rP5j5jjVS40iTmdhWBJeDcPMmiA631BSa74XW4RyZ8JDtu1qOYxH5tqhgsIEDbVAAqCB+t+y13z/Nb+SO3mbRGu5HzvAMaad3M7ztR3SAJTiPK1OI293wdXECQQDS4Hx3fwg66NYLb061Hk8P5arClUnBoh5/qZk/kx3nen7SdjACVXC/9B/PnxTeZkcqQi+y0MjzuPHU5n2PT26HAkEAyc/MWRqtgTQHd4EqzYt6vvkhMo0T8w36/ABiQSRfKrbJXEmK1Qf44z8f6jTZTMTqF56aMwaI81Uzt1IqzCf8EwJBAM2/d9GDoT0RBh58CJhQrSU+mWBnFmKV0hoPGNXdrZS3gNvJssfkIzE2eH8zoMHpms/RagaXDSo3LcTi6mkUQCsCQFz2cM524IfM3Meq43mtj4xbHHS50f+7Z+sfjiMtyvzVGGp/oglB099yW5Q6ZgLcDm107NkmYH2euOTwX7CNlqsCQBicZxvPsIgp8zdAiGbxverXzmZs9JZDODUhw8HQkm2oCZWXHDraHaZ9NA88vpdLfqBXtF5t0QNFpD80F/7HjtE=";
```

```ObjC
- (void)testRSA {
    NSString *encryptedText = [DYFCryptoUtils RSAEncrypt:PlainText publicKey:rsaPubKey];
    NSLog(@"[RSA] Encrypted text: %@", encryptedText);
    NSString *decryptedText = [DYFCryptoUtils RSADecrypt:encryptedText privateKey:rsaPrivKey];
    NSLog(@"[RSA] Decrypted text: %@", decryptedText);

    NSString *signature = [DYFCryptoUtils RSASign:PlainText privateKey:rsaPrivKey];
    NSLog(@"[RSA] Signature: %@", signature);
    BOOL re = [DYFCryptoUtils RSAVerify:PlainText signature:signature publicKey:rsaPubKey];
    NSLog(@"[RSA] Signature verificaiton %@", re ? @"succeeded" : @"failed");
}
```

7. QQ群交流 <br>
QQ群：155353383 <br>
![qq群：155353383](https://github.com/dgynfi/DYFCryptoUtils/raw/master/images/qq155353383.jpg)
