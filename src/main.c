#include "main.h"

int main(int ac, char **av)
{     
    chain_t *chain = NULL;
    // if chain exists, open it & save info to chain struct
    if (ac == 2)
    {
        chain = open_chain(av[1]);
        if (chain == NULL)
        {
            printf("%s", ERR_8);
            return -1;
        }
    }
    // else create empty blockchain
    else
    {
        chain = malloc(sizeof(chain_t));
        if (chain == NULL)
            printf("%s", ERR_1);
        
        node_t *node_head = NULL;
            
        chain->synced = true;
        chain->nodes = 0;
        chain->head = node_head;
    }

    // set strings for first prompt
    char *prompt_string = change_prompt(chain);
    char *input = "";

    while (true)
    {
        input = get_input(prompt_string);

        // exit condition
        if (my_strcmp(input, "quit") == 0)
        {
            save_blockchain(chain);
            break;
        }

        // input parsing
        command_t *command = parse_input(input);

        // the action takes places here, depending on command
        chain = take_action(command, chain);
        
        // prepare string for next prompt
        prompt_string = NULL;
        prompt_string = change_prompt(chain);

        // empty & free command for next round
        command = NULL;
        free(command);
    }

    // when the user quit, input still has to be freed
    if (input)
        free(input);
    
    free(chain);
    return 0;
}