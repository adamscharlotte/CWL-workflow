cwlVersion: v1.0
class: Workflow
requirements:
    MultipleInputFeatureRequirement: {}

inputs:
    mztab_to_csv_py: File
    Path: string
    bait: string
    identifications_R: File
    mass_tolerance:
        type: string
        default: "50"

outputs:
    identifications:
        type: File
        outputSource: identifications/identifications

steps:
    mztab_to_csv:
        run: Tools/mztab_to_csv.cwl
        in: 
            mztab_to_csv_py: mztab_to_csv_py
            Path: Path
            bait: bait
        out:
            [csv]
    
    identifications:
        run: Tools/identifications.cwl
        in: 
            identifications_R: identifications_R
            bait: bait
            mass_tolerance: mass_tolerance
            csv: mztab_to_csv/csv
        out:
            [identifications]

#    MassIVE_identifications:
 #       run: Tools/MassIVE_identifications.cwl
  #      in: 
   #         MassIVE_identifications_R: MassIVE_identifications_R
    #        bait: bait
     #       mass_tolerance: mass_tolerance
      #      csv: MassIVE_mztab_to_csv/csv
       # out:
        #    [MassIVE_identifications]

