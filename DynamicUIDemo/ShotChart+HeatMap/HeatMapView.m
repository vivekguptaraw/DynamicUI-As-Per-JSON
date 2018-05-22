
#import "HeatMapView.h"

static const NSInteger kSBHeatRadiusInPoints = 48;
static const CGFloat kSBAlphaPivotX = 0.333;
static const CGFloat kSBAlphaPivotY = 0.5;
static const CGFloat kSBMaxAlpha = 0.85;

@interface HeatMapView ()

@property (nonatomic, readonly) float *scaleMatrix;
@property (nonatomic) NSDictionary * pointDict;
@property (nonatomic) CGPoint MaxPoint;
- (UIImage*)imageGET:(CGRect)rect;
@end

@implementation HeatMapView

-(void)layoutSubviews {
    [super layoutSubviews];
    self.image = [self imageGET:self.frame];
    
}

-(void)setPointDict:(NSDictionary *)pointDict {
    _pointDict = pointDict;
    self.image = [self imageGET:self.frame];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    _scaleMatrix = malloc(2 * kSBHeatRadiusInPoints * 2 * kSBHeatRadiusInPoints * sizeof(float));
    [self populateScaleMatrix];
    self.isHomeTeam         = true;
}

- (void)populateScaleMatrix
{
    for (int i = 0; i < 2 * kSBHeatRadiusInPoints; i++) {
        for (int j = 0; j < 2 * kSBHeatRadiusInPoints; j++) {
            float distance = sqrt((i - kSBHeatRadiusInPoints) * (i - kSBHeatRadiusInPoints) + (j - kSBHeatRadiusInPoints) * (j - kSBHeatRadiusInPoints));
            float scaleFactor = 1 - distance / kSBHeatRadiusInPoints;
            if (scaleFactor < 0) {
                scaleFactor = 0;
            } else {
                scaleFactor = (expf(-distance/10.0) - expf(-kSBHeatRadiusInPoints/10.0)) / expf(0);
            }
            _scaleMatrix[j * 2 * kSBHeatRadiusInPoints + i] = scaleFactor;
        }
    }
}

- (UIImage*)imageGET:(CGRect)rect {
    int arrayLen = rect.size.width*rect.size.height;
    float *pointValues = calloc(arrayLen, sizeof(float));
    if (pointValues) {
        
        for (NSValue *key in self.pointDict) {
            // convert key to mapPoint
            CGPoint mapPoint;
            [key getValue:&mapPoint];
            double value = [[self.pointDict objectForKey:key] doubleValue];
            
            for (int i = 0; i < 2 * kSBHeatRadiusInPoints; i++) {
                for (int j = 0; j < 2 * kSBHeatRadiusInPoints; j++) {
                    // find the array index
                    int column = floor((mapPoint.x) - kSBHeatRadiusInPoints + i);
                    int row = floor((mapPoint.y) - kSBHeatRadiusInPoints + j);
                    
                    // make sure this is a valid array index
                    if (row >= 0 && column >= 0 && row < rect.size.height && column < rect.size.width) {
                        int index = rect.size.width * row + column;
                        double addVal = value * _scaleMatrix[j * 2 * kSBHeatRadiusInPoints + i];
                        pointValues[index] += addVal;
                    }
                }
            }
        }
        CGFloat red, green, blue, alpha;
        uint indexOrigin;
        unsigned char *rgba = (unsigned char *)calloc(arrayLen * 4, sizeof(unsigned char));
        
        
        
        
        for (int i = 0; i < arrayLen; i++) {
            if (pointValues[i] != 0) {
                indexOrigin = 4 * i;
                [self.teamColor getRed:&red green:&green blue:&blue alpha:nil];
                [self colorForValue:pointValues[i] red:&red green:&green blue:&blue alpha:&alpha];
                rgba[indexOrigin] = red;
                rgba[indexOrigin + 1] = green;
                rgba[indexOrigin + 2] = blue;
                rgba[indexOrigin + 3] = alpha;
            }
        }
        
        
        free(pointValues);
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef bitmapContext = CGBitmapContextCreate(rgba,
                                                           rect.size.width,
                                                           rect.size.height,
                                                           8, // bitsPerComponent
                                                           4 * rect.size.width, // bytesPerRow
                                                           colorSpace,
                                                           kCGImageAlphaPremultipliedLast | kCGBitmapByteOrderDefault);
        
        
        CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
        UIImage *img = [UIImage imageWithCGImage:cgImage];
        UIGraphicsPopContext();
        
        CFRelease(cgImage);
        CFRelease(bitmapContext);
        CFRelease(colorSpace);
        free(rgba);
        return img;
    }
    return nil;
}

- (void)colorForValue:(double)value
                  red:(CGFloat *)red
                green:(CGFloat *)green
                 blue:(CGFloat *)blue
                alpha:(CGFloat *)alpha
{
    static int maxVal = 255;
    if (value > 1) {
        value = 1;
    }
    
    value = sqrt(value);
    
    if (value < kSBAlphaPivotY) {
        *alpha = value * kSBAlphaPivotY / kSBAlphaPivotX;
    } else {
        *alpha = kSBAlphaPivotY + ((kSBMaxAlpha - kSBAlphaPivotY) / (1 - kSBAlphaPivotX)) * (value - kSBAlphaPivotX);
    }
    
    if (value <= 0) {
        *red = MIN (*red + 0.3, 1);
        *green = MIN (*green + 0.3, 1);
        *blue = MIN (*blue + 0.3, 1);
    } else if (value < 0.125) {
        *red = MIN (*red + 0.25, 1);
        *green = MIN (*green + 0.25, 1);
        *blue = MIN (*blue + 0.25, 1);
    } else if (value < 0.375) {
        *red = MIN (*red + 0.2, 1);
        *green = MIN (*green + 0.2, 1);
        *blue = MIN (*blue + 0.2, 1);
    } else if (value < 0.625) {
        *red = MIN (*red + 0.15, 1);
        *green = MIN (*green + 0.15, 1);
        *blue = MIN (*blue + 0.15, 1);
    } else if (value < 0.875) {
        *red = MIN (*red + 0.1, 1);
        *green = MIN (*green + 0.1, 1);
        *blue = MIN (*blue + 0.1, 1);
    }
    
    *alpha *= maxVal;
    *blue *= *alpha;
    *green *= *alpha;
    *red *= *alpha;
}

@end

