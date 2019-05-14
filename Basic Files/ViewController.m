//
//  ViewController.m
//
//  Created by dyf on 2019/5/6.
//  Copyright © 2019 dyf. All rights reserved.
//

#import "ViewController.h"
#import "DYFCryptoUtils.h"

static NSString *rsaPubKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmPW2SwJFldGVB1SM82VYvSZYRF1H5DREUiDK2SLnksxHAV/roC1uB44a4siUehJ9AKeV/g58pVrjhX3eSiBh9Khom/S2hEWF2n/6+lqqiwQi1W5rjl86v+dI2F6NgbPFpfesrRjWD9uskT2VX/ZJuMRLz8VPIyQOM9TW3PkMYBQIDAQAB";
static NSString *rsaPrivKey = @"MIICXAIBAAKBgQCmPW2SwJFldGVB1SM82VYvSZYRF1H5DREUiDK2SLnksxHAV/roC1uB44a4siUehJ9AKeV/g58pVrjhX3eSiBh9Khom/S2hEWF2n/6+lqqiwQi1W5rjl86v+dI2F6NgbPFpfesrRjWD9uskT2VX/ZJuMRLz8VPIyQOM9TW3PkMYBQIDAQABAoGAK2VVuT1ztxxPYoQVEslZaja3afbAe1ch4k47jsIlZMIqHB/ba7+rP5j5jjVS40iTmdhWBJeDcPMmiA631BSa74XW4RyZ8JDtu1qOYxH5tqhgsIEDbVAAqCB+t+y13z/Nb+SO3mbRGu5HzvAMaad3M7ztR3SAJTiPK1OI293wdXECQQDS4Hx3fwg66NYLb061Hk8P5arClUnBoh5/qZk/kx3nen7SdjACVXC/9B/PnxTeZkcqQi+y0MjzuPHU5n2PT26HAkEAyc/MWRqtgTQHd4EqzYt6vvkhMo0T8w36/ABiQSRfKrbJXEmK1Qf44z8f6jTZTMTqF56aMwaI81Uzt1IqzCf8EwJBAM2/d9GDoT0RBh58CJhQrSU+mWBnFmKV0hoPGNXdrZS3gNvJssfkIzE2eH8zoMHpms/RagaXDSo3LcTi6mkUQCsCQFz2cM524IfM3Meq43mtj4xbHHS50f+7Z+sfjiMtyvzVGGp/oglB099yW5Q6ZgLcDm107NkmYH2euOTwX7CNlqsCQBicZxvPsIgp8zdAiGbxverXzmZs9JZDODUhw8HQkm2oCZWXHDraHaZ9NA88vpdLfqBXtF5t0QNFpD80F/7HjtE=";

#define PlainText @"本文基本上是将dart官网部分内容进行翻译，没兴趣的请出门左转至Dart的官网，有兴趣的同志请继续阅读本文。Flutter教程在这里通常，映射是一个有键和值的对象。 键和值都可以是任何类型的对象。 每个键只出现一次，但您可以多次使用相同的值。Dart的Map支持由映射文字和Map。int和double都是num的子类型。 num类型包括基本运算符，如+， - ，/和*，也是你可以找到abs()，ceil()和floor()以及其他方法的地方。 （按位运算符，如>>，在int类中有定义。）如果num及其子类没有您要想要内容，那dart：math库可能有您想要的。Dart字符串是一系列UTF-16代码单元。 您可以使用单引号或双引号来创建字符串：您可以使用{expression}将表达式的值放在字符串中。如果表达式是标识符，则可以跳过{}。 要获取对应于对象的字符串，Dart调用对象的toString()方法。为了表示布尔值，Dart有一个名为bool的类型。 只有两个对象具有bool类型：true和false，它们都是编译时常量。Dart的类型安全意味着您不能使用if（nonbooleanValue）或assert（nonbooleanValue）等代码。 相反，明确检查值，如下所示：也许几乎每种编程语言中最常见的集合是数组或有序的对象组。 在Dart中，数组是List对象，因此大多数人只是将它们称为列表。Dart列表文字看起来像JavaScript数组文字。"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)testBase64 {
    NSString *encodedText = [DYFCryptoUtils base64EncodedStringWithString:PlainText];
    NSLog(@"[Base64] Encoded text: %@", encodedText);
    NSString *decodedText = [DYFCryptoUtils base64DecodedStringWithString:encodedText];
    NSLog(@"[Base64] Decoded text: %@", decodedText);
}

- (void)testMD5 {
    NSString *hash = [DYFCryptoUtils MD5EncodedStringWithString:PlainText];
    NSLog(@"[MD5] Hash: %@", hash);
    NSString *hash16Bit = [DYFCryptoUtils MD5EncodedStringFor16BitWithString:PlainText];
    NSLog(@"[MD5] 16 bit hash: %@", hash16Bit);
}

- (void)testDES {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    // iv为nil.
    NSString *encryptedText = [DYFCryptoUtils DESEncrypt:PlainText key:key];
    NSLog(@"[DES] Encrypted text: %@", encryptedText);
    NSString *decryptedText = [DYFCryptoUtils DESDecrypt:encryptedText key:key];
    NSLog(@"[DES] Decrypted text: %@", decryptedText);
}

- (void)testAES {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    // iv为nil.
    NSString *encryptedText = [DYFCryptoUtils AESEncrypt:PlainText key:key];
    NSLog(@"[AES] Encrypted text: %@", encryptedText);
    NSString *decryptedText = [DYFCryptoUtils AESDecrypt:encryptedText key:key];
    NSLog(@"[AES] Decrypted text: %@", decryptedText);
}

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

- (IBAction)test:(id)sender {
    [self testBase64];
    [self testMD5];
    [self testDES];
    [self testAES];
    [self testRSA];
}

@end
