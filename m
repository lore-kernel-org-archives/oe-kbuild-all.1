Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75F3175A68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 01:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791594095; cv=none; b=rybzXQ+dCOO6Lb+19FICjND6c3jbRPf08YGOrGcTz9Dz0VnpmZ2h8iaSYbqypZC7SQTFmCzJbL1iB5LgjRtn7QOgxefhjgpwXtjHHEcQ4n/e7uNllir1cIuGdeuuVJAH4daZm95Lj3JzjJfw0O9c/V2S8UBqcCOik1Y80ckz7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791594095; c=relaxed/simple;
	bh=KGbypTkb/nCnvqDu5zqO+9Og1Q1BUZyyqds/So+SsUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XZHnMv8jznmv6EqryqwCtdifNg9ukh+xKB4SqztN2UbvnbtbRVJ2Jq3oGbmVcx2qKCTWEJM42eKtBUoI7pW7xLShiuMzOzHM8eHbptTzXI+dJIS++iM9j5VyXEDfDrRA2zwYziwSpvz+zgAATgoO5EQvZ5py2R1Rv4iOXpcfuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+df+X04; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+df+X04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791594093; x=1823130093;
  h=date:from:to:cc:subject:message-id;
  bh=KGbypTkb/nCnvqDu5zqO+9Og1Q1BUZyyqds/So+SsUU=;
  b=l+df+X042TMowxc90pj3Fq8msAcAGYDj5qnvE7nQl1icZDEdCvB3xtBe
   n0+UUFYp87OpctmZboPgKa/OA2RA4OtEGGgau9jZsubSY8ypIkf031n6t
   TOhzr0oM86x1Ok0yQtdxOHrceS8030Rr1WImr57e0XKmQdGu0vvyPKoOu
   72Yjq/qS3PWvHUw7gvQYwxdFNXKiIwhXOJh3Tfg4w+k+5SiTSpnCJ1Iim
   TXrDpOmtef6bg0TCbglmuaWFS7JqZOhHEUG5Vjw0GZm0hlaT9k5jzJJ8f
   d4H9kf3Nitc3lLoGTDl35/hvW1Ckv4SXtdQPj581scM8+0Kge/LAJW99s
   A==;
X-CSE-ConnectionGUID: tBScb08aRiOHxpQeLXepDQ==
X-CSE-MsgGUID: OdiIhm2YTwKGYioy9Owp8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="278798"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="278798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 18:01:32 -0700
X-CSE-ConnectionGUID: FD45LHYcSoutoJ0Y4hPWBw==
X-CSE-MsgGUID: XDBZYUYYSnuBszvfBg+swQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="453455"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2026 18:01:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFLSq-000000007R5-1vDt;
	Sat, 10 Oct 2026 01:01:28 +0000
Date: Sat, 10 Oct 2026 03:00:52 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 33/52] kernel/bpf/scev.c:643:36: sparse:
 sparse: restricted __be16 degrades to integer
Message-ID: <202610100229.P8qCDYqu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   15b578b1715d9a318c804350d98af87c203672bc
commit: 1501b536818b99a643842296a062019d221716f7 [33/52] bpf: Compute scalar evolution expressions for loops
config: x86_64-randconfig-r2303-20261010 (https://download.01.org/0day-ci/archive/20261010/202610100229.P8qCDYqu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100229.P8qCDYqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100229.P8qCDYqu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/scev.c:643:36: sparse: sparse: restricted __be16 degrades to integer

vim +643 kernel/bpf/scev.c

   640	
   641	static int transfer(struct bpf_verifier_env *env, struct env *e, int idx)
   642	{
 > 643		const bool little_endian = htons(0x3412) == 0x1234;
   644		struct bpf_insn *insn = &env->prog->insnsi[idx];
   645		struct scev *scev = env->scev;
   646		u32 *reg2expr = e->reg2expr;
   647		u8 class = BPF_CLASS(insn->code);
   648		u8 x_or_k = BPF_SRC(insn->code);
   649		u8 opcode = BPF_OP(insn->code);
   650		u8 mode = BPF_MODE(insn->code);
   651		u32 dst = insn->dst_reg;
   652		u32 src = insn->src_reg;
   653		u32 op, sext;
   654		bool need_bswap;
   655		int i, id;
   656		s64 imm;
   657	
   658		switch (class) {
   659		case BPF_ALU:
   660		case BPF_ALU64:
   661			switch (opcode) {
   662			case BPF_MOV:
   663				switch (insn->off) {
   664				case 0: sext = 0; break;
   665				case 8: sext = SEXT8; break;
   666				case 16: sext = SEXT16; break;
   667				case 32: sext = SEXT32; break;
   668				default:
   669					goto mark_dst_unknown;
   670				}
   671	
   672				if (x_or_k == BPF_X && insn->imm == 0)
   673					id = reg2expr[src];
   674				else if (x_or_k == BPF_K && src == 0 && insn->off == 0)
   675					id = imm_expr(scev, insn->imm);
   676				else
   677					goto mark_dst_unknown;
   678	
   679				if (sext)
   680					id = expr1(scev, sext, id);
   681				if (class == BPF_ALU)
   682					id = expr1(scev, ZEXT32, id);
   683	
   684				return replace_reg(scev, e, dst, id);
   685	
   686			case BPF_ADD:
   687			case BPF_SUB:
   688			case BPF_MUL:
   689			case BPF_DIV:
   690			case BPF_MOD:
   691			case BPF_OR:
   692			case BPF_XOR:
   693			case BPF_AND:
   694			case BPF_LSH:
   695			case BPF_RSH:
   696			case BPF_ARSH:
   697				if (opcode == BPF_DIV && insn->off == 1)
   698					op = SDIV;
   699				else if (opcode == BPF_MOD && insn->off == 1)
   700					op = SMOD;
   701				else if (insn->off == 0)
   702					op = opcode;
   703				else
   704					goto mark_dst_unknown;
   705	
   706				if (x_or_k == BPF_X && insn->imm == 0)
   707					id = reg2expr[src];
   708				else if (x_or_k == BPF_K && src == 0)
   709					id = imm_expr(scev, insn->imm);
   710				else
   711					goto mark_dst_unknown;
   712	
   713				id = expr2(scev, op, reg2expr[dst], id);
   714	
   715				if (class == BPF_ALU)
   716					id = expr1(scev, ZEXT32, id);
   717	
   718				return replace_reg(scev, e, dst, id);
   719	
   720			case BPF_NEG:
   721				if (src == 0 && insn->off == 0 && insn->imm == 0)
   722					id = expr1(scev, BPF_NEG, reg2expr[dst]);
   723				else
   724					goto mark_dst_unknown;
   725	
   726				if (class == BPF_ALU)
   727					id = expr1(scev, ZEXT32, id);
   728	
   729				return replace_reg(scev, e, dst, id);
   730	
   731			case BPF_END:
   732				if (src != 0 || insn->off != 0 || (class == BPF_ALU64 && x_or_k != 0))
   733					goto mark_dst_unknown;
   734	
   735				need_bswap = class == BPF_ALU64 || ((x_or_k == BPF_TO_LE) != little_endian);
   736				switch (insn->imm) {
   737				case 16: op = need_bswap ? BSWAP16 : ZEXT16; break;
   738				case 32: op = need_bswap ? BSWAP32 : ZEXT32; break;
   739				case 64: op = need_bswap ? BSWAP64 : 0; break;
   740				default:
   741					goto mark_dst_unknown;
   742				}
   743	
   744				id = reg2expr[dst];
   745				if (op)
   746					id = expr1(scev, op, reg2expr[dst]);
   747	
   748				return replace_reg(scev, e, dst, id);
   749			default:
   750				goto mark_dst_unknown;
   751			}
   752			break;
   753		case BPF_LDX:
   754			switch (mode) {
   755			case BPF_MEM:
   756			case BPF_MEMSX:
   757				return maybe_load_fp(scev, e, insn);
   758			default:
   759				goto mark_dst_unknown;
   760			}
   761		case BPF_STX:
   762			switch (mode) {
   763			case BPF_MEM:
   764				return maybe_store_fp(scev, e, insn, reg2expr[src]);
   765			case BPF_ATOMIC:
   766				if (insn->imm == BPF_LOAD_ACQ)
   767					return maybe_load_fp(scev, e, insn);
   768				if (insn->imm == BPF_STORE_REL) {
   769					return maybe_store_fp(scev, e, insn, reg2expr[src]);
   770				}
   771				/*
   772				 * verifier does not track other atomic ops precisely,
   773				 * hence mark the results as opaque.
   774				 */
   775				if (insn->dst_reg == BPF_REG_FP)
   776					mark_opaque(e, insn->off, bpf_size_to_bytes(BPF_SIZE(insn->code)));
   777				if (insn->imm == BPF_CMPXCHG)
   778					return replace_reg(scev, e, BPF_REG_0, OPAQUE_EXPR_ID);
   779				if (insn->imm & BPF_FETCH)
   780					return replace_reg(scev, e, src, OPAQUE_EXPR_ID);
   781				break;
   782			}
   783			break;
   784		case BPF_ST:
   785			if (insn->dst_reg == BPF_REG_FP) {
   786				id = imm_expr(scev, insn->imm);
   787				if (id < 0)
   788					return id;
   789				return maybe_store_fp(scev, e, insn, id);
   790			}
   791			break;
   792		case BPF_JMP:
   793		case BPF_JMP32:
   794			if (opcode == BPF_CALL)
   795				forget_call_regs(e);
   796			/* for non-CALL there are no changes in register states */
   797			break;
   798		case BPF_LD:
   799			switch (mode) {
   800			case BPF_IMM:
   801				/* rX = imm ll */
   802				if (BPF_SIZE(insn->code) == BPF_DW && insn->src_reg == 0) {
   803					imm = ((u64)(insn + 1)->imm << 32) | (u32)insn->imm;
   804					return replace_reg(scev, e, dst, imm_expr(scev, imm));
   805				}
   806				/* map, map value, BTF id, function */
   807				if (BPF_SIZE(insn->code) == BPF_DW)
   808					return replace_reg(scev, e, dst, OPAQUE_EXPR_ID);
   809				goto mark_dst_unknown;
   810			case BPF_ABS:
   811			case BPF_IND:
   812				forget_call_regs(e);
   813				break;
   814			default:
   815				goto mark_dst_unknown;
   816			}
   817			break;
   818		default:
   819			/* unknown instruction, nuke state */
   820			for (i = 0; i < REGS_NUM; i++)
   821				reg2expr[i] = UNKNOWN_EXPR_ID;
   822			break;
   823		}
   824		return 0;
   825	
   826	mark_dst_unknown:
   827		reg2expr[dst] = UNKNOWN_EXPR_ID;
   828		return 0;
   829	}
   830	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
