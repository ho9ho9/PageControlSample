//
//  ViewController.m
//  PageControlSample
//
//  Created by ho9ho9 on 2012/10/13.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    float defWidth = _scrollView.frame.size.width;
    float defHeight = _scrollView.frame.size.height;
    
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(defWidth * _pageControl.numberOfPages, _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    UIColor *bgColor[] = {[UIColor orangeColor],[UIColor brownColor],[UIColor grayColor],[UIColor darkGrayColor],[UIColor blackColor]};
    
    for (int i = 0; i < _pageControl.numberOfPages; i++) {
        UILabel *label = [[UILabel alloc] init];
        float x = (defWidth * (float)i);
        label.frame = CGRectMake(x, 0.0f, defWidth, defHeight);
        label.backgroundColor = bgColor[i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"AppleGothic" size:20];
        NSLog(@"%d,%f", i, x);
        label.text = [NSString stringWithFormat:@"hogehoge%d", (i + 1)];
        NSLog(@"%@", label.text);
       [_scrollView addSubview:label];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    _pageControl.currentPage = page;
}

#pragma mark - UIPageControl Action
- (IBAction)pageControlValueChanged:(id)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    float x = ((float)_pageControl.currentPage * _scrollView.bounds.size.width);
    _scrollView.contentOffset = CGPointMake(x, _scrollView.contentOffset.y);
    [UIView commitAnimations];
}

@end
