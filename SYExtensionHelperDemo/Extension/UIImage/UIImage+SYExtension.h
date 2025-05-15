//
//  UIImage+SYExtension.h
//  SYExtensionHelperDemo
//
//  Created by 苏余昕龙 on 2025/5/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    /// PNG
    kImageContentTypeWithPNG = 0,
    /// JPG/JPEG
    kImageContentTypeWithJPG,
    /// GIF
    kImageContentTypeWithGIF,
    /// HEIC
    kImageContentTypeWithHEIC,
    /// TIFF
    kImageContentTypeWithTIFF,
    /// WEBP
    kImageContentTypeWithWEBP,
} ImageContentType;

@interface UIImage (SYExtension)

/// 图片类型
@property (nonatomic, assign, readonly) ImageContentType contentType;

#pragma mark - 图片缓存本地读取
/// 保存图片，图片会存在app的Documents目录下，清理缓存的时候，不可以清除
/// - Parameter imageName: 图片名称，不包含.png/.jpg等文件名后缀，也是找到图片的关键
- (BOOL)sy_imageToSaveWithName:(NSString *)imageName;

/// 读取本地存储的图片
/// - Parameter imageName: 图片名称，不包含.png/.jpg等文件名后缀，也是找到图片的关键
/// - Parameter defaultName: 默认图片，一般是app本地图片名，如果找不到本地存储的图，就展示默认图
+ (nullable UIImage *)sy_imageLoadFileWithName:(NSString *)imageName defaultImageName:(NSString *)defaultName;

/// 从网络上下载图片，同时设置图片名称并保存到app的Documents目录下
/// - Parameters:
///   - url: 网络图片地址
///   - imageName: 图片名称，不包含.png/.jpg等文件名后缀，也是找到图片的关键
+ (UIImage *)sy_setImageFromURL:(NSString *)url andSaveImageWithName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
