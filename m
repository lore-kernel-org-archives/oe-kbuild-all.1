Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C14A5392
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706832291; cv=none; b=DI3xbidPdIzmGJolmhok8tQCxJjj533I4GT7ZE5EkkryQXNa9Q6z8e5bKbZbYdshC9nDbUKzD7Kv5m13c7NwhXNw7mjdq9qkIkQ8zGbHYz1qL0POD77Bh8CwkwZ5AOXDiw8Nn7R9aupVU249+QTMbERHrJfSYxdTLv5OgBSnNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706832291; c=relaxed/simple;
	bh=0EANbgBZivaKW9pRVeINpmO8jxn0ZefGxJ+/nlG9NLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dww2AvCNFWS6KxvxZgdevawwoXRSE2YFIyjy6pxnsbIVrSo2+RXn8Q3eNNIMj7TW8uVPYfhfMKJHs64P5KiIxGRTOqzJ9neFc3QXWbRpafe4aTosSlYehtbb7wc0YKIYjKle1bIAho9paEEbxomFzXjdRCy5CWhB8ZmPOe3IIpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Onas1JTB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Onas1JTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706832290; x=1738368290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EANbgBZivaKW9pRVeINpmO8jxn0ZefGxJ+/nlG9NLU=;
  b=Onas1JTB3F7gKB4b3fs8AUomtBeHgSID5Umd+WqGhoHj1+Zyko6tg0qQ
   zmBhj9D1zSsdZ2O+zFcG1Xaouul+/leYc/TqInE6WCTwx0x6lIDVsMqwx
   G1DQYdWe+VgwRxRkO0sBhMXuLvc7HpKvcSNPQplXturwmH8NUUYX3vCe8
   I0pQJp/CssbYOQ+tHdYC9bvJ5nQMHDhclaJsfsxcHKVF0z1n7faBTQDbF
   jayQP6PIBMS6rv/FMMc2X5N0RFXr5wjvrVekH7I/i81kI4+QG/SYn/VfI
   4dW/vTIIoLWPWBOF0j/p10U7SthwnYE4BCpyyl+UnzF+29SNN7J6jz86l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11138998"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="11138998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 16:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="30748339"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Feb 2024 16:04:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVh2y-0003Mg-2q;
	Fri, 02 Feb 2024 00:04:44 +0000
Date: Fri, 2 Feb 2024 08:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena 11/20] arch/x86/net/bpf_jit_comp.c:1281: undefined
 reference to `bpf_arena_get_kern_vm_start'
Message-ID: <202402020818.lz57i1GW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena
head:   d36b70adaf031a8c1d6e6dae089dcbd42f1678ea
commit: 14998d7229aae1c444cebe748b0610805f2d43f2 [11/20] bpf: Add x86-64 JIT support for PROBE_MEM32 pseudo instructions.
config: x86_64-randconfig-161-20240201 (https://download.01.org/0day-ci/archive/20240202/202402020818.lz57i1GW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402020818.lz57i1GW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402020818.lz57i1GW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/net/bpf_jit_comp.o: in function `do_jit':
>> arch/x86/net/bpf_jit_comp.c:1281: undefined reference to `bpf_arena_get_kern_vm_start'


vim +1281 arch/x86/net/bpf_jit_comp.c

  1260	
  1261	/* mov rax, qword ptr [rbp - rounded_stack_depth - 8] */
  1262	#define RESTORE_TAIL_CALL_CNT(stack)				\
  1263		EMIT3_off32(0x48, 0x8B, 0x85, -round_up(stack, 8) - 8)
  1264	
  1265	static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
  1266			  int oldproglen, struct jit_context *ctx, bool jmp_padding)
  1267	{
  1268		bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
  1269		struct bpf_insn *insn = bpf_prog->insnsi;
  1270		bool callee_regs_used[4] = {};
  1271		int insn_cnt = bpf_prog->len;
  1272		bool tail_call_seen = false;
  1273		bool seen_exit = false;
  1274		u8 temp[BPF_MAX_INSN_SIZE + BPF_INSN_SAFETY];
  1275		u64 arena_vm_start;
  1276		int i, excnt = 0;
  1277		int ilen, proglen = 0;
  1278		u8 *prog = temp;
  1279		int err;
  1280	
> 1281		arena_vm_start = bpf_arena_get_kern_vm_start(bpf_prog->aux->arena);
  1282	
  1283		detect_reg_usage(insn, insn_cnt, callee_regs_used,
  1284				 &tail_call_seen);
  1285	
  1286		/* tail call's presence in current prog implies it is reachable */
  1287		tail_call_reachable |= tail_call_seen;
  1288	
  1289		emit_prologue(&prog, bpf_prog->aux->stack_depth,
  1290			      bpf_prog_was_classic(bpf_prog), tail_call_reachable,
  1291			      bpf_is_subprog(bpf_prog), bpf_prog->aux->exception_cb);
  1292		/* Exception callback will clobber callee regs for its own use, and
  1293		 * restore the original callee regs from main prog's stack frame.
  1294		 */
  1295		if (bpf_prog->aux->exception_boundary) {
  1296			/* We also need to save r12, which is not mapped to any BPF
  1297			 * register, as we throw after entry into the kernel, which may
  1298			 * overwrite r12.
  1299			 */
  1300			push_r12(&prog);
  1301			push_callee_regs(&prog, all_callee_regs_used);
  1302		} else {
  1303			if (arena_vm_start)
  1304				push_r12(&prog);
  1305			push_callee_regs(&prog, callee_regs_used);
  1306		}
  1307		if (arena_vm_start)
  1308			emit_mov_imm64(&prog, X86_REG_R12,
  1309				       arena_vm_start >> 32, (u32) arena_vm_start);
  1310	
  1311		ilen = prog - temp;
  1312		if (rw_image)
  1313			memcpy(rw_image + proglen, temp, ilen);
  1314		proglen += ilen;
  1315		addrs[0] = proglen;
  1316		prog = temp;
  1317	
  1318		for (i = 1; i <= insn_cnt; i++, insn++) {
  1319			const s32 imm32 = insn->imm;
  1320			u32 dst_reg = insn->dst_reg;
  1321			u32 src_reg = insn->src_reg;
  1322			u8 b2 = 0, b3 = 0;
  1323			u8 *start_of_ldx;
  1324			s64 jmp_offset;
  1325			s16 insn_off;
  1326			u8 jmp_cond;
  1327			u8 *func;
  1328			int nops;
  1329	
  1330			switch (insn->code) {
  1331				/* ALU */
  1332			case BPF_ALU | BPF_ADD | BPF_X:
  1333			case BPF_ALU | BPF_SUB | BPF_X:
  1334			case BPF_ALU | BPF_AND | BPF_X:
  1335			case BPF_ALU | BPF_OR | BPF_X:
  1336			case BPF_ALU | BPF_XOR | BPF_X:
  1337			case BPF_ALU64 | BPF_ADD | BPF_X:
  1338			case BPF_ALU64 | BPF_SUB | BPF_X:
  1339			case BPF_ALU64 | BPF_AND | BPF_X:
  1340			case BPF_ALU64 | BPF_OR | BPF_X:
  1341			case BPF_ALU64 | BPF_XOR | BPF_X:
  1342				maybe_emit_mod(&prog, dst_reg, src_reg,
  1343					       BPF_CLASS(insn->code) == BPF_ALU64);
  1344				b2 = simple_alu_opcodes[BPF_OP(insn->code)];
  1345				EMIT2(b2, add_2reg(0xC0, dst_reg, src_reg));
  1346				break;
  1347	
  1348			case BPF_ALU64 | BPF_MOV | BPF_X:
  1349			case BPF_ALU | BPF_MOV | BPF_X:
  1350				if (insn->off == 0)
  1351					emit_mov_reg(&prog,
  1352						     BPF_CLASS(insn->code) == BPF_ALU64,
  1353						     dst_reg, src_reg);
  1354				else
  1355					emit_movsx_reg(&prog, insn->off,
  1356						       BPF_CLASS(insn->code) == BPF_ALU64,
  1357						       dst_reg, src_reg);
  1358				break;
  1359	
  1360				/* neg dst */
  1361			case BPF_ALU | BPF_NEG:
  1362			case BPF_ALU64 | BPF_NEG:
  1363				maybe_emit_1mod(&prog, dst_reg,
  1364						BPF_CLASS(insn->code) == BPF_ALU64);
  1365				EMIT2(0xF7, add_1reg(0xD8, dst_reg));
  1366				break;
  1367	
  1368			case BPF_ALU | BPF_ADD | BPF_K:
  1369			case BPF_ALU | BPF_SUB | BPF_K:
  1370			case BPF_ALU | BPF_AND | BPF_K:
  1371			case BPF_ALU | BPF_OR | BPF_K:
  1372			case BPF_ALU | BPF_XOR | BPF_K:
  1373			case BPF_ALU64 | BPF_ADD | BPF_K:
  1374			case BPF_ALU64 | BPF_SUB | BPF_K:
  1375			case BPF_ALU64 | BPF_AND | BPF_K:
  1376			case BPF_ALU64 | BPF_OR | BPF_K:
  1377			case BPF_ALU64 | BPF_XOR | BPF_K:
  1378				maybe_emit_1mod(&prog, dst_reg,
  1379						BPF_CLASS(insn->code) == BPF_ALU64);
  1380	
  1381				/*
  1382				 * b3 holds 'normal' opcode, b2 short form only valid
  1383				 * in case dst is eax/rax.
  1384				 */
  1385				switch (BPF_OP(insn->code)) {
  1386				case BPF_ADD:
  1387					b3 = 0xC0;
  1388					b2 = 0x05;
  1389					break;
  1390				case BPF_SUB:
  1391					b3 = 0xE8;
  1392					b2 = 0x2D;
  1393					break;
  1394				case BPF_AND:
  1395					b3 = 0xE0;
  1396					b2 = 0x25;
  1397					break;
  1398				case BPF_OR:
  1399					b3 = 0xC8;
  1400					b2 = 0x0D;
  1401					break;
  1402				case BPF_XOR:
  1403					b3 = 0xF0;
  1404					b2 = 0x35;
  1405					break;
  1406				}
  1407	
  1408				if (is_imm8(imm32))
  1409					EMIT3(0x83, add_1reg(b3, dst_reg), imm32);
  1410				else if (is_axreg(dst_reg))
  1411					EMIT1_off32(b2, imm32);
  1412				else
  1413					EMIT2_off32(0x81, add_1reg(b3, dst_reg), imm32);
  1414				break;
  1415	
  1416			case BPF_ALU64 | BPF_MOV | BPF_K:
  1417			case BPF_ALU | BPF_MOV | BPF_K:
  1418				emit_mov_imm32(&prog, BPF_CLASS(insn->code) == BPF_ALU64,
  1419					       dst_reg, imm32);
  1420				break;
  1421	
  1422			case BPF_LD | BPF_IMM | BPF_DW:
  1423				emit_mov_imm64(&prog, dst_reg, insn[1].imm, insn[0].imm);
  1424				insn++;
  1425				i++;
  1426				break;
  1427	
  1428				/* dst %= src, dst /= src, dst %= imm32, dst /= imm32 */
  1429			case BPF_ALU | BPF_MOD | BPF_X:
  1430			case BPF_ALU | BPF_DIV | BPF_X:
  1431			case BPF_ALU | BPF_MOD | BPF_K:
  1432			case BPF_ALU | BPF_DIV | BPF_K:
  1433			case BPF_ALU64 | BPF_MOD | BPF_X:
  1434			case BPF_ALU64 | BPF_DIV | BPF_X:
  1435			case BPF_ALU64 | BPF_MOD | BPF_K:
  1436			case BPF_ALU64 | BPF_DIV | BPF_K: {
  1437				bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
  1438	
  1439				if (dst_reg != BPF_REG_0)
  1440					EMIT1(0x50); /* push rax */
  1441				if (dst_reg != BPF_REG_3)
  1442					EMIT1(0x52); /* push rdx */
  1443	
  1444				if (BPF_SRC(insn->code) == BPF_X) {
  1445					if (src_reg == BPF_REG_0 ||
  1446					    src_reg == BPF_REG_3) {
  1447						/* mov r11, src_reg */
  1448						EMIT_mov(AUX_REG, src_reg);
  1449						src_reg = AUX_REG;
  1450					}
  1451				} else {
  1452					/* mov r11, imm32 */
  1453					EMIT3_off32(0x49, 0xC7, 0xC3, imm32);
  1454					src_reg = AUX_REG;
  1455				}
  1456	
  1457				if (dst_reg != BPF_REG_0)
  1458					/* mov rax, dst_reg */
  1459					emit_mov_reg(&prog, is64, BPF_REG_0, dst_reg);
  1460	
  1461				if (insn->off == 0) {
  1462					/*
  1463					 * xor edx, edx
  1464					 * equivalent to 'xor rdx, rdx', but one byte less
  1465					 */
  1466					EMIT2(0x31, 0xd2);
  1467	
  1468					/* div src_reg */
  1469					maybe_emit_1mod(&prog, src_reg, is64);
  1470					EMIT2(0xF7, add_1reg(0xF0, src_reg));
  1471				} else {
  1472					if (BPF_CLASS(insn->code) == BPF_ALU)
  1473						EMIT1(0x99); /* cdq */
  1474					else
  1475						EMIT2(0x48, 0x99); /* cqo */
  1476	
  1477					/* idiv src_reg */
  1478					maybe_emit_1mod(&prog, src_reg, is64);
  1479					EMIT2(0xF7, add_1reg(0xF8, src_reg));
  1480				}
  1481	
  1482				if (BPF_OP(insn->code) == BPF_MOD &&
  1483				    dst_reg != BPF_REG_3)
  1484					/* mov dst_reg, rdx */
  1485					emit_mov_reg(&prog, is64, dst_reg, BPF_REG_3);
  1486				else if (BPF_OP(insn->code) == BPF_DIV &&
  1487					 dst_reg != BPF_REG_0)
  1488					/* mov dst_reg, rax */
  1489					emit_mov_reg(&prog, is64, dst_reg, BPF_REG_0);
  1490	
  1491				if (dst_reg != BPF_REG_3)
  1492					EMIT1(0x5A); /* pop rdx */
  1493				if (dst_reg != BPF_REG_0)
  1494					EMIT1(0x58); /* pop rax */
  1495				break;
  1496			}
  1497	
  1498			case BPF_ALU | BPF_MUL | BPF_K:
  1499			case BPF_ALU64 | BPF_MUL | BPF_K:
  1500				maybe_emit_mod(&prog, dst_reg, dst_reg,
  1501					       BPF_CLASS(insn->code) == BPF_ALU64);
  1502	
  1503				if (is_imm8(imm32))
  1504					/* imul dst_reg, dst_reg, imm8 */
  1505					EMIT3(0x6B, add_2reg(0xC0, dst_reg, dst_reg),
  1506					      imm32);
  1507				else
  1508					/* imul dst_reg, dst_reg, imm32 */
  1509					EMIT2_off32(0x69,
  1510						    add_2reg(0xC0, dst_reg, dst_reg),
  1511						    imm32);
  1512				break;
  1513	
  1514			case BPF_ALU | BPF_MUL | BPF_X:
  1515			case BPF_ALU64 | BPF_MUL | BPF_X:
  1516				maybe_emit_mod(&prog, src_reg, dst_reg,
  1517					       BPF_CLASS(insn->code) == BPF_ALU64);
  1518	
  1519				/* imul dst_reg, src_reg */
  1520				EMIT3(0x0F, 0xAF, add_2reg(0xC0, src_reg, dst_reg));
  1521				break;
  1522	
  1523				/* Shifts */
  1524			case BPF_ALU | BPF_LSH | BPF_K:
  1525			case BPF_ALU | BPF_RSH | BPF_K:
  1526			case BPF_ALU | BPF_ARSH | BPF_K:
  1527			case BPF_ALU64 | BPF_LSH | BPF_K:
  1528			case BPF_ALU64 | BPF_RSH | BPF_K:
  1529			case BPF_ALU64 | BPF_ARSH | BPF_K:
  1530				maybe_emit_1mod(&prog, dst_reg,
  1531						BPF_CLASS(insn->code) == BPF_ALU64);
  1532	
  1533				b3 = simple_alu_opcodes[BPF_OP(insn->code)];
  1534				if (imm32 == 1)
  1535					EMIT2(0xD1, add_1reg(b3, dst_reg));
  1536				else
  1537					EMIT3(0xC1, add_1reg(b3, dst_reg), imm32);
  1538				break;
  1539	
  1540			case BPF_ALU | BPF_LSH | BPF_X:
  1541			case BPF_ALU | BPF_RSH | BPF_X:
  1542			case BPF_ALU | BPF_ARSH | BPF_X:
  1543			case BPF_ALU64 | BPF_LSH | BPF_X:
  1544			case BPF_ALU64 | BPF_RSH | BPF_X:
  1545			case BPF_ALU64 | BPF_ARSH | BPF_X:
  1546				/* BMI2 shifts aren't better when shift count is already in rcx */
  1547				if (boot_cpu_has(X86_FEATURE_BMI2) && src_reg != BPF_REG_4) {
  1548					/* shrx/sarx/shlx dst_reg, dst_reg, src_reg */
  1549					bool w = (BPF_CLASS(insn->code) == BPF_ALU64);
  1550					u8 op;
  1551	
  1552					switch (BPF_OP(insn->code)) {
  1553					case BPF_LSH:
  1554						op = 1; /* prefix 0x66 */
  1555						break;
  1556					case BPF_RSH:
  1557						op = 3; /* prefix 0xf2 */
  1558						break;
  1559					case BPF_ARSH:
  1560						op = 2; /* prefix 0xf3 */
  1561						break;
  1562					}
  1563	
  1564					emit_shiftx(&prog, dst_reg, src_reg, w, op);
  1565	
  1566					break;
  1567				}
  1568	
  1569				if (src_reg != BPF_REG_4) { /* common case */
  1570					/* Check for bad case when dst_reg == rcx */
  1571					if (dst_reg == BPF_REG_4) {
  1572						/* mov r11, dst_reg */
  1573						EMIT_mov(AUX_REG, dst_reg);
  1574						dst_reg = AUX_REG;
  1575					} else {
  1576						EMIT1(0x51); /* push rcx */
  1577					}
  1578					/* mov rcx, src_reg */
  1579					EMIT_mov(BPF_REG_4, src_reg);
  1580				}
  1581	
  1582				/* shl %rax, %cl | shr %rax, %cl | sar %rax, %cl */
  1583				maybe_emit_1mod(&prog, dst_reg,
  1584						BPF_CLASS(insn->code) == BPF_ALU64);
  1585	
  1586				b3 = simple_alu_opcodes[BPF_OP(insn->code)];
  1587				EMIT2(0xD3, add_1reg(b3, dst_reg));
  1588	
  1589				if (src_reg != BPF_REG_4) {
  1590					if (insn->dst_reg == BPF_REG_4)
  1591						/* mov dst_reg, r11 */
  1592						EMIT_mov(insn->dst_reg, AUX_REG);
  1593					else
  1594						EMIT1(0x59); /* pop rcx */
  1595				}
  1596	
  1597				break;
  1598	
  1599			case BPF_ALU | BPF_END | BPF_FROM_BE:
  1600			case BPF_ALU64 | BPF_END | BPF_FROM_LE:
  1601				switch (imm32) {
  1602				case 16:
  1603					/* Emit 'ror %ax, 8' to swap lower 2 bytes */
  1604					EMIT1(0x66);
  1605					if (is_ereg(dst_reg))
  1606						EMIT1(0x41);
  1607					EMIT3(0xC1, add_1reg(0xC8, dst_reg), 8);
  1608	
  1609					/* Emit 'movzwl eax, ax' */
  1610					if (is_ereg(dst_reg))
  1611						EMIT3(0x45, 0x0F, 0xB7);
  1612					else
  1613						EMIT2(0x0F, 0xB7);
  1614					EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
  1615					break;
  1616				case 32:
  1617					/* Emit 'bswap eax' to swap lower 4 bytes */
  1618					if (is_ereg(dst_reg))
  1619						EMIT2(0x41, 0x0F);
  1620					else
  1621						EMIT1(0x0F);
  1622					EMIT1(add_1reg(0xC8, dst_reg));
  1623					break;
  1624				case 64:
  1625					/* Emit 'bswap rax' to swap 8 bytes */
  1626					EMIT3(add_1mod(0x48, dst_reg), 0x0F,
  1627					      add_1reg(0xC8, dst_reg));
  1628					break;
  1629				}
  1630				break;
  1631	
  1632			case BPF_ALU | BPF_END | BPF_FROM_LE:
  1633				switch (imm32) {
  1634				case 16:
  1635					/*
  1636					 * Emit 'movzwl eax, ax' to zero extend 16-bit
  1637					 * into 64 bit
  1638					 */
  1639					if (is_ereg(dst_reg))
  1640						EMIT3(0x45, 0x0F, 0xB7);
  1641					else
  1642						EMIT2(0x0F, 0xB7);
  1643					EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
  1644					break;
  1645				case 32:
  1646					/* Emit 'mov eax, eax' to clear upper 32-bits */
  1647					if (is_ereg(dst_reg))
  1648						EMIT1(0x45);
  1649					EMIT2(0x89, add_2reg(0xC0, dst_reg, dst_reg));
  1650					break;
  1651				case 64:
  1652					/* nop */
  1653					break;
  1654				}
  1655				break;
  1656	
  1657				/* speculation barrier */
  1658			case BPF_ST | BPF_NOSPEC:
  1659				EMIT_LFENCE();
  1660				break;
  1661	
  1662				/* ST: *(u8*)(dst_reg + off) = imm */
  1663			case BPF_ST | BPF_MEM | BPF_B:
  1664				if (is_ereg(dst_reg))
  1665					EMIT2(0x41, 0xC6);
  1666				else
  1667					EMIT1(0xC6);
  1668				goto st;
  1669			case BPF_ST | BPF_MEM | BPF_H:
  1670				if (is_ereg(dst_reg))
  1671					EMIT3(0x66, 0x41, 0xC7);
  1672				else
  1673					EMIT2(0x66, 0xC7);
  1674				goto st;
  1675			case BPF_ST | BPF_MEM | BPF_W:
  1676				if (is_ereg(dst_reg))
  1677					EMIT2(0x41, 0xC7);
  1678				else
  1679					EMIT1(0xC7);
  1680				goto st;
  1681			case BPF_ST | BPF_MEM | BPF_DW:
  1682				EMIT2(add_1mod(0x48, dst_reg), 0xC7);
  1683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
