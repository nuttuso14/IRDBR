#include <iostream>
#include <cstdio>
#include <time.h> 
#include <math.h>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip> // setprecision
#include <vector>
#include <random>
#include <iterator> 
#include <map> 

using namespace std;

default_random_engine eng{static_cast<long unsigned int>(time(0))};
uniform_real_distribution<double> distribution(0.0,1.0);

class MarkovProcess{

    double ets,et0,etw,et1,et2;
    double mu,lambda0,lambdaC,gamma1,gamma2;
    double P0, Pc, P1, P2; 
    double q1, q2;
    double P01, P02, P0T, P10, P12, P1T, P20, P21, P2T, PTT;

    double a21, a01, a12, a02;
    double f[3],st[3],n0[3];

    private:
    double getPcellular(double t0,double tw)
    {
        return t0/(t0+tw);
    }
    double getTranstitionI2J(double a,double i)
    {
        double lower = 0;
        if(i==0)
        {
            lower=(lambda0+mu);
    
        }
        else if(i==1)
        {
            lower=(lambdaC+gamma1+mu); 
        }
        else
        {
            lower=(lambdaC+gamma2+mu);
        }
        return a/lower;
        
    }
	public:
    MarkovProcess ();
	MarkovProcess (double,double,double,double,double);
    double getDeadlineTime(){
    	return ets;
	}
	double getCellularTime(){
    	return et0;
	}
    double getWiFiTime(){
    	return et0;
	}
    double getWiFiRate1Time(){
    	return et1;
	}
    double getWiFiRate2Time(){
    	return et2;
	}
    double getMu(){
        return mu;
    }
    double getLambda0(){
        return lambda0;
    }
    double getLambdaC(){
        return lambdaC;
    }
    double getGamma1(){
        return gamma1;
    }
    double getGamma2(){
        return gamma2;
    }
    double getP0(){
        return P0;
    }
    double getPc(){
        return Pc;
    }
    double getP1()
    {
        return P1;
    }
    double getP2()
    {
        return P2;
    }
    double getQ1()
    {
        return q1;
    }
    double getQ2()
    {
        return q2;
    }
    double getP01()
    {
        return P01;
    }
    double getP02()
    {
         return P02;
    }
     double getP0T()
    {
         return P0T;
    }
    double getP10()
    {
        return P10;
    }
    double getP12()
    {
         return P12;
    }
     double getP1T()
    {
         return P1T;
    }
    double getP20()
    {
        return P20;
    }
    double getP21()
    {
         return P21;
    }
    double getP2T()
    {
         return P2T;
    }
    double getPTT()
    {
         return PTT;
    }
    double getDistribution(int j, int n)
    {
        double dis = -1;
        if(n==0)
        {
            dis = n0[j];
        }
        else
        {
            dis = st[j]*pow(f[j],n-1)*(1-f[j]);
        }
        return dis;
    }

};

MarkovProcess::MarkovProcess () {
	//time_t t;
	//srand((unsigned) time(&t)+rand());
}

MarkovProcess::MarkovProcess (double a, double b,double c,double d,double e) {

    ets = a;
    et0 = b; 
    etw = c;
    et1 = d;
    et2 = e;

    mu = 1/ets;
    lambda0 = 1/et0;
    lambdaC = 1/etw;
    gamma1 = 1/et1;
    gamma2 = 1/et2;

    P0 = getPcellular(et0,etw);
    Pc = (1-P0);
    //q1 = ((1/gamma1))/(((1/gamma1))+((1/gamma2)));
    q1 = (et1/(et1+et2));
    q2 = (1-q1);
    P1 = q1*(1-P0);
    P2 = q2*(1-P0);
    P01 = getTranstitionI2J((q1*lambda0),0);
    P02 = getTranstitionI2J((q2*lambda0),0);
    P0T = getTranstitionI2J(mu,0);
    P10 = getTranstitionI2J(lambdaC,1);
    P12 = getTranstitionI2J(gamma1,1);
    P1T = getTranstitionI2J(mu,1);
    P20 = getTranstitionI2J(lambdaC,2);
    P21 = getTranstitionI2J(gamma2,2);
    P2T = getTranstitionI2J(mu,2);
    PTT = 1;

    a21 = ((P01*P20)+P21)/(1-(P02*P20));
    a01 = P01 + (P02)*a21;
    a12 = ((P02*P10)+P12)/(1-(P10*P01));
    a02 = P02 + (P01)*a12;

    f[0] = -1;
    f[1] = P10*(a01)+ P12*a21;
    f[2] = P20*(a02)+ P21*a12;

    st[0] = -1;
    st[1] = (P0*a01)+P1+(P2*a21);
    st[2] = (P0*a02)+(P1*a12)+P2;

    n0[0] = -1;
    n0[1] = P0*(1-a01) + P2*(1-a21);
    n0[2] = P0*(1-a02) + P1*(1-a12);
    //n0[1] = 1-st[1];
    //n0[2] = 1-st[2] ;
    cout << "New one" <<endl;
    cout << "n_1(0)="<< n0[1] <<endl;
    cout << "n_2(0)="<< n0[2] <<endl;
    cout << "1-st[1]="<< 1-st[1]<<endl;
    cout << "1-st[2]="<< 1-st[2] <<endl;
}



int getWifiStatus(double p[],int size){

    double randomNum = distribution(eng);
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

int main(int argc, char *argv[]) 
{
    int Nsim = 1000000;
    double ets = 400;
    double et0 = 100;
    double etw = 300;
    double et1 = 60;
    double et2 = 240;

    map<int, double> countP; 
    map<int, double> countP2; 
    double countT1 = 0;
    double countT2 = 0;
    MarkovProcess mv (ets,et0,etw,et1,et2);

    // ******** Simulation ********
    double plist[3] = {0};
    //cout << "P0=" << plist[0] <<endl;
    //cout << "P1=" << plist[1] <<endl;
    //cout << "P2=" << plist[2] <<endl;

    double WiFiStatus = -1,chageStatus=-1;
    int countR1 = 0, countR2=0;
    for(int i=0;i<Nsim;i++)
    {
        plist[0] = mv.getP0();
        plist[1] = mv.getP1();
        plist[2] = mv.getP2();
        WiFiStatus = getWifiStatus(plist,3);
        countR1 = 0;
        countR2 = 0;
        //cout << " S"<<WiFiStatus;
        //cout << "WiFiStatus : " << WiFiStatus << endl;
        do
        {
            if(WiFiStatus==0)
            {
                plist[0] = mv.getP01();
                plist[1] = mv.getP02();
                plist[2] = mv.getP0T();
                /*
                cout << "P01=" << plist[0] <<endl;
                cout << "P02=" << plist[1] <<endl;
                cout << "P0T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,3); 
                
                WiFiStatus = chageStatus+1; // 0 to 1 , 0 to 2 , o t0 3(T)  
                //cout << " S"<<WiFiStatus;
            }
            else if(WiFiStatus==1)
            {
                countR1++;
                plist[0] = mv.getP10(); 
                plist[1] = mv.getP12();
                plist[2] = mv.getP1T();
                /*
                cout << "P10=" << plist[0] <<endl;
                cout << "P12=" << plist[1] <<endl;
                cout << "P1T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,3); 
                WiFiStatus = (chageStatus!=0)?chageStatus+1:0;
                //cout << " S"<<WiFiStatus;
            }
            else if(WiFiStatus==2)
            {
                countR2++;
                plist[0] = mv.getP20(); 
                plist[1] = mv.getP21();
                plist[2] = mv.getP2T();
                /*
                cout << "P20=" << plist[0] <<endl;
                cout << "P21=" << plist[1] <<endl;
                cout << "P2T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,3); 
                WiFiStatus = (chageStatus==2)?chageStatus+1:chageStatus;
                //cout << " S"<<WiFiStatus;
            }

        }while(WiFiStatus!=3);
        //cout << endl;
        //cout << "State 1 =" << countR1 << endl;
        //cout << "State 2 =" << countR2 << endl;

        if(countP.find(countR1)==countP.end()) // if there is no P[N=n]
        {
            countP.insert(make_pair(countR1,1));
            countT1++;
        }
        else
        {
            int wcount = countP[countR1];
            countP[countR1] = wcount+1;
            countT1++;           
        } 

        if(countP2.find(countR2)==countP2.end()) // if there is no P[N=n]
        {
            countP2.insert(make_pair(countR2,1));
            countT2++;
        }
        else
        {
            int wcount = countP2[countR2];
            countP2[countR2] = wcount+1;
            countT2++;
        } 

    }
    /*
    cout  << "E[Tau2]=" << mv.getWiFiRate2Time() <<endl;
    cout  << "gamma2=" << mv.getGamma2()<<endl;
    cout << "P10=" << mv.getP10()<<endl; 
    cout << "P12=" << mv.getP12()<<endl; 
    cout << "P1T=" << mv.getP1T()<<endl; 
    cout << "Pr[N1=5]=" << mv.getDistribution(1,5) <<endl;
    cout << "Pr[N1=25]=" << mv.getDistribution(1,25) <<endl;
    cout << "Pr[N2=0]=" << mv.getDistribution(2,0) <<endl;
    cout << "Pr[N2=9]=" << mv.getDistribution(2,9) <<endl;*/

    cout << "=============== Report ==============="<<endl;
    cout << "N_simulation = " <<Nsim << endl;
    cout << "E[t0] = "<< et0 << endl;
    cout << "E[tw] = "<< etw << endl;
    cout << "E[t1] = "<< et1 << endl;
    cout << "E[t2] = "<< et2 << endl;
    cout << "E[ts] = "<< ets << endl;
    cout << "Total State 1 :" << countT1 << endl;
    cout << "Total State 2 :" << countT2 << endl;
    //cout << "Total State WiFi :" << countTall << endl;
    //double sump=0 , summp = 0;
    cout << "=============== State 1 ==============="<<endl;
    cout <<setw(5) << "P[N=n]| " <<setw(15)<<" # of Visitting | " << setw(15) <<" Simulation |" << setw(15) << " Math Analyisis |" <<endl;

    ofstream outfile;
    outfile.open("markov_state1.txt",ios_base::app);
    string content;

    for (map<int, double>::iterator it = countP.begin(); it != countP.end(); ++it) 
    {
        int n = it->first;
        string col1 = "P[N1=" + to_string(n) + "]";
        int n1 = it->second;
        //cout << "Pr[N1="<<n <<"]=" << n1 <<endl; 
        double psim = (double)n1/Nsim;
        double mp =mv.getDistribution(1,n);
        cout << fixed;
        cout << setw(5) <<left << col1 << setprecision(6) << setw(15)<< right << n1 << setw(15)<< right  << psim << setw(15) << setprecision(6)<< right << mp <<endl;
        
        content += to_string(Nsim)+ "," + to_string(ets) + "," + to_string(et0)+ "," + to_string(etw) + "," + to_string(et1) + "," + to_string(et2)  + ","+ to_string(n) \
                  + "," +  to_string(n1) + "," +  to_string(psim) + "," +  to_string(mp) + "\n";
        
        //sump += psim;
        //summp +=mv.getDistribution(1,n);
    }
    //cout << "sump ="<<sump <<": summp = " << summp <<endl;
    outfile << content; 
    outfile.close();

    outfile.open("markov_state2.txt",ios_base::app);
    string content2;

    cout << "=============== State 2 ==============="<<endl;
    cout <<setw(5) << "P[N=n]| " <<setw(15)<<" # of Visitting |" << setw(15) <<" Simulation |" << setw(15) << " Math Analyisis |" <<endl;
    for (map<int, double>::iterator it = countP2.begin(); it != countP2.end(); ++it) 
    {
        int n = it->first;
        string col1 = "P[N2=" + to_string(n) + "]";
        int n2 = it->second;
        double psim = (double)n2/Nsim;
        double mp = mv.getDistribution(2,n);
        //cout << "Pr[N2="<<n <<"]=" << n2 <<endl;
        cout << fixed;
        cout << setw(5) <<left << col1 << setprecision(6) << setw(15)<< right << n2 << setw(15)<< right  << psim << setw(15) << setprecision(6)<< right << mp <<endl;
        //sump += psim;
        //summp +=mv.getDistribution(1,n);
        content2 += to_string(Nsim)+ "," + to_string(ets) + "," + to_string(et0)+ "," + to_string(etw) + "," + to_string(et1) + "," + to_string(et2)  + ","+ to_string(n) \
        + "," +  to_string(n2) + "," +  to_string(psim) + "," +  to_string(mp) + "\n";

    }

    outfile << content2; 
    outfile.close();

    //cout << "sump ="<<sump <<": summp = " << summp <<endl;



    return 0;
}