Profile: SmPractitionerRole
Parent: PractitionerRole
Id: sm-practitioner-role
Title: "SmPractitionerRole"
Description: "健康医护服务提供者角色"
* . ^short = "健康医护服务提供者所关联的角色/机构"
* . ^definition = "健康医护服务提供者可能在一个机构内，一段时间内可能承担的一系列职务角色（Roles）/工作地点（Locations）/专业领域（specialties）/所提供的服务（services）。"
* id ^short = "不重复的ID用以识别储存在特定FHIR Server中的PractitionerRole纪录，通常又称为逻辑性ID。" 
* id ^comment = "一个resource使用新增操作（create operation）提交给服务器时，此resource没有id，它的id在resource被创建后由服务器分配/指定。"
* extension ^short = "扩展字段"
* modifierExtension ^short = "此扩展字段可能会完全修正或改变其他资料项目的涵意，需特别留意。"
* identifier MS
* identifier ^short = "与角色（role）/地点（location）相关的特定业务识别码"
* identifier ^definition = "与角色(role)/地点（location）相关的特定业务识别码"
* identifier ^requirements = "通常会为代理人指派特定的身份识别"
* active MS
* active ^short = "此健康医护服务提供者角色纪录是否有效"
* active ^definition = "此健康医护服务提供者角色纪录是否有效"
* active ^comment = "如果此值为 false，则可以参考period资料项目来了解角色的有效时间。如果没有指定eriod，则无法推断角色的有效时间。"
* active ^requirements = "需要能够将健康医护服务提供者角色纪录标记为无效，因为该记录是错误创建的，或已不再有效。"
* period ^short = "健康医护服务提供者在这些角色里被授权执行工作的时间范围"
* period ^definition = "健康医护服务提供者被授权在这些角色中为机构执行工作的时间范围"
* period ^requirements = "即使授权被撤销，仍需记录该授权曾经存在的事实。"
* practitioner only Reference(SmPractitioner)
* practitioner MS
* practitioner ^short = "能够为机构提供所定义服务的健康医护服务提供者"
* practitioner ^definition = "能够为机构提供所定义服务的健康医护服务提供者"
* organization only Reference(SmOrganization)
* organization MS
* organization ^short = "提供这此健康医护服务提供者角色的机构"
* organization ^definition = "此健康医护服务提供者履行相关角色职责的机构"
* specialty only CodeableConcept
* specialty MS
* specialty ^short = "健康医护服务提供者的特定专业"
* location only Reference(SmLocation)
* location MS
* location ^short = "此健康医护服务提供者提供医护的地点"
* healthcareService ^short = "此工作者为此角色的机构（Organizatoin）/地点（Location）提供的健康医护服务清单"
* telecom MS
* telecom ^short = "与角色（role）/地点（location）/服务（service）相关的联络细节"
* telecom.system 1.. MS
* telecom.system from http://hl7.org/fhir/ValueSet/contact-point-system|4.0.1 (required)
* telecom.system ^definition = "联络方式的通讯形式－需要什么通讯系统进行联络"
* telecom.value 1.. MS
* telecom.value ^short = "实际的联络方式之细节"
* telecom.use MS
* telecom.use from http://hl7.org/fhir/ValueSet/contact-point-use|4.0.1 (required)
* telecom.use ^short = "home | work | temp | old | mobile－此联络方式的用途"
* telecom.rank ^short = "具体说明偏好的使用顺序（1=最高优先顺序）"
* telecom.period MS
* telecom.period ^short = "此联络方式的使用效期"
* availableTime ^short = "服务地点可用的时间"
* availableTime.daysOfWeek from http://hl7.org/fhir/ValueSet/days-of-week|4.0.1 (required)
* availableTime.daysOfWeek ^definition = "此服务地点，在规定的开始和结束时间内，一周中哪些天是开放的。"
* availableTime.allDay ^short = "随时可用？ 例如：24 小时服务。"
* availableTime.allDay ^definition = "此服务地点是否始终开放？（因此时间并不重要），例如 24 小时服务。"
* availableTime.availableStartTime ^short = "每天的开放时间（如果 allDay = true，则忽略。）"
* availableTime.availableEndTime ^short = "每天的关闭时间（如果 allDay = true，则忽略。）"
* notAvailable ^short = "由于提供的原因，在此期间无法使用。"
* notAvailable.description ^short = "向使用者说明为什么此期间无法使用的原因"
* notAvailable.during ^short = "从这个日期起，服务将不再提供。"
* availabilityExceptions ^short = "描述在特定情况下服务不可用的特例"
* endpoint ^short = "提供用于此健康医护服务提供者角色运营服务的技术端点"