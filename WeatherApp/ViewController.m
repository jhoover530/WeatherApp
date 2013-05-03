//
//  ViewController.m
//  WeatherApp
//
//  Created by John on 4/25/13.
//  Copyright (c) 2013 John. All rights reserved.
//

// You seem to be successfully downloading, parsing, averaging, and displaying the weather data.
// It's extremely bad style to have so many variables that are handled identically, though -
// that's what object-oriented programming is for, and arrays and dictionaries.
// Also, every weather app has forecast information. We have forecast uncertainty
// information that nobody else has, and you're ignoring it.
// Project grade: 80
// Course grade: 60 (I didn't receive any assignments from you)

#import "ViewController.h"

#define weatherURL @"http://weatherparser.herokuapp.com"


@interface ViewController ()
{
    NSDictionary *crainsfc;
    NSDictionary *csnowsfc;
    NSDictionary *sunsdsfc;
    NSDictionary *tmax2m;
    NSDictionary *tmin2m;
    NSDictionary *apcpsfc;
    Boolean fahrenheit;
}
@end

@implementation ViewController

@synthesize weatherArray, arrayOfRain, arrayOfSnow, arrayOfSun, arrayOfPrecip, arrayOfHighF, arrayOfHighC, arrayOfLowF, arrayOfLowC;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:weatherURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    weatherArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    arrayOfRain = [[NSMutableArray alloc]init];
    arrayOfSnow = [[NSMutableArray alloc]init];
    arrayOfSun = [[NSMutableArray alloc]init];
    arrayOfPrecip = [[NSMutableArray alloc]init];
    arrayOfHighF = [[NSMutableArray alloc]init];
    arrayOfHighC = [[NSMutableArray alloc]init];
    arrayOfLowF = [[NSMutableArray alloc]init];
    arrayOfLowC = [[NSMutableArray alloc]init];
    //arrayOfSDHigh = [[NSMutableArray alloc]init];
    //arrayOfSDLow = [[NSMutableArray alloc] init];
    
    NSDictionary *NSD0 = [weatherArray objectAtIndex:0];
    NSDictionary *NSD1 = [weatherArray objectAtIndex:1];
    NSDictionary *NSD2 = [weatherArray objectAtIndex:2];
    NSDictionary *NSD3 = [weatherArray objectAtIndex:3];
    NSDictionary *NSD4 = [weatherArray objectAtIndex:4];
    NSDictionary *NSD5 = [weatherArray objectAtIndex:5];
    
    NSString *var0 = [NSD0 objectForKey:@"variable"];
    NSString *var1 = [NSD1 objectForKey:@"variable"];
    NSString *var2 = [NSD2 objectForKey:@"variable"];
    NSString *var3 = [NSD3 objectForKey:@"variable"];
    NSString *var4 = [NSD4 objectForKey:@"variable"];
    NSString *var5 = [NSD5 objectForKey:@"variable"];
    
    
    
    //find correct data dictionary for crainsfc
    if ([var0 isEqual: @"crainsfc"])
    {
        crainsfc = NSD0;
    }
    else if ([var1 isEqual: @"crainsfc"])
    {
        crainsfc = NSD1;
    }
    else if ([var2 isEqual: @"crainsfc"])
    {
        crainsfc = NSD2;
    }
    else if ([var3 isEqual: @"crainsfc"])
    {
        crainsfc = NSD3;
    }
    else if ([var4 isEqual: @"crainsfc"])
    {
        crainsfc = NSD4;
    }
    else if ([var5 isEqual: @"crainsfc"])
    {
        crainsfc = NSD5;
    }
    else
    {
        NSLog(@"Rain Data Error");
    }
    
    //find correct data dictionary for csnowsfc
    if ([var0 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD0;
    }
    else if ([var1 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD1;
    }
    else if ([var2 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD2;
    }
    else if ([var3 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD3;
    }
    else if ([var4 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD4;
    }
    else if ([var5 isEqual: @"csnowsfc"])
    {
        csnowsfc = NSD5;
    }
    else
    {
        NSLog(@"Snow Data Error");
    }
    
    //find correct data dictionary for sunsdsfc
    if ([var0 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD0;
    }
    else if ([var1 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD1;
    }
    else if ([var2 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD2;
    }
    else if ([var3 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD3;
    }
    else if ([var4 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD4;
    }
    else if ([var5 isEqual: @"sunsdsfc"])
    {
        sunsdsfc = NSD5;
    }
    else
    {
        NSLog(@"Sun Data Error");
    }
    
    //find correct data dictionary for tmax2m
    if ([var0 isEqual: @"tmax2m"])
    {
        tmax2m = NSD0;
    }
    else if ([var1 isEqual: @"tmax2m"])
    {
        tmax2m = NSD1;
    }
    else if ([var2 isEqual: @"tmax2m"])
    {
        tmax2m = NSD2;
    }
    else if ([var3 isEqual: @"tmax2m"])
    {
        tmax2m = NSD3;
    }
    else if ([var4 isEqual: @"tmax2m"])
    {
        tmax2m = NSD4;
    }
    else if ([var5 isEqual: @"tmax2m"])
    {
        tmax2m = NSD5;
    }
    else
    {
        NSLog(@"tmax Data Error");
    }
    
    //find correct data dictionary for tmin2m
    if ([var0 isEqual: @"tmin2m"])
    {
        tmin2m = NSD0;
    }
    else if ([var1 isEqual: @"tmin2m"])
    {
        tmin2m = NSD1;
    }
    else if ([var2 isEqual: @"tmin2m"])
    {
        tmin2m = NSD2;
    }
    else if ([var3 isEqual: @"tmin2m"])
    {
        tmin2m = NSD3;
    }
    else if ([var4 isEqual: @"tmin2m"])
    {
        tmin2m = NSD4;
    }
    else if ([var5 isEqual: @"tmin2m"])
    {
        tmin2m = NSD5;
    }
    else
    {
        NSLog(@"tmin Data Error");
    }
    
    //find correct data dictionary for apcpsfc
    if ([var0 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD0;
    }
    else if ([var1 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD1;
    }
    else if ([var2 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD2;
    }
    else if ([var3 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD3;
    }
    else if ([var4 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD4;
    }
    else if ([var5 isEqual: @"apcpsfc"])
    {
        apcpsfc = NSD5;
    }
    else
    {
        NSLog(@"Precip Data Error");
    }
    
    
    NSArray *values1 = [crainsfc objectForKey:@"values"];
    for (NSDictionary *inter1 in values1)
    {
        NSArray *pred1 = [inter1 objectForKey:@"predictions"];
        double v1 = [[self percentOf:pred1] doubleValue];
        [arrayOfRain addObject:[NSNumber numberWithDouble:v1]];
    }
    
    NSArray *values2 = [csnowsfc objectForKey:@"values"];
    for (NSDictionary *inter2 in values2)
    {
        NSArray *pred2 = [inter2 objectForKey:@"predictions"];
        double v2 = [[self percentOf:pred2] doubleValue];
        [arrayOfSnow addObject:[NSNumber numberWithDouble:v2]];
    }
    
    NSArray *values3 = [sunsdsfc objectForKey:@"values"];
    for (NSDictionary *inter3 in values3)
    {
        NSArray *pred3 = [inter3 objectForKey:@"predictions"];
        double v3 = [[self meanOf:pred3] doubleValue];
        [arrayOfSun addObject:[NSNumber numberWithDouble:v3]];
    }
    
    NSArray *values4 = [apcpsfc objectForKey:@"values"];
    for (NSDictionary *inter4 in values4)
    {
        NSArray *pred4 = [inter4 objectForKey:@"predictions"];
        double v4 = [[self meanOf:pred4] doubleValue];
        [arrayOfPrecip addObject:[NSNumber numberWithDouble:v4]];
    }
    
    NSArray *values5 = [tmax2m objectForKey:@"values"];
    for (NSDictionary *inter5 in values5)
    {
        NSArray *pred5 = [inter5 objectForKey:@"predictions"];
        //double sdH = [[self standardDeviationOf:pred5] doubleValue];
        double v5 = [[self meanOf:pred5] doubleValue];
        double v5c = [[self toCelsius:v5] doubleValue];
        double v5f = [[self toFahrenheit:v5] doubleValue];
        //[arrayOfSDHigh addObject:[NSNumber numberWithDouble:sdH]];
        [arrayOfHighC addObject:[NSNumber numberWithDouble:v5c]];
        [arrayOfHighF addObject:[NSNumber numberWithDouble:v5f]];
    }
    
    NSArray *values6 = [tmin2m objectForKey:@"values"];
    for (NSDictionary *inter6 in values6)
    {
        NSArray *pred6 = [inter6 objectForKey:@"predictions"];
        //double sdL = [[self standardDeviationOf:pred6] doubleValue];
        double v6 = [[self meanOf:pred6] doubleValue];
        double v6c = [[self toCelsius:v6] doubleValue];
        double v6f = [[self toFahrenheit:v6] doubleValue];
        //[arrayOfSDLow addObject:[NSNumber numberWithDouble:sdL]];
        [arrayOfLowC addObject:[NSNumber numberWithDouble:v6c]];
        [arrayOfLowF addObject:[NSNumber numberWithDouble:v6f]];
    }
    
    double percentChanceRain = [[arrayOfRain objectAtIndex:0] doubleValue];
    double percentCahnceSnow = [[arrayOfSnow objectAtIndex:0] doubleValue];
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:@" EEEE, MMMM dd, yyyy"];
    NSString *date = [dateF stringFromDate:[NSDate date]];
    
    NSDateFormatter *forecastDateFormatter = [[NSDateFormatter alloc] init];
    [forecastDateFormatter setDateFormat:@" EEE"];
    NSDate *today = [NSDate date];
    int daySeconds = 86400;
    
    NSDate *fDate1 = [today dateByAddingTimeInterval:daySeconds*1];
    NSDate *fDate2 = [today dateByAddingTimeInterval:daySeconds*2];
    NSDate *fDate3 = [today dateByAddingTimeInterval:daySeconds*3];
    NSDate *fDate4 = [today dateByAddingTimeInterval:daySeconds*4];
    
    NSString *fdString1 = [forecastDateFormatter stringFromDate:fDate1];
    NSString *fdString2 = [forecastDateFormatter stringFromDate:fDate2];
    NSString *fdString3 = [forecastDateFormatter stringFromDate:fDate3];
    NSString *fdString4 = [forecastDateFormatter stringFromDate:fDate4];
    
    int HighDay1 = [[arrayOfHighF objectAtIndex: 0] integerValue];
    int HighDay2 = [[arrayOfHighF objectAtIndex: 4] integerValue];
    int HighDay3 = [[arrayOfHighF objectAtIndex: 8] integerValue];
    int HighDay4 = [[arrayOfHighF objectAtIndex:12] integerValue];
    int HighDay5 = [[arrayOfHighF objectAtIndex:16] integerValue];
    int LowDay1 = [[arrayOfLowF objectAtIndex: 0] integerValue];
    int LowDay2 = [[arrayOfLowF objectAtIndex: 4] integerValue];
    int LowDay3 = [[arrayOfLowF objectAtIndex: 8] integerValue];
    int LowDay4 = [[arrayOfLowF objectAtIndex:12] integerValue];
    int LowDay5 = [[arrayOfLowF objectAtIndex:16] integerValue];
    
    [currentHighLabel setText:[NSString stringWithFormat:@"%d°", HighDay1]];
    [currentLowLabel setText:[NSString stringWithFormat:@"%d°", LowDay1]];
    [forecastHigh1 setText:[NSString stringWithFormat:@"%d°", HighDay2]];
    [forecastLow1 setText:[NSString stringWithFormat:@"%d°", LowDay2]];
    [forecastHigh2 setText:[NSString stringWithFormat:@"%d°", HighDay3]];
    [forecastLow2 setText:[NSString stringWithFormat:@"%d°", LowDay3]];
    [forecastHigh3 setText:[NSString stringWithFormat:@"%d°", HighDay4]];
    [forecastLow3 setText:[NSString stringWithFormat:@"%d°", LowDay4]];
    [forecastHigh4 setText:[NSString stringWithFormat:@"%d°", HighDay5]];
    [forecastLow4 setText:[NSString stringWithFormat:@"%d°", LowDay5]];
    
    fahrenheit = FALSE;
    
    //code for making the app switch temp between fahrenheit and celcius every 15 seconds
    //the next line can be commented out if the app is to remain only on fahrenheit temps
    [NSTimer scheduledTimerWithTimeInterval:15.0 target:self selector:@selector(updateTemps) userInfo:nil repeats:YES];
    
    [currentTempLabel setText:@"68°"];
    [dateLabel setText:date];
    [tempForm setText:@"F"];
    [forecastDate1 setText:fdString1];
    [forecastDate2 setText:fdString2];
    [forecastDate3 setText:fdString3];
    [forecastDate4 setText:fdString4];
    [chanceOfRainLabel setText:[NSString stringWithFormat:@" Chance Of Rain: %.1f%%", percentChanceRain]];
    [chanceOfSnowLabel setText:[NSString stringWithFormat:@" Chance Of Snow: %.1f%%", percentCahnceSnow]];
    
    UIImage *rainImage = [UIImage imageNamed:@"Rain1.jpeg"];
    UIImage *cloudsImage = [UIImage imageNamed:@"Clouds1.jpeg"];
    UIImage *snowImage = [UIImage imageNamed:@"Snow.jpg"];
    UIImage *sunImage = [UIImage imageNamed:@"Sun.jpeg"];
    UIImage *cloudIcon = [UIImage imageNamed:@"CloudsIcon.png"];
    UIImage *rainIcon = [UIImage imageNamed:@"RainIcon.png"];
    UIImage *snowIcon = [UIImage imageNamed:@"SnowIcon.png"];
    UIImage *sunIcon = [UIImage imageNamed:@"SunIcon.png"];
    
    //dynamically set image displayed on weatherImage
    int n11 = [[arrayOfSnow objectAtIndex:0] integerValue];
    int n12 = [[arrayOfRain objectAtIndex:0] integerValue];
    int n13 = [[arrayOfSun objectAtIndex:0] integerValue];
    
    if (n11 > 30)
    {
        [weatherImage setImage:snowImage];
    }
    else if (n12 > 30)
    {
        [weatherImage setImage:rainImage];
    }
    else if (n13 < 5975)
    {
        [weatherImage setImage:cloudsImage];
    }
    else
    {
        [weatherImage setImage:sunImage];
    }
    
    //dynamically set image displayed on forecastPic1
    int n21 = [[arrayOfSnow objectAtIndex:4] integerValue];
    int n22 = [[arrayOfRain objectAtIndex:4] integerValue];
    int n23 = [[arrayOfSun objectAtIndex:4] integerValue];
    
    if (n21 > 30)
    {
        [forecastPic1 setImage:snowIcon];
    }
    else if (n22 > 30)
    {
        [forecastPic1 setImage:rainIcon];
    }
    else if (n23 < 5975)
    {
        [forecastPic1 setImage:cloudIcon];
    }
    else
    {
        [forecastPic1 setImage:sunIcon];
    }
    
    //dynamically set image displayed on forecastPic2
    int n31 = [[arrayOfSnow objectAtIndex:8] integerValue];
    int n32 = [[arrayOfRain objectAtIndex:8] integerValue];
    int n33 = [[arrayOfSun objectAtIndex:8] integerValue];
    
    if (n31 > 30)
    {
        [forecastPic2 setImage:snowIcon];
    }
    else if (n32 > 30)
    {
        [forecastPic2 setImage:rainIcon];
    }
    else if (n33 < 5975)
    {
        [forecastPic2 setImage:cloudIcon];
    }
    else
    {
        [forecastPic2 setImage:sunIcon];
    }
    
    //dynamically set image displayed on forecastPic3
    int n41 = [[arrayOfSnow objectAtIndex:12] integerValue];
    int n42 = [[arrayOfRain objectAtIndex:12] integerValue];
    int n43 = [[arrayOfSun objectAtIndex:12] integerValue];
    
    if (n41 > 30)
    {
        [forecastPic3 setImage:snowIcon];
    }
    else if (n42 > 30)
    {
        [forecastPic3 setImage:rainIcon];
    }
    else if (n43 < 5975)
    {
        [forecastPic3 setImage:cloudIcon];
    }
    else
    {
        [forecastPic3 setImage:sunIcon];
    }
    
    //dynamically set image displayed on forecastPic4
    int n51 = [[arrayOfSnow objectAtIndex:16] integerValue];
    int n52 = [[arrayOfRain objectAtIndex:16] integerValue];
    int n53 = [[arrayOfSun objectAtIndex:16] integerValue];
    
    if (n51 > 30)
    {
        [forecastPic4 setImage:snowIcon];
    }
    else if (n52 > 30)
    {
        [forecastPic4 setImage:rainIcon];
    }
    else if (n53 < 5975)
    {
        [forecastPic4 setImage:cloudIcon];
    }
    else
    {
        [forecastPic4 setImage:sunIcon];
    }
}

- (void)updateTemps
{
    int HighDay1;
    int HighDay2;
    int HighDay3;
    int HighDay4;
    int HighDay5;
    int LowDay1;
    int LowDay2;
    int LowDay3;
    int LowDay4;
    int LowDay5;
    
    if(fahrenheit == TRUE)
    {
        HighDay1 = [[arrayOfHighF objectAtIndex: 0] integerValue];
        HighDay2 = [[arrayOfHighF objectAtIndex: 4] integerValue];
        HighDay3 = [[arrayOfHighF objectAtIndex: 8] integerValue];
        HighDay4 = [[arrayOfHighF objectAtIndex:12] integerValue];
        HighDay5 = [[arrayOfHighF objectAtIndex:16] integerValue];
        LowDay1 = [[arrayOfLowF objectAtIndex: 0] integerValue];
        LowDay2 = [[arrayOfLowF objectAtIndex: 4] integerValue];
        LowDay3 = [[arrayOfLowF objectAtIndex: 8] integerValue];
        LowDay4 = [[arrayOfLowF objectAtIndex:12] integerValue];
        LowDay5 = [[arrayOfLowF objectAtIndex:16] integerValue];
        [tempForm setText:@"F"];
        
        fahrenheit = FALSE;
    }
    else
    {
        HighDay1 = [[arrayOfHighC objectAtIndex: 0] integerValue];
        HighDay2 = [[arrayOfHighC objectAtIndex: 4] integerValue];
        HighDay3 = [[arrayOfHighC objectAtIndex: 8] integerValue];
        HighDay4 = [[arrayOfHighC objectAtIndex:12] integerValue];
        HighDay5 = [[arrayOfHighC objectAtIndex:16] integerValue];
        LowDay1 = [[arrayOfLowC objectAtIndex: 0] integerValue];
        LowDay2 = [[arrayOfLowC objectAtIndex: 4] integerValue];
        LowDay3 = [[arrayOfLowC objectAtIndex: 8] integerValue];
        LowDay4 = [[arrayOfLowC objectAtIndex:12] integerValue];
        LowDay5 = [[arrayOfLowC objectAtIndex:16] integerValue];
        [tempForm setText:@"C"];
        
        fahrenheit = TRUE;
    }
    
    [currentHighLabel setText:[NSString stringWithFormat:@"%d°", HighDay1]];
    [currentLowLabel setText:[NSString stringWithFormat:@"%d°", LowDay1]];
    [forecastHigh1 setText:[NSString stringWithFormat:@"%d°", HighDay2]];
    [forecastLow1 setText:[NSString stringWithFormat:@"%d°", LowDay2]];
    [forecastHigh2 setText:[NSString stringWithFormat:@"%d°", HighDay3]];
    [forecastLow2 setText:[NSString stringWithFormat:@"%d°", LowDay3]];
    [forecastHigh3 setText:[NSString stringWithFormat:@"%d°", HighDay4]];
    [forecastLow3 setText:[NSString stringWithFormat:@"%d°", LowDay4]];
    [forecastHigh4 setText:[NSString stringWithFormat:@"%d°", HighDay5]];
    [forecastLow4 setText:[NSString stringWithFormat:@"%d°", LowDay5]];
    
}

- (NSNumber *)percentOf:(NSArray *)array
{
    double pTotal = 0.0;
    
    for(NSNumber *n in array)
    {
        pTotal += [n doubleValue];
    }
    
    return [NSNumber numberWithDouble:((pTotal / 21) * 100)];
}

- (NSNumber *)meanOf:(NSArray *)array
{
    double mTotal = 0.0;
    
    for(NSNumber *n in array)
    {
        mTotal += [n doubleValue];
    }
    
    return [NSNumber numberWithDouble:(mTotal / [array count])];
}

- (NSNumber *)standardDeviationOf:(NSArray *)array
{
    double arrayMean = [[self meanOf:array] doubleValue];
    double sumOfSquareD = 0.0;
    
    for(NSNumber *n in array)
    {
        double value = [n doubleValue];
        double diff = value - arrayMean;
        sumOfSquareD += diff * diff;
    }
    
    return [NSNumber numberWithDouble:sqrt(sumOfSquareD / [array count])];
}

- (NSNumber *)toFahrenheit:(double)kValue
{
    double temp = (((kValue - 273.0) * 1.8) + 32.0);
    return [NSNumber numberWithDouble:temp];
}

- (NSNumber *)toCelsius:(double)kValue
{
    double temp = kValue - 273.0;
    return [NSNumber numberWithDouble:temp];
}

@end
