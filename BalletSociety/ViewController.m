#import "ViewController.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ViewController

- (void)setBackgroundAsImageNamed:(NSString*)image
{
    UIImage *unscaledBackgroundImage = [UIImage imageNamed:image];
    
    CGFloat unscaledBackgroundImageWidth = unscaledBackgroundImage.size.width;
    
    CGFloat viewWidth = self.view.frame.size.width;
    
    CGFloat scaleFactorWidth = unscaledBackgroundImageWidth / viewWidth;
    
    CGFloat unscaledBackgroundImageHeight = unscaledBackgroundImage.size.height;
    
    CGFloat viewHeight = self.view.frame.size.height;
    
    CGFloat scaleFactorHeight = unscaledBackgroundImageHeight / viewHeight;
    
    UIImage *scaledBackgroundImage = [UIImage imageWithCGImage:[unscaledBackgroundImage CGImage]
                                                         scale:((scaleFactorWidth + scaleFactorHeight) / 2) - 0.12
                                                   orientation:(unscaledBackgroundImage.imageOrientation)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:scaledBackgroundImage];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self setBackgroundAsImageNamed:@"subjectView_1.jpg"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



@end
