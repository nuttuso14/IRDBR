#ifndef _UE_H
#define _UE_H

#include<iostream>
#include<cfloat>
using namespace std;

class UE{
public:
    
    int wifi_id;
    int wifi_status;
    bool vip_ue;
    double budget;
    double discount_reallocate;

    double next_wifi_update_time;
    double this_wifi_update_time;

    double total_connect_time;
    double total_disconnect_time;
    
    double deadline;
    bool flag_deadline_miss;

    long double begin_time;
    double departure_time;
    double prev_time;
    long double current_time;
    double total_transfer_data_size;
    double bandwidth;
    double lte_bw;
    double wifi_bw;

    double orig_file_size;
    double remain_file_size; //new method usage
    double weight_bw_time;
    double weight_wifi_bw_time;
    double weight_lte_bw_time;
    double satis_increase;

    //for returning nearest Event
    double drb_next_event_time;
    int drb_next_event_type;

    //for Qosreallocate
    double b1_star;
    bool QosSatisfied;

    //for Pd statistic
    bool is_indigenous;
    bool have_disconnection_from_wifi;

    //for DBR-C Advanced
    bool lackBw;

    void init(int wifi_status, double next_update_time, double departure_time)
    {
        this->wifi_status = wifi_status;
        this->next_wifi_update_time = next_update_time;
        this_wifi_update_time = 0;
        total_connect_time = 0;
        total_disconnect_time = 0;
        deadline = DBL_MAX;
        flag_deadline_miss = false;
        this->departure_time = departure_time;
        prev_time = 0;
        current_time = 0;
        begin_time = 0;
        total_transfer_data_size = 0;
        bandwidth = 0;
        lte_bw = 0;
        wifi_bw = 0;

        orig_file_size = 0;
        remain_file_size = 0;
        weight_bw_time = 0;
        weight_wifi_bw_time = 0;
        weight_lte_bw_time = 0;

        is_indigenous = true;
        have_disconnection_from_wifi = false;

        lackBw = false;
    }

    void settleBW(){
        total_transfer_data_size = total_transfer_data_size + (current_time - prev_time)*bandwidth;
        prev_time = current_time;
    }
    double calMeanBw(){
        return total_transfer_data_size/(current_time-begin_time);
    }

    double calMeanBwByFileSize(){
        return orig_file_size / (current_time-begin_time);
    }

    double calMeanWifiBw(){
        return weight_wifi_bw_time/(current_time-begin_time);
    }

    double calMeanLteBw(){
        return weight_lte_bw_time/(current_time-begin_time);
    }

    void updateFileTransfer(ostream& fp){
        remain_file_size = remain_file_size - (current_time - prev_time)*bandwidth;
        if(remain_file_size<0){
            fp<<"Reamain file size error"<<endl
              <<"begin time: "<<begin_time<<endl
              <<"remain file size: "<<remain_file_size<<endl
              <<"current time: "<<current_time<<endl
              <<"prev time: "<<prev_time<<endl
              <<"bw: "<<bandwidth<<endl<<endl;
        }
        weight_bw_time += (current_time - prev_time)*bandwidth;
        weight_wifi_bw_time += (current_time - prev_time)*wifi_bw;
        weight_lte_bw_time += (current_time - prev_time)*lte_bw;
        prev_time = current_time;
    }

    void updateFileTransfer(){
        remain_file_size = remain_file_size - (current_time - prev_time)*bandwidth;
        weight_bw_time += (current_time - prev_time)*bandwidth;
        weight_wifi_bw_time += (current_time - prev_time)*wifi_bw;
        weight_lte_bw_time += (current_time - prev_time)*lte_bw;
        prev_time = current_time;
    }

    void updateDepartureTime(){
        departure_time = current_time + remain_file_size / bandwidth;
    }


    
    void printDRB(){
        cout<<"current time: "<<current_time<<endl
            <<"departure time: "<<departure_time<<endl
            <<"begin time: "<<begin_time<<endl
            <<"wifi status: "<<wifi_status<<endl
            <<"bandwidth: "<<bandwidth<<endl
            <<"lte bw: "<<lte_bw<<endl
            <<"wifi bw: "<<wifi_bw<<endl
            <<"orig file size: "<<orig_file_size<<endl
            <<"remain file size: "<<remain_file_size<<endl
            <<"weight bw time: "<<weight_bw_time<<endl<<endl;
    }

    void printDRB(ostream& fp){
        fp<<"current time: "<<current_time<<endl
            <<"departure time: "<<departure_time<<endl
            <<"begin time: "<<begin_time<<endl
            //<<"deadline: "<<deadline<<endl
            <<"wifi status: "<<wifi_status<<endl
            //<<"bandwidth: "<<bandwidth<<endl
            <<"lte bw: "<<lte_bw<<endl
            //<<"wifi bw: "<<wifi_bw<<endl
            //<<"orig file size: "<<orig_file_size<<endl
            //<<"remain file size: "<<remain_file_size<<endl<<endl;
            //<<"Qsatisfied: "<<QosSatisfied<<endl
            //<<"b1_star: "<<b1_star<<endl<<endl;
            //<<"weight bw time: "<<weight_bw_time<<endl<<endl;
            <<"indigenous: "<<is_indigenous<<endl
            <<"lack_bw: "<<lackBw<<endl;
    }

};

#endif