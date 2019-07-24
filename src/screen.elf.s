
screen.elf:     file format elf32-bigmips


Disassembly of section .text:

00400000 <start>:
  400000:	3c1d7fff 	lui	sp,0x7fff
  400004:	37bdfffc 	ori	sp,sp,0xfffc
  400008:	0c10054a 	jal	401528 <main>
  40000c:	08100003 	j	40000c <start+0xc>

00400010 <HandleBullet>:
  400010:	14800003 	bnez	a0,400020 <HandleBullet+0x10>
  400014:	3c021001 	lui	v0,0x1001
  400018:	a040034c 	sb	zero,844(v0)
  40001c:	03e00008 	jr	ra
  400020:	3c021001 	lui	v0,0x1001
  400024:	24430350 	addiu	v1,v0,848
  400028:	a0640001 	sb	a0,1(v1)
  40002c:	a0450350 	sb	a1,848(v0)
  400030:	03e00008 	jr	ra

00400034 <paintPlayer>:
  400034:	27bdffe0 	addiu	sp,sp,-32
  400038:	27a50010 	addiu	a1,sp,16
  40003c:	afa40020 	sw	a0,32(sp)
  400040:	27a40011 	addiu	a0,sp,17
  400044:	afbf001c 	sw	ra,28(sp)
  400048:	0c1005e8 	jal	4017a0 <get_color>
  40004c:	93a50020 	lbu	a1,32(sp)
  400050:	93a40021 	lbu	a0,33(sp)
  400054:	0c1005f0 	jal	4017c0 <set_cursor>
  400058:	00002825 	move	a1,zero
  40005c:	24040007 	li	a0,7
  400060:	0c1005e2 	jal	401788 <set_color>
  400064:	2404000e 	li	a0,14
  400068:	0c1005f9 	jal	4017e4 <put_char>
  40006c:	93a50010 	lbu	a1,16(sp)
  400070:	93a40011 	lbu	a0,17(sp)
  400074:	0c1005e2 	jal	401788 <set_color>
  400078:	8fbf001c 	lw	ra,28(sp)
  40007c:	27bd0020 	addiu	sp,sp,32
  400080:	03e00008 	jr	ra

00400084 <paintBullet>:
  400084:	27bdffe0 	addiu	sp,sp,-32
  400088:	27a50010 	addiu	a1,sp,16
  40008c:	afa40020 	sw	a0,32(sp)
  400090:	27a40011 	addiu	a0,sp,17
  400094:	afbf001c 	sw	ra,28(sp)
  400098:	0c1005e8 	jal	4017a0 <get_color>
  40009c:	93a50020 	lbu	a1,32(sp)
  4000a0:	93a40021 	lbu	a0,33(sp)
  4000a4:	0c1005f0 	jal	4017c0 <set_cursor>
  4000a8:	00002825 	move	a1,zero
  4000ac:	24040004 	li	a0,4
  4000b0:	0c1005e2 	jal	401788 <set_color>
  4000b4:	2404000d 	li	a0,13
  4000b8:	0c1005f9 	jal	4017e4 <put_char>
  4000bc:	93a50010 	lbu	a1,16(sp)
  4000c0:	93a40011 	lbu	a0,17(sp)
  4000c4:	0c1005e2 	jal	401788 <set_color>
  4000c8:	8fbf001c 	lw	ra,28(sp)
  4000cc:	27bd0020 	addiu	sp,sp,32
  4000d0:	03e00008 	jr	ra

004000d4 <paintSpider>:
  4000d4:	27bdffe0 	addiu	sp,sp,-32
  4000d8:	27a50010 	addiu	a1,sp,16
  4000dc:	afa40020 	sw	a0,32(sp)
  4000e0:	27a40011 	addiu	a0,sp,17
  4000e4:	afbf001c 	sw	ra,28(sp)
  4000e8:	0c1005e8 	jal	4017a0 <get_color>
  4000ec:	00002825 	move	a1,zero
  4000f0:	24040006 	li	a0,6
  4000f4:	0c1005e2 	jal	401788 <set_color>
  4000f8:	93a50020 	lbu	a1,32(sp)
  4000fc:	93a40021 	lbu	a0,33(sp)
  400100:	0c1005f0 	jal	4017c0 <set_cursor>
  400104:	24040025 	li	a0,37
  400108:	0c1005f9 	jal	4017e4 <put_char>
  40010c:	24040026 	li	a0,38
  400110:	0c1005f9 	jal	4017e4 <put_char>
  400114:	93a50010 	lbu	a1,16(sp)
  400118:	93a40011 	lbu	a0,17(sp)
  40011c:	0c1005e2 	jal	401788 <set_color>
  400120:	8fbf001c 	lw	ra,28(sp)
  400124:	27bd0020 	addiu	sp,sp,32
  400128:	03e00008 	jr	ra

0040012c <paintCentipede>:
  40012c:	00041202 	srl	v0,a0,0x8
  400130:	27bdffd8 	addiu	sp,sp,-40
  400134:	304200ff 	andi	v0,v0,0xff
  400138:	afbf0024 	sw	ra,36(sp)
  40013c:	afb10020 	sw	s1,32(sp)
  400140:	afb0001c 	sw	s0,28(sp)
  400144:	afa40028 	sw	a0,40(sp)
  400148:	afa5002c 	sw	a1,44(sp)
  40014c:	afa60030 	sw	a2,48(sp)
  400150:	afa70034 	sw	a3,52(sp)
  400154:	14400013 	bnez	v0,4001a4 <paintCentipede+0x78>
  400158:	93a40029 	lbu	a0,41(sp)
  40015c:	00a08025 	move	s0,a1
  400160:	93a50028 	lbu	a1,40(sp)
  400164:	93b1002b 	lbu	s1,43(sp)
  400168:	0c1005f0 	jal	4017c0 <set_cursor>
  40016c:	27a50010 	addiu	a1,sp,16
  400170:	27a40011 	addiu	a0,sp,17
  400174:	0c1005e8 	jal	4017a0 <get_color>
  400178:	00002825 	move	a1,zero
  40017c:	2404000a 	li	a0,10
  400180:	0c1005e2 	jal	401788 <set_color>
  400184:	1600000c 	bnez	s0,4001b8 <paintCentipede+0x8c>
  400188:	2404000c 	li	a0,12
  40018c:	16200001 	bnez	s1,400194 <paintCentipede+0x68>
  400190:	2404000b 	li	a0,11
  400194:	0c1005f9 	jal	4017e4 <put_char>
  400198:	93a50010 	lbu	a1,16(sp)
  40019c:	93a40011 	lbu	a0,17(sp)
  4001a0:	0c1005e2 	jal	401788 <set_color>
  4001a4:	8fbf0024 	lw	ra,36(sp)
  4001a8:	8fb10020 	lw	s1,32(sp)
  4001ac:	8fb0001c 	lw	s0,28(sp)
  4001b0:	27bd0028 	addiu	sp,sp,40
  4001b4:	03e00008 	jr	ra
  4001b8:	24020001 	li	v0,1
  4001bc:	16020004 	bne	s0,v0,4001d0 <paintCentipede+0xa4>
  4001c0:	24040008 	li	a0,8
  4001c4:	1620fff3 	bnez	s1,400194 <paintCentipede+0x68>
  4001c8:	24040007 	li	a0,7
  4001cc:	1000fff1 	b	400194 <paintCentipede+0x68>
  4001d0:	24020002 	li	v0,2
  4001d4:	16020004 	bne	s0,v0,4001e8 <paintCentipede+0xbc>
  4001d8:	24040002 	li	a0,2
  4001dc:	1620ffed 	bnez	s1,400194 <paintCentipede+0x68>
  4001e0:	24040001 	li	a0,1
  4001e4:	1000ffeb 	b	400194 <paintCentipede+0x68>
  4001e8:	24020003 	li	v0,3
  4001ec:	1602ffea 	bne	s0,v0,400198 <paintCentipede+0x6c>
  4001f0:	24040016 	li	a0,22
  4001f4:	1620ffe7 	bnez	s1,400194 <paintCentipede+0x68>
  4001f8:	24040009 	li	a0,9
  4001fc:	1000ffe5 	b	400194 <paintCentipede+0x68>

00400200 <set_fungus_in_array_and_print>:
  400200:	00041040 	sll	v0,a0,0x1
  400204:	3c041001 	lui	a0,0x1001
  400208:	248404ac 	addiu	a0,a0,1196
  40020c:	27bdffe8 	addiu	sp,sp,-24
  400210:	00441021 	addu	v0,v0,a0
  400214:	00c02025 	move	a0,a2
  400218:	afbf0014 	sw	ra,20(sp)
  40021c:	a0450000 	sb	a1,0(v0)
  400220:	a0460001 	sb	a2,1(v0)
  400224:	0c1005f0 	jal	4017c0 <set_cursor>
  400228:	8fbf0014 	lw	ra,20(sp)
  40022c:	24040004 	li	a0,4
  400230:	27bd0018 	addiu	sp,sp,24
  400234:	081005f9 	j	4017e4 <put_char>

00400238 <paintFungus>:
  400238:	27bdffe0 	addiu	sp,sp,-32
  40023c:	27a50010 	addiu	a1,sp,16
  400240:	27a40011 	addiu	a0,sp,17
  400244:	afbf001c 	sw	ra,28(sp)
  400248:	0c1005e8 	jal	4017a0 <get_color>
  40024c:	00002825 	move	a1,zero
  400250:	2404000d 	li	a0,13
  400254:	0c1005e2 	jal	401788 <set_color>
  400258:	24060003 	li	a2,3
  40025c:	24050003 	li	a1,3
  400260:	00002025 	move	a0,zero
  400264:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400268:	2406000a 	li	a2,10
  40026c:	2405000a 	li	a1,10
  400270:	24040001 	li	a0,1
  400274:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400278:	2406000d 	li	a2,13
  40027c:	2405000a 	li	a1,10
  400280:	24040002 	li	a0,2
  400284:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400288:	2406000b 	li	a2,11
  40028c:	2405000f 	li	a1,15
  400290:	24040003 	li	a0,3
  400294:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400298:	2406000e 	li	a2,14
  40029c:	24050011 	li	a1,17
  4002a0:	24040004 	li	a0,4
  4002a4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002a8:	24060014 	li	a2,20
  4002ac:	2405002c 	li	a1,44
  4002b0:	24040005 	li	a0,5
  4002b4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002b8:	24060016 	li	a2,22
  4002bc:	24050046 	li	a1,70
  4002c0:	24040006 	li	a0,6
  4002c4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002c8:	24060015 	li	a2,21
  4002cc:	2405004d 	li	a1,77
  4002d0:	24040007 	li	a0,7
  4002d4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002d8:	2406001b 	li	a2,27
  4002dc:	24050032 	li	a1,50
  4002e0:	24040008 	li	a0,8
  4002e4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002e8:	24060003 	li	a2,3
  4002ec:	24050028 	li	a1,40
  4002f0:	24040009 	li	a0,9
  4002f4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4002f8:	24060002 	li	a2,2
  4002fc:	2405003c 	li	a1,60
  400300:	2404000a 	li	a0,10
  400304:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400308:	24060005 	li	a2,5
  40030c:	24050049 	li	a1,73
  400310:	2404000b 	li	a0,11
  400314:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400318:	24060003 	li	a2,3
  40031c:	24050015 	li	a1,21
  400320:	2404000c 	li	a0,12
  400324:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400328:	24060014 	li	a2,20
  40032c:	2405000f 	li	a1,15
  400330:	2404000d 	li	a0,13
  400334:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400338:	24060007 	li	a2,7
  40033c:	24050038 	li	a1,56
  400340:	2404000e 	li	a0,14
  400344:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400348:	24060017 	li	a2,23
  40034c:	2405001e 	li	a1,30
  400350:	2404000f 	li	a0,15
  400354:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400358:	2406001b 	li	a2,27
  40035c:	24050013 	li	a1,19
  400360:	24040010 	li	a0,16
  400364:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400368:	24060005 	li	a2,5
  40036c:	2405004b 	li	a1,75
  400370:	24040011 	li	a0,17
  400374:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400378:	24060015 	li	a2,21
  40037c:	2405002f 	li	a1,47
  400380:	24040012 	li	a0,18
  400384:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400388:	2406000f 	li	a2,15
  40038c:	24050043 	li	a1,67
  400390:	24040013 	li	a0,19
  400394:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400398:	24060012 	li	a2,18
  40039c:	2405001f 	li	a1,31
  4003a0:	24040014 	li	a0,20
  4003a4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003a8:	24060013 	li	a2,19
  4003ac:	24050035 	li	a1,53
  4003b0:	24040015 	li	a0,21
  4003b4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003b8:	2406000a 	li	a2,10
  4003bc:	2405001c 	li	a1,28
  4003c0:	24040016 	li	a0,22
  4003c4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003c8:	24060009 	li	a2,9
  4003cc:	24050022 	li	a1,34
  4003d0:	24040017 	li	a0,23
  4003d4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003d8:	24060016 	li	a2,22
  4003dc:	2405002c 	li	a1,44
  4003e0:	24040018 	li	a0,24
  4003e4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003e8:	2406001d 	li	a2,29
  4003ec:	2405003d 	li	a1,61
  4003f0:	24040019 	li	a0,25
  4003f4:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  4003f8:	2406000b 	li	a2,11
  4003fc:	2405003e 	li	a1,62
  400400:	2404001a 	li	a0,26
  400404:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400408:	24060013 	li	a2,19
  40040c:	24050044 	li	a1,68
  400410:	2404001b 	li	a0,27
  400414:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400418:	2406001c 	li	a2,28
  40041c:	2405004f 	li	a1,79
  400420:	2404001c 	li	a0,28
  400424:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400428:	2405004f 	li	a1,79
  40042c:	2406001d 	li	a2,29
  400430:	2404001d 	li	a0,29
  400434:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400438:	3c021001 	lui	v0,0x1001
  40043c:	244204ac 	addiu	v0,v0,1196
  400440:	9045003c 	lbu	a1,60(v0)
  400444:	10a00007 	beqz	a1,400464 <paintFungus+0x22c>
  400448:	240300c7 	li	v1,199
  40044c:	10a30005 	beq	a1,v1,400464 <paintFungus+0x22c>
  400450:	240300fa 	li	v1,250
  400454:	10a30003 	beq	a1,v1,400464 <paintFungus+0x22c>
  400458:	9046003d 	lbu	a2,61(v0)
  40045c:	2404001e 	li	a0,30
  400460:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400464:	93a50010 	lbu	a1,16(sp)
  400468:	93a40011 	lbu	a0,17(sp)
  40046c:	0c1005e2 	jal	401788 <set_color>
  400470:	8fbf001c 	lw	ra,28(sp)
  400474:	27bd0020 	addiu	sp,sp,32
  400478:	03e00008 	jr	ra

0040047c <initializeCentipede>:
  40047c:	3c021001 	lui	v0,0x1001
  400480:	24420368 	addiu	v0,v0,872
  400484:	00001825 	move	v1,zero
  400488:	00402825 	move	a1,v0
  40048c:	24040001 	li	a0,1
  400490:	24090002 	li	t1,2
  400494:	24080003 	li	t0,3
  400498:	24070005 	li	a3,5
  40049c:	24060014 	li	a2,20
  4004a0:	246a0009 	addiu	t2,v1,9
  4004a4:	24630001 	addiu	v1,v1,1
  4004a8:	306300ff 	andi	v1,v1,0xff
  4004ac:	a04a0000 	sb	t2,0(v0)
  4004b0:	a0440001 	sb	a0,1(v0)
  4004b4:	ac490004 	sw	t1,4(v0)
  4004b8:	ac480008 	sw	t0,8(v0)
  4004bc:	ac47000c 	sw	a3,12(v0)
  4004c0:	a0400002 	sb	zero,2(v0)
  4004c4:	24420010 	addiu	v0,v0,16
  4004c8:	14660004 	bne	v1,a2,4004dc <initializeCentipede+0x60>
  4004cc:	3c021001 	lui	v0,0x1001
  4004d0:	a0a40003 	sb	a0,3(a1)
  4004d4:	a04304eb 	sb	v1,1259(v0)
  4004d8:	03e00008 	jr	ra
  4004dc:	a0400003 	sb	zero,3(v0)
  4004e0:	1000ffef 	b	4004a0 <initializeCentipede+0x24>

004004e4 <is_going_to_hit_a_fungus>:
  4004e4:	3c021001 	lui	v0,0x1001
  4004e8:	244204ac 	addiu	v0,v0,1196
  4004ec:	2443003e 	addiu	v1,v0,62
  4004f0:	90460000 	lbu	a2,0(v0)
  4004f4:	14c40002 	bne	a2,a0,400500 <is_going_to_hit_a_fungus+0x1c>
  4004f8:	90460001 	lbu	a2,1(v0)
  4004fc:	10c50004 	beq	a2,a1,400510 <is_going_to_hit_a_fungus+0x2c>
  400500:	24420002 	addiu	v0,v0,2
  400504:	1443fffa 	bne	v0,v1,4004f0 <is_going_to_hit_a_fungus+0xc>
  400508:	00001025 	move	v0,zero
  40050c:	03e00008 	jr	ra
  400510:	24020001 	li	v0,1
  400514:	03e00008 	jr	ra

00400518 <clearPosition>:
  400518:	27bdffe8 	addiu	sp,sp,-24
  40051c:	00041402 	srl	v0,a0,0x10
  400520:	00042e02 	srl	a1,a0,0x18
  400524:	afa40018 	sw	a0,24(sp)
  400528:	304400ff 	andi	a0,v0,0xff
  40052c:	afbf0014 	sw	ra,20(sp)
  400530:	0c1005f0 	jal	4017c0 <set_cursor>
  400534:	8fbf0014 	lw	ra,20(sp)
  400538:	240400ff 	li	a0,255
  40053c:	27bd0018 	addiu	sp,sp,24
  400540:	081005f9 	j	4017e4 <put_char>

00400544 <HandleCentipede>:
  400544:	27bdffc8 	addiu	sp,sp,-56
  400548:	afb00010 	sw	s0,16(sp)
  40054c:	3c101001 	lui	s0,0x1001
  400550:	26100368 	addiu	s0,s0,872
  400554:	afb7002c 	sw	s7,44(sp)
  400558:	afb60028 	sw	s6,40(sp)
  40055c:	afb50024 	sw	s5,36(sp)
  400560:	afb40020 	sw	s4,32(sp)
  400564:	afb3001c 	sw	s3,28(sp)
  400568:	afb20018 	sw	s2,24(sp)
  40056c:	afb10014 	sw	s1,20(sp)
  400570:	afbf0034 	sw	ra,52(sp)
  400574:	afbe0030 	sw	s8,48(sp)
  400578:	0000a025 	move	s4,zero
  40057c:	0200b025 	move	s6,s0
  400580:	24150005 	li	s5,5
  400584:	24110002 	li	s1,2
  400588:	24120003 	li	s2,3
  40058c:	2417004f 	li	s7,79
  400590:	24130001 	li	s3,1
  400594:	92020002 	lbu	v0,2(s0)
  400598:	14400022 	bnez	v0,400624 <HandleCentipede+0xe0>
  40059c:	0014f100 	sll	s8,s4,0x4
  4005a0:	02de1021 	addu	v0,s6,s8
  4005a4:	8c440000 	lw	a0,0(v0)
  4005a8:	0c100146 	jal	400518 <clearPosition>
  4005ac:	8e03000c 	lw	v1,12(s0)
  4005b0:	8e020004 	lw	v0,4(s0)
  4005b4:	14750047 	bne	v1,s5,4006d4 <HandleCentipede+0x190>
  4005b8:	1451002a 	bne	v0,s1,400664 <HandleCentipede+0x120>
  4005bc:	92040000 	lbu	a0,0(s0)
  4005c0:	92050001 	lbu	a1,1(s0)
  4005c4:	10800004 	beqz	a0,4005d8 <HandleCentipede+0x94>
  4005c8:	2484ffff 	addiu	a0,a0,-1
  4005cc:	308400ff 	andi	a0,a0,0xff
  4005d0:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4005d4:	1040005f 	beqz	v0,400754 <HandleCentipede+0x210>
  4005d8:	2402001d 	li	v0,29
  4005dc:	14a20007 	bne	a1,v0,4005fc <HandleCentipede+0xb8>
  4005e0:	2402001c 	li	v0,28
  4005e4:	a2020001 	sb	v0,1(s0)
  4005e8:	24020004 	li	v0,4
  4005ec:	ae02000c 	sw	v0,12(s0)
  4005f0:	ae110008 	sw	s1,8(s0)
  4005f4:	ae000004 	sw	zero,4(s0)
  4005f8:	10000004 	b	40060c <HandleCentipede+0xc8>
  4005fc:	24a50001 	addiu	a1,a1,1
  400600:	a2050001 	sb	a1,1(s0)
  400604:	ae110008 	sw	s1,8(s0)
  400608:	ae130004 	sw	s3,4(s0)
  40060c:	02de1021 	addu	v0,s6,s8
  400610:	8c440000 	lw	a0,0(v0)
  400614:	8c450004 	lw	a1,4(v0)
  400618:	8c460008 	lw	a2,8(v0)
  40061c:	8c47000c 	lw	a3,12(v0)
  400620:	0c10004b 	jal	40012c <paintCentipede>
  400624:	26940001 	addiu	s4,s4,1
  400628:	24020014 	li	v0,20
  40062c:	26100010 	addiu	s0,s0,16
  400630:	1682ffd8 	bne	s4,v0,400594 <HandleCentipede+0x50>
  400634:	8fbf0034 	lw	ra,52(sp)
  400638:	8fbe0030 	lw	s8,48(sp)
  40063c:	8fb7002c 	lw	s7,44(sp)
  400640:	8fb60028 	lw	s6,40(sp)
  400644:	8fb50024 	lw	s5,36(sp)
  400648:	8fb40020 	lw	s4,32(sp)
  40064c:	8fb3001c 	lw	s3,28(sp)
  400650:	8fb20018 	lw	s2,24(sp)
  400654:	8fb10014 	lw	s1,20(sp)
  400658:	8fb00010 	lw	s0,16(sp)
  40065c:	27bd0038 	addiu	sp,sp,56
  400660:	03e00008 	jr	ra
  400664:	14520013 	bne	v0,s2,4006b4 <HandleCentipede+0x170>
  400668:	92040000 	lbu	a0,0(s0)
  40066c:	92050001 	lbu	a1,1(s0)
  400670:	10970004 	beq	a0,s7,400684 <HandleCentipede+0x140>
  400674:	24840001 	addiu	a0,a0,1
  400678:	308400ff 	andi	a0,a0,0xff
  40067c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400680:	10400034 	beqz	v0,400754 <HandleCentipede+0x210>
  400684:	2402001d 	li	v0,29
  400688:	14a20006 	bne	a1,v0,4006a4 <HandleCentipede+0x160>
  40068c:	2402001c 	li	v0,28
  400690:	a2020001 	sb	v0,1(s0)
  400694:	24020004 	li	v0,4
  400698:	ae02000c 	sw	v0,12(s0)
  40069c:	ae120008 	sw	s2,8(s0)
  4006a0:	1000ffd4 	b	4005f4 <HandleCentipede+0xb0>
  4006a4:	24a50001 	addiu	a1,a1,1
  4006a8:	a2050001 	sb	a1,1(s0)
  4006ac:	ae120008 	sw	s2,8(s0)
  4006b0:	1000ffd5 	b	400608 <HandleCentipede+0xc4>
  4006b4:	1453ffd5 	bne	v0,s3,40060c <HandleCentipede+0xc8>
  4006b8:	8e030008 	lw	v1,8(s0)
  4006bc:	92020000 	lbu	v0,0(s0)
  4006c0:	14710028 	bne	v1,s1,400764 <HandleCentipede+0x220>
  4006c4:	ae120004 	sw	s2,4(s0)
  4006c8:	24420001 	addiu	v0,v0,1
  4006cc:	a2020000 	sb	v0,0(s0)
  4006d0:	1000ffce 	b	40060c <HandleCentipede+0xc8>
  4006d4:	1451000f 	bne	v0,s1,400714 <HandleCentipede+0x1d0>
  4006d8:	92040000 	lbu	a0,0(s0)
  4006dc:	92050001 	lbu	a1,1(s0)
  4006e0:	10800004 	beqz	a0,4006f4 <HandleCentipede+0x1b0>
  4006e4:	2484ffff 	addiu	a0,a0,-1
  4006e8:	308400ff 	andi	a0,a0,0xff
  4006ec:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4006f0:	10400018 	beqz	v0,400754 <HandleCentipede+0x210>
  4006f4:	14b30004 	bne	a1,s3,400708 <HandleCentipede+0x1c4>
  4006f8:	24020002 	li	v0,2
  4006fc:	a2020001 	sb	v0,1(s0)
  400700:	ae15000c 	sw	s5,12(s0)
  400704:	1000ffbf 	b	400604 <HandleCentipede+0xc0>
  400708:	24a5ffff 	addiu	a1,a1,-1
  40070c:	a2050001 	sb	a1,1(s0)
  400710:	1000ffb7 	b	4005f0 <HandleCentipede+0xac>
  400714:	14520011 	bne	v0,s2,40075c <HandleCentipede+0x218>
  400718:	92040000 	lbu	a0,0(s0)
  40071c:	92050001 	lbu	a1,1(s0)
  400720:	10970004 	beq	a0,s7,400734 <HandleCentipede+0x1f0>
  400724:	24840001 	addiu	a0,a0,1
  400728:	308400ff 	andi	a0,a0,0xff
  40072c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400730:	10400008 	beqz	v0,400754 <HandleCentipede+0x210>
  400734:	14b30004 	bne	a1,s3,400748 <HandleCentipede+0x204>
  400738:	24020002 	li	v0,2
  40073c:	a2020001 	sb	v0,1(s0)
  400740:	ae15000c 	sw	s5,12(s0)
  400744:	1000ffd9 	b	4006ac <HandleCentipede+0x168>
  400748:	24a5ffff 	addiu	a1,a1,-1
  40074c:	a2050001 	sb	a1,1(s0)
  400750:	1000ffd2 	b	40069c <HandleCentipede+0x158>
  400754:	a2040000 	sb	a0,0(s0)
  400758:	1000ffac 	b	40060c <HandleCentipede+0xc8>
  40075c:	1440ffab 	bnez	v0,40060c <HandleCentipede+0xc8>
  400760:	1000ffd5 	b	4006b8 <HandleCentipede+0x174>
  400764:	ae110004 	sw	s1,4(s0)
  400768:	2442ffff 	addiu	v0,v0,-1
  40076c:	1000ffd7 	b	4006cc <HandleCentipede+0x188>

00400770 <HandleSpider>:
  400770:	27bdffe8 	addiu	sp,sp,-24
  400774:	afb00010 	sw	s0,16(sp)
  400778:	3c101001 	lui	s0,0x1001
  40077c:	8e040358 	lw	a0,856(s0)
  400780:	afbf0014 	sw	ra,20(sp)
  400784:	0c100146 	jal	400518 <clearPosition>
  400788:	92020358 	lbu	v0,856(s0)
  40078c:	24420001 	addiu	v0,v0,1
  400790:	a2020358 	sb	v0,856(s0)
  400794:	8e040358 	lw	a0,856(s0)
  400798:	0c100146 	jal	400518 <clearPosition>
  40079c:	92080358 	lbu	t0,856(s0)
  4007a0:	26070358 	addiu	a3,s0,856
  4007a4:	250bffff 	addiu	t3,t0,-1
  4007a8:	8ce2000c 	lw	v0,12(a3)
  4007ac:	316b00ff 	andi	t3,t3,0xff
  4007b0:	24030004 	li	v1,4
  4007b4:	a20b0358 	sb	t3,856(s0)
  4007b8:	02005025 	move	t2,s0
  4007bc:	14430034 	bne	v0,v1,400890 <HandleSpider+0x120>
  4007c0:	8cec0004 	lw	t4,4(a3)
  4007c4:	240d0002 	li	t5,2
  4007c8:	158d001c 	bne	t4,t5,40083c <HandleSpider+0xcc>
  4007cc:	90e90001 	lbu	t1,1(a3)
  4007d0:	2508fffe 	addiu	t0,t0,-2
  4007d4:	240d0001 	li	t5,1
  4007d8:	310800ff 	andi	t0,t0,0xff
  4007dc:	112d0008 	beq	t1,t5,400800 <HandleSpider+0x90>
  4007e0:	2525ffff 	addiu	a1,t1,-1
  4007e4:	30a500ff 	andi	a1,a1,0xff
  4007e8:	01002025 	move	a0,t0
  4007ec:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4007f0:	14400003 	bnez	v0,400800 <HandleSpider+0x90>
  4007f4:	01602025 	move	a0,t3
  4007f8:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4007fc:	10400006 	beqz	v0,400818 <HandleSpider+0xa8>
  400800:	24020005 	li	v0,5
  400804:	ace2000c 	sw	v0,12(a3)
  400808:	25290001 	addiu	t1,t1,1
  40080c:	a0e90001 	sb	t1,1(a3)
  400810:	a1480358 	sb	t0,856(t2)
  400814:	10000005 	b	40082c <HandleSpider+0xbc>
  400818:	156d0048 	bne	t3,t5,40093c <HandleSpider+0x1cc>
  40081c:	24020003 	li	v0,3
  400820:	ace20004 	sw	v0,4(a3)
  400824:	a0e50001 	sb	a1,1(a3)
  400828:	a20c0358 	sb	t4,856(s0)
  40082c:	8fbf0014 	lw	ra,20(sp)
  400830:	8fb00010 	lw	s0,16(sp)
  400834:	27bd0018 	addiu	sp,sp,24
  400838:	03e00008 	jr	ra
  40083c:	24020003 	li	v0,3
  400840:	1582fffa 	bne	t4,v0,40082c <HandleSpider+0xbc>
  400844:	90e90001 	lbu	t1,1(a3)
  400848:	24020001 	li	v0,1
  40084c:	1122ffec 	beq	t1,v0,400800 <HandleSpider+0x90>
  400850:	2525ffff 	addiu	a1,t1,-1
  400854:	30a500ff 	andi	a1,a1,0xff
  400858:	01002025 	move	a0,t0
  40085c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400860:	1440ffe7 	bnez	v0,400800 <HandleSpider+0x90>
  400864:	25040001 	addiu	a0,t0,1
  400868:	308400ff 	andi	a0,a0,0xff
  40086c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400870:	1440ffe3 	bnez	v0,400800 <HandleSpider+0x90>
  400874:	2402004f 	li	v0,79
  400878:	1562001d 	bne	t3,v0,4008f0 <HandleSpider+0x180>
  40087c:	2402004e 	li	v0,78
  400880:	aced0004 	sw	t5,4(a3)
  400884:	a0e50001 	sb	a1,1(a3)
  400888:	a2020358 	sb	v0,856(s0)
  40088c:	1000ffe7 	b	40082c <HandleSpider+0xbc>
  400890:	24030005 	li	v1,5
  400894:	1443ffe5 	bne	v0,v1,40082c <HandleSpider+0xbc>
  400898:	8cec0004 	lw	t4,4(a3)
  40089c:	240d0002 	li	t5,2
  4008a0:	158d0016 	bne	t4,t5,4008fc <HandleSpider+0x18c>
  4008a4:	90e90001 	lbu	t1,1(a3)
  4008a8:	2508fffe 	addiu	t0,t0,-2
  4008ac:	2402001d 	li	v0,29
  4008b0:	310800ff 	andi	t0,t0,0xff
  4008b4:	11220008 	beq	t1,v0,4008d8 <HandleSpider+0x168>
  4008b8:	25250001 	addiu	a1,t1,1
  4008bc:	30a500ff 	andi	a1,a1,0xff
  4008c0:	01002025 	move	a0,t0
  4008c4:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4008c8:	14400003 	bnez	v0,4008d8 <HandleSpider+0x168>
  4008cc:	01602025 	move	a0,t3
  4008d0:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4008d4:	10400004 	beqz	v0,4008e8 <HandleSpider+0x178>
  4008d8:	24020004 	li	v0,4
  4008dc:	ace2000c 	sw	v0,12(a3)
  4008e0:	2529ffff 	addiu	t1,t1,-1
  4008e4:	1000ffc9 	b	40080c <HandleSpider+0x9c>
  4008e8:	24020001 	li	v0,1
  4008ec:	1162ffcb 	beq	t3,v0,40081c <HandleSpider+0xac>
  4008f0:	a2080358 	sb	t0,856(s0)
  4008f4:	a0e50001 	sb	a1,1(a3)
  4008f8:	1000ffcc 	b	40082c <HandleSpider+0xbc>
  4008fc:	24020003 	li	v0,3
  400900:	1582ffca 	bne	t4,v0,40082c <HandleSpider+0xbc>
  400904:	90e90001 	lbu	t1,1(a3)
  400908:	2402001d 	li	v0,29
  40090c:	1122fff2 	beq	t1,v0,4008d8 <HandleSpider+0x168>
  400910:	25250001 	addiu	a1,t1,1
  400914:	30a500ff 	andi	a1,a1,0xff
  400918:	01002025 	move	a0,t0
  40091c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400920:	1440ffed 	bnez	v0,4008d8 <HandleSpider+0x168>
  400924:	25040001 	addiu	a0,t0,1
  400928:	308400ff 	andi	a0,a0,0xff
  40092c:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400930:	1440ffe9 	bnez	v0,4008d8 <HandleSpider+0x168>
  400934:	2402004f 	li	v0,79
  400938:	1162ffd0 	beq	t3,v0,40087c <HandleSpider+0x10c>
  40093c:	a0e50001 	sb	a1,1(a3)
  400940:	a2080358 	sb	t0,856(s0)
  400944:	1000ffb9 	b	40082c <HandleSpider+0xbc>

00400948 <HandlePlayer>:
  400948:	27bdffe0 	addiu	sp,sp,-32
  40094c:	afbf001c 	sw	ra,28(sp)
  400950:	afb20018 	sw	s2,24(sp)
  400954:	afb10014 	sw	s1,20(sp)
  400958:	afb00010 	sw	s0,16(sp)
  40095c:	0c1005b7 	jal	4016dc <keypad_getkey>
  400960:	00408025 	move	s0,v0
  400964:	3c02ffff 	lui	v0,0xffff
  400968:	90520004 	lbu	s2,4(v0)
  40096c:	00002825 	move	a1,zero
  400970:	325100ff 	andi	s1,s2,0xff
  400974:	00002025 	move	a0,zero
  400978:	0c1005f0 	jal	4017c0 <set_cursor>
  40097c:	2e22000a 	sltiu	v0,s1,10
  400980:	001291c2 	srl	s2,s2,0x7
  400984:	10400010 	beqz	v0,4009c8 <HandlePlayer+0x80>
  400988:	26310030 	addiu	s1,s1,48
  40098c:	322400ff 	andi	a0,s1,0xff
  400990:	0c1005f9 	jal	4017e4 <put_char>
  400994:	26440030 	addiu	a0,s2,48
  400998:	0c1005f9 	jal	4017e4 <put_char>
  40099c:	12000023 	beqz	s0,400a2c <HandlePlayer+0xe4>
  4009a0:	2610ffff 	addiu	s0,s0,-1
  4009a4:	321000ff 	andi	s0,s0,0xff
  4009a8:	2e020008 	sltiu	v0,s0,8
  4009ac:	1040001f 	beqz	v0,400a2c <HandlePlayer+0xe4>
  4009b0:	3c021001 	lui	v0,0x1001
  4009b4:	24420000 	addiu	v0,v0,0
  4009b8:	00108080 	sll	s0,s0,0x2
  4009bc:	00508021 	addu	s0,v0,s0
  4009c0:	8e020000 	lw	v0,0(s0)
  4009c4:	00400008 	jr	v0
  4009c8:	26310057 	addiu	s1,s1,87
  4009cc:	1000ffef 	b	40098c <HandlePlayer+0x44>
  4009d0:	3c101001 	lui	s0,0x1001
  4009d4:	92070354 	lbu	a3,852(s0)
  4009d8:	10e0000e 	beqz	a3,400a14 <HandlePlayer+0xcc>
  4009dc:	26020354 	addiu	v0,s0,852
  4009e0:	24e4ffff 	addiu	a0,a3,-1
  4009e4:	90450001 	lbu	a1,1(v0)
  4009e8:	308400ff 	andi	a0,a0,0xff
  4009ec:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  4009f0:	14400008 	bnez	v0,400a14 <HandlePlayer+0xcc>
  4009f4:	92040355 	lbu	a0,853(s0)
  4009f8:	00073a00 	sll	a3,a3,0x8
  4009fc:	00872025 	or	a0,a0,a3
  400a00:	00042400 	sll	a0,a0,0x10
  400a04:	0c100146 	jal	400518 <clearPosition>
  400a08:	92020354 	lbu	v0,852(s0)
  400a0c:	2442ffff 	addiu	v0,v0,-1
  400a10:	a2020354 	sb	v0,852(s0)
  400a14:	12400005 	beqz	s2,400a2c <HandlePlayer+0xe4>
  400a18:	24020001 	li	v0,1
  400a1c:	3c031001 	lui	v1,0x1001
  400a20:	a062034d 	sb	v0,845(v1)
  400a24:	3c031001 	lui	v1,0x1001
  400a28:	a062034c 	sb	v0,844(v1)
  400a2c:	8fbf001c 	lw	ra,28(sp)
  400a30:	8fb20018 	lw	s2,24(sp)
  400a34:	8fb10014 	lw	s1,20(sp)
  400a38:	8fb00010 	lw	s0,16(sp)
  400a3c:	27bd0020 	addiu	sp,sp,32
  400a40:	03e00008 	jr	ra
  400a44:	3c101001 	lui	s0,0x1001
  400a48:	92070354 	lbu	a3,852(s0)
  400a4c:	2ce2004f 	sltiu	v0,a3,79
  400a50:	1040fff0 	beqz	v0,400a14 <HandlePlayer+0xcc>
  400a54:	26020354 	addiu	v0,s0,852
  400a58:	24e40001 	addiu	a0,a3,1
  400a5c:	90450001 	lbu	a1,1(v0)
  400a60:	308400ff 	andi	a0,a0,0xff
  400a64:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400a68:	1440ffea 	bnez	v0,400a14 <HandlePlayer+0xcc>
  400a6c:	92040355 	lbu	a0,853(s0)
  400a70:	00073a00 	sll	a3,a3,0x8
  400a74:	00872025 	or	a0,a0,a3
  400a78:	00042400 	sll	a0,a0,0x10
  400a7c:	0c100146 	jal	400518 <clearPosition>
  400a80:	92020354 	lbu	v0,852(s0)
  400a84:	24420001 	addiu	v0,v0,1
  400a88:	1000ffe1 	b	400a10 <HandlePlayer+0xc8>
  400a8c:	3c071001 	lui	a3,0x1001
  400a90:	24f00354 	addiu	s0,a3,852
  400a94:	92050001 	lbu	a1,1(s0)
  400a98:	2ca2001d 	sltiu	v0,a1,29
  400a9c:	1040ffdd 	beqz	v0,400a14 <HandlePlayer+0xcc>
  400aa0:	24a50001 	addiu	a1,a1,1
  400aa4:	90e40354 	lbu	a0,852(a3)
  400aa8:	30a500ff 	andi	a1,a1,0xff
  400aac:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400ab0:	1440ffd8 	bnez	v0,400a14 <HandlePlayer+0xcc>
  400ab4:	90e20355 	lbu	v0,853(a3)
  400ab8:	00042200 	sll	a0,a0,0x8
  400abc:	00442025 	or	a0,v0,a0
  400ac0:	00042400 	sll	a0,a0,0x10
  400ac4:	0c100146 	jal	400518 <clearPosition>
  400ac8:	92020001 	lbu	v0,1(s0)
  400acc:	24420001 	addiu	v0,v0,1
  400ad0:	a2020001 	sb	v0,1(s0)
  400ad4:	1000ffcf 	b	400a14 <HandlePlayer+0xcc>
  400ad8:	3c071001 	lui	a3,0x1001
  400adc:	24f00354 	addiu	s0,a3,852
  400ae0:	92050001 	lbu	a1,1(s0)
  400ae4:	10a0ffcb 	beqz	a1,400a14 <HandlePlayer+0xcc>
  400ae8:	24a5ffff 	addiu	a1,a1,-1
  400aec:	90e40354 	lbu	a0,852(a3)
  400af0:	30a500ff 	andi	a1,a1,0xff
  400af4:	0c100139 	jal	4004e4 <is_going_to_hit_a_fungus>
  400af8:	1440ffc6 	bnez	v0,400a14 <HandlePlayer+0xcc>
  400afc:	90e20355 	lbu	v0,853(a3)
  400b00:	00042200 	sll	a0,a0,0x8
  400b04:	00442025 	or	a0,v0,a0
  400b08:	00042400 	sll	a0,a0,0x10
  400b0c:	0c100146 	jal	400518 <clearPosition>
  400b10:	92020001 	lbu	v0,1(s0)
  400b14:	2442ffff 	addiu	v0,v0,-1
  400b18:	1000ffed 	b	400ad0 <HandlePlayer+0x188>

00400b1c <bullet_and_fungus_collision_detector>:
  400b1c:	27bdffe0 	addiu	sp,sp,-32
  400b20:	afb00014 	sw	s0,20(sp)
  400b24:	3c101001 	lui	s0,0x1001
  400b28:	afb10018 	sw	s1,24(sp)
  400b2c:	3c021001 	lui	v0,0x1001
  400b30:	26110350 	addiu	s1,s0,848
  400b34:	244204ac 	addiu	v0,v0,1196
  400b38:	92060350 	lbu	a2,848(s0)
  400b3c:	92270001 	lbu	a3,1(s1)
  400b40:	afbf001c 	sw	ra,28(sp)
  400b44:	00001825 	move	v1,zero
  400b48:	00402025 	move	a0,v0
  400b4c:	2405001f 	li	a1,31
  400b50:	90480000 	lbu	t0,0(v0)
  400b54:	1506001b 	bne	t0,a2,400bc4 <bullet_and_fungus_collision_detector+0xa8>
  400b58:	90480001 	lbu	t0,1(v0)
  400b5c:	15070019 	bne	t0,a3,400bc4 <bullet_and_fungus_collision_detector+0xa8>
  400b60:	3c051001 	lui	a1,0x1001
  400b64:	90a204a8 	lbu	v0,1192(a1)
  400b68:	00031840 	sll	v1,v1,0x1
  400b6c:	00831821 	addu	v1,a0,v1
  400b70:	24420001 	addiu	v0,v0,1
  400b74:	92040350 	lbu	a0,848(s0)
  400b78:	a0a204a8 	sb	v0,1192(a1)
  400b7c:	2402fffa 	li	v0,-6
  400b80:	a0620001 	sb	v0,1(v1)
  400b84:	a0620000 	sb	v0,0(v1)
  400b88:	00041200 	sll	v0,a0,0x8
  400b8c:	92040351 	lbu	a0,849(s0)
  400b90:	00822025 	or	a0,a0,v0
  400b94:	00042400 	sll	a0,a0,0x10
  400b98:	0c100146 	jal	400518 <clearPosition>
  400b9c:	2402ffe6 	li	v0,-26
  400ba0:	a2220001 	sb	v0,1(s1)
  400ba4:	a2020350 	sb	v0,848(s0)
  400ba8:	3c021001 	lui	v0,0x1001
  400bac:	a040034c 	sb	zero,844(v0)
  400bb0:	8fbf001c 	lw	ra,28(sp)
  400bb4:	8fb10018 	lw	s1,24(sp)
  400bb8:	8fb00014 	lw	s0,20(sp)
  400bbc:	27bd0020 	addiu	sp,sp,32
  400bc0:	03e00008 	jr	ra
  400bc4:	24630001 	addiu	v1,v1,1
  400bc8:	24420002 	addiu	v0,v0,2
  400bcc:	1465ffe0 	bne	v1,a1,400b50 <bullet_and_fungus_collision_detector+0x34>
  400bd0:	1000fff7 	b	400bb0 <bullet_and_fungus_collision_detector+0x94>

00400bd4 <bullet_and_spider_collision_detector>:
  400bd4:	27bdffd8 	addiu	sp,sp,-40
  400bd8:	afb30020 	sw	s3,32(sp)
  400bdc:	afb00014 	sw	s0,20(sp)
  400be0:	3c131001 	lui	s3,0x1001
  400be4:	3c101001 	lui	s0,0x1001
  400be8:	92630350 	lbu	v1,848(s3)
  400bec:	92020358 	lbu	v0,856(s0)
  400bf0:	afbf0024 	sw	ra,36(sp)
  400bf4:	afb2001c 	sw	s2,28(sp)
  400bf8:	afb10018 	sw	s1,24(sp)
  400bfc:	10620002 	beq	v1,v0,400c08 <bullet_and_spider_collision_detector+0x34>
  400c00:	24420001 	addiu	v0,v0,1
  400c04:	14620035 	bne	v1,v0,400cdc <bullet_and_spider_collision_detector+0x108>
  400c08:	26720350 	addiu	s2,s3,848
  400c0c:	26110358 	addiu	s1,s0,856
  400c10:	92430001 	lbu	v1,1(s2)
  400c14:	92220001 	lbu	v0,1(s1)
  400c18:	14620030 	bne	v1,v0,400cdc <bullet_and_spider_collision_detector+0x108>
  400c1c:	24050004 	li	a1,4
  400c20:	00002025 	move	a0,zero
  400c24:	0c1005f0 	jal	4017c0 <set_cursor>
  400c28:	3c041001 	lui	a0,0x1001
  400c2c:	24840020 	addiu	a0,a0,32
  400c30:	0c10061a 	jal	401868 <puts>
  400c34:	8e040358 	lw	a0,856(s0)
  400c38:	0c100146 	jal	400518 <clearPosition>
  400c3c:	92020358 	lbu	v0,856(s0)
  400c40:	24420001 	addiu	v0,v0,1
  400c44:	a2020358 	sb	v0,856(s0)
  400c48:	8e040358 	lw	a0,856(s0)
  400c4c:	0c100146 	jal	400518 <clearPosition>
  400c50:	3c021001 	lui	v0,0x1001
  400c54:	92230001 	lbu	v1,1(s1)
  400c58:	90420355 	lbu	v0,853(v0)
  400c5c:	24110008 	li	s1,8
  400c60:	00431023 	subu	v0,v0,v1
  400c64:	28430009 	slti	v1,v0,9
  400c68:	10600004 	beqz	v1,400c7c <bullet_and_spider_collision_detector+0xa8>
  400c6c:	28420006 	slti	v0,v0,6
  400c70:	24110006 	li	s1,6
  400c74:	10400001 	beqz	v0,400c7c <bullet_and_spider_collision_detector+0xa8>
  400c78:	24110004 	li	s1,4
  400c7c:	3c031001 	lui	v1,0x1001
  400c80:	906204a8 	lbu	v0,1192(v1)
  400c84:	92640350 	lbu	a0,848(s3)
  400c88:	02221021 	addu	v0,s1,v0
  400c8c:	a06204a8 	sb	v0,1192(v1)
  400c90:	3c02ffff 	lui	v0,0xffff
  400c94:	8c420008 	lw	v0,8(v0)
  400c98:	24020028 	li	v0,40
  400c9c:	a2020358 	sb	v0,856(s0)
  400ca0:	00041200 	sll	v0,a0,0x8
  400ca4:	92640351 	lbu	a0,849(s3)
  400ca8:	00822025 	or	a0,a0,v0
  400cac:	00042400 	sll	a0,a0,0x10
  400cb0:	0c100146 	jal	400518 <clearPosition>
  400cb4:	92650350 	lbu	a1,848(s3)
  400cb8:	92440001 	lbu	a0,1(s2)
  400cbc:	0c1005f0 	jal	4017c0 <set_cursor>
  400cc0:	26240030 	addiu	a0,s1,48
  400cc4:	0c1005f9 	jal	4017e4 <put_char>
  400cc8:	2402ffd1 	li	v0,-47
  400ccc:	a2420001 	sb	v0,1(s2)
  400cd0:	a2620350 	sb	v0,848(s3)
  400cd4:	3c021001 	lui	v0,0x1001
  400cd8:	a040034c 	sb	zero,844(v0)
  400cdc:	8fbf0024 	lw	ra,36(sp)
  400ce0:	8fb30020 	lw	s3,32(sp)
  400ce4:	8fb2001c 	lw	s2,28(sp)
  400ce8:	8fb10018 	lw	s1,24(sp)
  400cec:	8fb00014 	lw	s0,20(sp)
  400cf0:	27bd0028 	addiu	sp,sp,40
  400cf4:	03e00008 	jr	ra

00400cf8 <bullet_and_centipede_collision_detector>:
  400cf8:	27bdffb0 	addiu	sp,sp,-80
  400cfc:	3c021001 	lui	v0,0x1001
  400d00:	afbe0048 	sw	s8,72(sp)
  400d04:	afb1002c 	sw	s1,44(sp)
  400d08:	afb00028 	sw	s0,40(sp)
  400d0c:	245e0368 	addiu	s8,v0,872
  400d10:	3c101001 	lui	s0,0x1001
  400d14:	3c111001 	lui	s1,0x1001
  400d18:	afb60040 	sw	s6,64(sp)
  400d1c:	afb5003c 	sw	s5,60(sp)
  400d20:	afb40038 	sw	s4,56(sp)
  400d24:	afbf004c 	sw	ra,76(sp)
  400d28:	afb70044 	sw	s7,68(sp)
  400d2c:	afb30034 	sw	s3,52(sp)
  400d30:	afb20030 	sw	s2,48(sp)
  400d34:	00001825 	move	v1,zero
  400d38:	03c0a025 	move	s4,s8
  400d3c:	26150350 	addiu	s5,s0,848
  400d40:	3c161001 	lui	s6,0x1001
  400d44:	2631003c 	addiu	s1,s1,60
  400d48:	93c40002 	lbu	a0,2(s8)
  400d4c:	27d20010 	addiu	s2,s8,16
  400d50:	24730001 	addiu	s3,v1,1
  400d54:	14800036 	bnez	a0,400e30 <bullet_and_centipede_collision_detector+0x138>
  400d58:	92050350 	lbu	a1,848(s0)
  400d5c:	93c40000 	lbu	a0,0(s8)
  400d60:	14a40033 	bne	a1,a0,400e30 <bullet_and_centipede_collision_detector+0x138>
  400d64:	92a50001 	lbu	a1,1(s5)
  400d68:	93c40001 	lbu	a0,1(s8)
  400d6c:	14a40030 	bne	a1,a0,400e30 <bullet_and_centipede_collision_detector+0x138>
  400d70:	92c404a8 	lbu	a0,1192(s6)
  400d74:	3c051001 	lui	a1,0x1001
  400d78:	24840001 	addiu	a0,a0,1
  400d7c:	a2c404a8 	sb	a0,1192(s6)
  400d80:	90a404eb 	lbu	a0,1259(a1)
  400d84:	00031900 	sll	v1,v1,0x4
  400d88:	02831821 	addu	v1,s4,v1
  400d8c:	2484ffff 	addiu	a0,a0,-1
  400d90:	a0a404eb 	sb	a0,1259(a1)
  400d94:	8c640000 	lw	a0,0(v1)
  400d98:	0c100146 	jal	400518 <clearPosition>
  400d9c:	93d70000 	lbu	s7,0(s8)
  400da0:	93c20001 	lbu	v0,1(s8)
  400da4:	24030001 	li	v1,1
  400da8:	a3c30002 	sb	v1,2(s8)
  400dac:	26e70014 	addiu	a3,s7,20
  400db0:	2403ffc7 	li	v1,-57
  400db4:	afa20010 	sw	v0,16(sp)
  400db8:	a3c30001 	sb	v1,1(s8)
  400dbc:	a3c30000 	sb	v1,0(s8)
  400dc0:	02402825 	move	a1,s2
  400dc4:	02603025 	move	a2,s3
  400dc8:	30e700ff 	andi	a3,a3,0xff
  400dcc:	30c300ff 	andi	v1,a2,0xff
  400dd0:	2c640014 	sltiu	a0,v1,20
  400dd4:	14800026 	bnez	a0,400e70 <bullet_and_centipede_collision_detector+0x178>
  400dd8:	92040350 	lbu	a0,848(s0)
  400ddc:	00041a00 	sll	v1,a0,0x8
  400de0:	92040351 	lbu	a0,849(s0)
  400de4:	00832025 	or	a0,a0,v1
  400de8:	00042400 	sll	a0,a0,0x10
  400dec:	0c100146 	jal	400518 <clearPosition>
  400df0:	2403ffd0 	li	v1,-48
  400df4:	93c20003 	lbu	v0,3(s8)
  400df8:	a2a30001 	sb	v1,1(s5)
  400dfc:	a2030350 	sb	v1,848(s0)
  400e00:	3c031001 	lui	v1,0x1001
  400e04:	a060034c 	sb	zero,844(v1)
  400e08:	10400009 	beqz	v0,400e30 <bullet_and_centipede_collision_detector+0x138>
  400e0c:	2405001e 	li	a1,30
  400e10:	00002025 	move	a0,zero
  400e14:	0c1005f0 	jal	4017c0 <set_cursor>
  400e18:	02202025 	move	a0,s1
  400e1c:	0c10061a 	jal	401868 <puts>
  400e20:	8fa60010 	lw	a2,16(sp)
  400e24:	02e02825 	move	a1,s7
  400e28:	2404001e 	li	a0,30
  400e2c:	0c100080 	jal	400200 <set_fungus_in_array_and_print>
  400e30:	24040014 	li	a0,20
  400e34:	02601825 	move	v1,s3
  400e38:	0240f025 	move	s8,s2
  400e3c:	1664ffc2 	bne	s3,a0,400d48 <bullet_and_centipede_collision_detector+0x50>
  400e40:	8fbf004c 	lw	ra,76(sp)
  400e44:	8fbe0048 	lw	s8,72(sp)
  400e48:	8fb70044 	lw	s7,68(sp)
  400e4c:	8fb60040 	lw	s6,64(sp)
  400e50:	8fb5003c 	lw	s5,60(sp)
  400e54:	8fb40038 	lw	s4,56(sp)
  400e58:	8fb30034 	lw	s3,52(sp)
  400e5c:	8fb20030 	lw	s2,48(sp)
  400e60:	8fb1002c 	lw	s1,44(sp)
  400e64:	8fb00028 	lw	s0,40(sp)
  400e68:	27bd0050 	addiu	sp,sp,80
  400e6c:	03e00008 	jr	ra
  400e70:	00062100 	sll	a0,a2,0x4
  400e74:	02842021 	addu	a0,s4,a0
  400e78:	8c840000 	lw	a0,0(a0)
  400e7c:	afa70020 	sw	a3,32(sp)
  400e80:	afa3001c 	sw	v1,28(sp)
  400e84:	afa50018 	sw	a1,24(sp)
  400e88:	afa60014 	sw	a2,20(sp)
  400e8c:	0c100146 	jal	400518 <clearPosition>
  400e90:	8fa50018 	lw	a1,24(sp)
  400e94:	8fa60014 	lw	a2,20(sp)
  400e98:	90a40001 	lbu	a0,1(a1)
  400e9c:	8fa3001c 	lw	v1,28(sp)
  400ea0:	2c89001c 	sltiu	t1,a0,28
  400ea4:	8fa70020 	lw	a3,32(sp)
  400ea8:	24080002 	li	t0,2
  400eac:	15200010 	bnez	t1,400ef0 <bullet_and_centipede_collision_detector+0x1f8>
  400eb0:	2484ffff 	addiu	a0,a0,-1
  400eb4:	308400ff 	andi	a0,a0,0xff
  400eb8:	a0a40001 	sb	a0,1(a1)
  400ebc:	8ca40004 	lw	a0,4(a1)
  400ec0:	1488000d 	bne	a0,t0,400ef8 <bullet_and_centipede_collision_detector+0x200>
  400ec4:	00e31823 	subu	v1,a3,v1
  400ec8:	306300ff 	andi	v1,v1,0xff
  400ecc:	a0a30000 	sb	v1,0(a1)
  400ed0:	8ca3000c 	lw	v1,12(a1)
  400ed4:	aca40008 	sw	a0,8(a1)
  400ed8:	38630005 	xori	v1,v1,0x5
  400edc:	2c630001 	sltiu	v1,v1,1
  400ee0:	aca30004 	sw	v1,4(a1)
  400ee4:	24c60001 	addiu	a2,a2,1
  400ee8:	24a50010 	addiu	a1,a1,16
  400eec:	1000ffb7 	b	400dcc <bullet_and_centipede_collision_detector+0xd4>
  400ef0:	24840001 	addiu	a0,a0,1
  400ef4:	1000ffef 	b	400eb4 <bullet_and_centipede_collision_detector+0x1bc>
  400ef8:	00e31821 	addu	v1,a3,v1
  400efc:	1000fff2 	b	400ec8 <bullet_and_centipede_collision_detector+0x1d0>

00400f00 <bulletCollisionDetector>:
  400f00:	27bdffe8 	addiu	sp,sp,-24
  400f04:	afbf0014 	sw	ra,20(sp)
  400f08:	0c1002c7 	jal	400b1c <bullet_and_fungus_collision_detector>
  400f0c:	0c1002f5 	jal	400bd4 <bullet_and_spider_collision_detector>
  400f10:	8fbf0014 	lw	ra,20(sp)
  400f14:	27bd0018 	addiu	sp,sp,24
  400f18:	0810033e 	j	400cf8 <bullet_and_centipede_collision_detector>

00400f1c <updateScore>:
  400f1c:	27bdffe0 	addiu	sp,sp,-32
  400f20:	27a50010 	addiu	a1,sp,16
  400f24:	27a40011 	addiu	a0,sp,17
  400f28:	afbf001c 	sw	ra,28(sp)
  400f2c:	afb00018 	sw	s0,24(sp)
  400f30:	0c1005e8 	jal	4017a0 <get_color>
  400f34:	24050047 	li	a1,71
  400f38:	00002025 	move	a0,zero
  400f3c:	0c1005f0 	jal	4017c0 <set_cursor>
  400f40:	3c041001 	lui	a0,0x1001
  400f44:	2484004c 	addiu	a0,a0,76
  400f48:	0c10061a 	jal	401868 <puts>
  400f4c:	3c021001 	lui	v0,0x1001
  400f50:	904404a8 	lbu	a0,1192(v0)
  400f54:	2c82000a 	sltiu	v0,a0,10
  400f58:	1040002c 	beqz	v0,40100c <updateScore+0xf0>
  400f5c:	24840030 	addiu	a0,a0,48
  400f60:	308400ff 	andi	a0,a0,0xff
  400f64:	0c1005f9 	jal	4017e4 <put_char>
  400f68:	24050037 	li	a1,55
  400f6c:	00002025 	move	a0,zero
  400f70:	0c1005f0 	jal	4017c0 <set_cursor>
  400f74:	3c041001 	lui	a0,0x1001
  400f78:	24840054 	addiu	a0,a0,84
  400f7c:	0c10061a 	jal	401868 <puts>
  400f80:	00002825 	move	a1,zero
  400f84:	24040004 	li	a0,4
  400f88:	0c1005e2 	jal	401788 <set_color>
  400f8c:	3c021001 	lui	v0,0x1001
  400f90:	904204eb 	lbu	v0,1259(v0)
  400f94:	14400001 	bnez	v0,400f9c <updateScore+0x80>
  400f98:	0c10011f 	jal	40047c <initializeCentipede>
  400f9c:	3c021001 	lui	v0,0x1001
  400fa0:	904204ea 	lbu	v0,1258(v0)
  400fa4:	24030003 	li	v1,3
  400fa8:	1443001a 	bne	v0,v1,401014 <updateScore+0xf8>
  400fac:	24040011 	li	a0,17
  400fb0:	0c1005f9 	jal	4017e4 <put_char>
  400fb4:	3c101001 	lui	s0,0x1001
  400fb8:	24040012 	li	a0,18
  400fbc:	0c1005f9 	jal	4017e4 <put_char>
  400fc0:	2604005c 	addiu	a0,s0,92
  400fc4:	0c10061a 	jal	401868 <puts>
  400fc8:	24040011 	li	a0,17
  400fcc:	0c1005f9 	jal	4017e4 <put_char>
  400fd0:	24040012 	li	a0,18
  400fd4:	0c1005f9 	jal	4017e4 <put_char>
  400fd8:	2604005c 	addiu	a0,s0,92
  400fdc:	0c10061a 	jal	401868 <puts>
  400fe0:	24040011 	li	a0,17
  400fe4:	0c1005f9 	jal	4017e4 <put_char>
  400fe8:	24040012 	li	a0,18
  400fec:	0c1005f9 	jal	4017e4 <put_char>
  400ff0:	93a50010 	lbu	a1,16(sp)
  400ff4:	93a40011 	lbu	a0,17(sp)
  400ff8:	0c1005e2 	jal	401788 <set_color>
  400ffc:	8fbf001c 	lw	ra,28(sp)
  401000:	8fb00018 	lw	s0,24(sp)
  401004:	27bd0020 	addiu	sp,sp,32
  401008:	03e00008 	jr	ra
  40100c:	24840057 	addiu	a0,a0,87
  401010:	1000ffd3 	b	400f60 <updateScore+0x44>
  401014:	24030002 	li	v1,2
  401018:	24040011 	li	a0,17
  40101c:	1443fff1 	bne	v0,v1,400fe4 <updateScore+0xc8>
  401020:	0c1005f9 	jal	4017e4 <put_char>
  401024:	24040012 	li	a0,18
  401028:	0c1005f9 	jal	4017e4 <put_char>
  40102c:	3c041001 	lui	a0,0x1001
  401030:	2484005c 	addiu	a0,a0,92
  401034:	1000ffe9 	b	400fdc <updateScore+0xc0>

00401038 <resetGlobalVariables>:
  401038:	3c021001 	lui	v0,0x1001
  40103c:	24030028 	li	v1,40
  401040:	27bdffe8 	addiu	sp,sp,-24
  401044:	a0430354 	sb	v1,852(v0)
  401048:	24420354 	addiu	v0,v0,852
  40104c:	24030019 	li	v1,25
  401050:	afbf0014 	sw	ra,20(sp)
  401054:	a0430001 	sb	v1,1(v0)
  401058:	3c021001 	lui	v0,0x1001
  40105c:	24440350 	addiu	a0,v0,848
  401060:	2403ffd2 	li	v1,-46
  401064:	a0430350 	sb	v1,848(v0)
  401068:	a0830001 	sb	v1,1(a0)
  40106c:	3c021001 	lui	v0,0x1001
  401070:	2403010a 	li	v1,266
  401074:	a4430358 	sh	v1,856(v0)
  401078:	24420358 	addiu	v0,v0,856
  40107c:	24030005 	li	v1,5
  401080:	ac43000c 	sw	v1,12(v0)
  401084:	24030003 	li	v1,3
  401088:	ac430004 	sw	v1,4(v0)
  40108c:	3c021001 	lui	v0,0x1001
  401090:	a04004a8 	sb	zero,1192(v0)
  401094:	3c021001 	lui	v0,0x1001
  401098:	a04304ea 	sb	v1,1258(v0)
  40109c:	3c021001 	lui	v0,0x1001
  4010a0:	24030014 	li	v1,20
  4010a4:	a04304eb 	sb	v1,1259(v0)
  4010a8:	0c10008e 	jal	400238 <paintFungus>
  4010ac:	8fbf0014 	lw	ra,20(sp)
  4010b0:	27bd0018 	addiu	sp,sp,24
  4010b4:	0810011f 	j	40047c <initializeCentipede>

004010b8 <welcomeScreen>:
  4010b8:	27bdffb8 	addiu	sp,sp,-72
  4010bc:	afb50034 	sw	s5,52(sp)
  4010c0:	afb40030 	sw	s4,48(sp)
  4010c4:	3c151001 	lui	s5,0x1001
  4010c8:	3c141001 	lui	s4,0x1001
  4010cc:	afb60038 	sw	s6,56(sp)
  4010d0:	afbf0044 	sw	ra,68(sp)
  4010d4:	afbe0040 	sw	s8,64(sp)
  4010d8:	afb7003c 	sw	s7,60(sp)
  4010dc:	afb3002c 	sw	s3,44(sp)
  4010e0:	afb20028 	sw	s2,40(sp)
  4010e4:	afb10024 	sw	s1,36(sp)
  4010e8:	afb00020 	sw	s0,32(sp)
  4010ec:	26b50060 	addiu	s5,s5,96
  4010f0:	2694007c 	addiu	s4,s4,124
  4010f4:	3c161001 	lui	s6,0x1001
  4010f8:	0c1005b7 	jal	4016dc <keypad_getkey>
  4010fc:	00409825 	move	s3,v0
  401100:	241100fb 	li	s1,251
  401104:	24170005 	li	s7,5
  401108:	241e004b 	li	s8,75
  40110c:	26320005 	addiu	s2,s1,5
  401110:	325200ff 	andi	s2,s2,0xff
  401114:	00008025 	move	s0,zero
  401118:	2e270047 	sltiu	a3,s1,71
  40111c:	24060019 	li	a2,25
  401120:	2403001e 	li	v1,30
  401124:	10e00002 	beqz	a3,401130 <welcomeScreen+0x78>
  401128:	12170006 	beq	s0,s7,401144 <welcomeScreen+0x8c>
  40112c:	12060005 	beq	s0,a2,401144 <welcomeScreen+0x8c>
  401130:	2602fffb 	addiu	v0,s0,-5
  401134:	2c420015 	sltiu	v0,v0,21
  401138:	1040000b 	beqz	v0,401168 <welcomeScreen+0xb0>
  40113c:	12570001 	beq	s2,s7,401144 <welcomeScreen+0x8c>
  401140:	165e0009 	bne	s2,s8,401168 <welcomeScreen+0xb0>
  401144:	02402825 	move	a1,s2
  401148:	02002025 	move	a0,s0
  40114c:	afa70018 	sw	a3,24(sp)
  401150:	0c1005f0 	jal	4017c0 <set_cursor>
  401154:	240400fe 	li	a0,254
  401158:	0c1005f9 	jal	4017e4 <put_char>
  40115c:	8fa70018 	lw	a3,24(sp)
  401160:	24060019 	li	a2,25
  401164:	2403001e 	li	v1,30
  401168:	26100001 	addiu	s0,s0,1
  40116c:	321000ff 	andi	s0,s0,0xff
  401170:	1603ffec 	bne	s0,v1,401124 <welcomeScreen+0x6c>
  401174:	26310001 	addiu	s1,s1,1
  401178:	323100ff 	andi	s1,s1,0xff
  40117c:	163effe3 	bne	s1,s8,40110c <welcomeScreen+0x54>
  401180:	2405001a 	li	a1,26
  401184:	24040006 	li	a0,6
  401188:	0c1005f0 	jal	4017c0 <set_cursor>
  40118c:	02a02025 	move	a0,s5
  401190:	0c10061a 	jal	401868 <puts>
  401194:	27a50010 	addiu	a1,sp,16
  401198:	27a40011 	addiu	a0,sp,17
  40119c:	0c1005e8 	jal	4017a0 <get_color>
  4011a0:	00002825 	move	a1,zero
  4011a4:	24040001 	li	a0,1
  4011a8:	0c1005e2 	jal	401788 <set_color>
  4011ac:	2405001e 	li	a1,30
  4011b0:	24040008 	li	a0,8
  4011b4:	0c1005f0 	jal	4017c0 <set_cursor>
  4011b8:	02802025 	move	a0,s4
  4011bc:	0c10061a 	jal	401868 <puts>
  4011c0:	24050007 	li	a1,7
  4011c4:	2404000a 	li	a0,10
  4011c8:	0c1005f0 	jal	4017c0 <set_cursor>
  4011cc:	26c40090 	addiu	a0,s6,144
  4011d0:	0c10061a 	jal	401868 <puts>
  4011d4:	24050007 	li	a1,7
  4011d8:	2404000b 	li	a0,11
  4011dc:	0c1005f0 	jal	4017c0 <set_cursor>
  4011e0:	3c041001 	lui	a0,0x1001
  4011e4:	248400d4 	addiu	a0,a0,212
  4011e8:	0c10061a 	jal	401868 <puts>
  4011ec:	24050007 	li	a1,7
  4011f0:	2404000c 	li	a0,12
  4011f4:	0c1005f0 	jal	4017c0 <set_cursor>
  4011f8:	3c041001 	lui	a0,0x1001
  4011fc:	24840118 	addiu	a0,a0,280
  401200:	0c10061a 	jal	401868 <puts>
  401204:	24050007 	li	a1,7
  401208:	2404000d 	li	a0,13
  40120c:	0c1005f0 	jal	4017c0 <set_cursor>
  401210:	3c041001 	lui	a0,0x1001
  401214:	24840158 	addiu	a0,a0,344
  401218:	0c10061a 	jal	401868 <puts>
  40121c:	24050007 	li	a1,7
  401220:	2404000e 	li	a0,14
  401224:	0c1005f0 	jal	4017c0 <set_cursor>
  401228:	3c041001 	lui	a0,0x1001
  40122c:	24840184 	addiu	a0,a0,388
  401230:	0c10061a 	jal	401868 <puts>
  401234:	24050007 	li	a1,7
  401238:	2404000f 	li	a0,15
  40123c:	0c1005f0 	jal	4017c0 <set_cursor>
  401240:	3c041001 	lui	a0,0x1001
  401244:	248401c8 	addiu	a0,a0,456
  401248:	0c10061a 	jal	401868 <puts>
  40124c:	24050007 	li	a1,7
  401250:	24040010 	li	a0,16
  401254:	0c1005f0 	jal	4017c0 <set_cursor>
  401258:	3c041001 	lui	a0,0x1001
  40125c:	24840204 	addiu	a0,a0,516
  401260:	0c10061a 	jal	401868 <puts>
  401264:	24050007 	li	a1,7
  401268:	24040011 	li	a0,17
  40126c:	0c1005f0 	jal	4017c0 <set_cursor>
  401270:	3c041001 	lui	a0,0x1001
  401274:	24840240 	addiu	a0,a0,576
  401278:	0c10061a 	jal	401868 <puts>
  40127c:	24050007 	li	a1,7
  401280:	24040012 	li	a0,18
  401284:	0c1005f0 	jal	4017c0 <set_cursor>
  401288:	3c041001 	lui	a0,0x1001
  40128c:	24840284 	addiu	a0,a0,644
  401290:	0c10061a 	jal	401868 <puts>
  401294:	93a50010 	lbu	a1,16(sp)
  401298:	93a40011 	lbu	a0,17(sp)
  40129c:	0c1005e2 	jal	401788 <set_color>
  4012a0:	2405001e 	li	a1,30
  4012a4:	24040015 	li	a0,21
  4012a8:	0c1005f0 	jal	4017c0 <set_cursor>
  4012ac:	3c041001 	lui	a0,0x1001
  4012b0:	248402a8 	addiu	a0,a0,680
  4012b4:	0c10061a 	jal	401868 <puts>
  4012b8:	24050025 	li	a1,37
  4012bc:	24040016 	li	a0,22
  4012c0:	0c1005f0 	jal	4017c0 <set_cursor>
  4012c4:	3c041001 	lui	a0,0x1001
  4012c8:	248402c0 	addiu	a0,a0,704
  4012cc:	0c10061a 	jal	401868 <puts>
  4012d0:	24040018 	li	a0,24
  4012d4:	2405001b 	li	a1,27
  4012d8:	0c1005f0 	jal	4017c0 <set_cursor>
  4012dc:	3c041001 	lui	a0,0x1001
  4012e0:	248402c8 	addiu	a0,a0,712
  4012e4:	0c10061a 	jal	401868 <puts>
  4012e8:	1260ff83 	beqz	s3,4010f8 <welcomeScreen+0x40>
  4012ec:	0c100628 	jal	4018a0 <clear_screen>
  4012f0:	8fbf0044 	lw	ra,68(sp)
  4012f4:	8fbe0040 	lw	s8,64(sp)
  4012f8:	8fb7003c 	lw	s7,60(sp)
  4012fc:	8fb60038 	lw	s6,56(sp)
  401300:	8fb50034 	lw	s5,52(sp)
  401304:	8fb40030 	lw	s4,48(sp)
  401308:	8fb3002c 	lw	s3,44(sp)
  40130c:	8fb20028 	lw	s2,40(sp)
  401310:	8fb10024 	lw	s1,36(sp)
  401314:	8fb00020 	lw	s0,32(sp)
  401318:	27bd0048 	addiu	sp,sp,72
  40131c:	03e00008 	jr	ra

00401320 <registerPlayerDeath>:
  401320:	27bdffc0 	addiu	sp,sp,-64
  401324:	afb20020 	sw	s2,32(sp)
  401328:	3c121001 	lui	s2,0x1001
  40132c:	afb60030 	sw	s6,48(sp)
  401330:	afb5002c 	sw	s5,44(sp)
  401334:	afb40028 	sw	s4,40(sp)
  401338:	afbf003c 	sw	ra,60(sp)
  40133c:	afbe0038 	sw	s8,56(sp)
  401340:	afb70034 	sw	s7,52(sp)
  401344:	afb30024 	sw	s3,36(sp)
  401348:	afb1001c 	sw	s1,28(sp)
  40134c:	afb00018 	sw	s0,24(sp)
  401350:	0c100628 	jal	4018a0 <clear_screen>
  401354:	924204ea 	lbu	v0,1258(s2)
  401358:	3c141001 	lui	s4,0x1001
  40135c:	2442ffff 	addiu	v0,v0,-1
  401360:	3c151001 	lui	s5,0x1001
  401364:	a24204ea 	sb	v0,1258(s2)
  401368:	26940310 	addiu	s4,s4,784
  40136c:	26b5031c 	addiu	s5,s5,796
  401370:	3c161001 	lui	s6,0x1001
  401374:	0c1005b7 	jal	4016dc <keypad_getkey>
  401378:	00409825 	move	s3,v0
  40137c:	241100ec 	li	s1,236
  401380:	24080014 	li	t0,20
  401384:	241e003c 	li	s8,60
  401388:	26370014 	addiu	s7,s1,20
  40138c:	32f700ff 	andi	s7,s7,0xff
  401390:	00008025 	move	s0,zero
  401394:	2e270029 	sltiu	a3,s1,41
  401398:	2406000a 	li	a2,10
  40139c:	24030019 	li	v1,25
  4013a0:	10e00002 	beqz	a3,4013ac <registerPlayerDeath+0x8c>
  4013a4:	12060006 	beq	s0,a2,4013c0 <registerPlayerDeath+0xa0>
  4013a8:	12030005 	beq	s0,v1,4013c0 <registerPlayerDeath+0xa0>
  4013ac:	2602fff6 	addiu	v0,s0,-10
  4013b0:	2c420010 	sltiu	v0,v0,16
  4013b4:	1040000c 	beqz	v0,4013e8 <registerPlayerDeath+0xc8>
  4013b8:	12e80001 	beq	s7,t0,4013c0 <registerPlayerDeath+0xa0>
  4013bc:	16fe000a 	bne	s7,s8,4013e8 <registerPlayerDeath+0xc8>
  4013c0:	02e02825 	move	a1,s7
  4013c4:	02002025 	move	a0,s0
  4013c8:	afa70010 	sw	a3,16(sp)
  4013cc:	0c1005f0 	jal	4017c0 <set_cursor>
  4013d0:	240400fe 	li	a0,254
  4013d4:	0c1005f9 	jal	4017e4 <put_char>
  4013d8:	8fa70010 	lw	a3,16(sp)
  4013dc:	24030019 	li	v1,25
  4013e0:	2406000a 	li	a2,10
  4013e4:	24080014 	li	t0,20
  4013e8:	26100001 	addiu	s0,s0,1
  4013ec:	321000ff 	andi	s0,s0,0xff
  4013f0:	2402001e 	li	v0,30
  4013f4:	1602ffea 	bne	s0,v0,4013a0 <registerPlayerDeath+0x80>
  4013f8:	26310001 	addiu	s1,s1,1
  4013fc:	323100ff 	andi	s1,s1,0xff
  401400:	163effe1 	bne	s1,s8,401388 <registerPlayerDeath+0x68>
  401404:	924204ea 	lbu	v0,1258(s2)
  401408:	24050023 	li	a1,35
  40140c:	2404000f 	li	a0,15
  401410:	1440001f 	bnez	v0,401490 <registerPlayerDeath+0x170>
  401414:	0c1005f0 	jal	4017c0 <set_cursor>
  401418:	26c402e8 	addiu	a0,s6,744
  40141c:	0c10061a 	jal	401868 <puts>
  401420:	2405001d 	li	a1,29
  401424:	24040013 	li	a0,19
  401428:	0c1005f0 	jal	4017c0 <set_cursor>
  40142c:	3c041001 	lui	a0,0x1001
  401430:	248402f4 	addiu	a0,a0,756
  401434:	0c10061a 	jal	401868 <puts>
  401438:	24020008 	li	v0,8
  40143c:	1662001c 	bne	s3,v0,4014b0 <registerPlayerDeath+0x190>
  401440:	0c10040e 	jal	401038 <resetGlobalVariables>
  401444:	3c021001 	lui	v0,0x1001
  401448:	24030028 	li	v1,40
  40144c:	a0430354 	sb	v1,852(v0)
  401450:	24420354 	addiu	v0,v0,852
  401454:	2403001d 	li	v1,29
  401458:	a0430001 	sb	v1,1(v0)
  40145c:	0c100628 	jal	4018a0 <clear_screen>
  401460:	8fbf003c 	lw	ra,60(sp)
  401464:	8fbe0038 	lw	s8,56(sp)
  401468:	8fb70034 	lw	s7,52(sp)
  40146c:	8fb60030 	lw	s6,48(sp)
  401470:	8fb5002c 	lw	s5,44(sp)
  401474:	8fb40028 	lw	s4,40(sp)
  401478:	8fb30024 	lw	s3,36(sp)
  40147c:	8fb20020 	lw	s2,32(sp)
  401480:	8fb1001c 	lw	s1,28(sp)
  401484:	8fb00018 	lw	s0,24(sp)
  401488:	27bd0040 	addiu	sp,sp,64
  40148c:	0810008e 	j	400238 <paintFungus>
  401490:	0c1005f0 	jal	4017c0 <set_cursor>
  401494:	02802025 	move	a0,s4
  401498:	0c10061a 	jal	401868 <puts>
  40149c:	24040013 	li	a0,19
  4014a0:	2405001d 	li	a1,29
  4014a4:	0c1005f0 	jal	4017c0 <set_cursor>
  4014a8:	02a02025 	move	a0,s5
  4014ac:	0c10061a 	jal	401868 <puts>
  4014b0:	1260ffb0 	beqz	s3,401374 <registerPlayerDeath+0x54>
  4014b4:	924204ea 	lbu	v0,1258(s2)
  4014b8:	1040ffae 	beqz	v0,401374 <registerPlayerDeath+0x54>
  4014bc:	1000ffe1 	b	401444 <registerPlayerDeath+0x124>

004014c0 <playerCollisionDetector>:
  4014c0:	3c031001 	lui	v1,0x1001
  4014c4:	3c021001 	lui	v0,0x1001
  4014c8:	90650354 	lbu	a1,852(v1)
  4014cc:	90440358 	lbu	a0,856(v0)
  4014d0:	24630354 	addiu	v1,v1,852
  4014d4:	10a40002 	beq	a1,a0,4014e0 <playerCollisionDetector+0x20>
  4014d8:	24840001 	addiu	a0,a0,1
  4014dc:	14a40005 	bne	a1,a0,4014f4 <playerCollisionDetector+0x34>
  4014e0:	24420358 	addiu	v0,v0,856
  4014e4:	90640001 	lbu	a0,1(v1)
  4014e8:	90420001 	lbu	v0,1(v0)
  4014ec:	14820001 	bne	a0,v0,4014f4 <playerCollisionDetector+0x34>
  4014f0:	081004c8 	j	401320 <registerPlayerDeath>
  4014f4:	3c021001 	lui	v0,0x1001
  4014f8:	24420368 	addiu	v0,v0,872
  4014fc:	90640001 	lbu	a0,1(v1)
  401500:	24430140 	addiu	v1,v0,320
  401504:	90460002 	lbu	a2,2(v0)
  401508:	14c00004 	bnez	a2,40151c <playerCollisionDetector+0x5c>
  40150c:	90460000 	lbu	a2,0(v0)
  401510:	14c50002 	bne	a2,a1,40151c <playerCollisionDetector+0x5c>
  401514:	90460001 	lbu	a2,1(v0)
  401518:	10c4fff5 	beq	a2,a0,4014f0 <playerCollisionDetector+0x30>
  40151c:	24420010 	addiu	v0,v0,16
  401520:	1443fff8 	bne	v0,v1,401504 <playerCollisionDetector+0x44>
  401524:	03e00008 	jr	ra

00401528 <main>:
  401528:	27bdffd0 	addiu	sp,sp,-48
  40152c:	afbf002c 	sw	ra,44(sp)
  401530:	afb50024 	sw	s5,36(sp)
  401534:	afb40020 	sw	s4,32(sp)
  401538:	afb3001c 	sw	s3,28(sp)
  40153c:	afb20018 	sw	s2,24(sp)
  401540:	afb10014 	sw	s1,20(sp)
  401544:	afb00010 	sw	s0,16(sp)
  401548:	afb60028 	sw	s6,40(sp)
  40154c:	0c100628 	jal	4018a0 <clear_screen>
  401550:	00002825 	move	a1,zero
  401554:	24040007 	li	a0,7
  401558:	0c1005e2 	jal	401788 <set_color>
  40155c:	24050028 	li	a1,40
  401560:	2404000f 	li	a0,15
  401564:	0c1005f0 	jal	4017c0 <set_cursor>
  401568:	0c1005b3 	jal	4016cc <keypad_init>
  40156c:	0c10042e 	jal	4010b8 <welcomeScreen>
  401570:	0c10040e 	jal	401038 <resetGlobalVariables>
  401574:	3c02ffff 	lui	v0,0xffff
  401578:	3c111001 	lui	s1,0x1001
  40157c:	3c101001 	lui	s0,0x1001
  401580:	8c530008 	lw	s3,8(v0)
  401584:	3c141001 	lui	s4,0x1001
  401588:	26120350 	addiu	s2,s0,848
  40158c:	26350354 	addiu	s5,s1,852
  401590:	3c02ffff 	lui	v0,0xffff
  401594:	8c420008 	lw	v0,8(v0)
  401598:	3c030001 	lui	v1,0x1
  40159c:	00531023 	subu	v0,v0,s3
  4015a0:	3463d4c1 	ori	v1,v1,0xd4c1
  4015a4:	0043102b 	sltu	v0,v0,v1
  4015a8:	14400005 	bnez	v0,4015c0 <main+0x98>
  4015ac:	00002025 	move	a0,zero
  4015b0:	2405002b 	li	a1,43
  4015b4:	0c1005f0 	jal	4017c0 <set_cursor>
  4015b8:	26840338 	addiu	a0,s4,824
  4015bc:	0c10061a 	jal	401868 <puts>
  4015c0:	24040014 	li	a0,20
  4015c4:	0c1005a8 	jal	4016a0 <delay_ms>
  4015c8:	0c1003c7 	jal	400f1c <updateScore>
  4015cc:	0c1003c0 	jal	400f00 <bulletCollisionDetector>
  4015d0:	0c100252 	jal	400948 <HandlePlayer>
  4015d4:	0c1001dc 	jal	400770 <HandleSpider>
  4015d8:	0c100151 	jal	400544 <HandleCentipede>
  4015dc:	3c021001 	lui	v0,0x1001
  4015e0:	9042034c 	lbu	v0,844(v0)
  4015e4:	10400017 	beqz	v0,401644 <main+0x11c>
  4015e8:	3c161001 	lui	s6,0x1001
  4015ec:	92c2034d 	lbu	v0,845(s6)
  4015f0:	92040350 	lbu	a0,848(s0)
  4015f4:	1040001e 	beqz	v0,401670 <main+0x148>
  4015f8:	00041200 	sll	v0,a0,0x8
  4015fc:	92040351 	lbu	a0,849(s0)
  401600:	00822025 	or	a0,a0,v0
  401604:	00042400 	sll	a0,a0,0x10
  401608:	0c100146 	jal	400518 <clearPosition>
  40160c:	92a40001 	lbu	a0,1(s5)
  401610:	92250354 	lbu	a1,852(s1)
  401614:	2484ffff 	addiu	a0,a0,-1
  401618:	308400ff 	andi	a0,a0,0xff
  40161c:	0c100004 	jal	400010 <HandleBullet>
  401620:	a2c0034d 	sb	zero,845(s6)
  401624:	92420001 	lbu	v0,1(s2)
  401628:	10400006 	beqz	v0,401644 <main+0x11c>
  40162c:	92040350 	lbu	a0,848(s0)
  401630:	00041200 	sll	v0,a0,0x8
  401634:	92040351 	lbu	a0,849(s0)
  401638:	00822025 	or	a0,a0,v0
  40163c:	00042400 	sll	a0,a0,0x10
  401640:	0c100021 	jal	400084 <paintBullet>
  401644:	92240354 	lbu	a0,852(s1)
  401648:	00041200 	sll	v0,a0,0x8
  40164c:	92240355 	lbu	a0,853(s1)
  401650:	00822025 	or	a0,a0,v0
  401654:	00042400 	sll	a0,a0,0x10
  401658:	0c10000d 	jal	400034 <paintPlayer>
  40165c:	3c021001 	lui	v0,0x1001
  401660:	8c440358 	lw	a0,856(v0)
  401664:	0c100035 	jal	4000d4 <paintSpider>
  401668:	0c100530 	jal	4014c0 <playerCollisionDetector>
  40166c:	1000ffc8 	b	401590 <main+0x68>
  401670:	00041200 	sll	v0,a0,0x8
  401674:	92040351 	lbu	a0,849(s0)
  401678:	00822025 	or	a0,a0,v0
  40167c:	00042400 	sll	a0,a0,0x10
  401680:	0c100146 	jal	400518 <clearPosition>
  401684:	92440001 	lbu	a0,1(s2)
  401688:	92050350 	lbu	a1,848(s0)
  40168c:	2484ffff 	addiu	a0,a0,-1
  401690:	308400ff 	andi	a0,a0,0xff
  401694:	a2440001 	sb	a0,1(s2)
  401698:	0c100004 	jal	400010 <HandleBullet>
  40169c:	1000ffe1 	b	401624 <main+0xfc>

004016a0 <delay_ms>:
  4016a0:	3c08ffff 	lui	t0,0xffff
  4016a4:	8d090008 	lw	t1,8(t0)
  4016a8:	00000000 	nop
  4016ac:	01244820 	add	t1,t1,a0

004016b0 <.dm_loop>:
  4016b0:	8d0a0008 	lw	t2,8(t0)
  4016b4:	00000000 	nop
  4016b8:	0149582b 	sltu	t3,t2,t1
  4016bc:	1560fffc 	bnez	t3,4016b0 <.dm_loop>
  4016c0:	00000000 	nop
  4016c4:	03e00008 	jr	ra
  4016c8:	00000000 	nop

004016cc <keypad_init>:
  4016cc:	3c081001 	lui	t0,0x1001
  4016d0:	ad000344 	sw	zero,836(t0)
  4016d4:	03e00008 	jr	ra
  4016d8:	00000000 	nop

004016dc <keypad_getkey>:
  4016dc:	3c08ffff 	lui	t0,0xffff
  4016e0:	81080004 	lb	t0,4(t0)
  4016e4:	24090008 	li	t1,8
  4016e8:	240b0001 	li	t3,1
  4016ec:	00005025 	move	t2,zero

004016f0 <.gk_loop>:
  4016f0:	11490018 	beq	t2,t1,401754 <.gk_end_loop>
  4016f4:	00000000 	nop
  4016f8:	010b6024 	and	t4,t0,t3
  4016fc:	000b5840 	sll	t3,t3,0x1
  401700:	11800011 	beqz	t4,401748 <.gk_inc_loop>
  401704:	00000000 	nop
  401708:	3c081001 	lui	t0,0x1001
  40170c:	8d080344 	lw	t0,836(t0)
  401710:	3c09ffff 	lui	t1,0xffff
  401714:	8d290008 	lw	t1,8(t1)
  401718:	00000000 	nop
  40171c:	0128582b 	sltu	t3,t1,t0
  401720:	11600002 	beqz	t3,40172c <.set_key>
  401724:	00000000 	nop
  401728:	00001025 	move	v0,zero

0040172c <.set_key>:
  40172c:	252900c8 	addiu	t1,t1,200
  401730:	3c081001 	lui	t0,0x1001
  401734:	ad090344 	sw	t1,836(t0)
  401738:	01401025 	move	v0,t2
  40173c:	24420001 	addiu	v0,v0,1
  401740:	03e00008 	jr	ra
  401744:	00000000 	nop

00401748 <.gk_inc_loop>:
  401748:	254a0001 	addiu	t2,t2,1
  40174c:	081005bc 	j	4016f0 <.gk_loop>
  401750:	00000000 	nop

00401754 <.gk_end_loop>:
  401754:	00001025 	move	v0,zero
  401758:	03e00008 	jr	ra
  40175c:	00000000 	nop

00401760 <divide>:
  401760:	acc00000 	sw	zero,0(a2)
  401764:	0085102b 	sltu	v0,a0,a1
  401768:	10400002 	beqz	v0,401774 <divide+0x14>
  40176c:	ace40000 	sw	a0,0(a3)
  401770:	03e00008 	jr	ra
  401774:	8cc20000 	lw	v0,0(a2)
  401778:	00852023 	subu	a0,a0,a1
  40177c:	24420001 	addiu	v0,v0,1
  401780:	acc20000 	sw	v0,0(a2)
  401784:	1000fff7 	b	401764 <divide+0x4>

00401788 <set_color>:
  401788:	00052900 	sll	a1,a1,0x4
  40178c:	3084000f 	andi	a0,a0,0xf
  401790:	00a42825 	or	a1,a1,a0
  401794:	3c021001 	lui	v0,0x1001
  401798:	a04504ee 	sb	a1,1262(v0)
  40179c:	03e00008 	jr	ra

004017a0 <get_color>:
  4017a0:	3c031001 	lui	v1,0x1001
  4017a4:	906204ee 	lbu	v0,1262(v1)
  4017a8:	3042000f 	andi	v0,v0,0xf
  4017ac:	a0820000 	sb	v0,0(a0)
  4017b0:	906204ee 	lbu	v0,1262(v1)
  4017b4:	00021102 	srl	v0,v0,0x4
  4017b8:	a0a20000 	sb	v0,0(a1)
  4017bc:	03e00008 	jr	ra

004017c0 <set_cursor>:
  4017c0:	2c820028 	sltiu	v0,a0,40
  4017c4:	10400006 	beqz	v0,4017e0 <set_cursor+0x20>
  4017c8:	2ca20050 	sltiu	v0,a1,80
  4017cc:	10400004 	beqz	v0,4017e0 <set_cursor+0x20>
  4017d0:	3c021001 	lui	v0,0x1001
  4017d4:	a04404ed 	sb	a0,1261(v0)
  4017d8:	3c021001 	lui	v0,0x1001
  4017dc:	a04504ec 	sb	a1,1260(v0)
  4017e0:	03e00008 	jr	ra

004017e4 <put_char>:
  4017e4:	3c071001 	lui	a3,0x1001
  4017e8:	2403000a 	li	v1,10
  4017ec:	90e204ed 	lbu	v0,1261(a3)
  4017f0:	3c061001 	lui	a2,0x1001
  4017f4:	14830006 	bne	a0,v1,401810 <put_char+0x2c>
  4017f8:	2c430027 	sltiu	v1,v0,39
  4017fc:	10600002 	beqz	v1,401808 <put_char+0x24>
  401800:	24420001 	addiu	v0,v0,1
  401804:	a0e204ed 	sb	v0,1261(a3)
  401808:	a0c004ec 	sb	zero,1260(a2)
  40180c:	03e00008 	jr	ra
  401810:	3c031001 	lui	v1,0x1001
  401814:	906304ee 	lbu	v1,1262(v1)
  401818:	90c504ec 	lbu	a1,1260(a2)
  40181c:	00031a00 	sll	v1,v1,0x8
  401820:	00642025 	or	a0,v1,a0
  401824:	00021880 	sll	v1,v0,0x2
  401828:	00621821 	addu	v1,v1,v0
  40182c:	00031900 	sll	v1,v1,0x4
  401830:	00651821 	addu	v1,v1,a1
  401834:	00031840 	sll	v1,v1,0x1
  401838:	3408b800 	li	t0,0xb800
  40183c:	01031821 	addu	v1,t0,v1
  401840:	a4640000 	sh	a0,0(v1)
  401844:	2ca3004f 	sltiu	v1,a1,79
  401848:	10600003 	beqz	v1,401858 <put_char+0x74>
  40184c:	24a50001 	addiu	a1,a1,1
  401850:	a0c504ec 	sb	a1,1260(a2)
  401854:	03e00008 	jr	ra
  401858:	24420001 	addiu	v0,v0,1
  40185c:	a0c004ec 	sb	zero,1260(a2)
  401860:	a0e204ed 	sb	v0,1261(a3)
  401864:	03e00008 	jr	ra

00401868 <puts>:
  401868:	00804825 	move	t1,a0
  40186c:	80840000 	lb	a0,0(a0)
  401870:	14800001 	bnez	a0,401878 <puts+0x10>
  401874:	03e00008 	jr	ra
  401878:	27bdffe8 	addiu	sp,sp,-24
  40187c:	afbf0014 	sw	ra,20(sp)
  401880:	308400ff 	andi	a0,a0,0xff
  401884:	25290001 	addiu	t1,t1,1
  401888:	0c1005f9 	jal	4017e4 <put_char>
  40188c:	81240000 	lb	a0,0(t1)
  401890:	1480fffb 	bnez	a0,401880 <puts+0x18>
  401894:	8fbf0014 	lw	ra,20(sp)
  401898:	27bd0018 	addiu	sp,sp,24
  40189c:	03e00008 	jr	ra

004018a0 <clear_screen>:
  4018a0:	3c021001 	lui	v0,0x1001
  4018a4:	904204ee 	lbu	v0,1262(v0)
  4018a8:	3403b800 	li	v1,0xb800
  4018ac:	00021200 	sll	v0,v0,0x8
  4018b0:	34420020 	ori	v0,v0,0x20
  4018b4:	3404cac0 	li	a0,0xcac0
  4018b8:	a4620000 	sh	v0,0(v1)
  4018bc:	24630002 	addiu	v1,v1,2
  4018c0:	1464fffd 	bne	v1,a0,4018b8 <clear_screen+0x18>
  4018c4:	3c021001 	lui	v0,0x1001
  4018c8:	a04004ed 	sb	zero,1261(v0)
  4018cc:	3c021001 	lui	v0,0x1001
  4018d0:	a04004ec 	sb	zero,1260(v0)
  4018d4:	03e00008 	jr	ra

Disassembly of section .data:

10010000 <next_key_time-0x344>:
10010000:	004009d0 	0x4009d0
10010004:	00400a44 	0x400a44
10010008:	00400a8c 	syscall	0x1002a
1001000c:	00400ad8 	0x400ad8
10010010:	00400a2c 	0x400a2c
10010014:	00400a2c 	0x400a2c
10010018:	00400a2c 	0x400a2c
1001001c:	00400a18 	0x400a18
10010020:	53706964 	0x53706964
10010024:	65722067 	0x65722067
10010028:	6f742068 	0x6f742068
1001002c:	69742120 	0x69742120
10010030:	476f6f64 	c1	0x16f6f64
10010034:	206a6f62 	addi	t2,v1,28514
10010038:	00000000 	nop
1001003c:	48656164 	0x48656164
10010040:	204b696c 	addi	t3,v0,26988
10010044:	6c656421 	0x6c656421
10010048:	00000000 	nop
1001004c:	53636f72 	0x53636f72
10010050:	653a0000 	0x653a0000
10010054:	4c697665 	0x4c697665
10010058:	733a2000 	0x733a2000
1001005c:	20000000 	addi	zero,zero,0
10010060:	43454e54 	c0	0x1454e54
10010064:	49504544 	0x49504544
10010068:	45204152 	0x45204152
1001006c:	43414445 	c0	0x1414445
10010070:	20564944 	addi	s6,v0,18756
10010074:	454f4741 	0x454f4741
10010078:	4d450000 	0x4d450000
1001007c:	47616d65 	c1	0x1616d65
10010080:	20646573 	addi	a0,v1,25971
10010084:	63726970 	0x63726970
10010088:	74696f6e 	jalx	11a5bdb8 <chr_attr+0x1a4b8ca>
1001008c:	00000000 	nop
10010090:	596f7520 	0x596f7520
10010094:	61726520 	0x61726520
10010098:	74686520 	jalx	11a19480 <chr_attr+0x1a08f92>
1001009c:	77686974 	jalx	1da1a5d0 <chr_attr+0xda0a0e2>
100100a0:	65207370 	0x65207370
100100a4:	61636865 	0x61636865
100100a8:	73686970 	0x73686970
100100ac:	2e20596f 	sltiu	zero,s1,22895
100100b0:	75206361 	jalx	14818d84 <chr_attr+0x4808896>
100100b4:	6e206d6f 	0x6e206d6f
100100b8:	76652075 	jalx	199481d4 <chr_attr+0x9937ce6>
100100bc:	702c2072 	0x702c2072
100100c0:	69676874 	0x69676874
100100c4:	2c206c65 	sltiu	zero,at,27749
100100c8:	66742061 	0x66742061
100100cc:	6e642064 	0x6e642064
100100d0:	6f776e00 	0x6f776e00
100100d4:	54686520 	0x54686520
100100d8:	62757474 	0x62757474
100100dc:	6f6e7320 	0x6f6e7320
100100e0:	6172653a 	0x6172653a
100100e4:	20557020 	addi	s5,v0,28704
100100e8:	6b65792c 	0x6b65792c
100100ec:	20446f77 	addi	a0,v0,28535
100100f0:	6e2c206c 	0x6e2c206c
100100f4:	6566742c 	0x6566742c
100100f8:	20726967 	addi	s2,v1,26983
100100fc:	68742061 	0x68742061
10010100:	6e642073 	0x6e642073
10010104:	70616365 	0x70616365
10010108:	20737061 	addi	s3,v1,28769
1001010c:	7220746f 	0x7220746f
10010110:	2073686f 	addi	s3,v1,26735
10010114:	6f742100 	0x6f742100
10010118:	596f7520 	0x596f7520
1001011c:	63616e20 	0x63616e20
10010120:	6d6f7665 	0x6d6f7665
10010124:	20616e64 	addi	at,v1,28260
10010128:	2073686f 	addi	s3,v1,26735
1001012c:	6f742073 	0x6f742073
10010130:	696d756c 	0x696d756c
10010134:	74616e65 	jalx	1185b994 <chr_attr+0x184b4a6>
10010138:	6f75736c 	0x6f75736c
1001013c:	79212059 	0x79212059
10010140:	6f75206f 	0x6f75206f
10010144:	6e6c7920 	0x6e6c7920
10010148:	68617665 	0x68617665
1001014c:	206f6e65 	addi	t7,v1,28261
10010150:	2062756c 	addi	v0,v1,30060
10010154:	6c657400 	0x6c657400
10010158:	596f7520 	0x596f7520
1001015c:	6d757374 	0x6d757374
10010160:	206b696c 	addi	t3,v1,26988
10010164:	6c207468 	0x6c207468
10010168:	65206365 	0x65206365
1001016c:	6e746970 	0x6e746970
10010170:	65646520 	0x65646520
10010174:	746f2067 	jalx	11bc819c <chr_attr+0x1bb7cae>
10010178:	61696e20 	0x61696e20
1001017c:	706f696e 	0x706f696e
10010180:	74730000 	jalx	11cc0000 <chr_attr+0x1cafb12>
10010184:	596f7520 	0x596f7520
10010188:	63616e20 	0x63616e20
1001018c:	6b696c6c 	0x6b696c6c
10010190:	20746865 	addi	s4,v1,26725
10010194:	206d6f76 	addi	t5,v1,28534
10010198:	696e6720 	0x696e6720
1001019c:	73706964 	0x73706964
100101a0:	65722c20 	0x65722c20
100101a4:	74686520 	jalx	11a19480 <chr_attr+0x1a08f92>
100101a8:	6c6f6e67 	0x6c6f6e67
100101ac:	65722074 	0x65722074
100101b0:	6865206b 	0x6865206b
100101b4:	696c6c20 	0x696c6c20
100101b8:	3d206d6f 	0x3d206d6f
100101bc:	72652070 	0x72652070
100101c0:	6f696e74 	0x6f696e74
100101c4:	73000000 	0x73000000
100101c8:	49662079 	0x49662079
100101cc:	6f752068 	0x6f752068
100101d0:	69742074 	0x69742074
100101d4:	68652063 	0x68652063
100101d8:	656e7469 	0x656e7469
100101dc:	70656465 	0x70656465
100101e0:	2c206974 	sltiu	zero,at,26996
100101e4:	2077696c 	addi	s7,v1,26988
100101e8:	6c207370 	0x6c207370
100101ec:	6c697420 	0x6c697420
100101f0:	696e2074 	0x696e2074
100101f4:	776f2061 	jalx	1dbc8184 <chr_attr+0xdbb7c96>
100101f8:	63636f72 	0x63636f72
100101fc:	64696e67 	0x64696e67
10010200:	6c790000 	0x6c790000
10010204:	49662079 	0x49662079
10010208:	6f75206b 	0x6f75206b
1001020c:	696c6c20 	0x696c6c20
10010210:	74686520 	jalx	11a19480 <chr_attr+0x1a08f92>
10010214:	68656164 	0x68656164
10010218:	206f6620 	addi	t7,v1,26144
1001021c:	74686520 	jalx	11a19480 <chr_attr+0x1a08f92>
10010220:	63656e74 	0x63656e74
10010224:	69706564 	0x69706564
10010228:	652c2061 	0x652c2061
1001022c:	2066756e 	addi	a2,v1,30062
10010230:	67757320 	0x67757320
10010234:	77696c6c 	jalx	1da5b1b0 <chr_attr+0xda4acc2>
10010238:	20737061 	addi	s3,v1,28769
1001023c:	776e0000 	jalx	1db80000 <chr_attr+0xdb6fb12>
10010240:	46756e67 	c1	0x756e67
10010244:	75732061 	jalx	15cc8184 <chr_attr+0x5cb7c96>
10010248:	70706561 	0x70706561
1001024c:	72206163 	0x72206163
10010250:	63726f73 	0x63726f73
10010254:	73207468 	0x73207468
10010258:	65206d61 	0x65206d61
1001025c:	702c2069 	0x702c2069
10010260:	7420626c 	jalx	108189b0 <chr_attr+0x8084c2>
10010264:	6f636b73 	0x6f636b73
10010268:	20796f75 	addi	t9,v1,28533
1001026c:	72206d6f 	0x72206d6f
10010270:	76656d65 	jalx	1995b594 <chr_attr+0x994b0a6>
10010274:	6e742c20 	0x6e742c20
10010278:	796f7520 	0x796f7520
1001027c:	63616e20 	0x63616e20
10010280:	2d000000 	sltiu	zero,t0,0
10010284:	64657374 	0x64657374
10010288:	726f7920 	0x726f7920
1001028c:	7468656d 	jalx	11a195b4 <chr_attr+0x1a090c6>
10010290:	20746f20 	addi	s4,v1,28448
10010294:	66726565 	0x66726565
10010298:	20737061 	addi	s3,v1,28769
1001029c:	63652120 	0x63652120
100102a0:	456e6a6f 	0x456e6a6f
100102a4:	79212100 	0x79212100
100102a8:	43726561 	c0	0x1726561
100102ac:	74656420 	jalx	11959080 <chr_attr+0x1948b92>
100102b0:	62793a20 	0x62793a20
100102b4:	4c756973 	0x4c756973
100102b8:	44657639 	0x44657639
100102bc:	39000000 	xori	zero,t0,0x0
100102c0:	32303139 	andi	s0,s1,0x3139
100102c4:	00000000 	nop
100102c8:	50524553 	0x50524553
100102cc:	5320414e 	0x5320414e
100102d0:	59204b45 	0x59204b45
100102d4:	5920544f 	0x5920544f
100102d8:	20535441 	addi	s3,v0,21569
100102dc:	52542054 	0x52542054
100102e0:	48452047 	0x48452047
100102e4:	414d4500 	0x414d4500
100102e8:	47616d65 	c1	0x1616d65
100102ec:	204f7665 	addi	t7,v0,30309
100102f0:	72000000 	0x72000000
100102f4:	70726573 	0x70726573
100102f8:	73207370 	0x73207370
100102fc:	61636520 	0x61636520
10010300:	62617220 	0x62617220
10010304:	746f2072 	jalx	11bc81c8 <chr_attr+0x1bb7cda>
10010308:	65736574 	0x65736574
1001030c:	00000000 	nop
10010310:	594f5520 	0x594f5520
10010314:	44494544 	0x44494544
10010318:	21000000 	addi	zero,t0,0
1001031c:	70726573 	0x70726573
10010320:	7320616e 	0x7320616e
10010324:	79206b65 	0x79206b65
10010328:	7920746f 	0x7920746f
1001032c:	20636f6e 	addi	v1,v1,28526
10010330:	74696e75 	jalx	11a5b9d4 <chr_attr+0x1a4b4e6>
10010334:	65000000 	0x65000000
10010338:	45584345 	0x45584345
1001033c:	4c4c454e 	0x4c4c454e
10010340:	54210000 	0x54210000

10010344 <next_key_time>:
10010344:	00000000 	nop

10010348 <spiderDoneMovingRight>:
	...

10010349 <spiderDoneMovingLeft>:
	...

1001034a <spiderDoneMovingDown>:
	...

1001034b <spiderDoneMovingUp>:
	...

1001034c <shouldBulletBePainted>:
	...

1001034d <bulletWasPressed>:
	...

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	41000000 	bc0f	4 <_gp+0x4>
   4:	0f676e75 	jal	d9db9d4 <clear_screen+0xd5da134>
   8:	00010000 	sll	zero,at,0x0
   c:	00070401 	0x70401

Disassembly of section .bss:

10010350 <bullet>:
10010350:	00000000 	nop

10010354 <player>:
10010354:	00000000 	nop

10010358 <spider>:
	...

10010368 <centipede_body>:
	...

100104a8 <score>:
100104a8:	00000000 	nop

100104ac <fungus>:
	...

100104ea <lifes>:
	...

100104eb <centipedes_remaining>:
	...

100104ec <cursor_col>:
	...

100104ed <cursor_row>:
	...

100104ee <chr_attr>:
	...
