cwlVersion: v1.0
class: CommandLineTool

baseCommand: [python3]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    python_script:
        type: File
        inputBinding:
            position: 1
    
    input_path:
        type: File
        inputBinding:
            position: 2

    name:
        type: string
        inputBinding:
            position: 3

outputs:
    mod_csv:
        type: File
        outputBinding: 
            glob: $(inputs.name)_mod.csv

#    tibble:
 #       type: stdout
#stdout: tibble.txt          #this will appear in the working directory
