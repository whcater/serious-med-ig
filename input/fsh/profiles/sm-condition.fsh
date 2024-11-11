Profile: SmCondition
Parent: Condition
Id: sm-condition
Title: "SmCondition"
Description: "病情、问题或诊断"
* . ^short = "有关病情、问题或诊断的详细信息"
* . ^definition = "一个临床病情、问题、诊断或其他事件、情况、或临床概念，已上升到需要关注的程度。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的Condition纪录，通常又称为逻辑性ID。" 
* id ^comment = "一个resource使用新增操作（create operation）提交给服务器时，此resource没有id，它的id在resource被创建后由服务器分配/指定。"
* extension ^short = "扩展字段"
* identifier ^short = "此病情、问题或诊断的外部识别码"
* identifier ^definition = "由执行者或其他系统指定给此病情、问题或诊断的业务用识别码，即使此resource作更新及在服务器之间的传递，此识别码仍保持不变。"
* identifier ^comment = "这是一个业务识别码，不是一个resource识别码（详见讨论）。最好的做法是该识别码只出现在单个resource实例上，但是业务实务有可能会规定可以在多个resource实例中具有相同识别码—甚至可能具有不同的resource型例。例如：多个 「Patient（病人）」和 「Person（个人）」resource实例可能共用同一个社会保险号码。"
* clinicalStatus 1.. MS
* clinicalStatus only CodeableConcept
* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical|4.0.1 (required)
* clinicalStatus ^short = "active | recurrence | relapse | inactive | remission | resolved ，病情、问题或诊断的临床状态。"
* verificationStatus only CodeableConcept
* verificationStatus MS
* verificationStatus from http://hl7.org/fhir/ValueSet/condition-ver-status|4.0.1 (required)
* verificationStatus ^short = "unconfirmed | provisional | differential | confirmed | refuted | entered-in-error ，支持或拒绝病情、问题或诊断的临床状态的验证状态。" 
* verificationStatus ^comment = "verificationStatus不是必须的。例如：当病人在急诊室出现腹痛时，不可能出现验证状态。资料类型是CodeableConcept，因为verificationStatus涉及到一些临床判断，因此可能需要比所需的FHIR值集更多的特殊性。例如：SNOMED编码可能允许更多的特殊性。"
* category ^short = "problem-list-item | encounter-diagnosis ，指定病情、问题或诊断的类别。"
* severity only CodeableConcept
* severity MS
* severity from $condition-severity (extensible)
* severity ^short = "病情、问题或诊断的主观严重程度"
* code only CodeableConcept
* code MS
* code from $condition-code (example)
* code ^short = "病情、问题或诊断的识别"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^short = "由专门术语系统（terminology system）定义的代码。此资料项目为可扩充绑定预设国际标准值集，但实作者可视实务专案需求只绑定以下slices中的任一值集。目前未只限定绑定预设值集是因为尚无slice值集与预设国际标准值集的代码对应表，待后续有相对的代码对应表后将建议采用国际标准值集作为唯一绑定值集并针对该值集进行扩充与管理，以利进行跨国与跨系统之资料交换。"
* code.coding contains 
    absentOrUnknownProblem 0..1 MS and
    sct 0..1 MS 
* code.coding[absentOrUnknownProblem] from AbsentOrUnknownProblemsUvIps (required)
* code.coding[absentOrUnknownProblem] ^short = "不存在的问题或未知问题的代码"
* code.coding[absentOrUnknownProblem] ^definition = "表示「absent problem」或「problems unknown」的代码"
* code.coding[absentOrUnknownProblem] ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，如SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* code.coding[absentOrUnknownProblem] ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码"
* code.coding[absentOrUnknownProblem] ^binding.description = "应填入所绑定值集中的其中一个代码。"
* code.coding[sct] from ConditionCodeSCT (required)
* code.coding[sct] ^short = "此为SNOMED CT诊断代码，若机构已有购买相关授权，亦可使用。"
* code.coding[sct] ^definition = "由专门术语系统（terminology system）所定义之代码的参照。"
* code.coding[sct] ^comment = "代码可以在列举清单（enumerations）或代码清单（code lists）中非常随意地定义，直至有非常正式的定义，如SNOMED CT—更多信息见HL7 v3核心原则（Core Principles）。编码的排序是未定义的因而 **必须没有（SHALL NOT）** 被用来推断意义。一般来说，最多只有一个编码值（coding values）会被标记为UserSelected = true。"
* code.coding[sct] ^requirements = "允许使用者在不知道识别码系统的情况下利用识别码" 
* bodySite only CodeableConcept
* bodySite MS
* bodySite from SNOMEDCTBodyStructures (extensible)
* bodySite ^short = "如果相关请填写解剖位置"
* bodySite ^comment = "只有在Condition.code中找到的代码未隐含此资料项目概念时才使用。如果使用案例（use-case）要求将BodySite作为一个单独的resource来处理（例如：识别和追踪），那么就使用标准的资料项目扩充方式来扩充bodySite。可以是一个摘要代码，也可以是对一个非常精确位置定义的参照，或者两者都是。"
* subject only Reference(SmPatient or Group)
* subject MS
* subject ^short = "谁有此病情、问题或诊断？"
* encounter only Reference(Encounter)
* encounter ^short = "作为病情、问题或诊断纪录的一部分的就医（Encounter）纪录"
* onset[x] only dateTime or Age or Period or Range or string
* onset[x] MS
* onset[x] ^short = "估计的或实际的日期、日期—时间或年龄。医师认为此病情、问题或诊断之推估或实际发生时间或日期时间等"
* abatement[x] only dateTime or Age or Period or Range or string
* abatement[x] MS
* abatement[x] ^short = "何时解决/缓解"
* abatement[x] ^definition = "病情、问题或诊断缓解或开始缓解的日期或估计日期。因为与「缓解（remissio）」或 「解决（resolution）」相关的许多过多含义—病情、问题或诊断不会真正解决，但它们可以缓解，所以称为「缓解 （abatement）」，"
* recorder only Reference(SmPractitioner or SmPractitionerRole or SmPatient or RelatedPerson)
* recorder ^short = "谁记录此病情、问题或诊断"
* asserter only Reference(SmPractitioner or SmPractitionerRole or SmPatient or RelatedPerson)
* asserter MS
* asserter ^short = "声称有此病情、问题或诊断的人"
* stage ^short = "分期（stage）／分级（grade），通常是正式的评估。"
* stage ^definition = "病情、问题或诊断的临床分期或分级，可能包括正式的严重程度评估。"
* stage.summary only CodeableConcept
* stage.summary from ConditionStage (extensible)
* stage.summary ^short = "简单的摘要（特定疾病）。"
* stage.summary ^definition = "对分期的简单摘要，如「第3期」。针对特定疾病的分期测定。"
* stage.summary ^binding.description = "描述病情、问题或诊断分期的代码（例如：癌症分期）。应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* stage.assessment only Reference(ClinicalImpression or DiagnosticReport or Observation)
* stage.assessment ^short = "正式的评估记录"
* stage.assessment ^definition = "分期评估所依据的证据之正式记录"
* stage.type only CodeableConcept
* stage.type from ConditionStageType (extensible)
* stage.type ^short = "分期的种类"
* stage.type ^definition = "分期的种类，如病理分期或临床分期。"
* stage.type ^binding.description = "病情、问题或诊断分期种类的代码（如临床或病理）；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* evidence ^short = "支持的证据"
* evidence ^definition = "作为病情、问题或诊断验证状态基础的支持证据／临床表现，如证实或反驳病情、问题或诊断的证据。"
* evidence ^comment = "证据可以是一个简单的编码症状／临床表现的清单，或参考检验检查或者正式评估，或者两者都是。"
* evidence.code only CodeableConcept
* evidence.code from ManifestationAndSymptomCodes (extensible)
* evidence.code ^short = "表现／症状"
* evidence.code ^definition = "导致记录此病情、问题或诊断的表现或症状"
* evidence.code ^binding.description = "病情、问题或诊断的表现或症状之代码；应填入所绑定值集中适合的代码，确定无适合的代码才可以使用其他值集的代码来表示。"
* evidence.detail ^short = "在其他地方找到的支持信息"
* evidence.detail ^definition = "其他相关信息的连接，包括病理报告。"
* note MS
* note ^short = "关于此Condition的附加信息"
* note ^definition = "关于此Condition的附加信息。这是一个一般的注释／意见纪录，用于描述病情、问题或诊断、其诊断和预后。"