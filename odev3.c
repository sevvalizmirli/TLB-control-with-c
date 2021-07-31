#include <stdio.h>
#include <stdlib.h>

int page_table[100][1];
int toplam_hit=0;
int toplam_miss=0;


int TLBde_var_mi(char **TLB,char *arr){

    for(int i=0;i<10;i++){
        if(TLB[i]==arr) {
            return 1;
        }

    }
    return 0;

}

char deger_dondur(char **TLB,char *arr,int w_byte){

    for(int i=0;i<10;i++){
        if(TLB[i]==arr)
        {
            return TLB[i][w_byte];
        }

    }
    return -1;

}

int index_dondur(char **TLB,char *arr){

    for(int i=0;i<10;i++){
        if(TLB[i]==arr)
        {
            return i;
        }

    }
    return -1;

}


int main(){
    // benim memory'im 100 pageden oluşuyor. Odev metninde aksine bir durum söylenmemiş.

    FILE *f;
    char dosya_adi1[256];
    char dosya_adi2[256];

    printf("OKUMA yapacagınız dosyayı OKU.txt gibi giriniz \n");
    scanf("%s",dosya_adi1);
    printf("adres dosyasını adres.txt seklinde giriniz \n");
    scanf("%s",dosya_adi2);

    f=fopen(dosya_adi1,"r");
    if(f == NULL)
    {
        printf("Error! File Could not open !");
        exit(1);
    }
    char *arr[100];  //memory
    for (int i=0; i<100; i++)
        arr[i] = (char *)malloc(4096);



    for (int i = 0; i < 100; i++) {
        fgets(arr[i], 4096, f);
        page_table[i][0] = i;

}
    for(int i=0;i<100;i++){
        printf("%d. page ---- karsilik geldigi frame %d \n",i,page_table[i][0]);
    }

    char *temp1=malloc(4096);
    char *temp2=malloc(4096);

    for(int i=0;i<100;i++){
       int r_one=(int)( rand() % 100);
       int r_two=(int)( rand() % 100);
       temp1=arr[r_one];
       temp2=arr[r_two];
       int page_temp1=page_table[r_one][0];
       int page_temp2=page_table[r_two][0];

       //icerik swap edilisi
       arr[r_one]=temp2;
       arr[r_two]=temp1;

       //page table guncellemesi
       page_table[r_one][0]=page_temp2;
       page_table[r_two][0]=page_temp1;

    }

    printf("******* Random 100 swaptan sonra ******* \n");
    for(int i=0;i<100;i++){
        printf("%d. page ---- karsilik geldigi frame %d \n",i,page_table[i][0]);
    }








    FILE *adress;
    adress=fopen(dosya_adi2,"r");
    if(adress == NULL)
    {
        printf("Error! File Could not open !");
        exit(1);
    }

    char *TLB[10];  //TLB
    for (int i=0; i<10; i++) {
        TLB[i] = (char *) malloc(4096);
    }
    int t[10][3] ; // 0.indexte en son ne zaman kullanıldı. 1.indexte de hangi frame i tutuyor. 2.index hangi page

    for(int i=0;i<10;i++){
        t[i][0]=0;
        t[i][1]=-1;
        t[i][2]=-1;

    }

    int index=0;
    int blok,b,w_byte,deger;
    while (fscanf (adress, "%d", &index)!=EOF)
    {

        b=index/4096; //page no
        blok=page_table[b][0]; //frame no;
        w_byte=index%4096;

        deger=TLBde_var_mi(TLB,arr[blok]);
        if(deger==0){ //yok
             printf("TLB MISS !!!\n");
             toplam_miss++;
             printf("Adress : %d  bellekteki deger : %c \n",index,arr[blok][w_byte]);

             int flag=0;
             int flag2=0;
             int ind=0;

             while(flag2==0)
            {
                if(t[ind][1]==-1) {
                    flag = ind;  //tlbde ilk bos yer
                    flag2=1;
                }
                ind++;
            }
            if(flag!=0) {//tlbde yer var
            TLB[flag]=arr[blok];
            t[flag][1]=blok;
            t[flag][2]=b;

                for(int i=0;i<10;i++){
                    if(i!=flag)
                        t[i][0]=t[i][0]-1;
                }

            }
            else {
                //tlbde yer yoksa en az kullanılacak olan çıkacak
                int min = 0;
                int index=0;
                for (int i = 0; i < 10; i++) {
                    if (min > t[i][0]) {
                        min = t[i][0];
                        index=i;
                    }
                }
                TLB[index]=arr[blok];
                t[index][1]=blok;
                t[index][2]=b;
                t[index][0]=0;
                for(int i=0;i<10;i++){
                    if(i!=index)
                        t[i][0]=t[i][0]-1;
                }



            }

            printf("TLB 'nin anlık durumu \n");
            printf("TLB_index    LRU_level    page_no     frame_no  \n");
            for(int i=0;i<10;i++){
                printf("     %d          %d          %d          %d          \n",i,t[i][0],t[i][2],t[i][1]);
            }

        }
        else{ //bulduk hit
            printf("TLB HIT !!!\n");
            toplam_hit++;
            printf("Adress : %d  \n",index);
            printf("istenilen deger : %c \n",deger_dondur(TLB,arr[blok],w_byte));
            int in=index_dondur(TLB,arr[blok]);
            for(int i=0;i<10;i++){
                if(i!=in)
                 t[i][0]=t[i][0]-1;
            }

            printf("TLB 'nin anlık durumu \n");
            printf("TLB_index    LRU_level    page_no     frame_no  \n");
            for(int i=0;i<10;i++){
                printf("     %d          %d          %d          %d          \n",i,t[i][0],t[i][2],t[i][1]);
            }




        }


    }

    printf("Toplam hit sayisi : %d \n",toplam_hit);
    printf("Toplam miss sayisi : %d \n",toplam_miss);




    fclose(adress);
    fclose(f);
    return 0;
}

