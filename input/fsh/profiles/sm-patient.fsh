Profile: SmPatientBase
Parent: Patient
Id: sm-patient
Title: "SmPatient Base"
Description: "病人（Serious Medical Patient) Profile说明本IG如何进一步定义FHIR的Patient Resource以呈现基本资料"
* . ^short = "接受健康医护服务的个人信息"
* . ^definition = "关于接受医护或其他健康相关服务的个人的人口统计学和其他行政信息。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Patient纪录，通常又称为逻辑性ID。"
* id ^comment = "一个resource使用新增操作（create operation）提交给伺服器时，此resource没有id，它的id在resource被创建后由伺器分配/指定。"
* language from CommonLanguages (preferred)
* language ^short = "用以表述Patient Resource内容的语言。"
* language ^example.valueString = "zh-TW"
* identifier MS  
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier contains
    patientId 1..1 MS  
* identifier[patientId] ^short = "patient id" 
* identifier[patientId].value ^maxLength = 12  
* name 1..* MS 
* name.text 1..1 MS
* name.text ^short = "English full name, Patient’s full name in English" 
* name.text ^min = 0
* name.text ^maxLength = 100
* name.family 0..1 MS
* name.family ^short = "English surname, Patient's surname in English"
* name.family ^maxLength = 40
* name.given MS
* name.given ^min = 0
* name.given ^short = "English given name, Patient's given name in English"
* name.given ^maxLength = 40
* telecom MS
* gender 1..1 MS
* gender ^short = "Sex"
* birthDate 1.. MS
* birthDate ^short = "Date of Birth, The patient's date of birth"
* birthDate ^maxLength = 10 

 