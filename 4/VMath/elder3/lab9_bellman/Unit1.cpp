//---------------------------------------------------------------------------

#pragma hdrstop
#include <stdio.h>
#include <conio.h>
#include <limits.h>

#define n 7
#define besk INT_MAX-100

#pragma argsused

int A[n][n];
int D[n];
bool B[n];  // ������ ������������� ���������


//---------------------------------------------------------------------------

bool tranzit()
{
 bool t=true;
 int i;
 for (i=0; i<n; i++) if (!B[i]) { t=false; break; }

return t;
}

int Min(int num)
{
  int i,min=besk;
  for (i=0; i<n; i++){
        if (D[i]==besk || A[i][num]==besk) continue; // �������� ���������� �� ��������� ��������
        if (min>D[i]+A[i][num]) min=D[i]+A[i][num];
        }
  return min;
}

int main(int argc, char* argv[])
{

/* A[i][j] ������, ����������� �� �����
   Dw �������� ����������� �������� ������ ������

*/

int Dw;
int i,j;
int num;
FILE *f=fopen("arr.txt","r");

for(i=0; i<n; i++)
{
 for(j=0;j<n;j++)
 {
  fscanf(f,"%d",&A[i][j]);
  if (A[i][j]<0)
  {
   A[i][j]=besk;
   printf(" - ");
  }
  else printf("%4d ",A[i][j]);
 }
 printf("\n");
}


  for(i=0; i<n; i++) // ��������� ������ ��������
  {
   D[i]=besk;
   B[i]=false;
  }

  while(1)
  {
   printf("Enter number of vertex: ");
   scanf("%d",&num);
   if (num>=0 && num<n) break;
  }

  B[num]=true;


  // .....


  for(i=0;i<n;i++) if(A[num][i]>=0) D[i]=A[num][i]; // ������� ������������� �� d

  while (!tranzit())
        for (i=0; i<n; i++)
           if (!B[i])    // ���� ��� ������������, ��...
                {
                Dw=Min(i);
                if (Dw==besk) continue;
                else if (Dw == D[i]) B[i]=true; // ���� �� ������, ������� �� ����� ��������� � �������� ��������������� �� ����. ����, �� ������ ����
                else if (Dw < D[i]) D[i]=Dw;   // ���� ����� ����� ������� ����, �� �������� ��� �� ������
                }

  printf("\n\n");
  for(i=0; i<n; i++) printf("%4d ",D[i]);

  getch(); return 0;
}
//---------------------------------------------------------------------------
