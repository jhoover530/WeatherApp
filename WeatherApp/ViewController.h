//
//  ViewController.h
//  WeatherApp
//
//  Created by John on 4/25/13.
//  Copyright (c) 2013 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *currentHighLabel;
    IBOutlet UILabel *currentTempLabel;
    IBOutlet UILabel *currentLowLabel;
    IBOutlet UILabel *chanceOfRainLabel;
    IBOutlet UILabel *chanceOfSnowLabel;
    IBOutlet UILabel *forecastHigh1;
    IBOutlet UILabel *forecastLow1;
    IBOutlet UILabel *forecastHigh2;
    IBOutlet UILabel *forecastLow2;
    IBOutlet UILabel *forecastHigh3;
    IBOutlet UILabel *forecastLow3;
    IBOutlet UILabel *forecastHigh4;
    IBOutlet UILabel *forecastLow4;
    IBOutlet UILabel *forecastDate1;
    IBOutlet UILabel *forecastDate2;
    IBOutlet UILabel *forecastDate3;
    IBOutlet UILabel *forecastDate4;
    
    IBOutlet UIImageView *weatherImage;
    IBOutlet UIImageView *forecastPic1;
    IBOutlet UIImageView *forecastPic2;
    IBOutlet UIImageView *forecastPic3;
    IBOutlet UIImageView *forecastPic4;
    
    NSTimer *timer;
}

@property (nonatomic, strong) NSMutableArray *weatherArray;
@property (nonatomic, strong) NSMutableData *weatherData;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableArray *arrayOfRain;
@property (nonatomic, strong) NSMutableArray *arrayOfSnow;
@property (nonatomic, strong) NSMutableArray *arrayOfSun;
@property (nonatomic, strong) NSMutableArray *arrayOfPrecip;
@property (nonatomic, strong) NSMutableArray *arrayOfHighF;
@property (nonatomic, strong) NSMutableArray *arrayOfHighC;
@property (nonatomic, strong) NSMutableArray *arrayOfLowF;
@property (nonatomic, strong) NSMutableArray *arrayOfLowC;
@property (nonatomic, assign) NSInteger fahrenheit;
@property (nonatomic, retain) NSTimer *timer;
//@property (nonatomic, strong) NSMutableArray *arrayOfSDHigh;
//@property (nonatomic, strong) NSMutableArray *arrayOfSDLow;

@end
