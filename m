Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794095680;
	b=A+D91lV4C0CYOAVq0QSrWxHtYmcdYMp4FDeTnMyHZXB6lJqUTDETiSvWFLn8ef5l/fPk
	 Yxm1uxF1hiU0gA8zaqHHxjevN0yj4XtovgHUUsJNlxPlh1jEQfMrZeb7nFX9yDky7JDbn
	 qrYfcc/tCQ2ufouQx6OoyHiuqpbQweRhFvzQU1j3Yxs1UMhJS0VhNj1gBc2OA5RuDF0q1
	 59pleIzUmUuAUm7N+lgXjM62kEd3NTPIYt2CfnkpjwCT1f8DT6rgVsGyhlw/zWt79qZuV
	 KLTNReaqJ7d32PFSusCjETNEcy36NDxgH0ONqbE9jtOZe7e1yhmqfQyfQSamzcMHuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794095680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=e/0k5HwMHN5QaMja7wZqMwsu1zLnoxT3rcM/sLjzvSI=;
	b=A4lFttiFnWNEBSE3Tr9cvEujorg4fwu0njmuZVUBlfwgjHRic56wDCwrsvRL9AYGlGun
	 ZIVjMmvDjVkBIIKiRtn/zzd0u0nKYst/rVuuxZoF+iarRpiHFjhSUxeiIFBOc9OR6loKG
	 knNVULSncSnvpHSmX7Btj6e6/yfK+DMiWrJ4kCFvwwgN6dTngYrydNtJ5yUUM6zExlKSn
	 DE2Tdf1UFR0VmsRM9UGTd3bi8wyw1TmMIGBpCDPXELGXGgqFHGe38BM1JWVKUtqIFQ5GM
	 aoPmYpSfWgKbYN5ODEIer1j/PI+yla4iY89TsNR+s+WvSnJTVxADwH8U6zKQbJVGr/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5r9Qz0q;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED796606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 23:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED796606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5r9Qz0q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794095678; x=1825631678;
  h=date:from:to:cc:subject:message-id;
  bh=S+zz111V64SPm3YGOBx6pQUCHd2p6yyXzCdFHcqhPd8=;
  b=N5r9Qz0qVQik1L+QH2/fZiYmlQ27yxAriVNe4cHwbJHL1+oD631Knzkc
   UjMzm9hvAnoPf2lP+07GXUtykdSaLUaps8NudZEjtQgmTH+hpZPOUdJQG
   X2w8Z+lmXr9CbjKPKEuoGs3vHUQM7ZxA7UplSkzSpwWmNgCnxAf0hoKgG
   eB0UXl3L8Shs0pMbVUbS5UAQl1cDRl4nNu4QJhKfCKxQaL/4QlEAwmnLd
   qUQyl9HTKkbhjs6CuqDV6PrdZdMgdNLEbuQGDZmxo45tfhgA+kAJOZEOi
   GAHlPm+0SMowOVf7yp4rkg0RcP3ZeJUumkU/kp0UCQzX/FiJvLfZyNzuG
   w==;
X-CSE-ConnectionGUID: p4YGv2YqSI+z55bxxb9QeA==
X-CSE-MsgGUID: mJk5WjYJRpif83JcXXvc7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2747004"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2747004"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 15:54:37 -0800
X-CSE-ConnectionGUID: V++DR0pgSt6GSIeD8yiPLw==
X-CSE-MsgGUID: QdsNyy1OTbahA0f2ISfYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7459499"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 15:54:36 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqEy-00000000As4-0xog;
	Sat, 07 Nov 2026 23:54:32 +0000
Date: Sun, 08 Nov 2026 00:54:23 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3430/4145] kernel/bpf/scev.c:736:33-42:
 duplicated argument to && or ||
Message-ID: <202611080024.A0phXMMa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
commit: 28a373cb0f6a579049ffe92747575213a442673f [3430/4145] bpf: Fold sums of constants and two shifts by 32 in scalar evolution
config: hexagon-randconfig-r2101-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080024.A0phXMMa-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080024.A0phXMMa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/scev.c:736:33-42: duplicated argument to && or ||

vim +736 kernel/bpf/scev.c

   656	
   657	static int transfer(struct bpf_verifier_env *env, struct env *e, int idx)
   658	{
   659		const bool little_endian = htons(0x3412) == 0x1234;
   660		struct bpf_insn *insn = &env->prog->insnsi[idx];
   661		struct scev *scev = env->scev;
   662		u32 *reg2expr = e->reg2expr;
   663		u8 class = BPF_CLASS(insn->code);
   664		u8 x_or_k = BPF_SRC(insn->code);
   665		u8 opcode = BPF_OP(insn->code);
   666		u8 mode = BPF_MODE(insn->code);
   667		u32 dst = insn->dst_reg;
   668		u32 src = insn->src_reg;
   669		u32 op, sext, l, r;
   670		bool need_bswap;
   671		int i, id;
   672		s64 imm;
   673	
   674		switch (class) {
   675		case BPF_ALU:
   676		case BPF_ALU64:
   677			switch (opcode) {
   678			case BPF_MOV:
   679				switch (insn->off) {
   680				case 0: sext = 0; break;
   681				case 8: sext = SEXT8; break;
   682				case 16: sext = SEXT16; break;
   683				case 32: sext = SEXT32; break;
   684				default:
   685					goto mark_dst_unknown;
   686				}
   687	
   688				if (x_or_k == BPF_X && insn->imm == 0)
   689					id = reg2expr[src];
   690				else if (x_or_k == BPF_K && src == 0 && insn->off == 0)
   691					id = imm_expr(scev, insn->imm);
   692				else
   693					goto mark_dst_unknown;
   694	
   695				if (sext)
   696					id = expr1(scev, sext, id);
   697				if (class == BPF_ALU)
   698					id = expr1(scev, ZEXT32, id);
   699	
   700				return replace_reg(scev, e, dst, id);
   701	
   702			case BPF_ADD:
   703			case BPF_SUB:
   704			case BPF_MUL:
   705			case BPF_DIV:
   706			case BPF_MOD:
   707			case BPF_OR:
   708			case BPF_XOR:
   709			case BPF_AND:
   710			case BPF_LSH:
   711			case BPF_RSH:
   712			case BPF_ARSH:
   713				if (opcode == BPF_DIV && insn->off == 1)
   714					op = SDIV;
   715				else if (opcode == BPF_MOD && insn->off == 1)
   716					op = SMOD;
   717				else if (insn->off == 0)
   718					op = opcode;
   719				else
   720					goto mark_dst_unknown;
   721	
   722				if (x_or_k == BPF_X && insn->imm == 0)
   723					id = reg2expr[src];
   724				else if (x_or_k == BPF_K && src == 0)
   725					id = imm_expr(scev, insn->imm);
   726				else
   727					goto mark_dst_unknown;
   728	
   729				/*
   730				 * 'r1 <<= 32; r1 >>= 32' is (u32)r1 for cpu v1 and v2. Only here both
   731				 * shifts are known to be 64-bit ones: the result of a 32-bit shift is
   732				 * (zext32 ...), and (>> x 32) is 'w1 >>= w2' with 32 in w2 as well,
   733				 * which shifts by 0.
   734				 */
   735				if (class == BPF_ALU64 && op == BPF_RSH && id >= 0 &&
 > 736				    is_imm(scev, id, &imm) && imm == 32 &&
   737				    is_binop(scev, BPF_LSH, reg2expr[dst], &l, &r) &&
   738				    is_imm(scev, r, &imm) && imm == 32)
   739					return replace_reg(scev, e, dst, expr1(scev, ZEXT32, l));
   740	
   741				id = expr2(scev, op, reg2expr[dst], id);
   742	
   743				if (class == BPF_ALU)
   744					id = expr1(scev, ZEXT32, id);
   745	
   746				return replace_reg(scev, e, dst, id);
   747	
   748			case BPF_NEG:
   749				if (src == 0 && insn->off == 0 && insn->imm == 0)
   750					id = expr1(scev, BPF_NEG, reg2expr[dst]);
   751				else
   752					goto mark_dst_unknown;
   753	
   754				if (class == BPF_ALU)
   755					id = expr1(scev, ZEXT32, id);
   756	
   757				return replace_reg(scev, e, dst, id);
   758	
   759			case BPF_END:
   760				if (src != 0 || insn->off != 0 || (class == BPF_ALU64 && x_or_k != 0))
   761					goto mark_dst_unknown;
   762	
   763				need_bswap = class == BPF_ALU64 || ((x_or_k == BPF_TO_LE) != little_endian);
   764				switch (insn->imm) {
   765				case 16: op = need_bswap ? BSWAP16 : ZEXT16; break;
   766				case 32: op = need_bswap ? BSWAP32 : ZEXT32; break;
   767				case 64: op = need_bswap ? BSWAP64 : 0; break;
   768				default:
   769					goto mark_dst_unknown;
   770				}
   771	
   772				id = reg2expr[dst];
   773				if (op)
   774					id = expr1(scev, op, reg2expr[dst]);
   775	
   776				return replace_reg(scev, e, dst, id);
   777			default:
   778				goto mark_dst_unknown;
   779			}
   780			break;
   781		case BPF_LDX:
   782			switch (mode) {
   783			case BPF_MEM:
   784			case BPF_MEMSX:
   785				/*
   786				 * for (i = 0; i < nr_cpus; i++) with "const volatile int nr_cpus":
   787				 * bpf_compute_const_regs() knows what is loaded from a read-only map.
   788				 */
   789				if (insn->src_reg != BPF_REG_FP && idx + 1 < env->prog->len &&
   790				    (env->insn_aux_data[idx + 1].const_reg_mask & BIT(dst))) {
   791					imm = env->insn_aux_data[idx + 1].const_reg_vals[dst];
   792					return replace_reg(scev, e, dst, imm_expr(scev, imm));
   793				}
   794				return maybe_load_fp(scev, e, insn);
   795			default:
   796				goto mark_dst_unknown;
   797			}
   798		case BPF_STX:
   799			switch (mode) {
   800			case BPF_MEM:
   801				return maybe_store_fp(scev, e, insn, reg2expr[src]);
   802			case BPF_ATOMIC:
   803				if (insn->imm == BPF_LOAD_ACQ)
   804					return maybe_load_fp(scev, e, insn);
   805				if (insn->imm == BPF_STORE_REL) {
   806					return maybe_store_fp(scev, e, insn, reg2expr[src]);
   807				}
   808				/*
   809				 * verifier does not track other atomic ops precisely,
   810				 * hence mark the results as opaque.
   811				 */
   812				if (insn->dst_reg == BPF_REG_FP)
   813					mark_opaque(e, insn->off, bpf_size_to_bytes(BPF_SIZE(insn->code)));
   814				if (insn->imm == BPF_CMPXCHG)
   815					return replace_reg(scev, e, BPF_REG_0, OPAQUE_EXPR_ID);
   816				if (insn->imm & BPF_FETCH)
   817					return replace_reg(scev, e, src, OPAQUE_EXPR_ID);
   818				break;
   819			}
   820			break;
   821		case BPF_ST:
   822			if (insn->dst_reg == BPF_REG_FP) {
   823				id = imm_expr(scev, insn->imm);
   824				if (id < 0)
   825					return id;
   826				return maybe_store_fp(scev, e, insn, id);
   827			}
   828			break;
   829		case BPF_JMP:
   830		case BPF_JMP32:
   831			if (opcode == BPF_CALL)
   832				forget_call_regs(e);
   833			/* for non-CALL there are no changes in register states */
   834			break;
   835		case BPF_LD:
   836			switch (mode) {
   837			case BPF_IMM:
   838				/* rX = imm ll */
   839				if (BPF_SIZE(insn->code) == BPF_DW && insn->src_reg == 0) {
   840					imm = ((u64)(insn + 1)->imm << 32) | (u32)insn->imm;
   841					return replace_reg(scev, e, dst, imm_expr(scev, imm));
   842				}
   843				/* map, map value, BTF id, function */
   844				if (BPF_SIZE(insn->code) == BPF_DW)
   845					return replace_reg(scev, e, dst, OPAQUE_EXPR_ID);
   846				goto mark_dst_unknown;
   847			case BPF_ABS:
   848			case BPF_IND:
   849				forget_call_regs(e);
   850				break;
   851			default:
   852				goto mark_dst_unknown;
   853			}
   854			break;
   855		default:
   856			/* unknown instruction, nuke state */
   857			for (i = 0; i < REGS_NUM; i++)
   858				reg2expr[i] = UNKNOWN_EXPR_ID;
   859			break;
   860		}
   861		return 0;
   862	
   863	mark_dst_unknown:
   864		reg2expr[dst] = UNKNOWN_EXPR_ID;
   865		return 0;
   866	}
   867	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
