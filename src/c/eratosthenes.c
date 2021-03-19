#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void array_print(int *array, int len){
    for (int x=0; x < len; x++){
        printf("%d ", array[x]);
    }
    printf("\n");
}

int * erasthenos(int* upper_limit){
    int *array = malloc(sizeof(int) * *upper_limit);
    
    int *bool_array = malloc(sizeof(int) * *upper_limit);

    array[0] = 2;
    array[1] = 3;

    int *cursor = array + 2;

    int i = 5;
    int adder = 0;

    while (i < *upper_limit){
        // if value is false -> enter 
        if (!bool_array[i]){
            *cursor = i;
            cursor++;
            int inc = i * 2;
            int multiples = i * 3;
            while (multiples < *upper_limit){
                bool_array[multiples] = 1;
                multiples += inc;
            }
        }
        i += 2 + adder;
        adder = (adder - 2) * - 1;
    }

    free(bool_array);
    
    *upper_limit = cursor-array;

    array = realloc(array, *upper_limit * sizeof(int));
    return array;
}


int main(){
    clock_t begin = clock();
    int *array;
    int i = 0;
    int len = 1000000;
    int iterations = 1000;
    while(i < iterations){  
        int _len = len;
        array = erasthenos(&_len);
        free(array);
        i++;
    }
    //array_print(array, len);
    //printf("%d", len);

    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC
    / iterations;
    printf("Time spent [seconds]: %f\n", time_spent);
    return 0;
}