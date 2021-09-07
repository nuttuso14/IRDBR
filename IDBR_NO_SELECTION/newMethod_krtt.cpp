#include<iostream>
#include<cmath>
#include<fstream>
#include<algorithm>
#include<vector>
#include "UE.h"
#include "eNB.h"
#include "e_list.h"
#include "event.h"
#include "random.h"
#include "mydef.h"

/*Event defined in mydef.h
#define EVENT_ARRIVAL 0
#define EVENT_DEPARTURE 1
#define EVENT_SAMPLING 2
#define EVENT_DEADLINE 3
#define EVENT_WIFI_UPDATE 4
*/

#define ENB_TOTAL_BW 200
#define STA_SERVICE_T_INTERVAL 50

#define FEATURE_WIFI true
#define FEATURE_DEADLINE true

#define PROB_START_WITH_WIFI 0.685
#define PROB_VIP_MEMBER 0.5

#define P_MAX 1.8
#define PARETO_SH 1.8
#define N_WIFI_AP 5
//#define MAX_NUM_UE_DEPARTURE 100000
#define MAX_TIME_SIMULATION 3000000

#define DEBUG false
using namespace std;

class WiFi
{
    int wifi_id;
    int mean_ni;

    double wifi_bw;
    double wifi_bw_r1;
    double wifi_bw_r2;
    double wifi_bw_r3;
    double mean_time_bw;
    double mean_time_r1;
    double mean_time_r2;
    double mean_time_r3;
    double dicount_alpha;
    double offloading_rate;
    
    double lambaC;
    double gamma1;
    double gamma2;
    double gamma3;

    private:
    public:
    WiFi();
    WiFi(int,int,double,double,double,double,double,double,double,double,double,double);
    int getWiFi_id()
    {
        return wifi_id; 
    }
    int getMean_ni()
    {
        return mean_ni; 
    }
    double getWifi_bw()
    {
        return wifi_bw; 
    }
    double getWifi_bw_r1()
    {
        return wifi_bw_r1; 
    }
    double getWifi_bw_r2()
    {
        return wifi_bw_r2; 
    }
    double getWifi_bw_r3()
    {
        return wifi_bw_r3;     
    }
    double getMean_time_bw()    
    {
        return mean_time_bw; 
    }
    double getMean_time_r1()
    {
        return mean_time_r1;     
    }
    double getMean_time_r2()
    {
        return mean_time_r2;     
    }
    double getMean_time_r3()
    {
        return mean_time_r3;     
    }
    double getDicount_alpha()
    {
        return dicount_alpha;     
    }
    double getOffloading_rate()
    {
        return offloading_rate;     
    }
    double getLambaC()    
    {
        return lambaC;     
    }
    double getGamma1()
    {
        return gamma1;     
    }
    double getGamma2()    
    {
        return gamma2;    
    }
    double getGamma3()
    {
        return gamma3;     
    }

};

WiFi::WiFi(){}
WiFi::WiFi(int id,int m,double bw,double r1,double r2,double r3,double tw,double t1,double t2,double t3,double coupon,double p)
{
    wifi_id=id;
    mean_ni=m;
    wifi_bw=bw;
    wifi_bw_r1=r1;
    wifi_bw_r2=r2;
    wifi_bw_r3=r3;
    mean_time_bw=tw;
    mean_time_r1=t1;
    mean_time_r2=t2;
    mean_time_r3=t3;
    dicount_alpha=coupon;
    offloading_rate=p;

    lambaC=1/mean_time_bw;
    gamma1=1/mean_time_r1;
    gamma2=1/mean_time_r2;
    gamma3=1/mean_time_r3;

}

//input
double enb_mean_time_arrival;
double enb_mean_time_service;
int max_drb_served_by_enb;
double wifi_bw;
double wifi_r1_bw;
double wifi_r2_bw;
double wifi_r3_bw;
double wifi_mean_time_connected;
double wifi_r1_mean_time_connected;
double wifi_r2_mean_time_connected;
double wifi_r3_mean_time_connected;
double wifi_mean_time_disconnected;

double deadline;
double algo;
double alpha;
double Ps;
double satisfaction_a;
double satisfaction_b;
double p_mean_file_size;
double p_mean_UE_bugget;
double lambdaC;
double lambda0;
double gamma1;
double gamma2;
double gamma3;
double offloading_rate;
bool sdbr_r;
bool idbr;


//output
double o_blocking_prob = 0;
double o_mean_service_time = 0;
double o_mean_bandwidth = 0;
double o_mean_wifi_bandwidth = 0;
double o_mean_lte_bandwidth = 0;
double o_successful_download_time = 0;
double o_primary_resource_saved = 0;
double o_mean_user_in_sys = 0;
double o_deadline_miss_rario = 0;
double o_mean_money_earned = 0;
double o_mean_money_per_time_unit = 0;
double o_num_success_download_user = 0;
double o_mean_money_earned_from_success_user = 0;
double o_mean_money_earned_per_user = 0;
double o_revenue_per_indigenous = 0;
//Pd: the session with wifi will disconnect from wifi before task complete
double o_proportion_indigenous_Pd = 0;
double o_proportion_ue_Pd = 0;
double o_proportion_indigenous = 0;

//statistic
double sta_drb_mean_bw = 0;
double sta_drb_mean_wifi_bw = 0;
double sta_drb_mean_lte_bw = 0;
double sta_drb_service_time = 0;
double sta_file_size = 0;
int sta_drb_in_sys = 0;
int sta_drb_in_sys_less_than_max = 0;
int count_sampling_time = 0;
int count_drb_miss_deadline = 0;
int count_drb_finished_by_deadline = 0;
double sta_file_transfer_by_wifi = 0;
double sta_successful_download_time = 0;
double sta_money_earned = 0;
double sta_revenue_indigenous = 0;
int* arr_num_drb_in_sys = NULL;
int arr_service_t[2000000] = {0};

int count_indigenous = 0; //有多少次arrival當下，系統人數是超過上限的(原住民的人數) 
int count_indigenous_have_wifi_disconnect  = 0;
int count_all_ue_have_wifi_disconnect = 0;
//map<int, int> map_num_service_time;


//environment 'rv' means random variable
double current_time = 0.1;
Expon rv_time_arrival;
Expon rv_time_service;
Expon rv_time_sampling;
Expon rv_time_wifi_connected;
Expon rv_time_wifi_r1_connected;
Expon rv_time_wifi_r2_connected;
Expon rv_time_wifi_r3_connected;
Expon rv_time_wifi_disconnected;
Uniform rnd_start_with_wifi(0, 1);
Uniform rnd_WiFi_visit(0, 1);
Pareto rnd_file_size;
Pareto UE_bugget;
// Expon rnd_file_size;
eNB enb;
E_List* e_list;
WiFi* ww = new WiFi[N_WIFI_AP+1];
int count_drb_finished = 0;

double enb_total_bw = ENB_TOTAL_BW;
double device_min_distribute_bw;

double p_max = P_MAX;

//prototype
void addNewDrbToENB(double);
void creatEvent(int, int, double);
void creatNearestEvent();
void SDBRappendNewDRB(double);
void recordCollectedServiceT();
void detectLteBwError(int);
double allocateBwToLackBwDrb(double);
double calLackBw(list<UE*>::iterator);
void addDrbToLackBwList(UE*);
void delDrbFromLackBwList(list<UE*>::iterator);
double allocBwToLackBwDrbwithSatis(double);
int getWifiStatus(double[],int);
double getTranstitionI2J(double,double,double,double);
double selectWiFI(double,double,double,double,int);
int generatePoissonNumber(int);
//void recordServiceTime(double);

//for testing
int consecutive_arrival = 0;
char file_name[] = "debug.txt";
ofstream fp;
ofstream fp_result;

int main(int argc, char** argv)
{
    
    cout << "Welcome to IDBR Jaaa!!!" <<endl;
    
    enb_mean_time_arrival = 1/strtod(argv[1], NULL);;
    enb_mean_time_service = strtod(argv[2], NULL);;
    max_drb_served_by_enb = atoi(argv[3]);

    wifi_mean_time_connected = strtod(argv[4], NULL);
    wifi_mean_time_disconnected = strtod(argv[5], NULL);;

    deadline = strtod(argv[6], NULL);
    algo = strtod(argv[7],NULL);
    alpha = strtod(argv[8], NULL);
    Ps = strtod(argv[9],NULL);
    satisfaction_b = strtod(argv[10],NULL);
    p_mean_file_size = strtod(argv[11],NULL);  // Unit is MB
    sdbr_r = 0;
    idbr = atoi(argv[12]);


    lambda0 = 1/wifi_mean_time_disconnected;

    if(idbr)
    {
        cout << "================ IDBR ================" <<endl;
    }

    p_mean_UE_bugget = 700;
    cout << "For Uncertainty !" << endl;
    cout << "p_mean_UE_bugget:" << p_mean_UE_bugget <<endl;

    double pareto_l = p_mean_file_size*(PARETO_SH-1)/PARETO_SH;
    rnd_file_size.SetShape(PARETO_SH);
    rnd_file_size.SetLocation(pareto_l);

    double pareto_2 = p_mean_UE_bugget*(PARETO_SH-1)/PARETO_SH;
    UE_bugget.SetShape(PARETO_SH);
    UE_bugget.SetLocation(pareto_2);

    e_list = new E_List;
    rv_time_arrival.SetMean(enb_mean_time_arrival);
    rv_time_service.SetMean(enb_mean_time_service);
    rv_time_sampling.SetMean(100);
    rv_time_wifi_disconnected.SetMean(wifi_mean_time_disconnected);

    arr_num_drb_in_sys = new int[max_drb_served_by_enb+1]();

    device_min_distribute_bw = enb_total_bw/max_drb_served_by_enb;

    enb.init(0, current_time, enb_mean_time_arrival, enb_total_bw, device_min_distribute_bw, 0);
    enb.current_time = current_time;

    //cout << "device_min_distribute_bw:"<<device_min_distribute_bw<<endl;
    //cout << "Wg:"<<enb.min_guaranteed_bw<<endl;
    
    //creatEvent(0, EVENT_ARRIVAL, current_time + rv_time_arrival++);
    //creatEvent(0, EVENT_SAMPLING, current_time + rv_time_sampling++);
    //fp.open(file_name);
    bool first_departure  = false;
    int ni[6] = {2,4,10,5,15,30};
    double bw[6] = {60,60,60,60,60,60};
    double r1_bw[6] = {40,30,5,5,5,1};
    double r2_bw[6] = {60,50,80,50,80,65};
    double r3_bw[6] = {80,100,90,120,90,100};
    double t1_time[6] = {30,60,150,100,5,300};
    double t2_time[6] = {30,60,150,100,5,300};
    double t3_time[6] = {30,60,150,100,5,300};
    double discount[6] = {0.5,0.5,0.1,0.3,0.2,0};
    double price_ap[6] = {0.02,0.05,0.01,0.02,0.01,0};

    /*for(int i=0;i<=N_WIFI_AP;i++)
    {
        ww[5] = WiFi((i+1),ni[i],bw[i],r1_bw[i],r2_bw[i],r3_bw[i],wifi_mean_time_connected,t1_time[i],t2_time[i],t3_time[i],discount[i],price_ap[i]);
    }*/
    /* for uncertainty */
    /*ww[0] = WiFi(1,ni[0],40,10,45,60.5,wifi_mean_time_connected,50,50,50,0.5,0.41);
    ww[1] = WiFi(2,ni[1],50,1,45,100,wifi_mean_time_connected,100,100,100,0.5,0.22);
    ww[2] = WiFi(3,ni[2],60,0.5,85,100,wifi_mean_time_connected,200,200,200,0.1,0.14);
    ww[3] = WiFi(4,ni[3],40,2.5,35,80,wifi_mean_time_connected,15,15,15,0.3,0.25);
    ww[4] = WiFi(5,ni[4],60,25,55,99,wifi_mean_time_connected,5,5,5,0.2,0.11);
    ww[5] = WiFi(6,ni[5],5,0.5,6,8,wifi_mean_time_connected,500,500,500,0,0);*/

    /* for constant bandwidth */
    /*
    ww[0] = WiFi(1,ni[0],50,50,50,50,wifi_mean_time_connected,50,50,50,0.5,0.41);
    ww[1] = WiFi(2,ni[1],50,50,50,50,wifi_mean_time_connected,100,100,100,0.5,0.22);
    ww[2] = WiFi(3,ni[2],50,50,50,50,wifi_mean_time_connected,200,200,200,0.1,0.14);
    ww[3] = WiFi(4,ni[3],50,50,50,50,wifi_mean_time_connected,15,15,15,0.3,0.25);
    ww[4] = WiFi(5,ni[4],50,50,50,50,wifi_mean_time_connected,5,5,5,0.2,0.11);
    ww[5] = WiFi(6,ni[5],50,50,50,50,wifi_mean_time_connected,500,500,500,0,0);*/

        /* for mutiple bandwidth [no selection] */
    /*cout << "======No selection unceratianty ======" <<endl;
    ww[0] = WiFi(1,ni[0],50,30,50,70,wifi_mean_time_connected,500,500,500,0.5,0.41);
    ww[1] = WiFi(2,ni[1],50,30,50,70,wifi_mean_time_connected,500,500,500,0.5,0.22);
    ww[2] = WiFi(3,ni[2],50,30,50,70,wifi_mean_time_connected,500,500,500,0.1,0.14);
    ww[3] = WiFi(4,ni[3],50,30,50,70,wifi_mean_time_connected,500,500,500,0.3,0.25);
    ww[4] = WiFi(5,ni[4],50,30,50,70,wifi_mean_time_connected,500,500,500,0.2,0.11);
    ww[5] = WiFi(6,ni[5],50,30,50,70,wifi_mean_time_connected,500,500,500,0,0);*/

            /* for mutiple bandwidth [with selection] */
    cout << "======No selection unceratianty [with selection]======" <<endl;
    ww[0] = WiFi(1,ni[0],40,10,45,60.5,wifi_mean_time_connected,50,50,50,0.5,0.41);
    ww[1] = WiFi(2,ni[1],50,1,45,100,wifi_mean_time_connected,100,100,100,0.5,0.22);
    ww[2] = WiFi(3,ni[2],60,0.5,85,100,wifi_mean_time_connected,200,200,200,0.1,0.14);
    ww[3] = WiFi(4,ni[3],40,2.5,35,80,wifi_mean_time_connected,15,15,15,0.3,0.25);
    ww[4] = WiFi(5,ni[4],60,25,55,99,wifi_mean_time_connected,5,5,5,0.2,0.11);
    ww[5] = WiFi(6,ni[5],5,0.5,6,8,wifi_mean_time_connected,500,500,500,0,0);




    /*ww[0] = WiFi(1,2,40,10,45,60.5,wifi_mean_time_connected,30,30,30,0.5,0.02);
    ww[1] = WiFi(2,4,50,1,45,100,wifi_mean_time_connected,30,30,30,0.5,0.05);
    ww[2] = WiFi(3,10,60,0.5,85,100,wifi_mean_time_connected,30,30,30,0.1,0.01);
    ww[3] = WiFi(4,5,40,2.5,35,80,wifi_mean_time_connected,30,30,30,0.3,0.02);
    ww[4] = WiFi(5,15,60,25,55,99,wifi_mean_time_connected,30,30,30,0.2,0.01);
    ww[5] = WiFi(6,30,5,0.5,6,8,wifi_mean_time_connected,30,30,30,0,0);*/

    /*for(int i=0;i<N_WIFI_AP;i++)
    {
        cout << "gamma1_" << i << "="<<ww[i].getGamma1()<<endl;
    }*/
    //double j = selectWiFI(5,UE_bugget++,rnd_file_size++,0.5,3);
    //cout << "The best is AP" <<j<<endl; 
    /*addNewDrbToENB(50);
    cout << "-------------" <<endl;
    addNewDrbToENB(100);
    cout << "-------------" <<endl;
    addNewDrbToENB(150);
    cout << "-------------" <<endl;
    addNewDrbToENB(5);
    cout << "-------------" <<endl;*/
    /*for(int i=0;i<5;i++)
    {
        cout << "What:" << ww[i].getWifi_bw_r3() << endl;
    }*/
    //SDBRappendNewDRB(50);

    creatEvent(0, EVENT_ARRIVAL, current_time + rv_time_arrival++);
    creatEvent(0, EVENT_SAMPLING, current_time + rv_time_sampling++);
    
    fp.open(file_name);

    while(true)
    {
        //Extract current event 
        
        Event* this_event;
        *e_list >> this_event;
        
        //Update time and update file transfer progress
        current_time = this_event->getTimeStamp();
        enb.current_time = current_time;
        enb.updateDrbTransfer();

        if(current_time >= MAX_TIME_SIMULATION){
            //cout << "current_time:"<<current_time<<endl;
            //cout << "MAX_TIME_SIMULATION:"<<MAX_TIME_SIMULATION<<endl;
            break;
        }

        /*if(first_departure)
        {
            break;
        }*/
        
        switch(this_event->getEventType()){
            
            case EVENT_ARRIVAL:{
                if(DEBUG == true){
                    fp<<"ARRIVAL"<<endl;
                    cout<<"ARRIVAL"<<endl;
                }

                consecutive_arrival++; //for testing
                
                //Creat next arrival event
                double next_arrival_time = current_time + rv_time_arrival++;
                creatEvent(0, EVENT_ARRIVAL, next_arrival_time);
                enb.count_total_drb_arrival++;
                

                if(!enb.isFull())
                { //Run DBR
                    addNewDrbToENB(enb.enb_total_bw / enb.num_drb);
                    enb.ReDistributeDrbBw();

                    if(algo==DBR)
                    {
                        enb.DBRreallocate(alpha);
                    }  
                    else if(algo==QEDF || algo==QSSF)
                    {
                        enb.QosAwarnessRelocateBw(wifi_mean_time_connected, Ps, algo);
                        //cout << "Finish reallocate on event ARRIVAL" <<endl;
                    } 
                    else if(algo==SDBR)
                    {
                        if(idbr)
                        {
                            enb.IDBR_reallocate(alpha);  
                        }
                        else
                        {
                            enb.DBRreallocate(alpha);
                        }
                        
                    }
                        

                    enb.updateDrbDepartureTime();
                }
                else if(algo==SDBR && enb.num_drb==enb.max_num_drb)
                { //initialize the SDBR
                    enb.ReDistributeDrbBw();
                    
                    //for each UE in drb_list, if it have Wifi connect, then share its bw to bw_pool accroding to alpha
                    list<UE*>::iterator itr = enb.drb_list.begin();
                    for(; itr!=enb.drb_list.end(); itr++)
                    {
                        if((*itr)->wifi_status > 0)
                        {
                            double shared_bw = 0;
                            double dicount_alpha = 1;
                            double new_alpha  = 1;
                            if(idbr)
                            {
                                if((*itr)->vip_ue)
                                {
                                    dicount_alpha = (*itr)->discount_reallocate;
                                    new_alpha = (1-dicount_alpha)*alpha;
                                }
                                else
                                {
                                    new_alpha =  dicount_alpha*alpha; 
                                }
                                shared_bw = ((*itr)->lte_bw < (*itr)->wifi_bw)? new_alpha*(*itr)->lte_bw : new_alpha*(*itr)->wifi_bw;
                            }
                            else
                            {
                                shared_bw = ((*itr)->lte_bw < (*itr)->wifi_bw)? alpha*(*itr)->lte_bw : alpha*(*itr)->wifi_bw;
                            }
                            enb.bw_pool += shared_bw;
                            (*itr)->lte_bw -= shared_bw;
                            (*itr)->bandwidth -= shared_bw;
                        }
                    }
                    //Distribute the bw in bw_pool to UE
                    if(enb.bw_pool > 0 && enb.bw_pool <= enb.min_guaranteed_bw){
                        double org_bw_pool = enb.bw_pool;
                       // cout << "WFT org_bw_pool:" << org_bw_pool <<endl;
                        enb.bw_pool = 0;
                        SDBRappendNewDRB(org_bw_pool);                      
                    }
                    else if(enb.bw_pool > enb.min_guaranteed_bw){
                        //cout << "WFT WG:" << enb.min_guaranteed_bw <<endl;
                        enb.bw_pool -= enb.min_guaranteed_bw;
                        SDBRappendNewDRB(enb.min_guaranteed_bw);
                    }
                    else{
                        enb.count_fall_drb++;
                    }

                    enb.updateDrbDepartureTime();

                }
                //if bw_pool have any bw then distribute to UE
                else if(algo==SDBR && enb.num_drb>enb.max_num_drb)
                {
                    //cout << "OVer max:enb.bw_pool" << enb.bw_pool <<endl;
                    if(enb.bw_pool > 0 && enb.bw_pool <= enb.min_guaranteed_bw){
                        double org_bw_pool = enb.bw_pool;
                       // cout << "OVer MAx :WFT org_bw_pool:" << org_bw_pool <<endl;
                        enb.bw_pool = 0;
                        SDBRappendNewDRB(org_bw_pool);
                    }
                    else if(enb.bw_pool > enb.min_guaranteed_bw){
                       // cout << "OVer MAx :WFT WG:" << enb.min_guaranteed_bw <<endl;
                        enb.bw_pool -= enb.min_guaranteed_bw;
                        SDBRappendNewDRB(enb.min_guaranteed_bw);                        
                    }
                    else{
                        enb.count_fall_drb++;
                    }

                    enb.updateDrbDepartureTime();
                    //break;
                }
                else{ //for algo DBR、QEDF、QSSF
                    enb.count_fall_drb++;
                }
                
                //
                if(enb.num_drb>0){
                    creatNearestEvent();
                }               

                if(DEBUG == true){
                    fp<< *e_list <<endl;
                    enb.printENB(fp);

                    detectLteBwError(EVENT_ARRIVAL);
                }                
                break;
            }
            case EVENT_DEPARTURE:{                
                 if(DEBUG == true)
                 {
                    fp<<"Departure"<<endl;
                    cout<<"Departure"<<endl;
                 }
                 
                 
                 consecutive_arrival = 0;

                list<UE*>::iterator drbFinished = enb.findFinishedDRB(this_event->getTimeStamp());
                sta_drb_mean_bw += (*drbFinished)->calMeanBwByFileSize();
                sta_drb_mean_wifi_bw += (*drbFinished)->calMeanWifiBw();
                sta_drb_mean_lte_bw += (*drbFinished)->calMeanLteBw();
                sta_drb_service_time += (*drbFinished)->current_time - (*drbFinished)->begin_time;
                sta_file_size += (*drbFinished)->orig_file_size;
                sta_file_transfer_by_wifi += (*drbFinished)->weight_wifi_bw_time;
                
                if((*drbFinished)->flag_deadline_miss == false && (*drbFinished)->current_time > (*drbFinished)->deadline){
                    cout<<"Error"<<endl;
                }

                if((*drbFinished)->flag_deadline_miss == true){
                    count_drb_miss_deadline++;
                }
                else{
                    sta_successful_download_time += (*drbFinished)->current_time - (*drbFinished)->begin_time;
                    count_drb_finished_by_deadline++;
                }
                
                if((*drbFinished)->flag_deadline_miss != true)
                { //calculate money
                    double drb_time_spend = (*drbFinished)->current_time - (*drbFinished)->begin_time;
                    
                    double offloading_fee = 0;
                    if ((*drbFinished)->wifi_id==(N_WIFI_AP+1)) // if UE use free WiFi
                    {
                        /* code */
                        offloading_fee = p_max;
                    }
                    else
                    {
                        offloading_fee = ww[((*drbFinished)->wifi_id)-1].getOffloading_rate()*(((*drbFinished)->orig_file_size)/8);
                    }
            
                    //double offloading_fee = ww[(*drbFinished)->wifi_id-1].getOffloading_rate()*((*drbFinished)->orig_file_size/8);
                    //double offloading_fee = offloading_rate*((*drbFinished)->orig_file_size/8);
                    satisfaction_a = offloading_fee/pow(deadline, satisfaction_b);
                    //double money = p_max- satisfaction_a*pow((drb_time_spend),satisfaction_b);
                    double money = offloading_fee - satisfaction_a*pow((drb_time_spend),satisfaction_b);

                    if(drb_time_spend>0)
                    {
                        sta_money_earned += money;
                        if((*drbFinished)->is_indigenous){
                            sta_revenue_indigenous += money;
                        }
                    }

                   /* cout << "go to this loop ========" <<endl;
                    cout << "drb_time_spend:" <<drb_time_spend<<endl;
                    cout << "offloading_fee:" <<offloading_fee<<endl;
                    cout << "satisfaction_a:" <<satisfaction_a<<endl;
                    cout << "satisfaction_b:" <<satisfaction_b<<endl;
                    cout << "money:" <<money<<endl;
                    cout << "sta_money_earned:" <<sta_money_earned<<endl;*/
                }


                //arr_service_t[count_drb_finished] = (int)((*drbFinished)->current_time - (*drbFinished)->begin_time);
                
                if((*drbFinished)->have_disconnection_from_wifi)
                {
                    count_all_ue_have_wifi_disconnect+=1;
                    if((*drbFinished)->is_indigenous)
                        count_indigenous_have_wifi_disconnect+=1;
                }
                //recordServiceTime(drbFinished->current_time - drbFinished->begin_time);
                
                
                //cout<<"DRB Finished:"<<endl;
                //drbFinished->printDRB();


                double lte_bw_of_erased_drb = (*drbFinished)->lte_bw;
                
                if((*drbFinished)->lackBw)
                    enb.deleteDRBinLackBwList(*drbFinished);
                    //enb.deleteDRBinLackBwList((*drbFinished)->departure_time, (*drbFinished)->is_indigenous);
                delete(*drbFinished);
                enb.drb_list.erase(drbFinished);
                
                enb.num_drb--;

                if(enb.num_drb <= enb.max_num_drb){
                    enb.bw_pool = 0;
                    enb.ReDistributeDrbBw();
                    
                }

                if(algo==DBR)
                    enb.DBRreallocate(alpha);
                else if(algo==QEDF || algo==QSSF)
                {
                    enb.QosAwarnessRelocateBw(wifi_mean_time_connected, Ps, algo);
                    //cout << "From Depature Event"<<endl;
                }
                    
                else if(algo==SDBR)
                {
                    if(enb.num_drb <= enb.max_num_drb)
                    {
                        if(idbr)
                        {
                            enb.IDBR_reallocate(alpha);
                        }
                        else
                        {
                            enb.DBRreallocate(alpha);
                        }

                        if(sdbr_r){
                            for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++){
                                (*it)->lackBw = false;
                            }
                            enb.indigenous_lackbw_list.clear();
                            enb.immigrant_lackbw_list.clear();                    
                        }
                    }
                    else
                    {
                        if(DEBUG){
                                fp<<endl<<"bw of erased drb: "<<lte_bw_of_erased_drb<<endl;
                        }
                        if(sdbr_r){
                            //Todo
                            //double remain_bw = allocateBwToLackBwDrb(lte_bw_of_erased_drb);
                            
                            double remain_bw = allocBwToLackBwDrbwithSatis(lte_bw_of_erased_drb);
                            enb.bw_pool += remain_bw;
                        }
                        else
                        {
                            if(!idbr)
                            {
                                enb.bw_pool += lte_bw_of_erased_drb;
                            }
                            else
                            {
                                double share_half = lte_bw_of_erased_drb/2;
                                enb.bw_pool+=share_half;

                                int n_vip=0;
                                for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                {
                                    if((*it)->vip_ue && (*it)->flag_deadline_miss!=true)
                                    {
                                        n_vip++;
                                    }
                                }

                                if(n_vip>0)
                                {
                                    double avg_distribute = share_half/n_vip;
                                    for(list<UE*>::iterator vip=enb.drb_list.begin(); vip!=enb.drb_list.end(); vip++)
                                    {
                                        if((*vip)->vip_ue && (*vip)->flag_deadline_miss!=true)
                                        {
                                            (*vip)->lte_bw+=avg_distribute;
                                            (*vip)->bandwidth+=avg_distribute;
                                        }
                                    }                        
                                }
                                else
                                {
                                    int n_lack_bw = 0;
                                    for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                    {
                                        if((*it)->lte_bw <=enb.min_guaranteed_bw*0.75 && (*it)->flag_deadline_miss!=true)
                                        {
                                            n_lack_bw++;
                                        }
                                    }

                                    if(n_lack_bw>0)
                                    {
                                        double avg_distribute = share_half/n_lack_bw;
                                        for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                        {
                                            if((*it)->lte_bw <=enb.min_guaranteed_bw*0.75 && (*it)->flag_deadline_miss!=true)
                                            {
                                                (*it)->lte_bw+=avg_distribute;
                                                (*it)->bandwidth+=avg_distribute;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        int n_no_miss=0;
                                        for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                        {
                                            if((*it)->flag_deadline_miss!=true)
                                            {
                                                n_no_miss++;
                                            }
                                        }

                                        if(n_no_miss>0)
                                        {
                                        double avg_distribute = share_half/n_no_miss; 
                                            for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                            {
                                                if((*it)->flag_deadline_miss!=true)
                                                {
                                                    (*it)->lte_bw+=avg_distribute;
                                                    (*it)->bandwidth+=avg_distribute;
                                                }
                                            }                                
                                        }
                                    }

                                }       
                            }
                                
                        }
                    }
                }

                enb.updateDrbDepartureTime();
                
                if(enb.num_drb>0){
                    creatNearestEvent();
                }

                count_drb_finished++;            
                
                // if(consecutive_arrival > 20){
                //     cout<<"count drb finished: "<<count_drb_finished<<endl;
                //     cout<<"Event list:"<<endl;
                //     cout<< *e_list <<endl;
                //     cout<<"sta mean bw: "<<sta_drb_mean_bw<<endl;
                //     cout<<"sta mean time service: "<<sta_drb_service_time<<endl<<endl;
                //     enb.printENB();          
                // }

                // cout<<"count drb finished: "<<count_drb_finished<<endl;
                // cout<<"Event list:"<<endl;
                // cout<< *e_list <<endl;
                // cout<<"sta mean bw: "<<sta_drb_mean_bw<<endl;
                // cout<<"sta mean time service: "<<sta_drb_service_time<<endl<<endl;
                // enb.printENB();

                if(DEBUG == true){
                    // fp<<"count drb finished: "<<count_drb_finished<<endl;
                    // fp<<"Event list:"<<endl;
                    // fp<< *e_list <<endl;
                    // fp<<"sta mean bw: "<<sta_drb_mean_bw<<endl;
                    // fp<<"sta mean time service: "<<sta_drb_service_time<<endl<<endl;
                    enb.printENB(fp);

                    detectLteBwError(EVENT_DEPARTURE);
                }
                first_departure = true;
                break; 
            }

            case EVENT_DEADLINE:{
                if(DEBUG == true){
                    fp<<"DEADLINE"<<endl;
                    cout<<"DEADLINE"<<endl;
                }
                

                list<UE*>::iterator drbOverDeadline = enb.findDrbOverDeadline(this_event->getTimeStamp());
                (*drbOverDeadline)->flag_deadline_miss = true;

                if(algo==SDBR && idbr)
                {
                    double lte_bw_of_erased_drb = (*drbOverDeadline)->lte_bw;   
                    (*drbOverDeadline)->lte_bw = 0;
                    (*drbOverDeadline)->bandwidth-=lte_bw_of_erased_drb;
                    enb.bw_pool += lte_bw_of_erased_drb;

                    int n_vip=0;
                    for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                    {
                        if((*it)->vip_ue && (*it)->flag_deadline_miss!=true)
                        {
                            n_vip++;
                        }
                    }

                    if(n_vip>0)
                    {
                        double avg_distribute = enb.bw_pool/n_vip;
                        for(list<UE*>::iterator vip=enb.drb_list.begin(); vip!=enb.drb_list.end(); vip++)
                        {
                            if((*vip)->vip_ue && (*vip)->flag_deadline_miss!=true)
                            {
                                (*vip)->lte_bw+=avg_distribute;
                                (*vip)->bandwidth+=avg_distribute;
                            }
                        }                        
                    }
                    else
                    {
                        int n_lack_bw = 0;
                        for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                        {
                            if((*it)->lte_bw <=enb.min_guaranteed_bw*0.75 && (*it)->flag_deadline_miss!=true)
                            {
                                n_lack_bw++;
                            }
                        }

                        if(n_lack_bw>0)
                        {
                            double avg_distribute = enb.bw_pool/n_lack_bw;
                            for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                            {
                                if((*it)->lte_bw <=enb.min_guaranteed_bw*0.75 && (*it)->flag_deadline_miss!=true)
                                {
                                    (*it)->lte_bw+=avg_distribute;
                                    (*it)->bandwidth+=avg_distribute;
                                }
                            }
                        }
                        else
                        {
                            int n_no_miss=0;
                            for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                            {
                                if((*it)->flag_deadline_miss!=true)
                                {
                                    n_no_miss++;
                                }
                            }

                            if(n_no_miss>0)
                            {
                               double avg_distribute = enb.bw_pool/n_no_miss; 
                                for(list<UE*>::iterator it=enb.drb_list.begin(); it!=enb.drb_list.end(); it++)
                                {
                                    if((*it)->flag_deadline_miss!=true)
                                    {
                                        (*it)->lte_bw+=avg_distribute;
                                        (*it)->bandwidth+=avg_distribute;
                                    }
                                }                                
                            }
                        }

                    }
                    enb.bw_pool =0;
                    enb.updateDrbDepartureTime();
                }

                /*if(idbr)
                {
                    count_drb_miss_deadline++;
                  double lte_bw_of_erased_drb = (*drbOverDeadline)->lte_bw;  
                  if((*drbOverDeadline)->lackBw)
                    enb.deleteDRBinLackBwList(*drbOverDeadline);
                    //enb.deleteDRBinLackBwList((*drbFinished)->departure_time, (*drbFinished)->is_indigenous);
                    delete(*drbOverDeadline);
                    enb.drb_list.erase(drbOverDeadline);
                
                    enb.num_drb--;

                    if(enb.num_drb <= enb.max_num_drb)
                    {
                        enb.bw_pool = 0;
                        enb.ReDistributeDrbBw();
                        enb.IDBR_reallocate(alpha);
                    }
                    else
                    {
                        enb.bw_pool += lte_bw_of_erased_drb;             
                    }
                    enb.updateDrbDepartureTime();
                }*/


                if(enb.num_drb>0){
                    creatNearestEvent();
                }
                if(DEBUG == true){
                    fp<< *e_list <<endl;
                    enb.printENB(fp);  
                }
                // cout<<"DEADLINE"<<endl;
                // cout<< *e_list <<endl;
                // enb.printENB();       
                break;
            }
            
            case EVENT_WIFI_UPDATE:{
                if(DEBUG == true){
                    fp<<"Wifi update"<<endl;
                    cout<<"WiFi update"<<endl;
                }         
               /* else{
                    if(drbupdate.lte_bw < min_distributed_bw){
                        看pool有沒有bw可以分給她
                        計算需要多少bw，
                        若pool足夠
                            就分給他。
                        若不夠
                            drbupdate.lackbw = true;
                    }  */
               // cout << " Fixed QEDF ::::::::: WiFi Update" <<endl;
                list<UE*>::iterator drbWifiUpdate = enb.findDrbWifiUpadate(this_event->getTimeStamp());
                //wifi turn false

                //cout << "(*drbWifiUpdate)->wifi_status : " << (*drbWifiUpdate)->wifi_status<<endl;
                if((*drbWifiUpdate)->wifi_status == 0)
                {
                    double P0 = wifi_mean_time_disconnected/(wifi_mean_time_disconnected 
                                + ww[((*drbWifiUpdate)->wifi_id)-1].getMean_time_bw());
                    double Pc = 1-P0;
                    double q1 = (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1())/((1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1())
                                +(1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2())+(1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma3()));
                    double q2 = (1/1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2())/((1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1())
                                +(1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2())+(1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma3())); 
                    double q3 = 1-(q1+q2); 

                    double P01 = getTranstitionI2J((q1*lambda0),0,0,0);
                    double P02 = getTranstitionI2J((q2*lambda0),0,0,0);
                    double P03 = getTranstitionI2J((q3*lambda0),0,0,0); 



                    double plist[3] = {P01,P02,P03};

                    double chageStatus = getWifiStatus(plist,3);
                    (*drbWifiUpdate)->wifi_status = chageStatus+1;

                   // cout << "Fix QEDF: chageStatus :" << (*drbWifiUpdate)->wifi_status <<endl; 
                    /*cout << "====== Before WiFi status:0 ======" <<endl;
                    cout << "P01:" << P01 <<endl;
                    cout << "P02:" << P02 <<endl;
                    cout << "P02:" << P02 <<endl;
                    cout << "plist[0]:" << plist[0] <<endl;
                    cout << "plist[1]:" << plist[1] <<endl;
                    cout << "plist[2]:" << plist[2] <<endl;
                    cout << "====== WiFi Status is " << (*drbWifiUpdate)->wifi_status << endl;*/
                    //break;
                }
                else if((*drbWifiUpdate)->wifi_status == 1)
                {
                    double gamma12 = (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2())/(((1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2()))
                                   + (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma3()));
                    double gamma13 = 1-gamma12;
                    double lamC = ww[((*drbWifiUpdate)->wifi_id)-1].getLambaC();
                    double gam1 = ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1();

                    double P10 = getTranstitionI2J(lamC,lamC,gam1,1);
                    double P12 = getTranstitionI2J((gam1*gamma12),lamC,gam1,1);
                    double P13 = getTranstitionI2J((gam1*gamma13),lamC,gam1,1); 


                    double plist[3] = {P10,P12,P13};
                    double chageStatus = getWifiStatus(plist,3);

                    (*drbWifiUpdate)->wifi_status = (chageStatus!=0)?chageStatus+1:0; 

                    /*
                    cout << "====== Before WiFi status:1 ======" <<endl;
                    cout << "P10:" << P10 <<endl;
                    cout << "P12:" << P12 <<endl;
                    cout << "P13:" << P13 <<endl;
                    cout << "plist[0]:" << plist[0] <<endl;
                    cout << "plist[1]:" << plist[1] <<endl;
                    cout << "plist[2]:" << plist[2] <<endl;
                    cout << "====== WiFi Status is " << (*drbWifiUpdate)->wifi_status << endl;*/
                }
                else if((*drbWifiUpdate)->wifi_status == 2)
                {
                    double gamma21 = (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1())/(((1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1()))
                                   + (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma3()));
                    double gamma23 = 1-gamma21;

                    double lamC = ww[((*drbWifiUpdate)->wifi_id)-1].getLambaC();
                    double gam2 = ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2();

  
                    double P20 = getTranstitionI2J(lamC,lamC,gam2,2);
                    double P21 = getTranstitionI2J(gam2*gamma21,lamC,gam2,2);
                    double P23 = getTranstitionI2J(gam2*gamma23,lamC,gam2,2);
                    double plist[3] = {P20,P21,P23};
                    double chageStatus = getWifiStatus(plist,3);    
                    (*drbWifiUpdate)->wifi_status = (chageStatus>=2)?chageStatus+1:chageStatus;

                    /*cout << "====== Before WiFi status:2 ======" <<endl;
                    cout << "P20:" << P20 <<endl;
                    cout << "P21:" << P21 <<endl;
                    cout << "P23:" << P23 <<endl;
                    cout << "plist[0]:" << plist[0] <<endl;
                    cout << "plist[1]:" << plist[1] <<endl;
                    cout << "plist[2]:" << plist[2] <<endl;
                    cout << "====== WiFi Status is " << (*drbWifiUpdate)->wifi_status << endl;*/

                } 
                else if((*drbWifiUpdate)->wifi_status == 3)
                {
                    double gamma31 = (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1())/(((1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma1()))
                                   + (1/ww[((*drbWifiUpdate)->wifi_id)-1].getGamma2()));
                    double gamma32 = 1-gamma31;
                    double lamC = ww[((*drbWifiUpdate)->wifi_id)-1].getLambaC();
                    double gam3 = ww[((*drbWifiUpdate)->wifi_id)-1].getGamma3();

                    double P30 = getTranstitionI2J(lamC,lamC,gam3,3);
                    double P31 = getTranstitionI2J(gam3*gamma31,lamC,gam3,3);
                    double P32 = getTranstitionI2J(gam3*gamma32,lamC,gam3,3);
                    double plist[3] = {P30,P31,P32};
                    double chageStatus = getWifiStatus(plist,3);
                    (*drbWifiUpdate)->wifi_status = chageStatus;

                    /*cout << "====== Before WiFi status:3 ======" <<endl;
                    cout << "P30:" << P30 <<endl;
                    cout << "P31:" << P31 <<endl;
                    cout << "P32:" << P32 <<endl;
                    cout << "plist[0]:" << plist[0] <<endl;
                    cout << "plist[1]:" << plist[1] <<endl;
                    cout << "plist[2]:" << plist[2] <<endl;
                    cout << "====== WiFi Status is " << (*drbWifiUpdate)->wifi_status << endl;*/

                } 
                
                // after change status

                //cout << "After :::::::(*drbWifiUpdate)->wifi_status : " << (*drbWifiUpdate)->wifi_status<<endl;

                if((*drbWifiUpdate)->wifi_status == 0)
                {
                    //cout << "======== This is loop 0" << endl;
                    (*drbWifiUpdate)->next_wifi_update_time = current_time + rv_time_wifi_disconnected++;
                    (*drbWifiUpdate)->wifi_bw = 0;

                    if(algo==SDBR && enb.num_drb>enb.max_num_drb)
                    {
                        double neededBw = enb.min_guaranteed_bw - (*drbWifiUpdate)->lte_bw;
                        if((enb.bw_pool+0.0001)<neededBw){
                            (*drbWifiUpdate)->lte_bw += enb.bw_pool;
                            (*drbWifiUpdate)->bandwidth += enb.bw_pool;
                            enb.bw_pool = 0;

                            if(sdbr_r && (*drbWifiUpdate)->lackBw == false)
                            {
                                 (*drbWifiUpdate)->lackBw = true;
                                 addDrbToLackBwList(*drbWifiUpdate);
                            }                               
                        }
                        else if(enb.bw_pool >= (neededBw-0.0001))
                        {
                            (*drbWifiUpdate)->lte_bw += neededBw;
                            (*drbWifiUpdate)->bandwidth += neededBw;
                            enb.bw_pool -= neededBw;
                        }
                    }
                    (*drbWifiUpdate)->have_disconnection_from_wifi = true; //used on statistic
                }
                else
                {
                    if((*drbWifiUpdate)->wifi_status == 1)
                    {
                        //cout << "======== This is loop 1" << endl;
                        rv_time_wifi_r1_connected.SetMean(ww[((*drbWifiUpdate)->wifi_id)-1].getMean_time_r1());
                        (*drbWifiUpdate)->next_wifi_update_time = current_time + rv_time_wifi_r1_connected++;
                        (*drbWifiUpdate)->wifi_bw = ww[((*drbWifiUpdate)->wifi_id)-1].getWifi_bw_r1();
                    }
                    else if((*drbWifiUpdate)->wifi_status == 2)
                    {
                        //cout << "======== This is loop 2" << endl;
                        rv_time_wifi_r2_connected.SetMean(ww[((*drbWifiUpdate)->wifi_id)-1].getMean_time_r2());
                        (*drbWifiUpdate)->next_wifi_update_time = current_time + rv_time_wifi_r2_connected++;
                        (*drbWifiUpdate)->wifi_bw = ww[((*drbWifiUpdate)->wifi_id)-1].getWifi_bw_r2();
                    } 
                    else if((*drbWifiUpdate)->wifi_status == 3)
                    {
                        //cout << "======== This is loop 3" << endl;
                        rv_time_wifi_r3_connected.SetMean(ww[((*drbWifiUpdate)->wifi_id)-1].getMean_time_r3());
                        (*drbWifiUpdate)->next_wifi_update_time = current_time + rv_time_wifi_r3_connected++;
                        (*drbWifiUpdate)->wifi_bw = ww[((*drbWifiUpdate)->wifi_id)-1].getWifi_bw_r3();
                    }

                    //In SDBR-R, DRB Will share 
                    if(algo==SDBR && enb.num_drb>enb.max_num_drb)
                    {
                        if(sdbr_r && calLackBw(drbWifiUpdate)<=0.0001)
                        {
                            (*drbWifiUpdate)->lackBw = false;
                            //enb.deleteDRBinLackBwList((*drbWifiUpdate)->departure_time, (*drbWifiUpdate)->is_indigenous);
                            enb.deleteDRBinLackBwList(*drbWifiUpdate);
                        }
                        //When drb's lte bandwidth is more than Wg
                        if((*drbWifiUpdate)->lte_bw>=enb.min_guaranteed_bw)
                        {
                            double shared_bw = 0;
                            if(idbr)
                            {
                                //cout << "===========In WiFi Update"<<endl;
                                double new_alpha = 1;
                                if((*drbWifiUpdate)->vip_ue)
                                {
                                    new_alpha = (1-(*drbWifiUpdate)->discount_reallocate)*alpha;
                                    //cout << "===========VIP LOOP"  << endl;
                                    //cout << "alpha:" << alpha << endl;
                                    //cout << "dicount_alpha:" << (*drbWifiUpdate)->discount_reallocate << endl;
                                    //cout << "new_alpha:" << new_alpha << endl;
                                }
                                else
                                {
                                    new_alpha = alpha;
                                    //cout << "===========Else LOOP" << endl;
                                    //cout << "alpha:" << alpha << endl;
                                    //cout << "dicount_alpha:" << dicount_alpha << endl;
                                    //cout << "new_alpha:" << new_alpha << endl; 
                                }
                                shared_bw = ((*drbWifiUpdate)->lte_bw < (*drbWifiUpdate)->wifi_bw)? new_alpha*(*drbWifiUpdate)->lte_bw : new_alpha*(*drbWifiUpdate)->wifi_bw;
                            }
                            else
                            {
                                shared_bw = ((*drbWifiUpdate)->lte_bw < (*drbWifiUpdate)->wifi_bw)? alpha*(*drbWifiUpdate)->lte_bw : alpha*(*drbWifiUpdate)->wifi_bw;
                            }
                            
                            (*drbWifiUpdate)->lte_bw -= shared_bw;
                            (*drbWifiUpdate)->bandwidth = (*drbWifiUpdate)->lte_bw + (*drbWifiUpdate)->wifi_bw;
                            
                            double remain_bw=0;
                            if(sdbr_r)
                            {
                                
                                if(DEBUG) fp<<"before"<<endl;
                                remain_bw = allocBwToLackBwDrbwithSatis(shared_bw);
                                if(DEBUG) fp<<"after"<<endl;
                                enb.bw_pool += remain_bw;
                            }
                            else{
                                enb.bw_pool+=shared_bw;
                            }
                           
                        }
                    }
                }
                
                (*drbWifiUpdate)->bandwidth = (*drbWifiUpdate)->lte_bw + (*drbWifiUpdate)->wifi_bw;
                

                if(enb.num_drb <= enb.max_num_drb){
                    enb.bw_pool = 0;
                    enb.ReDistributeDrbBw();
                }
                
                if(algo==DBR)
                    enb.DBRreallocate(alpha);
                else if(algo==QEDF || algo==QSSF)
                    enb.QosAwarnessRelocateBw(wifi_mean_time_connected, Ps, algo);
                else if(algo==SDBR && enb.num_drb<=enb.max_num_drb)
                {
                    if(idbr)
                    {
                        enb.IDBR_reallocate(alpha);
                    }
                    else
                    {
                        enb.DBRreallocate(alpha);
                    }
                    
                }
               
                enb.updateDrbDepartureTime();

                if(enb.num_drb>0){
                    creatNearestEvent();
                }
                
                if(DEBUG == true){
                    fp<< *e_list <<endl;
                    enb.printENB(fp); 

                    detectLteBwError(EVENT_WIFI_UPDATE);
                }
                

                break;
            }

            case EVENT_SAMPLING:{
                if(DEBUG){
                    cout<<"sampling"<<endl;
                }
                sta_drb_in_sys += enb.num_drb;
                arr_num_drb_in_sys[enb.num_drb]++;
                count_sampling_time++;
                if(enb.num_drb < enb.max_num_drb)
                    sta_drb_in_sys_less_than_max++;
                creatEvent(0, EVENT_SAMPLING, current_time + rv_time_sampling++);

                // cout<<"Event Sampling"<<endl;
                // cout<<*e_list<<endl;
                // cout<<"sta drb in sys: "<<sta_drb_in_sys<<endl
                //     <<"count sampling time: "<<count_sampling_time<<endl;
                // enb.printENB();
                
                break;
            }           
        }        
    }

    o_blocking_prob = (double)enb.count_fall_drb/enb.count_total_drb_arrival;
    o_mean_bandwidth = sta_drb_mean_bw/count_drb_finished;
    o_mean_wifi_bandwidth = sta_drb_mean_wifi_bw / count_drb_finished;
    o_mean_lte_bandwidth = sta_drb_mean_lte_bw / count_drb_finished;
    o_successful_download_time = sta_successful_download_time / count_drb_finished_by_deadline; 
    o_primary_resource_saved = sta_file_transfer_by_wifi / count_drb_finished;
    o_mean_service_time = sta_drb_service_time/count_drb_finished;
    o_mean_user_in_sys = (double)sta_drb_in_sys / count_sampling_time;
    o_deadline_miss_rario = (double)count_drb_miss_deadline / count_drb_finished;
    o_mean_money_earned = sta_money_earned/count_drb_finished;
    o_mean_money_per_time_unit = sta_money_earned / current_time;
    o_num_success_download_user = count_drb_finished_by_deadline;
    o_mean_money_earned_from_success_user = sta_money_earned / count_drb_finished_by_deadline;
    o_mean_money_earned_per_user = sta_money_earned / count_drb_finished;
    o_revenue_per_indigenous = sta_revenue_indigenous / count_indigenous;

    o_proportion_indigenous_Pd = (double)count_indigenous_have_wifi_disconnect/count_indigenous;
    o_proportion_ue_Pd = (double)count_all_ue_have_wifi_disconnect/count_drb_finished;
    o_proportion_indigenous = (double)count_indigenous / count_drb_finished;

    cout<<"num of simulate user: "<<count_drb_finished<<endl
        <<"num of user before deadline: "<<count_drb_finished_by_deadline<<endl
        <<"DRB blocking prob: "<< o_blocking_prob <<endl
        <<"Mean bw: "<<o_mean_bandwidth<<endl
        <<"Mean wifi bw: "<<o_mean_wifi_bandwidth<<endl
        <<"Mean Lte bw: "<<o_mean_lte_bandwidth<<endl
        <<"Mean service time: "<<o_mean_service_time<<endl
        <<"Mean successful download time: "<<o_successful_download_time<<endl
        <<"Mean file size: "<<sta_file_size/count_drb_finished<<endl
        <<"Primary resource saved: "<<o_primary_resource_saved<<endl
        <<"Mean drb in sys: "<<o_mean_user_in_sys<<" ,sampling time: "<<count_sampling_time<<endl
        <<"Deadline miss ratio: "<<o_deadline_miss_rario<<endl
        <<"Mean money per user: "<<o_mean_money_earned<<endl
        <<"Total Money: "<<sta_money_earned<<endl;
        


    //recordCollectedServiceT();

    fp_result.open("result_un.txt",ios_base::app);
    
    fp_result
            // <<count_drb_finished<<" "
            //  <<count_drb_finished_by_deadline<<" "
             //<<o_mean_money_per_time_unit<< " "
             <<sta_money_earned<<" "
             <<o_blocking_prob<<" "
             <<o_mean_money_earned_per_user<<" "
             //<<o_mean_bandwidth<<endl
            //  <<o_mean_wifi_bandwidth<<" "
            //  <<o_mean_lte_bandwidth<<" "
            //  <<o_mean_service_time<<" "
            //  <<o_successful_download_time<<" "
             <<sta_file_size/count_drb_finished<<" "
             <<o_primary_resource_saved<<" "
             <<o_deadline_miss_rario<<endl;
            //  <<o_mean_user_in_sys<<endl;            
             //<<count_drb_finished_by_deadline<<endl;
             //<<o_mean_money_earned_from_success_user<<endl;
            // <<o_mean_money_earned_per_user<<endl;
            //  <<o_deadline_miss_rario<<" "
            //  <<o_mean_user_in_sys<<endl;
             //<<o_revenue_per_indigenous<<" ";
             //<<o_proportion_indigenous_Pd<<" "
             //<<o_proportion_ue_Pd<<" "
             //<<o_proportion_indigenous<<" "<<endl;
             //<< (double)sta_drb_in_sys_less_than_max/count_sampling_time<<" ";

    //fp.close();
    //fp_result.close();
}



double calculatePI(int shape)
{
			double U = 1;
            Uniform uu(0,1);
		//	cout <<"sss:" <<shape <<"\n";
        	for(int i=0;i<shape;i++){
            	U*=uu++;
            //	cout << "PI"<< U <<"\n";
        	}
        //	free(&t);
        	return U;
}

double generateRandomNumber(int ni,double lambda){
		double U = calculatePI(ni);
		if(U==0){
			do{
				U = calculatePI(ni);
			}while(U==0);
		}
        return (-1/lambda)*log(U);
    }

double selectWiFI(double lte,double money,double volume,double packet_size,int K)
{
    double ping[N_WIFI_AP]={0};
    double mean_time[N_WIFI_AP]={0};
    double lamda_i[N_WIFI_AP]={0};
    double bit_packet = 8*packet_size;
    double bit_volume = 8*volume;
    double tl[N_WIFI_AP]={0};
    double off_fee[N_WIFI_AP]={0};
    vector<int> i_qualify;
    int N_qualify_AP = 0;

    //cout << "Money :" << money <<endl;
    for(int i=0;i<N_WIFI_AP;i++)
    {
        tl[i] = bit_volume/(ww[i].getWifi_bw()+lte);
        off_fee[i] =ww[i].getOffloading_rate()*volume; 
        //cout << "tl["<<i<<"]=" << tl[i] << " volume=" << volume << " price =" << ww[i].getOffloading_rate() << " off_fee["<<i<<"]=" << off_fee[i] <<endl;
    }

    for(int i=0;i<N_WIFI_AP;i++)
    {
        if(tl[i]<=deadline && money>=off_fee[i])
        {
            //cout << "qualify:" << i << endl; 
            i_qualify.push_back(i);
            N_qualify_AP++;
        }
    }

    if(N_qualify_AP==0)
    {
        return N_WIFI_AP;
    }

    for(int i=0;i<N_qualify_AP;i++)
    {
        ping[i_qualify[i]] = bit_packet/(ww[i_qualify[i]].getWifi_bw()+lte);
        lamda_i[i_qualify[i]] = 1/ping[i_qualify[i]];
        //mean_time[i]= ww[i].getMean_ni()*ping[i];
        //cout << "tl_"<<i<<"="<< tl[i] << " n"<<i<<"="<<ww[i].getMean_ni() << " mean_response="<<ww[i].getMean_ni()/lamda_i[i]<<endl;
    }

    //Erlang err;
    double sum_delay=0;
    double min_delay=0;
    int x=0;
    for(int i=0;i<N_qualify_AP;i++)
    {
        sum_delay = 0;
        //err.SetMean(mean_time[i]);
        //cout << "i="<<i<<endl;
        int nn = generatePoissonNumber(ww[i_qualify[i]].getMean_ni());
        double ni = (nn==0)?1:nn;
        //cout << "n"<<i<<"="<<ni<<endl;
        for(int j=0;j<K;j++)
        {
            double Ti = generateRandomNumber(ni,lamda_i[i_qualify[i]]); 
            sum_delay+=Ti;
            //cout << "Ti="<<Ti<<" sum_delay="<<sum_delay <<endl;
        }
        //cout << "avg_delay:" << sum_delay/100 <<endl;
        //cout << "AP"<< i_qualify[i] <<":" << sum_delay <<endl;
        if(i==0)
        {
            min_delay = sum_delay;
            x=0;
        }
        else
        {
            if(min_delay>sum_delay)
            {
                min_delay = sum_delay;
                x=i;
            }
        }
    }
    //cout << "select :" << i_qualify[x] << endl;


    return i_qualify[x];
}

void addNewDrbToENB(double lte_bw){
    UE* newDrb = new UE;
    newDrb->init(0,0,0);
    //double file_size = device_min_distribute_bw * rv_time_service++;
    double file_MB_size = rnd_file_size++;
    double file_size = 8*file_MB_size;//file size unit is Mb
    double ue_money = UE_bugget++;
    newDrb->orig_file_size = file_size;
    newDrb->remain_file_size = file_size;
    newDrb->current_time = current_time;
    newDrb->begin_time = current_time;
    newDrb->prev_time = current_time;
    newDrb->lte_bw = lte_bw;
    newDrb->budget = ue_money;
    if(FEATURE_WIFI == true)
    {
        /*
        bool newStatus = (rnd_start_with_wifi++ > PROB_START_WITH_WIFI)?true:false;
        */
        // select WiFi APs
        int get_wifi_i = selectWiFI(lte_bw,ue_money,file_MB_size,2,3);
        newDrb->wifi_id = get_wifi_i+1;
        newDrb->vip_ue = (rnd_start_with_wifi++ < PROB_VIP_MEMBER)?true:false;
        newDrb->discount_reallocate = ww[get_wifi_i].getDicount_alpha();

        double P0 = wifi_mean_time_disconnected/(wifi_mean_time_disconnected + ww[get_wifi_i].getMean_time_bw());
        double Pc = 1-P0;
        double q1 = (1/ww[get_wifi_i].getGamma1())/((1/ww[get_wifi_i].getGamma1())+(1/ww[get_wifi_i].getGamma2())+(1/ww[get_wifi_i].getGamma3()));
        double q2 = (1/ww[get_wifi_i].getGamma2())/((1/ww[get_wifi_i].getGamma1())+(1/ww[get_wifi_i].getGamma2())+(1/ww[get_wifi_i].getGamma3()));
        double q3 = 1-(q1+q2);
        double P1 = q1*Pc;
        double P2 = q2*Pc;
        double P3 = q3*Pc;
        double plist[4]={P0,P1,P2,P3};
        int newStatus = getWifiStatus(plist,4);
        newDrb->wifi_status = newStatus;
        //cout << "newDBR->WiFi_status=" << newDrb->wifi_status <<endl;

        if(newStatus==0)
        {
            newDrb->wifi_bw = 0;  
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_disconnected++;
        }
        else if(newStatus==1)
        {
            rv_time_wifi_r1_connected.SetMean(ww[get_wifi_i].getMean_time_r1());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r1();  
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r1_connected++;
        }
        else if(newStatus==2)
        {
            rv_time_wifi_r2_connected.SetMean(ww[get_wifi_i].getMean_time_r2());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r2();   
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r2_connected++;
            
        }
        else if(newStatus==3)
        {
            rv_time_wifi_r3_connected.SetMean(ww[get_wifi_i].getMean_time_r3());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r3();    
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r3_connected++;
            
        }
        //cout << "newDrb->wifi_bw=" << newDrb->wifi_bw <<endl;
        
       // newDrb->wifi_status = newStatus;
        //newDrb->wifi_bw = wifi_bw*newStatus;  
        //newDrb->next_wifi_update_time = (newStatus == true)? (current_time+rv_time_wifi_connected++):(current_time+rv_time_wifi_disconnected++);
         
    }
    newDrb->bandwidth = newDrb->wifi_bw + newDrb->lte_bw;

    if(FEATURE_DEADLINE == true){
        newDrb->deadline = current_time + deadline;
    }

    newDrb->is_indigenous = enb.isFull()? false:true;
    if(newDrb->is_indigenous) count_indigenous++;

    enb.addDRB(&newDrb);
    enb.num_drb++;
}

void SDBRappendNewDRB(double lte_bw)
{
    
    UE* newDrb = new UE;
    newDrb->init(0,0,0);
    //double WiFi_bw_lists[4] = {0,wifi_r1_bw,wifi_r2_bw,wifi_r3_bw};   
    //double file_size = device_min_distribute_bw * rv_time_service++;
    double file_MB_size = rnd_file_size++;
    double file_size = 8*(file_MB_size);//File size unit is Mb
    double ue_money = UE_bugget++;
    newDrb->orig_file_size = file_size;
    newDrb->remain_file_size = file_size;
    newDrb->current_time = current_time;
    newDrb->begin_time = current_time;
    newDrb->prev_time = current_time;
    newDrb->budget = ue_money;
    
    

    newDrb->is_indigenous = enb.isFull()? false:true;
    if(newDrb->is_indigenous) count_indigenous++;

    if(FEATURE_WIFI == true)
    {
        /*
        bool newStatus = (rnd_start_with_wifi++ > PROB_START_WITH_WIFI)?true:false;
        newDrb->wifi_status = newStatus;
        newDrb->wifi_bw = wifi_bw*newStatus;  
        newDrb->next_wifi_update_time = (newStatus == true)? (current_time+rv_time_wifi_connected++):(current_time+rv_time_wifi_disconnected++);*/

        int get_wifi_i = selectWiFI(lte_bw,ue_money,file_MB_size,2,3);
        newDrb->wifi_id = get_wifi_i+1;
        newDrb->vip_ue = (rnd_start_with_wifi++ < PROB_VIP_MEMBER)?true:false;
        newDrb->discount_reallocate = ww[get_wifi_i].getDicount_alpha();

        double P0 = wifi_mean_time_disconnected/(wifi_mean_time_disconnected + ww[get_wifi_i].getMean_time_bw());
        double Pc = 1-P0;
        double q1 = (1/ww[get_wifi_i].getGamma1())/((1/ww[get_wifi_i].getGamma1())+(1/ww[get_wifi_i].getGamma2())+(1/ww[get_wifi_i].getGamma3()));
        double q2 = (1/ww[get_wifi_i].getGamma2())/((1/ww[get_wifi_i].getGamma1())+(1/ww[get_wifi_i].getGamma2())+(1/ww[get_wifi_i].getGamma3()));
        double q3 = 1-(q1+q2);
        double P1 = q1*Pc;
        double P2 = q2*Pc;
        double P3 = q3*Pc;

        double plist[4]={P0,P1,P2,P3};
        int newStatus = getWifiStatus(plist,4);
        newDrb->wifi_status = newStatus;
        //cout << "SDBR : newDrb->wifi_status=" << newDrb->wifi_status <<endl;
         if(newStatus==0)
        {
            newDrb->wifi_bw = 0;  
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_disconnected++;
        }
        else if(newStatus==1)
        {
            rv_time_wifi_r1_connected.SetMean(ww[get_wifi_i].getMean_time_r1());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r1();  
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r1_connected++;
        }
        else if(newStatus==2)
        {
            rv_time_wifi_r2_connected.SetMean(ww[get_wifi_i].getMean_time_r2());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r2();   
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r2_connected++;
            
        }
        else if(newStatus==3)
        {
            rv_time_wifi_r3_connected.SetMean(ww[get_wifi_i].getMean_time_r3());
            newDrb->wifi_bw = ww[get_wifi_i].getWifi_bw_r3();    
            newDrb->next_wifi_update_time = current_time+rv_time_wifi_r3_connected++;
            
        }

        //cout << "SDBR : newDrb->wifi_bw=" << newDrb->wifi_bw <<endl;
         
        if(sdbr_r && lte_bw<device_min_distribute_bw)
        { 
            if(newDrb->wifi_status>0)
            {
                if(device_min_distribute_bw<=newDrb->wifi_bw) 
                {
                    if((1-alpha)*device_min_distribute_bw > (lte_bw+0.0001))
                    {
                        if(DEBUG)
                        {
                            fp<<"1-alpha*wg "<<(1-alpha)*device_min_distribute_bw<<endl
                                <<"lte bw"<<lte_bw<<endl
                                <<((1-alpha)*device_min_distribute_bw > lte_bw+0.0001)<<endl;
                        }
                        newDrb->lackBw = true;
                        addDrbToLackBwList(newDrb);
                    }
                }
                else{
                    if((device_min_distribute_bw-alpha*newDrb->wifi_bw) > lte_bw+0.0001){
                        newDrb->lackBw = true;
                        addDrbToLackBwList(newDrb);
                    }
                }
            }
            else{
                if(lte_bw+0.0001 < device_min_distribute_bw){
                    newDrb->lackBw = true;
                    addDrbToLackBwList(newDrb);
                }
            }
            
            // if(newDrb->is_indigenous)
            //     enb.indigenous_lackbw_list.push_back(newDrb);
            // else
            //     enb.immigrant_lackbw_list.push_back(newDrb);
        }

        if(newStatus >0 && lte_bw>=device_min_distribute_bw)
        {
            
            double shared_bw = 0;
            double dicount_alpha = 1;
            double new_alpha  = 1;
            if(idbr)
            {
                //cout << "in loop : (newStatus >0 && lte_bw>=device_min_distribute_bw)" <<endl;
                if(newDrb->vip_ue)
                {

                    dicount_alpha = newDrb->discount_reallocate;
                    new_alpha = (1-dicount_alpha)*alpha;
                    //cout << "===========VIP LOOP" << alpha << endl;
                    //cout << "alpha:" << alpha << endl;
                    //cout << "dicount_alpha:" << dicount_alpha << endl;
                    //cout << "new_alpha:" << new_alpha << endl;
                }
                else
                {
                    new_alpha =  dicount_alpha*alpha;
                    //cout << "===========Else LOOP" << alpha << endl;
                    //cout << "alpha:" << alpha << endl;
                    //cout << "dicount_alpha:" << dicount_alpha << endl;
                    //cout << "new_alpha:" << new_alpha << endl; 
                }
                shared_bw = (lte_bw < newDrb->wifi_bw)? new_alpha*lte_bw : new_alpha*newDrb->wifi_bw;
            }
            else
            {
                shared_bw = (lte_bw < newDrb->wifi_bw)? alpha*lte_bw : alpha*newDrb->wifi_bw;
            }
            //double shared_bw = (lte_bw < newDrb->wifi_bw)? alpha*lte_bw : alpha*newDrb->wifi_bw;
            lte_bw -= shared_bw;
            enb.bw_pool += shared_bw;
        }

    }
    newDrb->lte_bw = lte_bw;
    newDrb->bandwidth = newDrb->wifi_bw + newDrb->lte_bw;

    if(FEATURE_DEADLINE == true){
        newDrb->deadline = current_time + deadline;
    }

    enb.addDRB(&newDrb);
    enb.num_drb++;
}

void creatEvent(int enbId ,int eventType, double timeStamp){
    Event* event = new Event;
    event->setENBid(enbId);
    event->setEventType(eventType);
    event->setTimestamp(timeStamp);
    *e_list << *event;
}

void creatNearestEvent(){
    EData nearestEvent = enb.findNearestEventOfDrb(FEATURE_WIFI, FEATURE_DEADLINE);
    Event* nextArrivalEvent = e_list->findNextArrival(EVENT_ARRIVAL);
     //cout<<"Nearest Event time: "<<nearestEvent.eventTime<<endl
         //<<"Nearest Event Type: "<<nearestEvent.eventType<<endl<<endl;
    if(nearestEvent.eventTime < nextArrivalEvent->getTimeStamp()){
        creatEvent(0, nearestEvent.eventType, nearestEvent.eventTime);
    }
}

void detectLteBwError(int event){
    if(enb.num_drb==0) return;
    double sum_lte_bw = 0;
    list<UE*>::iterator itr = enb.drb_list.begin();
    for(; itr!=enb.drb_list.end(); itr++){
        sum_lte_bw += (*itr)->lte_bw;
    }

    if(sum_lte_bw+enb.bw_pool>enb.enb_total_bw+0.1 || sum_lte_bw+enb.bw_pool<enb.enb_total_bw-0.1){
        cout<<"bw error in event "<<event<<" with sum bw "<<(sum_lte_bw+enb.bw_pool)<<endl;
        fp<<"bw error in event "<<event<<" with sum bw "<<(sum_lte_bw+enb.bw_pool)<<endl;
        //fp<<"bw error: "<<sum_lte_bw<<endl;
    } 
}

double allocBwToLackBwDrbwithSatis(double reallocatableBw){
    //剩餘file_size
    //舊time = 剩餘file_size/現有頻寬
    //double 舊money = p_max- satisfaction_a*pow((drb_time_spend),satisfaction_b);

    while(reallocatableBw>0.000001){
        if(enb.indigenous_lackbw_list.empty() && enb.immigrant_lackbw_list.empty()){
            return reallocatableBw;
        }

        if(DEBUG){
            fp<<"-----------------"<<endl
            <<"reallocatable bw"<<reallocatableBw<<endl
            <<"Reallocate bw head"<<endl;
        }

        list<UE*>::iterator drbWithLargestSatisDiff;
        //double drbLargestStatisDiffBeginTime = 0;
        double largestSatisDiff = 0;
        double allocBwLargestSatisDiff = 0;
        bool drb_still_lack_bw = false;

        list<UE*>::iterator itr = enb.indigenous_lackbw_list.begin();
        for(;itr!=enb.indigenous_lackbw_list.end(); itr++){        
            double remain_time_norealloc = (*itr)->remain_file_size/(*itr)->bandwidth; 
            //double offloading_fee = offloading_rate*((*itr)->orig_file_size/8);
            double offloading_fee = 0;
            if ((*itr)->wifi_id==(N_WIFI_AP+1)) // if UE use free WiFi
            {
                /* code */
                offloading_fee = p_max;
            }
            else
            {
                offloading_fee = ww[((*itr)->wifi_id)-1].getOffloading_rate()*(((*itr)->orig_file_size)/8);
            }

            satisfaction_a = offloading_fee/pow(deadline, satisfaction_b);
            //double money = offloading_fee - satisfaction_a*pow((drb_time_spend),satisfaction_b);
            //double satisfac_norealloc = p_max- satisfaction_a*pow((remain_time_norealloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            double satisfac_norealloc = offloading_fee- satisfaction_a*pow((remain_time_norealloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            double lacked_bw = calLackBw(itr);
            if(DEBUG && lacked_bw<0)cout<<"err"<<endl;
            double remain_time_realloc=0; 
            double allocBw = 0;
            if(reallocatableBw>=lacked_bw){
                allocBw = lacked_bw;
                remain_time_realloc = (*itr)->remain_file_size/((*itr)->bandwidth+lacked_bw);               
            }
            else{
                allocBw = reallocatableBw;
                remain_time_realloc = (*itr)->remain_file_size/((*itr)->bandwidth+reallocatableBw);
            }
            //double satisfac_realloc = p_max- satisfaction_a*pow((remain_time_realloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            double satisfac_realloc = offloading_fee- satisfaction_a*pow((remain_time_realloc+(current_time-(*itr)->begin_time)),satisfaction_b);

            if((satisfac_realloc-satisfac_norealloc)>largestSatisDiff){
                largestSatisDiff = satisfac_realloc-satisfac_norealloc;
                allocBwLargestSatisDiff = allocBw;
                drbWithLargestSatisDiff = itr;
                if(reallocatableBw>=lacked_bw)
                    drb_still_lack_bw = false;
                else
                    drb_still_lack_bw = true;
                //drbLargestStatisDiffBeginTime = (*itr)->begin_time;
            }
        }
        
        itr=enb.immigrant_lackbw_list.begin();
        for(; itr!=enb.immigrant_lackbw_list.end(); itr++)
        {
        
            double remain_time_norealloc = (*itr)->remain_file_size/(*itr)->bandwidth;
            //double offloading_fee = offloading_rate*((*itr)->orig_file_size/8);
            double offloading_fee = 0;
            if ((*itr)->wifi_id==(N_WIFI_AP+1)) // if UE use free WiFi
            {
                /* code */
                offloading_fee = p_max;
            }
            else
            {
                offloading_fee = ww[(*itr)->wifi_id-1].getOffloading_rate()*((*itr)->orig_file_size/8);
            }

            satisfaction_a = offloading_fee/pow(deadline, satisfaction_b);
            double satisfac_norealloc = offloading_fee- satisfaction_a*pow((remain_time_norealloc+(current_time-(*itr)->begin_time)),satisfaction_b);
           // double satisfac_norealloc = p_max- satisfaction_a*pow((remain_time_norealloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            double lacked_bw = calLackBw(itr);
            if(DEBUG && lacked_bw<0.0001)cout<<"err"<<endl;
            double remain_time_realloc=0;
            double allocBw = 0;
            if(reallocatableBw>=lacked_bw){
                allocBw = lacked_bw;
                remain_time_realloc = (*itr)->remain_file_size/((*itr)->bandwidth+lacked_bw);
            }
            else{
                allocBw = reallocatableBw;
                remain_time_realloc = (*itr)->remain_file_size/((*itr)->bandwidth+reallocatableBw);
            }
            //double satisfac_realloc = p_max- satisfaction_a*pow((remain_time_realloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            double satisfac_realloc = offloading_fee - satisfaction_a*pow((remain_time_realloc+(current_time-(*itr)->begin_time)),satisfaction_b);
            
            if((satisfac_realloc-satisfac_norealloc)>largestSatisDiff){
                largestSatisDiff = satisfac_realloc-satisfac_norealloc;
                allocBwLargestSatisDiff = allocBw;
                drbWithLargestSatisDiff = itr;
                if(DEBUG){
                    fp<<"realloc bw:"<<reallocatableBw<<endl
                        <<"lack bw: "<<lacked_bw<<endl;
                }
                if(reallocatableBw>=(lacked_bw-0.0001))
                    drb_still_lack_bw = false;
                else
                    drb_still_lack_bw = true;
                //drbLargestStatisDiffBeginTime = (*itr)->begin_time;
            }
        }
        // if(DEBUG){
        //     fp<<"begin T drb with largest satis diff: "<<(*drbWithLargestSatisDiff)->begin_time<<endl
        //     <<"allocBw"<<allocateBwToLackBwDrb<<endl;
        // }

        if(allocBwLargestSatisDiff>0){
            reallocatableBw -= allocBwLargestSatisDiff;
            (*drbWithLargestSatisDiff)->lte_bw += allocBwLargestSatisDiff;
            (*drbWithLargestSatisDiff)->bandwidth += allocBwLargestSatisDiff;
            if(!drb_still_lack_bw){
                (*drbWithLargestSatisDiff)->lackBw = false;
                delDrbFromLackBwList(drbWithLargestSatisDiff);
            }
        }
        //return reallocatableBw;
        if(DEBUG){
            fp<<"Reallocate bw bottom"<<endl
            <<"-----------------"<<endl;
        }
    }
    return reallocatableBw;
}

double allocateBwToLackBwDrb(double reallocatableBw){
    list<UE*>::iterator itr = enb.indigenous_lackbw_list.begin();
    for(;itr!=enb.indigenous_lackbw_list.end(); itr++){
        if(reallocatableBw==0)
            return 0;

        if((*itr)->lackBw){
            double lacked_bw = calLackBw(itr);
            if(DEBUG && lacked_bw<0)cout<<"err"<<endl;
            
            if(DEBUG){
                fp<<endl<<"lacked_bw:"<<lacked_bw<<endl<<endl;
            }
            if(reallocatableBw>=lacked_bw){
                reallocatableBw-=lacked_bw;
                (*itr)->lte_bw += lacked_bw;
                (*itr)->bandwidth += lacked_bw;
                (*itr)->lackBw = false;
                delDrbFromLackBwList(itr);
                //enb.indigenous_lackbw_list.erase(itr);
                --itr;
            }
            else{
                (*itr)->lte_bw += reallocatableBw;
                (*itr)->bandwidth += reallocatableBw;
                reallocatableBw = 0;
            }
        }
    }

    itr=enb.immigrant_lackbw_list.begin();
    for(; itr!=enb.immigrant_lackbw_list.end(); itr++){
        if(reallocatableBw==0)
            return 0;
        
        if((*itr)->lackBw){
            double lacked_bw = calLackBw(itr);
            if(DEBUG && lacked_bw<0)cout<<"err"<<endl;
            if(DEBUG){
                fp<<endl<<"lacked_bw:"<<lacked_bw<<endl<<endl;
            }
            if(reallocatableBw>=lacked_bw){
                reallocatableBw-=lacked_bw;
                (*itr)->lte_bw += lacked_bw;
                (*itr)->bandwidth += lacked_bw;
                (*itr)->lackBw = false;
                delDrbFromLackBwList(itr);
                //enb.immigrant_lackbw_list.erase(itr);
                --itr;
            }
            else{
                (*itr)->lte_bw += reallocatableBw;
                (*itr)->bandwidth += reallocatableBw;
                reallocatableBw = 0;
            }
        }
    }
    return reallocatableBw;
}
    /*  for(itr = indigenous_list.begin(); ...){
                        if (bw == 0) break;
                        if itr->lackbw == true  
                            calculate needbw of itr
                            distribute needbw to itr
                            pool -= needbw;           
                    }
                    for(itr = UElist.begin;...){
                        if (bw == 0) break;
                        if itr->lackbw == true
                            calculate needbw of itr
                            distribute needbw to itr
                            pool -= needbw;      
                    }*/

//Can't be call when enb.num_drb<enb.max_num_drb
double calLackBw(list<UE*>::iterator itDrb)
{  
    //double WiFi_bw_lists[4] = {0,wifi_r1_bw,wifi_r2_bw,wifi_r3_bw};   
    if((*itDrb)->wifi_status > 0)
    {
        if(device_min_distribute_bw<=(*itDrb)->wifi_bw)
        {
            // if(((1-alpha)*device_min_distribute_bw - (*itDrb)->lte_bw)<0){
            //     cout<<"err"<<endl;
            //     fp<<"err"<<endl;
            //     fp<<"lte_bw"<<(*itDrb)->lte_bw<<endl;
            // }
            return (1-alpha)*device_min_distribute_bw - (*itDrb)->lte_bw;
        }
        else{
            return (device_min_distribute_bw-alpha*(*itDrb)->wifi_bw) - (*itDrb)->lte_bw;
        }
    }
    else{
        return device_min_distribute_bw-(*itDrb)->lte_bw;
    }
}

// void recordServiceTime(double service_time){
//     int int_service_time = (int)service_time;
//     int_service_time = int_service_time - int_service_time%10;

//     map<int, int>::iterator itr = map_num_service_time.find(int_service_time);
//     if(itr != map_num_service_time.end()){
//         itr->second++;
//     }
//     else{
//         map_num_service_time.insert(pair<int,int>(int_service_time, 1));
//     }
// }

void recordCollectedServiceT(){
    ofstream fp_service_t;
    // Ee

    fp_service_t.open("sta_service_t.txt", ios::app);
    
    
    fp_service_t<<count_drb_finished<<" ";
    for(int i=0; i<1500000; i++){
        fp_service_t<< arr_service_t[i]<<" ";
    }
    fp_service_t<<endl;
    fp_service_t.close();
}

void addDrbToLackBwList(UE* ptr_drb){
    if(ptr_drb->is_indigenous){
        enb.indigenous_lackbw_list.push_back(ptr_drb);
    }
    else{
        enb.immigrant_lackbw_list.push_back(ptr_drb);
    }
}

void delDrbFromLackBwList(list<UE*>::iterator itr){
    if((*itr)->is_indigenous){
        enb.indigenous_lackbw_list.erase(itr);
    }
    else{
        enb.immigrant_lackbw_list.erase(itr);
    }
}

int getWifiStatus(double p[],int size){

    double randomNum = rnd_start_with_wifi++;
    double r = randomNum;
    int wifistatus = 0;
    double pi = 0;
    //cout << "r=" << r <<endl;
    for(int i=0;i<size;i++)
    {
        //cout << "P["<<i<<"]="<<p[i] <<endl;
        pi +=p[i];
        //cout << "r=" <<r << ", pi="<<pi <<endl;
        if(r<=pi)
        {
            wifistatus = i;
            break;
        }
    }

	return wifistatus;

}

double getTranstitionI2J(double a,double lambdaC, double gamma ,double i)
{
    double lower = 0;
    if(i==0)
    {
        lower=(lambda0);

    }
    else
    {
        lower=(lambdaC+gamma); 
    }
    /*else if(i==1)
    {
        lower=(lambdaC+gamma1); 
    }
    else if(i==2)
    {
        lower=(lambdaC+gamma2); 
    }
    else
    {
        lower=(lambdaC+gamma3);
    }*/
    return a/lower;
    
}

int generatePoissonNumber(int lambda)  // 0,1,2,3,4,...
{
    Uniform uu(0,1);
    double p=0;
    int X=-1;
    double F=0;
    double U = uu++;
    int i =0;
    p = exp(-1*lambda);
    F =p;
    //cout << "p:" <<p <<endl;
    //cout << typeid(p).name() << endl;
    //cout << typeid(F).name() << endl;
    
    bool exitloop = false;
    do
    {
        //cout << "U=" <<U << ", F="<<F <<endl; 
        if(U<F)
        {
            X=i;
            exitloop = true;
        }
        else
        {
            p=(lambda*p)/(i+1);
            F = F+p;
            i++;
        }
        
    }while(!exitloop);
    return X;
}

// void dealCollectedServiceT(){
//     for(int i=0; i<count_drb_finished; i++){
//         arr_service_t[i] /= STA_SERVICE_T_INTERVAL;
//     }
//     int* itr_max_service_t = max_element(arr_service_t, arr_service_t+count_drb_finished);
//     const int max_service_t = *itr_max_service_t;
    
//     int arr_sta_service_t[max_service_t] = {0};
//     for(int i=0; i<count_drb_finished; i++){
//         arr_sta_service_t[arr_service_t[i]-1]++;
//     }
    
//     ofstream fp_service_t;
//     fp_service_t.open("sta_service_t.txt", ios::app);
//     for(int i=0; i<max_service_t; i++){
//         fp_service_t<< arr_sta_service_t[i]<<" ";
//     }
//     fp_service_t<<endl;

//     fp_service_t.close();
// }

/*
蒐集完所有service time(共100000筆)

int 區間 = 10;
arr_service_t(100000筆)
for each service time 除以10

取arr_service_t的max

創造一個1~max大小的陣列arr_sta_service_t全為0

for each service_t in arr_service_t
arr_sta_service_t[service_t]++

*/

/* new algo
Case arrival:
    if(new_drb.wifis_tatus==false || lte_bw<min_distributed_bw)
        newUE.lackBw = true;

Case departure:
    after departure 

    for(itr = indigenous_list.begin(); ...){
        if (bw == 0) break;
        if itr->lackbw == true
            calculate needbw of itr
            distribute needbw to itr
            pool -= needbw;           
    }
    for(itr = UElist.begin;...){
        if (bw == 0) break;
        if itr->lackbw == true
            calculate needbw of itr
            distribute needbw to itr
            pool -= needbw;      
    }

Case update:
    if(status turn true){
        if drbupdate.lte_bw >= min_distributed_bw
            將bw分給pool
        else if(drbupdate.lte_bw>= (1-alpha)*min_distributed_bw){
            drbupdate.lackbw = false;
        }
    }
    else{
        if(drbupdate.lte_bw < min_distributed_bw){
            看pool有沒有bw可以分給她
            計算需要多少bw，
            若pool足夠
                就分給他。
            若不夠
                drbupdate.lackbw = true;
        }
    }
    
*/