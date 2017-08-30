#iOS开发：UIButton设置图片、文字的位置

![效果图.png](http://upload-images.jianshu.io/upload_images/1840399-1700d00f81982b35.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

关于`imageEdgeInsets`和`imageEdgeInsets`的说明，这里不多叙述了，有两篇文章可以参考[文章1](http://www.jianshu.com/p/0fd782d67efb)，[文章2](http://shinancao.github.io/2016/12/15/iOS-UIButton-EdgeInsets/)，都讲的不错；

之所以写这篇文章，是因为我button中使用的图片比较大时，会导致文字显示不全
![错误效果.png](http://upload-images.jianshu.io/upload_images/1840399-66877c3e4ee51bf4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#####我这里封装了一下，使用时比较方便，.h文件

```
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DKSButtonStyle){
    DKSButtonImageLeft = 0,   //图片在左
    DKSButtonImageRight = 1,  //图片在右
    DKSButtonImageTop = 2,    //图片在上
    DKSButtonImageBottom = 3, //图片在下
};

@interface DKSButton : UIButton

/**
 图片的位置，上、下、左、右，默认是图片居左
 */
@property (nonatomic, assign) DKSButtonStyle buttonStyle;

/**
 文字与图片之间的间距，默认是0
 */
@property (nonatomic, assign) CGFloat padding;

/**
 创建button

 @param buttonType button的类型
 @param space 图片距离button的边距，如果图片比较大的，此时有效果；
              如果图片比较小，没有效果，默认居中；
 @return button
 */
+ (id)buttonWithType:(UIButtonType)buttonType withSpace:(CGFloat)space;

@end
```
关于上面的`space`，如果图片是比较小的，此时space设置无效，图片和文字会居中显示，如果图片比较大时，测试图片距离button的边距

.m文件中：

```
#import "DKSButton.h"

@interface DKSButton ()

/**
 图片距离上下的距离
 */
@property (nonatomic, assign) CGFloat space;

@end

@implementation DKSButton

+ (id)buttonWithType:(UIButtonType)buttonType withSpace:(CGFloat)space {
    DKSButton *button = [super buttonWithType:buttonType];
    button.space = space;
    return button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //文案的宽度
    CGFloat labelWidth = self.titleLabel.frame.size.width;
    //文案的高度
    CGFloat labelHeight = self.titleLabel.frame.size.height;
    //button的image
    UIImage *image = self.imageView.image;
    
    switch (self.buttonStyle) {
        case DKSButtonImageLeft: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space);
            //文案和图片居中显示时距离两边的距离
            CGFloat edgeSpace = (self.frame.size.width - imageHeight - labelWidth - self.padding) / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, edgeSpace, self.space, edgeSpace + labelWidth + self.padding);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width + imageHeight + self.padding, 0, 0);
        }
            break;
        case DKSButtonImageRight: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space);
            //文案和图片居中显示时距离两边的距离
            CGFloat edgeSpace = (self.frame.size.width - imageHeight - labelWidth - self.padding) / 2;
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, edgeSpace + labelWidth + self.padding, self.space, edgeSpace);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width - self.padding - imageHeight, 0, 0);
        }
            break;
        case DKSButtonImageTop: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space) - labelHeight - self.padding;
            if (imageHeight > image.size.height) {
                imageHeight = image.size.height;
            }
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, (self.frame.size.width - imageHeight) / 2, self.space + labelHeight + self.padding, (self.frame.size.width - imageHeight) / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.space + imageHeight + self.padding, -image.size.width, self.space, 0);
        }
            break;
        case DKSButtonImageBottom: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space) - labelHeight - self.padding;
            if (imageHeight > image.size.height) {
                imageHeight = image.size.height;
            }
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space + labelHeight + self.padding, (self.frame.size.width - imageHeight) / 2, self.space, (self.frame.size.width - imageHeight) / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.space, -image.size.width, self.padding + imageHeight + self.space, 0);
        }
            break;
        default:
            break;
    }
}

@end

```
里面都是一些算法，搞懂一个，其它的就很容明白了

[简书地址](http://www.jianshu.com/p/39d4745db2ee)
