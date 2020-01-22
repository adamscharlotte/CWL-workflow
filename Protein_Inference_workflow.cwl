cwlVersion: v1.0
class: Workflow
requirements:
    MultipleInputFeatureRequirement: {}

inputs:
    cp: File
    compiler: string
    idxml: File
    outfile: string
    name:
        type: string
        default: "test"
    jar: File
    proteinExport: string
    paramFile: File
    fileType: 
        type: string
        default: "mzTab"    
    mztab_to_csv_py: File
    pia_proteins_R: File
    bait: string    

outputs:
    proteins_csv:
        type: File
        outputSource: pia_proteins/proteins_csv

steps:
    pia_xml:
        run: Tools/pia_xml.cwl
        in:
            cp: cp
            compiler: compiler
            idxml: idxml
            bait: bait
            outfile: outfile
            name: name
        out:
            [xml]
    
    pia_run:
        run: Tools/pia_run.cwl
        in: 
            jar: jar
            xml: pia_xml/xml
            bait: bait
            fileType: fileType
            paramFile: paramFile
            proteinExport: proteinExport
        out: 
            [mztab]
            
    mztab_to_csv:
        run: Tools/mztab_to_csv.cwl
        in:
            mztab_to_csv_py: mztab_to_csv_py
            mztab: pia_run/mztab
            bait: bait
        out:
            [csv]

    pia_proteins:
        run: Tools/pia_proteins.cwl
        in: 
            pia_proteins_R: pia_proteins_R
            csv: mztab_to_csv/csv
            bait: bait
        out:
            [proteins_csv]
