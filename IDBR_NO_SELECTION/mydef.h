#ifndef _MY_DEF_H
#define _MY_DEF_H

//Notation
#define         TRUE           1
#define         FALSE          0
#define   cycle          1000000  
#define   x_axis         15

//Timer definition
#define time_unit         1
#define   t_expire        50 * time_unit //Reporting time period for REPORTING event



//Credit Information
#define  initCredit            100000          //Initial credit in user account or recharge credit
#define  eventCreditUnit       1
//#define  m                     30             //Theta = m events' credit

//Arrival Traffic Expo
#define  lambda_MTC_unit  1
#define  lambda_MTC_scale 0.5
#define  lambda_MTC       lambda_MTC_unit * lambda_MTC_scale

//Random user check
#define  lambda_user_unit             0.01           //Random_check arrival rate
#define  lambda_user_scale            1
#define  lambda_user                  lambda_user_unit * lambda_user_scale

//Specific define each event type
#define		ARRIVAL             1
#define		CREDIT_RESERVATION  2
#define     CREDIT_CONSUMED     3
#define		TIMER_EXPIRY    	4
#define		RANDOM_CHECK    	5

//newMethod.cpp define event
#define EVENT_ARRIVAL 0
#define EVENT_DEPARTURE 1
#define EVENT_SAMPLING 2
#define EVENT_DEADLINE 3
#define EVENT_WIFI_UPDATE 4

//for newMethod returning nearest event
typedef struct EventData{
    int eventType;
    double eventTime;
}EData;

//0 is AP, 1 is eNB
#define AP 0
#define ENB 1

//algo
#define STATIC 0
#define DBR 1
#define QEDF 2
#define QSSF 3
#define SDBR 4

#endif