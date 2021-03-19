import java.util.ArrayList;
import java.util.List;

public class Main {
    public static List<Integer> erastothenes_sieve(int upper_limit){
        List<Integer> primes = new ArrayList<Integer>();
        primes.add(2);
        primes.add(3);

        boolean[] bool_array = new boolean[upper_limit];

        int i = 5;
        int adder = 0;

        while(i < upper_limit){
            if(!bool_array[i]) {

                primes.add(i);

                int multiple = i * 3;
                int inc = i * 2;
                while (multiple < upper_limit) {
                    bool_array[multiple] = true;
                    multiple += inc;
                }
            }
            i += 2 + adder;
            adder = (adder - 2) * -1;
        }

        return primes;
    }

    public static void main(String[] args) {
        int len = 1000000;
        int iterations = 1000;
        System.out.println("Starting");
        long time = System.currentTimeMillis();
        for (int i = 0; i < iterations; i++){
            var primes = erastothenes_sieve(len);
        }
        long timePassed = System.currentTimeMillis() - time;
        System.out.println("Finished in " + timePassed / (double) iterations + " milliseconds");
    }
}
