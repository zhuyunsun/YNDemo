#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define YNNOTI @"YN_is_formal"
FOUNDATION_STATIC_INLINE NSString* YNSDKVERSION(){
    NSString *VERSION = @"2.0.3";
    NSLog(@"YN版本 = %@",VERSION);
    return VERSION;
}
/*
 *登陆/注册  成功的block回调
 *userID 用户ID
 */
typedef void(^loginSuccessful)(NSString *userID,BOOL isVistor);

/*
 角色数据返回
 result 用户详细信息
 state  接口报错信息
 httpType 接口超时信息
 */
typedef void(^UserDetailMessage)(NSDictionary * result,NSString * state,NSString * httpType);


typedef NS_ENUM(NSInteger,iosBackCode){
    iosBackCode_success = 0,
    iosBackCode_Paying,
    iosBackCode_Fail,
};
//支付block处理
/*
 block说明
 储值行为非正常时   state!=nil
 储值行为正常时     state == nil
 */
typedef void(^payResult)(NSString * state,NSInteger iosBackCode);


@interface V168Core : NSObject

@property (nonatomic,copy)NSDictionary * V168Parmas;

@property (nonatomic,readonly)NSString * sdkUid;

@property (nonatomic,copy)NSString * gameRid;

@property (nonatomic,copy)NSString * gameSid;

@property (nonatomic,copy)NSString * Ctext;

+ (V168Core *)V168CoreStart;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

-(void)applicationDidBecomeActive:(UIApplication *)application;


- (BOOL) application:(UIApplication *)application
             openURL:(NSURL *)url
   sourceApplication:(NSString *)sourceApplication
          annotation:(id)annotation;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options;

- (BOOL) continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler;


-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

//登录
/*
 *flag        自动登录标记：启动游戏进入登录界面传YES，在游戏里切换账号进入登录界面传NO
 *completion  参照CompleteSuccessful 声明
 */
/*注意：completion只有在登录/注册 成功时才回调
 */
- (void) Jacksonvillewehavehad:(BOOL)flag complete:(loginSuccessful)completion;


//角色信息获取
- (void) Andinhighspiritsofficers:(NSString *)s_id RoleID:(NSString *)r_id Block:(UserDetailMessage)block;


//内购调用
- (void) Steamboatthatcomesupforcoalbrings:(NSString *)sku orderNum:(NSString *)order currentMoney:(NSString *)money Ctext:(NSString *)ctext callBack:(NSString *)address payBlock:(payResult)block;

//五星评价
- (BOOL)Greatestfearisoffinding;


//账号绑定接口
//参数:1.个人中心0 游客绑定2 手机注册1 2.角色id 3.服务器id
//使用说明 当登陆接口isvistor参数返回1的时候 这个接口的count参数传2 其余的传0
-(void)showThePersonCenterView:(int)count roleid:(NSString *)roleid serverid:(NSString *)serverid;


//事件统计
/*
 事件类型
 earn_virtual_currency 玩家购买货币(充值)
 spend_virtual_currency 玩家消耗货币
 join_group 玩家加入公会
 level_up 玩家升级
 select_content 玩家选择指定商品
 tutorial_begin 玩家开始教程
 tutorial_complete 玩家完成教程
 unlock_achievement 玩家达成成就(解锁成就或者到达等级之类的，根据游戏定制)
 role_completed        到达角色页面。      （cp 到达角色页面打点）
 game_completed        进入游戏打点。      （cp 进入游戏主城后打点）
 game_login_completed     sdk登陆完成后，点击游戏界面的 登陆游戏按钮打点（cp打点）
 
 例子:
 [[NIK NKStart] eventRecordBeginsWithRoleid:当前的角色id serverid:当前的服务器id eventName:事件名称 count:如果当前事件有数量单位就传当前的值，如果没有单位值请传空值];
 */

-(void)eventRecordBeginsWithRoleid:(NSString *)roleid serverid:(NSString *)serverid eventName:(NSString *)event count:(NSString *)count;

///当前角色是否填写了信息,yes表示已经填写,NO表示没有填写(请正确调用Andinhighspiritsofficers接口才能正确获取该信息)
-(BOOL)hadBindMessage;
///填写信息界面
-(void)showBindMessage;
///暂不填写按钮 返回操作
/*
 
 点击(暂不填写)使用通知来接收当前是正式服还是测试服,可参考demo
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAction:) name:YNNOTI object:nil];
 
 -(void)notiAction:(NSNotification *)noti{
     NSLog(@"noti = %@",noti.userInfo);
     "is_formal" = 0;是否为正式服：1是，0否
 }
 */
@end
