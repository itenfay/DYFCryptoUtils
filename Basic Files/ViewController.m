//
//  ViewController.m
//
//  Created by Tenfay on 2019/5/6.
//  Copyright © 2019 Tenfay. All rights reserved.
//

#import "ViewController.h"
#import "DYFCryptoUtils.h"

static NSString *rsaPubKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmPW2SwJFldGVB1SM82VYvSZYRF1H5DREUiDK2SLnksxHAV/roC1uB44a4siUehJ9AKeV/g58pVrjhX3eSiBh9Khom/S2hEWF2n/6+lqqiwQi1W5rjl86v+dI2F6NgbPFpfesrRjWD9uskT2VX/ZJuMRLz8VPIyQOM9TW3PkMYBQIDAQAB";

static NSString *rsaPrivKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKY9bZLAkWV0ZUHVIzzZVi9JlhEXUfkNERSIMrZIueSzEcBX+ugLW4HjhriyJR6En0Ap5X+DnylWuOFfd5KIGH0qGib9LaERYXaf/r6WqqLBCLVbmuOXzq/50jYXo2Bs8Wl96ytGNYP26yRPZVf9km4xEvPxU8jJA4z1Nbc+QxgFAgMBAAECgYArZVW5PXO3HE9ihBUSyVlqNrdp9sB7VyHiTjuOwiVkwiocH9trv6s/mPmONVLjSJOZ2FYEl4Nw8yaIDrfUFJrvhdbhHJnwkO27Wo5jEfm2qGCwgQNtUACoIH637LXfP81v5I7eZtEa7kfO8Axpp3czvO1HdIAlOI8rU4jb3fB1cQJBANLgfHd/CDro1gtvTrUeTw/lqsKVScGiHn+pmT+THed6ftJ2MAJVcL/0H8+fFN5mRypCL7LQyPO48dTmfY9PbocCQQDJz8xZGq2BNAd3gSrNi3q++SEyjRPzDfr8AGJBJF8qtslcSYrVB/jjPx/qNNlMxOoXnpozBojzVTO3UirMJ/wTAkEAzb930YOhPREGHnwImFCtJT6ZYGcWYpXSGg8Y1d2tlLeA28myx+QjMTZ4fzOgwemaz9FqBpcNKjctxOLqaRRAKwJAXPZwznbgh8zcx6rjea2PjFscdLnR/7tn6x+OIy3K/NUYan+iCUHT33JblDpmAtwObXTs2SZgfZ645PBfsI2WqwJAGJxnG8+wiCnzN0CIZvG96tfOZmz0lkM4NSHDwdCSbagJlZccOtodpn00Dzy+l0t+oFe0Xm3RA0WkPzQX/seO0Q==";

#define PlainText @"Objective-C，通常写作ObjC或OC和较少用的Objective C或Obj-C，是扩充C的面向对象编程语言。它主要使用于Mac OS X和GNUstep这两个使用OpenStep标准的系统，而在NeXTSTEP和OpenStep中它更是基本语言。GCC与Clang含Objective-C的编译器，Objective-C可以在GCC以及Clang运作的系统上编译。Swift是苹果于2014年WWDC（苹果开发者大会）发布的一种新的编程语言，用于编写 iOS 和 macOS 应用。Swift 结合了 C 和 Objective-C 的优点并且不受C兼容性的限制。Swift 采用安全的编程模式并添加了很多新特性，这将使编程更简单，更灵活，也更有趣。Swift 是基于成熟而且倍受喜爱的 Cocoa 和 Cocoa Touch 框架，他的降临将重新定义软件开发。"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *mTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)testBase64:(id)sender {
    NSString *encodedText = [DYFCryptoUtils base64EncodedString:PlainText];
    NSLog(@"[Base64] Encoded text: %@", encodedText);
    
    NSString *decodedText = [DYFCryptoUtils base64DecodedString:encodedText];
    NSLog(@"[Base64] Decoded text: %@", decodedText);
    
    NSData *encodedData = [DYFCryptoUtils base64EncodedDataWithString:PlainText];
    NSLog(@"[Base64] Encoded data: %@", encodedData);
    
    NSData *decodeData = [DYFCryptoUtils base64DecodedData:encodedData];
    NSLog(@"[Base64] Decoded data: %@", decodeData);
    
    NSString *r = [NSString stringWithFormat:@"[Base64]: \n\n EncodedText: %@ \n\n DecodedText: %@ \n\n EncodedData: %@ \n\n DecodeData: %@", encodedText, decodedText, encodedData, decodeData];
    [self showResult:r];
}

- (IBAction)testMD5:(id)sender {
    NSString *hash = [DYFCryptoUtils MD5EncodedString:PlainText];
    NSLog(@"[MD5] Hash: %@", hash);
    
    NSString *bit16Hash = [DYFCryptoUtils bit16MD5EncodedString:PlainText];
    NSLog(@"[MD5] 16 Bit Hash: %@", bit16Hash);
    
    NSString *r = [NSString stringWithFormat:@"[MD5]: \n\n Hash: %@ \n\n Bit16Hash: %@", hash, bit16Hash];
    [self showResult:r];
}

- (IBAction)testDES:(id)sender {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    
    NSString *encryptedText = [DYFCryptoUtils DESEncrypt:PlainText key:key]; // iv is nil.
    NSLog(@"[DES] Encrypted text: %@", encryptedText);
    
    NSString *decryptedText = [DYFCryptoUtils DESDecrypt:encryptedText key:key]; // iv is nil.
    NSLog(@"[DES] Decrypted text: %@", decryptedText);
    
    NSString *r = [NSString stringWithFormat:@"[DES]: \n\n EncryptedText: %@ \n\n DecryptedText: %@", encryptedText, decryptedText];
    [self showResult:r];
}

- (IBAction)testAES:(id)sender {
    NSString *key = @"aT59qMrbqJh3o7F566GpO6BhKgdrHDUsMfIPs27J5CmE6DXGkl9VFYam4gRI5MFVjFTi9oScQALesTaPuQ8hdAH9jEssJnItgYxE6Pl+D8sFTVZJvhMwNQR";
    
    NSString *encryptedText = [DYFCryptoUtils AESEncrypt:PlainText key:key]; // iv is nil.
    NSLog(@"[AES] Encrypted text: %@", encryptedText);
    
    NSString *decryptedText = [DYFCryptoUtils AESDecrypt:encryptedText key:key]; // iv is nil.
    NSLog(@"[AES] Decrypted text: %@", decryptedText);
    
    NSString *r = [NSString stringWithFormat:@"[AES]: \n\n EncryptedText: %@ \n\n DecryptedText: %@", encryptedText, decryptedText];
    [self showResult:r];
}

- (IBAction)testRSA:(id)sender {
    NSString *encryptedText = [DYFCryptoUtils RSAEncrypt:PlainText publicKey:rsaPubKey];
    NSLog(@"[RSA] Encrypted text: %@", encryptedText);
    
    NSString *decryptedText = [DYFCryptoUtils RSADecrypt:encryptedText privateKey:rsaPrivKey];
    NSLog(@"[RSA] Decrypted text: %@", decryptedText);
    
    NSString *signature = [DYFCryptoUtils RSASign:PlainText privateKey:rsaPrivKey];
    NSLog(@"[RSA] Signature: %@", signature);
    
    BOOL re = [DYFCryptoUtils RSAVerify:PlainText signature:signature publicKey:rsaPubKey];
    NSLog(@"[RSA] Signature verificaiton: %@", re ? @"Success" : @"Failure");
    
    NSString *r = [NSString stringWithFormat:@"[RSA]: \n\n EncryptedText: %@ \n\n DecryptedText: %@ \n\n Signature: %@ \n\n Signature verificaiton: %@", encryptedText, decryptedText, signature, re ? @"Success" : @"Failure"];
    [self showResult:r];
}

- (void)showResult:(NSString *)string {
    if (self.mTextView.text.length > 0) {
        self.mTextView.text = @"";
    }
    self.mTextView.text = string;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
