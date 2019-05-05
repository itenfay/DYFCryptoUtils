//
//  DYFCryptoUtil.h
//
//  Created by dyf on 2017/10/10.
//  Copyright © 2017年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface DYFCryptoUtil : NSObject

// Create a Base-64 encoded NSString from the receiver's contents.
+ (NSString *)base64EncodedStringWithString:(NSString *)string;
+ (NSString *)base64EncodedStringWithData:(NSData *)data;

// Create an NSData from a Base-64 encoded NSString. By default, returns nil when the input is not recognized as valid Base-64.
+ (NSString *)base64DecodedStringWithString:(NSString *)base64String;
+ (NSString *)base64DecodedStringWithData:(NSData *)base64Data;

// Create a Base-64, UTF-8 encoded NSData from the receiver's contents.
+ (NSData *)base64EncodedDataWithData:(NSData *)data;
+ (NSData *)base64EncodedDataWithString:(NSString *)string;

// Create an NSData from a Base-64, UTF-8 encoded NSData. By default, returns nil when the input is not recognized as valid Base-64.
+ (NSData *)base64DecodedDataWithData:(NSData *)base64Data;
+ (NSData *)base64DecodedDataWithString:(NSString *)base64String;

// Create a 32 bit MD5 encoded NSString from the receiver's contents.
+ (NSString *)MD5EncodedStringWithString:(NSString *)string;
// Create a 16 bit MD5 encoded NSString from the receiver's contents.
+ (NSString *)MD5Bit16EncodedStringWithString:(NSString *)string;

// Create a DES encoded NSString from the receiver's contents using the given key.
+ (NSString *)DESEncrypt:(NSString *)string withKey:(NSString *)key;
// Create a DES decoded NSString from the receiver's contents using the given key.
+ (NSString *)DESDecrypt:(NSString *)string withKey:(NSString *)key;

// Create an AES encoded NSString from the receiver's contents using the given key.
+ (NSString *)AESEncrypt:(NSString *)string withKey:(NSString *)key;
// Create an AES decoded NSString from the receiver's contents using the given key.
+ (NSString *)AESDecrypt:(NSString *)string withKey:(NSString *)key;

// Create a RSA encoded NSString from the receiver's contents using the given public key.
+ (NSString *)RSAEncrypt:(NSString *)string publicKey:(NSString *)pubKey;
// Create a RSA decoded NSString from the receiver's contents using the given private key.
+ (NSString *)RSADecrypt:(NSString *)string privateKey:(NSString *)privKey;

// Create a RSA signed NSString from the receiver's contents using the given private key.
+ (NSString *)RSASign:(NSString *)string privateKey:(NSString *)privKey;
// Verify a RSA signature from the receiver's contents using the given public key.
+ (BOOL)RSAVerify:(NSString *)string signature:(NSString *)sign publicKey:(NSString *)pubKey;

@end
