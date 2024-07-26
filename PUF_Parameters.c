#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define NUM_RESPONSES 63

// Function to calculate Hamming Weight of a number
int hamming_weight(unsigned int value)
{
    int weight = 0;
    while (value)
    {
        weight += (value & 1);
        value >>= 1;
    }
    return weight;
}


// Function to calculate uniqueness (variation of Hamming Weights)
double calculate_uniqueness(int arbiter_responses[], int ro_responses[], int num_responses)
{

    double uniqueness = 0.0;

    for (int i = 0; i < num_responses - 1; i++)
    {
        for (int j = i + 1; j < num_responses; j++)
        {
            uniqueness = uniqueness + (hamming_weight((arbiter_responses[i] ^ ro_responses[j])) / 8.0);
        }
    }
    uniqueness = uniqueness / num_responses;
    return uniqueness;
}

// Function to calculate uniformity / randomness (variation of Hamming Weights)
double calculate_uniformity(int arbiter_responses[], int num_responses)
{
    double uniformity = 0.0;

    for (int i = 0; i < num_responses - 1; i++)
    {

        uniformity += hamming_weight(arbiter_responses[i]);
    }
    uniformity = (uniformity / 8.0) / num_responses;
    return (uniformity * 100);
}



// Function to calculate min-entropy (minimum entropy of responses)
double calculate_min_entropy(int responses[], int num_responses)
{
    int max_hw = 0;
    for (int i = 0; i < num_responses; i++)
    {
        int hw = hamming_weight(responses[i]);
        if (hw > max_hw)
        {
            max_hw = hw;
        }
    }
    return log2(8.0 / max_hw);
    // return (log2(num_responses) - log2(max_hw));
}

// Function to calculate PUF entropy (entropy of responses)
double calculate_puf_entropy(int responses[], int num_responses)
{
    double sum_entropy = 0.0;
    for (int i = 0; i < num_responses; i++)
    {
        double prob = (double)hamming_weight(responses[i]) / 8.0; // Assuming 32-bit responses
        sum_entropy += -prob * log2(prob);
    }
    return sum_entropy / num_responses;
}

int main()
{
    // Example responses (replace with your actual PUF responses)
    int arbiter_responses[NUM_RESPONSES] = {0xff, 0xff, 0xfb, 0xfb, 0xbb, 0xdb, 0xff, 0xff, 0xdf, 0xdf, 0xdf, 0xdf, 0xf7, 0xf7, 0xfe, 0xfe, 0xa1, 0xa1, 0xd9, 0xd9, 0x7e, 0xfb, 0xfe, 0xfe, 0xfb, 0xef, 0xe9, 0xe9, 0xb9, 0x7f, 0xfb, 0xf9, 0xfa, 0xdb, 0x5f, 0xdb, 0x7f, 0xdb, 0x81, 0xe1, 0x5c, 0x18, 0x7e, 0x67, 0x6e, 0x6e, 0xe8, 0xec, 0xa9, 0xe9, 0xec, 0xb8, 0x7f, 0xf9, 0x99, 0xf9, 0x59, 0x5b, 0x5b, 0x5f, 0x67, 0x85, 0x94};
    int ro_responses[NUM_RESPONSES]      = {0xfc, 0x4a, 0x62, 0x58, 0xcd, 0x90, 0x90, 0x82, 0xd2, 0x10, 0x92, 0x90, 0x10, 0x5f, 0x5e, 0x5a, 0x5a, 0x72, 0xe0, 0x30, 0x30, 0x80, 0xaf, 0x4f, 0xa9, 0xae, 0x2e, 0x0e, 0x0d, 0x1d, 0xbd, 0x35, 0x35, 0x74, 0x54, 0x54, 0x54, 0x44, 0xa5, 0x05, 0x85, 0x85, 0xa5, 0x84, 0xa4, 0x56, 0x46, 0x46, 0x56, 0x46, 0x46, 0xed, 0xef, 0xfb, 0xfb, 0xad, 0xed, 0xef, 0x25, 0xa5, 0xa7, 0xa7, 0xeb};

    printf("Calculating parameters for Arbiter PUF:\n");
    // printf("Reliability: %.2f\n", calculate_reliability(arbiter_responses, ro_responses, NUM_RESPONSES));
    printf("Uniqueness: %.2f %%\n", calculate_uniqueness(arbiter_responses, ro_responses, NUM_RESPONSES));
    printf("Uniformity: %.2f %%\n", calculate_uniformity(arbiter_responses, NUM_RESPONSES));
    printf("Min-Entropy: %.2f bits\n", calculate_min_entropy(arbiter_responses, NUM_RESPONSES));
    printf("PUF Entropy: %.2f bits\n", calculate_puf_entropy(arbiter_responses, NUM_RESPONSES));

    printf("\nCalculating parameters for RO PUF:\n");
    // printf("Reliability: %.2f\n", calculate_reliability(ro_responses, NUM_RESPONSES));
    printf("Uniqueness: %.2f %%\n", calculate_uniqueness(arbiter_responses, ro_responses, NUM_RESPONSES));
    printf("Uniformity: %.2f %%\n", calculate_uniformity(ro_responses, NUM_RESPONSES));
    printf("Min-Entropy: %.2f bits\n", calculate_min_entropy(ro_responses, NUM_RESPONSES));
    printf("PUF Entropy: %.2f bits\n", calculate_puf_entropy(ro_responses, NUM_RESPONSES));

    return 0;
}
