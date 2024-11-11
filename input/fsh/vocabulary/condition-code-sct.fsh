ValueSet: ConditionCodeSCT
Id: condition-code-sct
Title: "ValueSet-SNOMED CT诊断代码值集"
Description: "SNOMED CT诊断代码值集。"
* ^version = "2024-11-11"
* ^status = #active
* include codes from system SNOMED_CT where concept is-a #404684003
* include codes from system SNOMED_CT where concept is-a #243796009
* include codes from system SNOMED_CT where concept is-a #272379006
* SNOMED_CT#160245001