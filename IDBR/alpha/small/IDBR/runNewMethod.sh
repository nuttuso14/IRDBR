## sed -i 's/\r//' runNewMethod.sh  ##Run this command when the error "unexpecting 'do' " occur   
cat /dev/null > result.txt  
arrRate=0.1  
mean_service_t=1500  
max_drb_served_enb=10  
wifi_bw=60  
wifi_mean_time_connected=1679  
wifi_mean_time_disconnected=439  
deadline=120
Ps=0.9  
idbr=1 
alpha=0.5  
# interArrivalT=1  
# b=1.2  
mean_file_size=250  
# j=1  
for b in 1.2  
do  
    #for algo in 0 1 4 2 3 
    for algo in 4  
    #for algo in 0 1 4 2 3  
    do  
            # for interArrivalT in $(seq 1 5)  
            #for arrRate in 0.01 0.05 0.1 0.2 0.3 0.4 0.5 1 3 5 10 50    
            #for arrRate in 0.01 0.02 0.03 0.04 0.05 0.1 0.5 1 5 10  
            # for j in 0.01 0.05 0.1 0.5 1 5 10 25 50 75 100 250 500 750 1000  
            # for j in 25 50 75 100 250 500 750 1000  
            # for mean_file_size in 50 100 250 500 750 1000 2500 5000  
            # for wifi_bw in 20 40 60 80 100  
            #for b in 0.2 0.6 1.0 1.4 1.8   
             for alpha in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9  
            # for alpha in 0.8 0.85 0.9 0.95 0.99 0.999 1   
            #for wifi_mean_time_connected in 400 800 1200 1600 2000  
            #for wifi_mean_time_connected in 100 250 500 750 1000 2500 5000 7500 10000  
			#for wifi_mean_time_disconnected in 420 840 1260 1679 3360 6716 8400 
            do  
                # for i in $(seq 1 10)  
                # do  
                    # j=`expr $interArrivalT \* 10`  
                    echo "./main $arrRate $mean_service_t $max_drb_served_enb $wifi_mean_time_connected $wifi_mean_time_disconnected $deadline $algo $alpha $Ps $b $mean_file_size $idbr"  
                    ./main $arrRate $mean_service_t $max_drb_served_enb $wifi_mean_time_connected $wifi_mean_time_disconnected $deadline $algo $alpha $Ps $b $mean_file_size $idbr  
                    echo ""  
                    time sleep 0.6  
                # done  
                # echo  >> result.txt  
            done  
            echo >> result.txt  
    done  
    echo "------------">> result.txt  
done  
  
