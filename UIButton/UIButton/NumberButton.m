//
//  NumberButton.m
//  UIButton
//
//  Created by Meng Fan on 16/11/10.
//  Copyright © 2016年 Meng Fan. All rights reserved.
//

#import "NumberButton.h"
#import "NSString+NumberButton.h"


@interface NumberButton () <UITextFieldDelegate>

/** 减按钮 */
@property (nonatomic, strong) UIButton *decreaseBtn;
/** 加按钮 */
@property (nonatomic, strong) UIButton *increaseBtn;
/** 数量展示／输入框 */
@property (nonatomic, strong) UITextField *textField;

/** 快速加减定时器 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation NumberButton

-(void)dealloc {
    [self clearTimer];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
        
        //整个控件的默认尺寸（和某宝上的按钮同样大小）
        if (CGRectIsEmpty(frame)) {
            self.frame = CGRectMake(0, 0, 110, 30);
        }
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setUpUI];
}

/**
 *  通过类方法创建一个按钮实例对象
 *
 *  @param  frame  按钮的尺寸
 *
 *  @return 返回一个NumberButton的实例对象
 */
+ (instancetype)numberButtonWithframe:(CGRect)frame {
    return [[NumberButton alloc] initWithFrame:frame];
}


#pragma mark - setUpViews
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    //设置圆角
    self.layer.cornerRadius = 3.f;
    self.clipsToBounds = YES;
    
    //初始化
    _minValue = 1;
    _maxValue = NSIntegerMax;
    
    //减／加按钮
    _decreaseBtn = [self setUpButtonWithTitle:@"-"];
    _increaseBtn = [self setUpButtonWithTitle:@"+"];
    
    //数量展示／输入框
    _textField = [[UITextField alloc] init];
    _textField.text = @"1";
    _textField.delegate = self;
    _textField.font = [UIFont boldSystemFontOfSize:15];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    //设置字体位置在中间
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _textField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self addSubview:_textField];
    
}

//加减按钮的公共方法
- (UIButton *)setUpButtonWithTitle:(NSString *)title {
    UIButton *buttton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    buttton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [buttton setTitle:title forState:UIControlStateNormal];
    [buttton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    //添加action
    [buttton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [buttton addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel];
    [self addSubview:buttton];
    
    return buttton;
}

#pragma mark - UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *minValurString = [NSString stringWithFormat:@"%ld", _minValue];
    NSString *maxValueString = [NSString stringWithFormat:@"%ld", _maxValue];
    
    //判断所填数据是否在范围内
    [textField.text isNotBlank] == NO || textField.text.integerValue < _minValue ? _textField.text = minValurString : nil;
    textField.text.integerValue > _maxValue ? textField.text = maxValueString : nil;
    _numberBlock ? _numberBlock(_textField.text) : nil;
    _delegate ? [_delegate numberButton:self number:_textField.text] : nil;
}


#pragma mark - action
//点击：单次点击逐次加减，长按连续加减
- (void)touchDown:(UIButton *)sender {
    //取消弹出键盘
    [_textField resignFirstResponder];
    
    if (sender == _increaseBtn) {   // +
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(increase) userInfo:nil repeats:YES];
    }else {     // -
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(decrease) userInfo:nil repeats:YES];
    }
    /** fire方法触发定时器
     *  注：You can use this method to fire a repeating timer without interrupting its regular firing schedule. If the timer is non-repeating, it is automatically invalidated after firing, even if its scheduled fire date has not arrived.
     在重复执行的定时器中调用此方法后立即触发该定时器，但不会中断其之前的执行计划；
     在不重复执行的定时器中调用此方法，立即触发后，就会使这个定时器失效。
     */
    [_timer fire];
}

//松开按钮
- (void)touchUp:(UIButton *)sender {
    [self clearTimer];
}

//+
- (void)increase {
    [_textField.text isNotBlank] ? nil : (_textField.text = [NSString stringWithFormat:@"%ld", _minValue]);
    NSInteger number = [_textField.text integerValue] + 1;
    
    if (number <= self.maxValue) {
        _textField.text = [NSString stringWithFormat:@"%ld", number];
        _numberBlock ? _numberBlock(_textField.text) : nil;
        _delegate ? [_delegate numberButton:self number:_textField.text] : nil;
        
    }else {
        self.isShakeAnimation ? [self shakeAnimation] : nil;
        NSLog(@"数量不能大于%ld", _maxValue);
    }
}

//-
- (void)decrease {
    [_textField.text isNotBlank] == NO ? _textField.text = [NSString stringWithFormat:@"%ld",_minValue] : nil;
    NSInteger number = [_textField.text integerValue] - 1;
    
    if (number >= self.minValue) {
        _textField.text = [NSString stringWithFormat:@"%ld", number];
        _numberBlock ? _numberBlock(_textField.text) : nil;
        _delegate ? [_delegate numberButton:self number:_textField.text] : nil;
    } else {
        self.isShakeAnimation ? [self shakeAnimation] : nil;
        NSLog(@"数量不能小于%ld",_minValue);
    }
}

- (void)clearTimer {
    if (_timer.isValid) {
        //销毁
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - 设置
#pragma mark -加减按钮的属性设置
-(void)setMinValue:(NSInteger)minValue {
    _minValue = minValue;
    _textField.text = [NSString stringWithFormat:@"%ld", minValue];
}

-(void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    
    self.layer.borderColor = [borderColor CGColor];
    _decreaseBtn.layer.borderColor = [borderColor CGColor];
    _increaseBtn.layer.borderColor = [borderColor CGColor];
    
    self.layer.borderWidth = 0.5;
    _decreaseBtn.layer.borderWidth = 0.5;
    _increaseBtn.layer.borderWidth = 0.5;
}

-(void)setButtonTitleFont:(UIFont *)buttonTitleFont {
    _buttonTitleFont = buttonTitleFont;
    
    _decreaseBtn.titleLabel.font = buttonTitleFont;
    _increaseBtn.titleLabel.font = buttonTitleFont;
}


//注意：加减号按钮的标题和背景图片只能设置一个，若全部设置，则以最后设置的类型为准
/** 设置加／减号按钮的标题
 *
 *  @param increaseTitle 加按钮标题
 *  @param decreaseTitle 减按钮标题
 */
- (void)settitleWithIncreseTitle:(NSString *)increaseTitle decreaseTitle:(NSString *)decreaseTitle {
    
    [_increaseBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [_decreaseBtn setBackgroundImage:nil forState:UIControlStateNormal];
    
    [_increaseBtn setTitle:increaseTitle forState:UIControlStateNormal];
    [_decreaseBtn setTitle:decreaseTitle forState:UIControlStateNormal];
}

/**
 *  设置加／减按钮的背景图片
 *
 *  @param increaseImage 加按钮背景图片
 *  @param decreaseImage 减按钮背景图片
 */
- (void)setImageWithIncreaseImage:(UIImage *)increaseImage decreaseImage:(UIImage *)decreaseImage {
    [_increaseBtn setTitle:@"" forState:UIControlStateNormal];
    [_decreaseBtn setTitle:@"" forState:UIControlStateNormal];
    
    [_increaseBtn setBackgroundImage:increaseImage forState:UIControlStateNormal];
    [_decreaseBtn setBackgroundImage:decreaseImage forState:UIControlStateNormal];}


#pragma mark -输入框中的内容设置
- (NSString *)currentNumber {
    return _textField.text;
}

- (void)setCurrentNumber:(NSString *)currentNumber {
    _textField.text = currentNumber;
}

- (void)setInputFieldFont:(UIFont *)inputFieldFont {
    _textField.font = inputFieldFont;
}



#pragma mark - layoutSubviews
-(void)layoutSubviews {
    [super layoutSubviews];
    
    //设置frame
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    _decreaseBtn.frame = CGRectMake(0, 0, height, height);
    _increaseBtn.frame = CGRectMake(width-height, 0, height, height);
    _textField.frame = CGRectMake(height, 0, width-2*height, height);
}

#pragma mark - 抖动动画
- (void)shakeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
    //获取当前View的position坐标
    CGFloat positionX = self.layer.position.x;
    //设置抖动的范围
    animation.values = @[@(positionX-10), @(positionX), @(positionX+10)];
    //设置动画重复的次数
    animation.repeatCount = 3;
    //设置动画时间
    animation.duration = 0.07;
    //设置自动反转
    animation.autoreverses = YES;
    [self.layer addAnimation:animation forKey:nil];
}


@end
