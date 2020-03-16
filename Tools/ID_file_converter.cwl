cwlVersion: v1.0
class: CommandLineTool

baseCommand: [/Applications/OpenMS-2.4.0/bin/IDFileConverter]

inputs:
    input:
        type: File
        inputBinding:
            position: 1
            prefix: -in
    
    output:
        type: string
        inputBinding:
            position: 2
            prefix: -out

outputs:
    mzid:
        type: File
        outputBinding: 
            glob: $(inputs.output)
