//
//  ViewController.h
//  PageControlSample
//
//  Created by ho9ho9 on 2012/10/13.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate> {
    @private
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIPageControl *_pageControl;
}

- (IBAction)pageControlValueChanged:(id)sender;

@end
