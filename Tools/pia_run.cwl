cwlVersion: v1.0
class: CommandLineTool

baseCommand: [java]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    jar:
        type: File
        inputBinding:
            position: 1
            prefix: -jar

    xml:
        type: File
        inputBinding:
            position: 2
            prefix: -infile
    
    paramFile:
        type: File
        inputBinding:
            position: 3
            prefix: -paramFile
        
    psmExport:
        type: string
        inputBinding:
            position: 4
            prefix: -psmExport
    
    fileType:
        type: string
        inputBinding:
            position: 5

    bait:
        type: string
        inputBinding:
            position: 6

outputs:
    mzidentml:
        type: File
        outputBinding: 
            glob: $(inputs.bait).mzIdentML
    # csv:
    #     type: File
    #     outputBinding: 
    #         glob: $(inputs.bait).csv
#    tibbles:
 #       type: stdout
#stdout: tibble.txt          #this will appear in the working directory
