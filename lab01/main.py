import sys
import os

with open("max", "w") as fout:
    try:
        args = sys.argv
        args_count = int(args[1])
    except IndexError:
        print("Count of arguments in generated script not found")
    else:
        output = ""    
        counter = 0
        
        def put(s):
            global output
            output = output + s

        bash_ver = "#!/bin/bash\n"
        put(bash_ver)

        def print_if(variables, biggest):        
            global counter, args_count
            if (counter >= 1):
                put("el")
            put('if [[ ')
            count = 0
            for i in range(len(variables)):
                var_name = variables[i]            
                if (biggest == var_name):
                    continue
                if (count == len(variables) - 2):
                    put('"${' + var_name + '}" -le "${' + biggest + '}" ]]\n')
                else:
                    put('"${' + var_name + '}" -le "${' + biggest + '}" && ')        
                count += 1
                
            put('then echo "${' + biggest + '}"\n')            
            counter += 1
            if (counter == args_count):
                put('fi\n\n')
        
        variables = [str(i) for i in range(1, args_count + 1)]
        for variable in variables:
            print_if(variables, variable)
        fout.write(output)
        os.popen('chmod u+x max')

    
