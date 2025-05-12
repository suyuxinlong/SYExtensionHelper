//
//  UIImage+SYExtension.m
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import "UIImage+SYExtension.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (SYExtension)

- (BOOL)sy_imageToSaveWithName:(NSString *)imageName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:imageName];
    NSData *imageData = UIImagePNGRepresentation(self);
    return [imageData writeToFile:imagePath atomically:YES];
}

+ (UIImage *)sy_imageLoadFileWithName:(NSString *)imageName defaultImageName:(NSString *)defaultName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:imageName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
        return [UIImage imageWithContentsOfFile:imagePath];
    } else if (defaultName.length > 0) {
        return [UIImage imageNamed:defaultName];
    } else {
        return nil;
    }
}

// 通过图片Data数据第一个字节 来获取图片扩展名
- (nullable NSString *)contentTypeForImageData:(NSData *)data {
    if (!data) return nil;
        
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    if (source) {
        CFStringRef type = CGImageSourceGetType(source);
        CFRelease(source);
        return (__bridge_transfer NSString *)type;
    }
    
    uint8_t header[8];
    [data getBytes:&header length:8];
    
    if (memcmp(header, "\x89PNG\r\n\x1a\n", 8) == 0) {
        return @"public.png";
    } else if (header[0] == 0xFF && header[1] == 0xD8) {
        return @"public.jpeg";
    } else if (memcmp(header, "GIF87a", 6) == 0 || memcmp(header, "GIF89a", 6) == 0) {
        return @"com.compuserve.gif";
    } else if (memcmp(header, "RIFF", 4) == 0 && memcmp(header + 8, "WEBP", 4) == 0) {
        return @"public.webp";
    }
    
    return @"unknown";
}


@end
