#include<stdio.h>
#include<string.h>

int main(){
    char *p;
    printf("donner num = ");
    scanf("%s",p);
    printf("nom = %s",*p);
    return 0;
}