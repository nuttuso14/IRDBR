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

    double ets,et0,etw,et1,et2,et3;
    double mu,lambda0,lambdaC,gamma1,gamma2,gamma3;
    double gamma12, gamma13, gamma21, gamma23, gamma31,gamma32;
    double P0, Pc, P1, P2, P3; 
    double q1, q2, q3;
    double P01, P02, P03, P0T;
    double P10, P12, P13, P1T;
    double P20, P21, P23, P2T;
    double P30, P31, P32, P3T;
    double PTT;

    double detA, detB, detC;
    double a01, a21, a31;
    double a02, a12, a32;
    double a03, a13, a23;
    double f[4],st[4],n0[4];

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
        else if(i==2)
        {
            lower=(lambdaC+gamma2+mu); 
        }
        else
        {
            lower=(lambdaC+gamma3+mu);
        }
        return a/lower;
        
    }
	public:
    MarkovProcess ();
	MarkovProcess (double,double,double,double,double,double);
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
    double getWiFiRate3Time(){
    	return et3;
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
    double getGamma3(){
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
    double getP3()
    {
        return P3;
    }
    double getQ1()
    {
        return q1;
    }
    double getQ2()
    {
        return q2;
    }
    double getQ3()
    {
        return q3;
    }
    double getP01()
    {
        return P01;
    }
    double getP02()
    {
         return P02;
    }
    double getP03()
    {
         return P03;
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
    double getP13()
    {
         return P13;
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
    double getP23()
    {
         return P23;
    }
    double getP2T()
    {
         return P2T;
    }
    double getP30()
    {
        return P30;
    }
    double getP31()
    {
         return P31;
    }
    double getP32()
    {
         return P32;
    }
    double getP3T()
    {
         return P3T;
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
            //dis = n0[j];
            dis = 1-st[j];
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

MarkovProcess::MarkovProcess (double a, double b,double c,double d,double e,double g) {

    ets = a;
    et0 = b; 
    etw = c;
    et1 = d;
    et2 = e;
    et3 = g;

    mu = 1/ets;
    lambda0 = 1/et0;
    lambdaC = 1/etw;
    gamma1 = 1/et1;
    gamma2 = 1/et2;
    gamma3 = 1/et3;

    P0 = getPcellular(et0,etw);
    Pc = (1-P0);
    q1 = (et1/(et1+et2+et3));
    q2 = (et2/(et1+et2+et3));;
    q3 = (1-(q1+q2));
    P1 = q1*Pc;
    P2 = q2*Pc;
    P3 = q3*Pc;

    gamma12 = (1/gamma2)/(((1/gamma2))+ (1/gamma3));
    gamma13 = 1-gamma12;

    gamma21 = (1/gamma1)/(((1/gamma1))+ (1/gamma3));
    gamma23 = 1-gamma21;
    
    gamma31 = (1/gamma1)/(((1/gamma1))+ (1/gamma2));
    gamma32 = 1-gamma31;

    P01 = getTranstitionI2J((q1*lambda0),0);
    P02 = getTranstitionI2J((q2*lambda0),0);
    P03 = getTranstitionI2J((q3*lambda0),0);
    P0T = getTranstitionI2J(mu,0);
    P10 = getTranstitionI2J(lambdaC,1);
    P12 = getTranstitionI2J((gamma1*gamma12),1);
    P13 = getTranstitionI2J((gamma1*gamma13),1);
    P1T = getTranstitionI2J(mu,1);
    P20 = getTranstitionI2J(lambdaC,2);
    P21 = getTranstitionI2J(gamma2*gamma21,2);
    P23 = getTranstitionI2J(gamma2*gamma23,2);
    P2T = getTranstitionI2J(mu,2);
    P30 = getTranstitionI2J(lambdaC,3);
    P31 = getTranstitionI2J(gamma3*gamma31,3);
    P32 = getTranstitionI2J(gamma3*gamma32,3);
    P3T = getTranstitionI2J(mu,3);
    PTT = 1;


    double a01, a21, a31;
    double a02, a12, a32;
    double a03, a13, a23;

    detA = 1-((P02*P20)+(P03*P30)+(P23*P32)+(P20*P03*P32)+(P02*P23*P30)); 
    detB = 1-((P30*P03)+(P31*P13)+(P01*P10)+(P01*P13*P30)+(P31*P10*P03)); 
    detC = 1-((P02*P20)+(P21*P12)+(P10*P01)+(P01*P12*P20)+(P02*P21*P10)); 

    a01 = (P01+(P02*P21)+(P03*P31)+(P03*P32*P21)+(P02*P23*P31)-(P23*P32*P01))/detA;
    a21 = (P21+(P20*P01)+(P23*P31)+(P23*P30*P01)+(P20*P03*P31)-(P03*P30*P21))/detA;
    a31 = P31+(P30*a01)+(P32*a21);
    a02 = (P02+(P01*P12)+(P03*P32)+(P01*P13*P32)+(P03*P31*P12)-(P31*P13*P02))/detB;
    a12 = (P12+(P10*P02)+(P13*P32)+(P13*P30*P02)+(P10*P03*P32)-(P03*P30*P12))/detB;
    a32 = P32+(P30*a02)+(P31*a12);
    a03 = ((P03)+(P01*P13)+(P02*P23)+(P02*P21*P13)+(P01*P12*P23)-(P21*P12*P03))/detC;
    a13 = ((P13)+(P10*P03)+(P12*P23)+(P12*P20*P03)+(P10*P02*P23)-(P20*P02*P13))/detC;
    a23 = P23+(P20*a03)+(P21*a13);

    f[0] = -1;
    f[1] = P10*(a01)+ P12*a21 + P13*a31;
    f[2] = P20*(a02)+ P21*a12 + P23*a32;
    f[3] = P30*(a03)+ P31*a13 + P32*a23;

    st[0] = -1;
    st[1] = (P0*a01)+P1+(P2*a21)+(P3*a31);
    st[2] = (P0*a02)+(P1*a12)+P2+(P3*a32);
    st[3] = (P0*a03)+(P1*a13)+P3+(P2*a23);

    //n0[0] = -1;
    //n0[1] = P0*(1-a01) + P2*(1-a21);
    //n0[2] = P0*(1-a02) + P1*(1-a12);

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
    double ets = 600;
    double et0 = 100;
    double etw = 500;
    double et1 = 80;
    double et2 = 120;
    double et3 = 300;

    map<int, double> countP; 
    map<int, double> countP2; 
    map<int, double> countP3; 
    MarkovProcess mv (ets,et0,etw,et1,et2,et3);
        cout << "P01=" << mv.getP01()<<endl;
        cout << "P02=" << mv.getP02() <<endl;
        cout << "P03=" << mv.getP03() <<endl;
        cout << "P0T=" << mv.getP0T() <<endl;
        
                
        cout << "P10=" << mv.getP10()<<endl;
        cout << "P12=" << mv.getP12()<<endl;
        cout << "P13=" << mv.getP13()<<endl;
        cout << "P1T=" << mv.getP1T()<<endl;
                
        
        cout << "P20=" << mv.getP20()<<endl;
        cout << "P21=" << mv.getP21()<<endl;
        cout << "P23=" << mv.getP23()<<endl;
        cout << "P2T=" << mv.getP2T()<<endl;

        cout << "P30=" << mv.getP30()<<endl;
        cout << "P31=" << mv.getP31()<<endl;
        cout << "P32=" << mv.getP32()<<endl;
        cout << "P3T=" << mv.getP3T()<<endl;
        
    // ******** Simulation ********
    double plist[4] = {0};
    double WiFiStatus = -1,chageStatus=-1;
    int countR1 = 0, countR2=0, countR3=0;
    for(int i=0;i<Nsim;i++)
    {
        plist[0] = mv.getP0();
        plist[1] = mv.getP1();
        plist[2] = mv.getP2();
        plist[3] = mv.getP3();
        WiFiStatus = getWifiStatus(plist,4);
        countR1 = 0;
        countR2 = 0;
        countR3 = 0;
        //cout << " S"<<WiFiStatus;
        //cout << "WiFiStatus : " << WiFiStatus << endl;

        do
        {
            if(WiFiStatus==0)
            {
                plist[0] = mv.getP01();
                plist[1] = mv.getP02();
                plist[2] = mv.getP03();
                plist[3] = mv.getP0T();
                /*
                cout << "P01=" << plist[0] <<endl;
                cout << "P02=" << plist[1] <<endl;
                cout << "P0T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,4); 
                
                WiFiStatus = chageStatus+1; // 0 to 1 , 0 to 2 , o t0 3(T)  
                //cout << " S"<<WiFiStatus;
            }
            else if(WiFiStatus==1)
            {
                countR1++;
                plist[0] = mv.getP10(); 
                plist[1] = mv.getP12();
                plist[2] = mv.getP13();
                plist[3] = mv.getP1T();
                /*
                cout << "P10=" << plist[0] <<endl;
                cout << "P12=" << plist[1] <<endl;
                cout << "P1T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,4); 
                WiFiStatus = (chageStatus!=0)?chageStatus+1:0;
                //cout << " S"<<WiFiStatus;
            }
            else if(WiFiStatus==2)
            {
                countR2++;
                plist[0] = mv.getP20(); 
                plist[1] = mv.getP21();
                plist[2] = mv.getP23();
                plist[3] = mv.getP2T();
                /*
                cout << "P20=" << plist[0] <<endl;
                cout << "P21=" << plist[1] <<endl;
                cout << "P2T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,4); 
                WiFiStatus = (chageStatus>=2)?chageStatus+1:chageStatus;
                //cout << " S"<<WiFiStatus;
            }
            else if(WiFiStatus==3)
            {
                countR3++;
                plist[0] = mv.getP30(); 
                plist[1] = mv.getP31();
                plist[2] = mv.getP32();
                plist[3] = mv.getP3T();
                /*
                cout << "P20=" << plist[0] <<endl;
                cout << "P21=" << plist[1] <<endl;
                cout << "P2T=" << plist[2] <<endl;
                */
                chageStatus = getWifiStatus(plist,4); 
                WiFiStatus = (chageStatus==3)?chageStatus+1:chageStatus;
                //cout << " S"<<WiFiStatus;
            }

        }while(WiFiStatus!=4); // 4 is terminate state
        //cout << endl;
        //cout << "State 1 =" << countR1 << endl;
        //cout << "State 2 =" << countR2 << endl;
        //cout << "State 3 =" << countR3 << endl;

        if(countP.find(countR1)==countP.end()) // if there is no P[N=n]
        {
            countP.insert(make_pair(countR1,1));
            //countT1++;
        }
        else
        {
            int wcount = countP[countR1];
            countP[countR1] = wcount+1;
            //countT1++;           
        } 

        if(countP2.find(countR2)==countP2.end()) // if there is no P[N=n]
        {
            countP2.insert(make_pair(countR2,1));
            //countT2++;
        }
        else
        {
            int wcount = countP2[countR2];
            countP2[countR2] = wcount+1;
            //countT2++;
        } 
        
        if(countP3.find(countR3)==countP3.end()) // if there is no P[N=n]
        {
            countP3.insert(make_pair(countR3,1));
            //countT2++;
        }
        else
        {
            int wcount = countP3[countR3];
            countP3[countR3] = wcount+1;
            //countT2++;
        } 

    }

    ofstream outfile;
    outfile.open("markov_state1_m3.txt",ios_base::app);
    string content;

    cout << "=============== Report ==============="<<endl;
    cout << "N_simulation = " <<Nsim << endl;
    cout << "E[t0] = "<< et0 << endl;
    cout << "E[tw] = "<< etw << endl;
    cout << "E[t1] = "<< et1 << endl;
    cout << "E[t2] = "<< et2 << endl;
    cout << "E[t3] = "<< et3 << endl;
    cout << "E[ts] = "<< ets << endl;
    cout << "=============== State 1 ==============="<<endl;
    cout <<setw(5) << "P[N=n]| " <<setw(15)<<" # of Visitting |" << setw(15) <<" Simulation |" << setw(18) << " Math Analyisis |" <<endl;
    for (map<int, double>::iterator it = countP.begin(); it != countP.end(); ++it) 
    {
        int n = it->first;
        string col1 = "P[N1=" + to_string(n) + "]";
        int n2 = it->second;
        //cout << col1 <<"="<<n2<<endl;
        double psim = (double)n2/Nsim;
        double mp = mv.getDistribution(1,n);
        //cout << "Pr[N2="<<n <<"]=" << n2 <<endl;
        cout << fixed;
        cout << setw(5) <<left << col1 << setprecision(6) << setw(15)<< right << n2 << setw(15)<< right  << psim << setw(15) << setprecision(6)<< right << mp <<endl;
        content += to_string(Nsim)+ "," + to_string(ets) + "," + to_string(et0)+ "," + to_string(etw) + "," + to_string(et1) + "," + to_string(et2) + "," + to_string(et3) \
           + ","+ to_string(n)  + "," +  to_string(n2) + "," +  to_string(psim) + "," +  to_string(mp) + "\n";
    }
    outfile << content; 
    outfile.close();

    outfile.open("markov_state2_m3.txt",ios_base::app);
    string content2;

    cout << "=============== State 2 ==============="<<endl;
    cout <<setw(5) << "P[N=n]| " <<setw(15)<<" # of Visitting |" << setw(15) <<" Simulation |" << setw(18) << " Math Analyisis |" <<endl;
    for (map<int, double>::iterator it = countP2.begin(); it != countP2.end(); ++it) 
    {
        int n = it->first;
        string col1 = "P[N2=" + to_string(n) + "]";
        int n2 = it->second;
        //cout << col1 <<"="<<n2<<endl;
        double psim = (double)n2/Nsim;
        double mp = mv.getDistribution(2,n);
        //cout << "Pr[N2="<<n <<"]=" << n2 <<endl;
        cout << fixed;
        cout << setw(5) <<left << col1 << setprecision(6) << setw(15)<< right << n2 << setw(15)<< right  << psim << setw(15) << setprecision(6)<< right << mp <<endl;
        content2 += to_string(Nsim)+ "," + to_string(ets) + "," + to_string(et0)+ "," + to_string(etw) + "," + to_string(et1) + "," + to_string(et2) + "," + to_string(et3) \
           + ","+ to_string(n)  + "," +  to_string(n2) + "," +  to_string(psim) + "," +  to_string(mp) + "\n";
    }

    outfile << content2; 
    outfile.close();

    outfile.open("markov_state3_m3.txt",ios_base::app);
    string content3;
    
    cout << "=============== State 3 ==============="<<endl;
    cout <<setw(5) << "P[N=n]| " <<setw(15)<<" # of Visitting |" << setw(15) <<" Simulation |" << setw(18) << " Math Analyisis |" <<endl;
    for (map<int, double>::iterator it = countP3.begin(); it != countP3.end(); ++it) 
    {
        int n = it->first;
        string col1 = "P[N3=" + to_string(n) + "]";
        int n2 = it->second;
        //cout << col1 <<"="<<n2<<endl;
        double psim = (double)n2/Nsim;
        double mp = mv.getDistribution(3,n);
        //cout << "Pr[N2="<<n <<"]=" << n2 <<endl;
        cout << fixed;
        cout << setw(5) <<left << col1 << setprecision(6) << setw(15)<< right << n2 << setw(15)<< right  << psim << setw(15) << setprecision(6)<< right << mp <<endl;
        content3 += to_string(Nsim)+ "," + to_string(ets) + "," + to_string(et0)+ "," + to_string(etw) + "," + to_string(et1) + "," + to_string(et2) + "," + to_string(et3) \
           + ","+ to_string(n)  + "," +  to_string(n2) + "," +  to_string(psim) + "," +  to_string(mp) + "\n"; 
    }
    outfile << content3; 
    outfile.close();

    /*
    double sump[3] = {0};
    for(int j=1;j<4;j++)
    {
        for(int n=0;n<21;n++)
        {
            sump[j-1]+=mv.getDistribution(j,n);
            cout << "P[N"<<j<<"="<<n<<"]="<< mv.getDistribution(j,n)<<endl;
        }
    }
    
    cout << "sumP[0]="<<sump[0] <<endl;
    cout << "sumP[1]="<<sump[1] <<endl;
    cout << "sumP[2]="<<sump[2] <<endl;
    */
    /*
    cout << "P0=" << mv.getP0() <<endl;
    cout << "P1=" << mv.getP1() <<endl;
    cout << "P2=" << mv.getP2() <<endl;
    cout << "P3=" << mv.getP3() <<endl;
    cout << "P01=" << mv.getP01() <<endl;
    cout << "P02=" << mv.getP02() <<endl;
    cout << "P03=" << mv.getP03() <<endl;
    cout << "P0T=" << mv.getP0T() <<endl;

    cout << "P10=" << mv.getP10() <<endl;
    cout << "P12=" << mv.getP12() <<endl;
    cout << "P13=" << mv.getP13() <<endl;
    cout << "P1T=" << mv.getP1T() <<endl;

    cout << "P20=" << mv.getP20() <<endl;
    cout << "P21=" << mv.getP21() <<endl;
    cout << "P23=" << mv.getP23() <<endl;
    cout << "P2T=" << mv.getP2T() <<endl;

    cout << "P30=" << mv.getP30() <<endl;
    cout << "P31=" << mv.getP31() <<endl;
    cout << "P32=" << mv.getP32() <<endl;
    cout << "P3T=" << mv.getP3T() <<endl;
    */
    
    return 0;
}