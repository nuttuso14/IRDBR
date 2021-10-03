#ifndef _ENB_H
#define _ENB_H

#include<list>
#include<stdlib.h>
#include<iomanip>
#include "UE.h"
#include "mydef.h"
using namespace std;


class eNB{
public:
    int id;
    double current_time;
    double mean_time_arrival;
    int max_num_drb;
    int num_drb;
    double enb_total_bw;
    double min_guaranteed_bw;
    double bw_pool;

    int count_total_drb_arrival;
    list<UE*> drb_list;
    list<UE*> indigenous_lackbw_list;
    list<UE*> immigrant_lackbw_list;

    int* count_enb_fall_drb_from_specific_ap;
    int count_fall_drb;

    void init(int enb_id, double init_time, double mean_time_arrival, double enb_total_bw, double min_guaranteed_bw, int ap_num){
        this->id = enb_id;
        current_time = init_time; 
        this->mean_time_arrival = mean_time_arrival;
        this->enb_total_bw = enb_total_bw;
        this->min_guaranteed_bw = min_guaranteed_bw;
        bw_pool = 0;
        num_drb = 0;
        max_num_drb = enb_total_bw/min_guaranteed_bw; //若不整除, 則無條件捨去, 所以不加轉型
        
        count_total_drb_arrival = 0;
        count_enb_fall_drb_from_specific_ap = new int[ap_num]();
        count_fall_drb = 0;
    }

    bool isFull(){
        return (num_drb < max_num_drb) ? false : true;
    }

    void addDRB(UE** ptr_newDrb){
        drb_list.push_back(*ptr_newDrb);
    }

    void updateDrbTransfer(ostream& fp){ //new method
        if(num_drb>0){
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                (*itr)->current_time = current_time;
                (*itr)->updateFileTransfer(fp);
            }
        }
    }

    void updateDrbTransfer(){ //new method
        if(num_drb>0){
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                (*itr)->current_time = current_time;
                (*itr)->updateFileTransfer();
            }
        }
    }

    void ReDistributeDrbBw(){
        if(num_drb>0){
            double newDistributeBw = enb_total_bw / num_drb;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                (*itr)->lte_bw = newDistributeBw;
                (*itr)->bandwidth = newDistributeBw + (*itr)->wifi_bw;
            }
        }
    }

    void updateDrbDepartureTime(){
        if(num_drb>0){
            //cout << "======================numdrb :" << num_drb <<endl;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                (*itr)->updateDepartureTime();
               // cout << "(*itr)->departure_time:"<<(*itr)->departure_time<<endl;
            }
        }        
    }

    list<UE*>::iterator findnearestDepartureDRB(){
        list<UE*>::iterator itr = drb_list.begin();
        list<UE*>::iterator nearestDRB = drb_list.begin();
        for(; itr!=drb_list.end(); itr++){
            if((*itr)->departure_time < (*nearestDRB)->departure_time){
                nearestDRB = itr;
            }
        }
        return nearestDRB;
    }

    list<UE*>::iterator findFinishedDRB(double departureTime){
        list<UE*>::iterator itr = drb_list.begin();
        for(; itr!=drb_list.end(); itr++){
            if((*itr)->departure_time == departureTime){
                return itr;
            }
        }
    }

    // void deleteDRBinLackBwList(double departureTime, bool isIndigenous){
    void deleteDRBinLackBwList(UE* DRBdeleted){
        if(DRBdeleted->is_indigenous){   
            list<UE*>::iterator itr = indigenous_lackbw_list.begin();
            for(; itr!=indigenous_lackbw_list.end(); itr++){
                // if((*itr)->departure_time == departureTime){
                //     indigenous_lackbw_list.erase(itr);
                //     break;
                // }
                if(*itr == DRBdeleted){
                    indigenous_lackbw_list.erase(itr);
                    break;
                }
            }
        }
        else{
            list<UE*>::iterator itr = immigrant_lackbw_list.begin();
            for(; itr!=immigrant_lackbw_list.end(); itr++){
                // if((*itr)->departure_time == departureTime){
                //     immigrant_lackbw_list.erase(itr);
                //     break;
                // }
                if(*itr == DRBdeleted){
                    indigenous_lackbw_list.erase(itr);
                    break;
                }
            }
        }
    }
        
    

    list<UE*>::iterator findDrbOverDeadline(double deadline){
        list<UE*>::iterator itr = drb_list.begin();
        for(; itr!=drb_list.end(); itr++){
            if((*itr)->deadline == deadline){
                return itr;
            }
        }
    }

    list<UE*>::iterator findDrbWifiUpadate(double updateTime){
        list<UE*>::iterator itr = drb_list.begin();
        for(; itr!=drb_list.end(); itr++){
            if((*itr)->next_wifi_update_time == updateTime){
                return itr;
            }
        }
    }

    EData findNearestEventOfDrb(bool featureWifi, bool featureDeadline){
        if(num_drb>0){
            list<UE*>::iterator itr = drb_list.begin();
            double nearestEventTime = (*itr)->departure_time;
            int nearestEventType = EVENT_DEPARTURE;
        
            for(; itr!=drb_list.end(); itr++){
                if((*itr)->departure_time < nearestEventTime){
                    nearestEventTime = (*itr)->departure_time;
                    nearestEventType = EVENT_DEPARTURE;
                }
                if((*itr)->deadline < nearestEventTime && (*itr)->flag_deadline_miss==false && featureDeadline == true){
                    nearestEventTime = (*itr)->deadline;
                    nearestEventType = EVENT_DEADLINE;
                }
                if((*itr)->next_wifi_update_time < nearestEventTime && featureWifi == true){
                    nearestEventTime = (*itr)->next_wifi_update_time;
                    nearestEventType = EVENT_WIFI_UPDATE;
                }
            }
            EData nearestEvent;
            nearestEvent.eventTime = nearestEventTime;
            nearestEvent.eventType = nearestEventType;
            return nearestEvent;
        }

        EData nullEvent;
        nullEvent.eventTime = -1;
        nullEvent.eventType = -1;
        return nullEvent;
    }

    void DBRreallocate(double alpha){
        if(drb_list.size()>1){
            double total_shared_bw = 0;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                //if((*itr)->wifi_status == true){
                if((*itr)->wifi_status>0){
                    double shared_bw = ((*itr)->lte_bw < (*itr)->wifi_bw)? alpha*(*itr)->lte_bw : alpha*(*itr)->wifi_bw;
                    total_shared_bw += shared_bw;
                    (*itr)->lte_bw -= shared_bw;
                    (*itr)->bandwidth -= shared_bw;
                }
            }

            double avg_shared_bw = total_shared_bw / num_drb;
            for(itr=drb_list.begin(); itr!=drb_list.end(); itr++){
                (*itr)->lte_bw += avg_shared_bw;
                (*itr)->bandwidth += avg_shared_bw;
            }
        }
    }

    void IDBR_reallocate(double alpha)
    {
        if(drb_list.size()>1)
        {
            //cout << "====== In fuction IDBR_reallocate(double alpha)" <<endl;
            double total_shared_bw = 0;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++)
            {
                //if((*itr)->wifi_status == true){
                if((*itr)->wifi_status>0)
                {

                    double new_alpha = (1-(*itr)->discount_reallocate)*alpha;
                    double shared_bw = ((*itr)->lte_bw < (*itr)->wifi_bw)? new_alpha*(*itr)->lte_bw : new_alpha*(*itr)->wifi_bw;
                    total_shared_bw += shared_bw;
                    (*itr)->lte_bw -= shared_bw;
                    (*itr)->bandwidth -= shared_bw;
                }
            }

            double avg_shared_bw = total_shared_bw / num_drb;
            for(itr=drb_list.begin(); itr!=drb_list.end(); itr++)
            {
                (*itr)->lte_bw += avg_shared_bw;
                (*itr)->bandwidth += avg_shared_bw;
            }
        }
    }

   /* void DBRCreallocate(double alpha){
        if(drb_list.size()>1){
            double total_shared_bw = 0;
            list<DRB>::iterator itr = drb_list.begin();
            
            for(; itr!=drb_list.end(); itr++){
                if(itr->wifi_status == true){
                    double shared_bw = (itr->lte_bw < itr->wifi_bw)? alpha*itr->lte_bw : alpha*itr->wifi_bw;
                    total_shared_bw += shared_bw;
                    itr->lte_bw -= shared_bw;
                    itr->bandwidth -= shared_bw;
                }
            }
        
            if(num_drb < max_num_drb){
                double avg_shared_bw = total_shared_bw / num_drb;
                for(itr=drb_list.begin(); itr!=drb_list.end(); itr++){
                    itr->lte_bw += avg_shared_bw;
                    itr->bandwidth += avg_shared_bw;
                }
            }
            else if(num_drb == max_num_drb){
                
            }
        }
    }*/

    void QosAwarnessRelocateBw(double wifi_mean_time_connected, double Ps, int algo){
       // cout << "In QoS_fn ==========" <<endl;
       // cout << "wifi_mean_time_connected="<< wifi_mean_time_connected <<endl;

        int numDRBnotMissDeadline = 0;
        {
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                if((*itr)->flag_deadline_miss == false)
                    numDRBnotMissDeadline++;
            }
        }
        
        if(numDRBnotMissDeadline > 1){
            double total_shared_bw = 0;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++)
            {
                if((*itr)->flag_deadline_miss == false)
                {
                    if((*itr)->deadline < (*itr)->current_time)exit(1);
                    double tm = 0;
                    bool Qsatisfied = false;
                    double Vr = (*itr)->remain_file_size;
                    double b1 = (*itr)->lte_bw;
                    double b2 = (*itr)->wifi_bw;
                    double td = (*itr)->deadline - (*itr)->current_time;

                    /*cout << "(*itr)->lte_bw="<< (*itr)->lte_bw <<endl;
                    cout << "(*itr)->wifi_bw="<< (*itr)->wifi_bw <<endl;
                    cout << "(*itr)->deadline="<< (*itr)->deadline <<endl;
                    cout << "(*itr)->current_time="<< (*itr)->current_time <<endl;*/
                    

                    tm = (Vr - b1*td)/b2;
                    if(tm<0) tm = 0;
                    Qsatisfied = exp(-wifi_mean_time_connected*tm);
                    /*cout << "==========================================" <<endl;
                    cout << "Vr:"<< Vr <<endl;
                    cout << "b1:"<< b1 <<endl;
                    cout << "b2:"<< b2 <<endl;
                    cout << "td:"<< td <<endl;
                    cout << "tm:"<< tm <<endl;
                    cout << "wifi_mean_time_connected:"<< wifi_mean_time_connected <<endl;
                    cout << "-wifi_mean_time_connected*tm:"<< -wifi_mean_time_connected*tm <<endl;
                    cout << "exp(-wifi_mean_time_connected*tm):"<< exp(-wifi_mean_time_connected*tm) <<endl;
                    cout << "Qsatisfied:"<< Qsatisfied <<endl;
                    cout << "==========================================" <<endl;*/

                    double b1_star = (Vr + 1/wifi_mean_time_connected * tm * b2 * log(Ps)) / td;
                   /* if(isnan(b1_star))
                    {
                        cout << "(Is_nan) td:"<< td <<endl;
                    }*/
                    if(b1_star<0) b1_star=0;
                    (*itr)->b1_star = b1_star;
                    
                    if(tm<=td && Qsatisfied>=Ps){
                        (*itr)->QosSatisfied = true;
                        (*itr)->lte_bw = b1_star;
                        (*itr)->bandwidth = (*itr)->lte_bw + (*itr)->wifi_bw;
                        total_shared_bw += (b1-b1_star);
                    }
                    else{
                        (*itr)->QosSatisfied = false;
                    }
                    //cout << "b1_star:"<< b1_star <<endl;
                   // cout << "total_shared_bw:"<< total_shared_bw <<endl;                
                }
            }
            //cout << "What is algo :" << algo <<endl;
            if(algo = QEDF)
            {
               // cout << "before function :" << total_shared_bw <<endl;
                QEDFdistributeBW(total_shared_bw);
               // cout << "Finish function :" << total_shared_bw <<endl;
            }    
            else if(algo = QSSF)
            {
                QSSFdistributeBW(total_shared_bw);
            }

        }
    }

    void QEDFdistributeBW(double totalSharedBw)
    {
        //cout << "in QEDF loop =====" <<endl;
        //cout << "totalSharedBw:"<<totalSharedBw<<endl;
        while(totalSharedBw > 0)
        {
            list<UE*>::iterator drbWithShortestTd;
            double shortestTd = 0;

            list<UE*>::iterator itr = drb_list.begin();
            bool hasQosUnsatisfied = false;
            
            for(; itr!=drb_list.end(); itr++){
                if((*itr)->QosSatisfied == false && (*itr)->flag_deadline_miss==false){
                    hasQosUnsatisfied = true;
                    drbWithShortestTd = itr;
                    shortestTd = (*itr)->deadline - (*itr)->current_time;
                    break;
                }
            }

            if(hasQosUnsatisfied == false)
                break;
                
            for(itr=drbWithShortestTd; itr!=drb_list.end(); itr++){
                if((*itr)->QosSatisfied==false && ((*itr)->deadline - (*itr)->current_time < shortestTd) && (*itr)->flag_deadline_miss==false){
                    drbWithShortestTd = itr;
                    shortestTd = (*itr)->deadline - (*itr)->current_time;
                }
            }

            double br = (*drbWithShortestTd)->b1_star - (*drbWithShortestTd)->lte_bw;
            if(totalSharedBw >= br){
                double newLTEBw = br + (*drbWithShortestTd)->lte_bw;
                (*drbWithShortestTd)->lte_bw = newLTEBw;
                (*drbWithShortestTd)->bandwidth = (*drbWithShortestTd)->lte_bw + (*drbWithShortestTd)->wifi_bw;
                (*drbWithShortestTd)->QosSatisfied = true;
                totalSharedBw -= br;
            }
            else{
                double newLTEBw = (*drbWithShortestTd)->lte_bw + totalSharedBw;
                (*drbWithShortestTd)->lte_bw = newLTEBw;
                (*drbWithShortestTd)->bandwidth = (*drbWithShortestTd)->lte_bw + (*drbWithShortestTd)->wifi_bw;
                totalSharedBw = 0;
            }
        }
        if(totalSharedBw >= 1)
        {
            double num_drb_not_miss_deadline = 0;
            {
                list<UE*>::iterator itr = drb_list.begin();
                for(; itr!=drb_list.end(); itr++){
                    if((*itr)->flag_deadline_miss == false)
                        num_drb_not_miss_deadline++;
                }
            }
            
            double distributedBw = totalSharedBw/num_drb_not_miss_deadline;
            if(num_drb_not_miss_deadline>0)
            {
                list<UE*>::iterator itr = drb_list.begin();
                for(; itr!=drb_list.end(); itr++){
                    if((*itr)->flag_deadline_miss==false){
                        (*itr)->lte_bw = (*itr)->lte_bw + distributedBw;
                        (*itr)->bandwidth = (*itr)->lte_bw + (*itr)->wifi_bw;
                    }               
                }
            }

        }
        //cout << "Finally total share is :" <<totalSharedBw<<endl;
    }

    void QSSFdistributeBW(double totalSharedBw){

        while(totalSharedBw > 0){
            list<UE*>::iterator drbWithMinVr;
            double MinVr = 0;
            list<UE*>::iterator itr = drb_list.begin();
            bool hasQosUnsatisfied = false;

            for(; itr!=drb_list.end(); itr++){
                if((*itr)->QosSatisfied == false && (*itr)->flag_deadline_miss==false){
                    hasQosUnsatisfied = true;
                    drbWithMinVr = itr;
                    MinVr = (*itr)->remain_file_size;
                    break;
                }
            }

            if(hasQosUnsatisfied == false) 
                break;

            for(itr=drbWithMinVr; itr!=drb_list.end(); itr++){
                if((*itr)->QosSatisfied==false && (*itr)->remain_file_size<MinVr && (*itr)->flag_deadline_miss==false){
                    drbWithMinVr = itr;
                    MinVr = (*itr)->remain_file_size;
                }
            }

            double br = (*drbWithMinVr)->b1_star - (*drbWithMinVr)->lte_bw;
            if(totalSharedBw>br){
                double newLTEBw = br + (*drbWithMinVr)->lte_bw;
                (*drbWithMinVr)->lte_bw = newLTEBw;
                (*drbWithMinVr)->bandwidth = (*drbWithMinVr)->lte_bw + (*drbWithMinVr)->wifi_bw;
                (*drbWithMinVr)->QosSatisfied = true;
                totalSharedBw -= br;
            }
            else{
                double newLTEBw = (*drbWithMinVr)->lte_bw + totalSharedBw;
                (*drbWithMinVr)->lte_bw = newLTEBw;
                (*drbWithMinVr)->bandwidth = (*drbWithMinVr)->lte_bw + (*drbWithMinVr)->wifi_bw;
                totalSharedBw = 0;
            }
        }
        if(totalSharedBw >= 1){
            double num_drb_not_miss_deadline = 0;
            {
                list<UE*>::iterator itr = drb_list.begin();
                for(; itr!=drb_list.end(); itr++){
                    if((*itr)->flag_deadline_miss == false)
                        num_drb_not_miss_deadline++;
                }
            }   

            double distributedBw = totalSharedBw/num_drb_not_miss_deadline;
            list<UE*>::iterator itr = drb_list.begin();
            for(; itr!=drb_list.end(); itr++){
                if((*itr)->flag_deadline_miss==false){
                    (*itr)->lte_bw = (*itr)->lte_bw + distributedBw;
                    (*itr)->bandwidth = (*itr)->lte_bw + (*itr)->wifi_bw;
                }               
            }
        }
        
    }

    

    void printENB(){
        cout<<"current time: "<<current_time<<endl
            //<<"max num drb: "<<max_num_drb<<"\n"
            <<"num drb:"<<num_drb<<"\n"
            <<"bw_pool: "<<bw_pool<<endl
            <<"fall drb: "<<count_fall_drb<<endl
            //<<"num fall drb: "<<count_enb_fall_drb_from_specific_ap[0]<<"\n"
            
            <<"-----drb list-----"<<endl;

        list<UE*>::iterator itr = drb_list.begin();
        for(; itr!=drb_list.end(); itr++){
            //cout<<"departure time: "<< itr->departure_time <<endl;
            (*itr)->printDRB();
        }
        cout<<"----------------------------------------"<<endl;
    }

    void printENB(ofstream& fp){
        double sum_lte_bw = 0;
        for(list<UE*>::iterator itr = drb_list.begin(); itr!=drb_list.end(); itr++){
            sum_lte_bw += (*itr)->lte_bw;
        }

        fp<<setprecision(6)
            <<"current time: "<<current_time<<endl
            // <<"max num drb: "<<max_num_drb<<"\n"
            <<"num drb:"<<num_drb<<"\n"
            <<"bw_pool: "<<bw_pool<<endl
            // <<"fall drb: "<<count_fall_drb<<endl
            <<"total lte bw:"<<sum_lte_bw<<endl<<endl;
            fp <<"begin time, "<<"VIP_member,"<<"UE_MONEY,"<<"UE_origial_file_size,"<<"remain file size, "<<"total bw, "<<"WiFi id, "<<"Discount_alpha"<<"WiFi status, "<<"wifi_bw, "<<"lte_bw, "<<endl;
            for(list<UE*>::iterator it=drb_list.begin(); it!=drb_list.end(); it++){
                fp<<(*it)->begin_time<<", "<<(*it)->vip_ue<<", "<<(*it)->budget<<", "<<((*it)->orig_file_size/8)<<", "<<(*it)->remain_file_size<<", "<<(*it)->bandwidth
                <<", "<<(*it)->wifi_id<<", "<<(*it)->discount_reallocate<<", "<<(*it)->wifi_status<<","<<(*it)->wifi_bw<<", "<<(*it)->lte_bw<<endl;
            }
            //<<"num fall drb: "<<count_enb_fall_drb_from_specific_ap[0]<<"\n"
            fp<<endl
            <<"--------lackbw list----------->"<<endl;
            fp<<"indi: ";
            for(list<UE*>::iterator it=indigenous_lackbw_list.begin(); it!=indigenous_lackbw_list.end(); it++){
                fp<<(*it)->begin_time<<", "<<(*it)->remain_file_size<<", "<<(*it)->bandwidth<<", "
                <<(*it)->wifi_bw<<", "<<(*it)->lte_bw<<endl;
            }
            fp<<endl<<"immi: ";
            for(list<UE*>::iterator it=immigrant_lackbw_list.begin(); it!=immigrant_lackbw_list.end(); it++){
                fp<<(*it)->begin_time<<", "<<(*it)->remain_file_size<<", "<<(*it)->bandwidth<<", "
                <<(*it)->wifi_bw<<", "<<(*it)->lte_bw<<endl;
            }
            fp<<endl;
            //<<"-----drb list-----"<<endl;

        // list<DRB*>::iterator itr = drb_list.begin();
        // for(; itr!=drb_list.end(); itr++){
        //     //cout<<"departure time: "<< itr->departure_time <<endl;
        //     (*itr)->printDRB(fp);
        // }
        fp<<"----------------------------------------"<<endl;
    }

};

#endif