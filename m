Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401CA2E36FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 00:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753231282; cv=none; b=T0jUOn2vEOxM2mkxg6TwYJ6ZaifzGShDK8d1TjWUlXTDiMztdCsLexyydxedNsvikOfixADF947L5cYF1w52kAZ6r7/Ee6LDMrsGtDrbQsjorNcbPAATQO0UhacW3UlIhZ+zByG5VmABJ8llKTdeUwl0X79ao1+AObqokzeUeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753231282; c=relaxed/simple;
	bh=oPdtMSciM6FKvmT3BlWIM6cAS6O28Of8vzvvEdEjjQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtO3cs+LJ07GdKNfYz771QMmSXjDij205anIx1HbqU3mls50krvG9uhfJ0bV5vbWQaz7+/BknEWTLGmXMhSGN+9G68GC1uvca00LA3ggZm9QrPKs7pVhOuqgjjkyquwj22+VIi8d64AaiGuSjSoibHXqohN2QGZ+7ytO4b2D0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfGKdf5K; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfGKdf5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753231279; x=1784767279;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oPdtMSciM6FKvmT3BlWIM6cAS6O28Of8vzvvEdEjjQA=;
  b=jfGKdf5K903ljEwCqdlrNxMSd+f0yELNHaaX4bNJrJMWGiFJ+fUlPZ9R
   nmZU7mEhOxJyNrotHXYtVKsuqgAtIGuNS5VtOfFYH8Fnj3kLqknLHm+P/
   5OJso36UWzuBxI/UKzDzvGYhN2VK6/yqNJSn7cR5o9rHOycExNwCb9YmX
   p5DVk1agVTul/t1cHnA0ygOvqGrQRc8tPk6VsjEKH+8RBr0OQc0k4aJOD
   bC0ypZOleOFMtHYjm9nrNOhr8CJnOVf0nIi6xGT21MgzJANKDTToTZrBs
   8x3OnBjvAK678RcD6ZlLi6r0K5WwuQNkTV3GWS8xT0fwSyr6Yvh2ES/cL
   A==;
X-CSE-ConnectionGUID: z2z8b+FmQkeTUI4m1UL/zw==
X-CSE-MsgGUID: UdYP5kbhR3qVZi2QNnYoew==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55348626"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55348626"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 17:41:18 -0700
X-CSE-ConnectionGUID: nZbrwBYdR2GETemjoZS3uA==
X-CSE-MsgGUID: teiv3MPwR6+4o0I/viiTtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="159037357"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 22 Jul 2025 17:41:16 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueNXl-0001Zx-0G;
	Wed, 23 Jul 2025 00:41:13 +0000
Date: Wed, 23 Jul 2025 02:40:26 +0200
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [jkirsher-net-queue:master 4/4] arch/x86/net/bpf_jit_comp.c:2232:39:
 error: implicit declaration of function 'emit_atomic_ld_st'; did you mean
 'emit_atomic_index'?
Message-ID: <202507230201.ELvyjrGB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   db494b13c593e578fed58a6e41f4c9df619180d8
commit: db494b13c593e578fed58a6e41f4c9df619180d8 [4/4] bpf: Add support for certain atomics in bpf_arena to x86 JIT
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250723/202507230201.ELvyjrGB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230201.ELvyjrGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230201.ELvyjrGB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/net/bpf_jit_comp.c: In function 'do_jit':
>> arch/x86/net/bpf_jit_comp.c:2232:39: error: implicit declaration of function 'emit_atomic_ld_st'; did you mean 'emit_atomic_index'? [-Werror=implicit-function-declaration]
    2232 |                                 err = emit_atomic_ld_st(&prog, insn->imm, dst_reg, src_reg,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       emit_atomic_index
   arch/x86/net/bpf_jit_comp.c: At top level:
   arch/x86/net/bpf_jit_comp.c:3771:6: warning: no previous prototype for 'bpf_jit_supports_private_stack' [-Wmissing-prototypes]
    3771 | bool bpf_jit_supports_private_stack(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/net/bpf_jit_comp.c:3865:5: warning: no previous prototype for 'bpf_arch_uaddress_limit' [-Wmissing-prototypes]
    3865 | u64 bpf_arch_uaddress_limit(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/net/bpf_jit_comp.c:3870:6: warning: no previous prototype for 'bpf_jit_supports_timed_may_goto' [-Wmissing-prototypes]
    3870 | bool bpf_jit_supports_timed_may_goto(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2232 arch/x86/net/bpf_jit_comp.c

d4e89d212d4016 Daniel Sneddon          2025-05-05  1507  
1022a5498f6f74 Song Liu                2022-02-04  1508  static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
93c5aecc35c614 Gary Lin                2021-01-19  1509  		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1510  {
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  1511  	bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1512  	struct bpf_insn *insn = bpf_prog->insnsi;
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  1513  	bool callee_regs_used[4] = {};
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1514  	int insn_cnt = bpf_prog->len;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1515  	bool seen_exit = false;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1516  	u8 temp[BPF_MAX_INSN_SIZE + BPF_INSN_SAFETY];
7d1cd70d4b16ff Yonghong Song           2024-11-12  1517  	void __percpu *priv_frame_ptr = NULL;
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1518  	u64 arena_vm_start, user_vm_start;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1519  	void __percpu *priv_stack_ptr;
ced50fc49f3bde Jiri Olsa               2021-06-23  1520  	int i, excnt = 0;
93c5aecc35c614 Gary Lin                2021-01-19  1521  	int ilen, proglen = 0;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1522  	u8 *prog = temp;
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  1523  	u32 stack_depth;
91c960b0056672 Brendan Jackman         2021-01-14  1524  	int err;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1525  
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  1526  	stack_depth = bpf_prog->aux->stack_depth;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1527  	priv_stack_ptr = bpf_prog->aux->priv_stack_ptr;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1528  	if (priv_stack_ptr) {
7d1cd70d4b16ff Yonghong Song           2024-11-12  1529  		priv_frame_ptr = priv_stack_ptr + PRIV_STACK_GUARD_SZ + round_up(stack_depth, 8);
7d1cd70d4b16ff Yonghong Song           2024-11-12  1530  		stack_depth = 0;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1531  	}
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  1532  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1533  	arena_vm_start = bpf_arena_get_kern_vm_start(bpf_prog->aux->arena);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1534  	user_vm_start = bpf_arena_get_user_vm_start(bpf_prog->aux->arena);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1535  
f663a03c8e35c5 Leon Hwang              2024-06-10  1536  	detect_reg_usage(insn, insn_cnt, callee_regs_used);
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  1537  
0c92385dc05ee9 Peter Zijlstra          2025-02-24  1538  	emit_prologue(&prog, image, stack_depth,
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  1539  		      bpf_prog_was_classic(bpf_prog), tail_call_reachable,
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1540  		      bpf_is_subprog(bpf_prog), bpf_prog->aux->exception_cb);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1541  	/* Exception callback will clobber callee regs for its own use, and
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1542  	 * restore the original callee regs from main prog's stack frame.
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1543  	 */
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1544  	if (bpf_prog->aux->exception_boundary) {
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1545  		/* We also need to save r12, which is not mapped to any BPF
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1546  		 * register, as we throw after entry into the kernel, which may
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1547  		 * overwrite r12.
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1548  		 */
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1549  		push_r12(&prog);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1550  		push_callee_regs(&prog, all_callee_regs_used);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1551  	} else {
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1552  		if (arena_vm_start)
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1553  			push_r12(&prog);
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  1554  		push_callee_regs(&prog, callee_regs_used);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  1555  	}
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1556  	if (arena_vm_start)
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1557  		emit_mov_imm64(&prog, X86_REG_R12,
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  1558  			       arena_vm_start >> 32, (u32) arena_vm_start);
93c5aecc35c614 Gary Lin                2021-01-19  1559  
7d1cd70d4b16ff Yonghong Song           2024-11-12  1560  	if (priv_frame_ptr)
7d1cd70d4b16ff Yonghong Song           2024-11-12  1561  		emit_priv_frame_ptr(&prog, priv_frame_ptr);
7d1cd70d4b16ff Yonghong Song           2024-11-12  1562  
93c5aecc35c614 Gary Lin                2021-01-19  1563  	ilen = prog - temp;
1022a5498f6f74 Song Liu                2022-02-04  1564  	if (rw_image)
1022a5498f6f74 Song Liu                2022-02-04  1565  		memcpy(rw_image + proglen, temp, ilen);
93c5aecc35c614 Gary Lin                2021-01-19  1566  	proglen += ilen;
93c5aecc35c614 Gary Lin                2021-01-19  1567  	addrs[0] = proglen;
93c5aecc35c614 Gary Lin                2021-01-19  1568  	prog = temp;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  1569  
7c2e988f400e83 Alexei Starovoitov      2019-07-30  1570  	for (i = 1; i <= insn_cnt; i++, insn++) {
e430f34ee5192c Alexei Starovoitov      2014-06-06  1571  		const s32 imm32 = insn->imm;
e430f34ee5192c Alexei Starovoitov      2014-06-06  1572  		u32 dst_reg = insn->dst_reg;
e430f34ee5192c Alexei Starovoitov      2014-06-06  1573  		u32 src_reg = insn->src_reg;
6fe8b9c1f41dfe Daniel Borkmann         2018-02-24  1574  		u8 b2 = 0, b3 = 0;
4c5de127598e1b Alexei Starovoitov      2021-02-01  1575  		u8 *start_of_ldx;
622582786c9e04 Alexei Starovoitov      2014-05-13  1576  		s64 jmp_offset;
90156f4bfa21ad Dave Marchevsky         2022-12-16  1577  		s16 insn_off;
622582786c9e04 Alexei Starovoitov      2014-05-13  1578  		u8 jmp_cond;
622582786c9e04 Alexei Starovoitov      2014-05-13  1579  		u8 *func;
93c5aecc35c614 Gary Lin                2021-01-19  1580  		int nops;
0a14842f5a3c0e Eric Dumazet            2011-04-20  1581  
7d1cd70d4b16ff Yonghong Song           2024-11-12  1582  		if (priv_frame_ptr) {
7d1cd70d4b16ff Yonghong Song           2024-11-12  1583  			if (src_reg == BPF_REG_FP)
7d1cd70d4b16ff Yonghong Song           2024-11-12  1584  				src_reg = X86_REG_R9;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1585  
7d1cd70d4b16ff Yonghong Song           2024-11-12  1586  			if (dst_reg == BPF_REG_FP)
7d1cd70d4b16ff Yonghong Song           2024-11-12  1587  				dst_reg = X86_REG_R9;
7d1cd70d4b16ff Yonghong Song           2024-11-12  1588  		}
7d1cd70d4b16ff Yonghong Song           2024-11-12  1589  
622582786c9e04 Alexei Starovoitov      2014-05-13  1590  		switch (insn->code) {
622582786c9e04 Alexei Starovoitov      2014-05-13  1591  			/* ALU */
622582786c9e04 Alexei Starovoitov      2014-05-13  1592  		case BPF_ALU | BPF_ADD | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1593  		case BPF_ALU | BPF_SUB | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1594  		case BPF_ALU | BPF_AND | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1595  		case BPF_ALU | BPF_OR | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1596  		case BPF_ALU | BPF_XOR | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1597  		case BPF_ALU64 | BPF_ADD | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1598  		case BPF_ALU64 | BPF_SUB | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1599  		case BPF_ALU64 | BPF_AND | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1600  		case BPF_ALU64 | BPF_OR | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1601  		case BPF_ALU64 | BPF_XOR | BPF_X:
74007cfc1f71e4 Brendan Jackman         2021-01-14  1602  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman         2021-01-14  1603  				       BPF_CLASS(insn->code) == BPF_ALU64);
e5f02caccfae94 Brendan Jackman         2021-01-14  1604  			b2 = simple_alu_opcodes[BPF_OP(insn->code)];
e430f34ee5192c Alexei Starovoitov      2014-06-06  1605  			EMIT2(b2, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  1606  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1607  
622582786c9e04 Alexei Starovoitov      2014-05-13  1608  		case BPF_ALU64 | BPF_MOV | BPF_X:
770546ae9f4c1a Puranjay Mohan          2024-03-24  1609  			if (insn_is_cast_user(insn)) {
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1610  				if (dst_reg != src_reg)
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1611  					/* 32-bit mov */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1612  					emit_mov_reg(&prog, false, dst_reg, src_reg);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1613  				/* shl dst_reg, 32 */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1614  				maybe_emit_1mod(&prog, dst_reg, true);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1615  				EMIT3(0xC1, add_1reg(0xE0, dst_reg), 32);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1616  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1617  				/* or dst_reg, user_vm_start */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1618  				maybe_emit_1mod(&prog, dst_reg, true);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1619  				if (is_axreg(dst_reg))
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1620  					EMIT1_off32(0x0D,  user_vm_start >> 32);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1621  				else
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1622  					EMIT2_off32(0x81, add_1reg(0xC8, dst_reg),  user_vm_start >> 32);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1623  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1624  				/* rol dst_reg, 32 */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1625  				maybe_emit_1mod(&prog, dst_reg, true);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1626  				EMIT3(0xC1, add_1reg(0xC0, dst_reg), 32);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1627  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1628  				/* xor r11, r11 */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1629  				EMIT3(0x4D, 0x31, 0xDB);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1630  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1631  				/* test dst_reg32, dst_reg32; check if lower 32-bit are zero */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1632  				maybe_emit_mod(&prog, dst_reg, dst_reg, false);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1633  				EMIT2(0x85, add_2reg(0xC0, dst_reg, dst_reg));
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1634  
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1635  				/* cmove r11, dst_reg; if so, set dst_reg to zero */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1636  				/* WARNING: Intel swapped src/dst register encoding in CMOVcc !!! */
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1637  				maybe_emit_mod(&prog, AUX_REG, dst_reg, true);
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1638  				EMIT3(0x0F, 0x44, add_2reg(0xC0, AUX_REG, dst_reg));
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1639  				break;
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1640  			} else if (insn_is_mov_percpu_addr(insn)) {
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1641  				/* mov <dst>, <src> (if necessary) */
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1642  				EMIT_mov(dst_reg, src_reg);
1e9e0b85255e6e Andrii Nakryiko         2024-04-03  1643  #ifdef CONFIG_SMP
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1644  				/* add <dst>, gs:[<off>] */
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1645  				EMIT2(0x65, add_1mod(0x48, dst_reg));
462e5e2a5938d0 Alexei Starovoitov      2024-04-17  1646  				EMIT3(0x03, add_2reg(0x04, 0, dst_reg), 0x25);
1e9e0b85255e6e Andrii Nakryiko         2024-04-03  1647  				EMIT((u32)(unsigned long)&this_cpu_off, 4);
1e9e0b85255e6e Andrii Nakryiko         2024-04-03  1648  #endif
7bdbf7446305cb Andrii Nakryiko         2024-04-01  1649  				break;
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1650  			}
142fd4d2dcf58b Alexei Starovoitov      2024-03-07  1651  			fallthrough;
622582786c9e04 Alexei Starovoitov      2014-05-13  1652  		case BPF_ALU | BPF_MOV | BPF_X:
8100928c881482 Yonghong Song           2023-07-27  1653  			if (insn->off == 0)
4c38e2f386b4fc Daniel Borkmann         2018-02-24  1654  				emit_mov_reg(&prog,
4c38e2f386b4fc Daniel Borkmann         2018-02-24  1655  					     BPF_CLASS(insn->code) == BPF_ALU64,
4c38e2f386b4fc Daniel Borkmann         2018-02-24  1656  					     dst_reg, src_reg);
8100928c881482 Yonghong Song           2023-07-27  1657  			else
8100928c881482 Yonghong Song           2023-07-27  1658  				emit_movsx_reg(&prog, insn->off,
8100928c881482 Yonghong Song           2023-07-27  1659  					       BPF_CLASS(insn->code) == BPF_ALU64,
8100928c881482 Yonghong Song           2023-07-27  1660  					       dst_reg, src_reg);
622582786c9e04 Alexei Starovoitov      2014-05-13  1661  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1662  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1663  			/* neg dst */
622582786c9e04 Alexei Starovoitov      2014-05-13  1664  		case BPF_ALU | BPF_NEG:
622582786c9e04 Alexei Starovoitov      2014-05-13  1665  		case BPF_ALU64 | BPF_NEG:
6364d7d75a0e01 Jie Meng                2021-10-06  1666  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1667  					BPF_CLASS(insn->code) == BPF_ALU64);
e430f34ee5192c Alexei Starovoitov      2014-06-06  1668  			EMIT2(0xF7, add_1reg(0xD8, dst_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  1669  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1670  
622582786c9e04 Alexei Starovoitov      2014-05-13  1671  		case BPF_ALU | BPF_ADD | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1672  		case BPF_ALU | BPF_SUB | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1673  		case BPF_ALU | BPF_AND | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1674  		case BPF_ALU | BPF_OR | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1675  		case BPF_ALU | BPF_XOR | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1676  		case BPF_ALU64 | BPF_ADD | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1677  		case BPF_ALU64 | BPF_SUB | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1678  		case BPF_ALU64 | BPF_AND | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1679  		case BPF_ALU64 | BPF_OR | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1680  		case BPF_ALU64 | BPF_XOR | BPF_K:
6364d7d75a0e01 Jie Meng                2021-10-06  1681  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1682  					BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov      2014-05-13  1683  
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1684  			/*
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1685  			 * b3 holds 'normal' opcode, b2 short form only valid
de0a444ddae61b Daniel Borkmann         2018-01-20  1686  			 * in case dst is eax/rax.
de0a444ddae61b Daniel Borkmann         2018-01-20  1687  			 */
622582786c9e04 Alexei Starovoitov      2014-05-13  1688  			switch (BPF_OP(insn->code)) {
de0a444ddae61b Daniel Borkmann         2018-01-20  1689  			case BPF_ADD:
de0a444ddae61b Daniel Borkmann         2018-01-20  1690  				b3 = 0xC0;
de0a444ddae61b Daniel Borkmann         2018-01-20  1691  				b2 = 0x05;
de0a444ddae61b Daniel Borkmann         2018-01-20  1692  				break;
de0a444ddae61b Daniel Borkmann         2018-01-20  1693  			case BPF_SUB:
de0a444ddae61b Daniel Borkmann         2018-01-20  1694  				b3 = 0xE8;
de0a444ddae61b Daniel Borkmann         2018-01-20  1695  				b2 = 0x2D;
de0a444ddae61b Daniel Borkmann         2018-01-20  1696  				break;
de0a444ddae61b Daniel Borkmann         2018-01-20  1697  			case BPF_AND:
de0a444ddae61b Daniel Borkmann         2018-01-20  1698  				b3 = 0xE0;
de0a444ddae61b Daniel Borkmann         2018-01-20  1699  				b2 = 0x25;
de0a444ddae61b Daniel Borkmann         2018-01-20  1700  				break;
de0a444ddae61b Daniel Borkmann         2018-01-20  1701  			case BPF_OR:
de0a444ddae61b Daniel Borkmann         2018-01-20  1702  				b3 = 0xC8;
de0a444ddae61b Daniel Borkmann         2018-01-20  1703  				b2 = 0x0D;
de0a444ddae61b Daniel Borkmann         2018-01-20  1704  				break;
de0a444ddae61b Daniel Borkmann         2018-01-20  1705  			case BPF_XOR:
de0a444ddae61b Daniel Borkmann         2018-01-20  1706  				b3 = 0xF0;
de0a444ddae61b Daniel Borkmann         2018-01-20  1707  				b2 = 0x35;
de0a444ddae61b Daniel Borkmann         2018-01-20  1708  				break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1709  			}
0a14842f5a3c0e Eric Dumazet            2011-04-20  1710  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1711  			if (is_imm8(imm32))
e430f34ee5192c Alexei Starovoitov      2014-06-06  1712  				EMIT3(0x83, add_1reg(b3, dst_reg), imm32);
de0a444ddae61b Daniel Borkmann         2018-01-20  1713  			else if (is_axreg(dst_reg))
de0a444ddae61b Daniel Borkmann         2018-01-20  1714  				EMIT1_off32(b2, imm32);
0a14842f5a3c0e Eric Dumazet            2011-04-20  1715  			else
e430f34ee5192c Alexei Starovoitov      2014-06-06  1716  				EMIT2_off32(0x81, add_1reg(b3, dst_reg), imm32);
0a14842f5a3c0e Eric Dumazet            2011-04-20  1717  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1718  
622582786c9e04 Alexei Starovoitov      2014-05-13  1719  		case BPF_ALU64 | BPF_MOV | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1720  		case BPF_ALU | BPF_MOV | BPF_K:
6fe8b9c1f41dfe Daniel Borkmann         2018-02-24  1721  			emit_mov_imm32(&prog, BPF_CLASS(insn->code) == BPF_ALU64,
6fe8b9c1f41dfe Daniel Borkmann         2018-02-24  1722  				       dst_reg, imm32);
622582786c9e04 Alexei Starovoitov      2014-05-13  1723  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1724  
02ab695bb37ee9 Alexei Starovoitov      2014-09-04  1725  		case BPF_LD | BPF_IMM | BPF_DW:
6fe8b9c1f41dfe Daniel Borkmann         2018-02-24  1726  			emit_mov_imm64(&prog, dst_reg, insn[1].imm, insn[0].imm);
02ab695bb37ee9 Alexei Starovoitov      2014-09-04  1727  			insn++;
02ab695bb37ee9 Alexei Starovoitov      2014-09-04  1728  			i++;
02ab695bb37ee9 Alexei Starovoitov      2014-09-04  1729  			break;
02ab695bb37ee9 Alexei Starovoitov      2014-09-04  1730  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1731  			/* dst %= src, dst /= src, dst %= imm32, dst /= imm32 */
622582786c9e04 Alexei Starovoitov      2014-05-13  1732  		case BPF_ALU | BPF_MOD | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1733  		case BPF_ALU | BPF_DIV | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1734  		case BPF_ALU | BPF_MOD | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1735  		case BPF_ALU | BPF_DIV | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1736  		case BPF_ALU64 | BPF_MOD | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1737  		case BPF_ALU64 | BPF_DIV | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  1738  		case BPF_ALU64 | BPF_MOD | BPF_K:
57a610f1c58fa4 Jie Meng                2021-10-01  1739  		case BPF_ALU64 | BPF_DIV | BPF_K: {
57a610f1c58fa4 Jie Meng                2021-10-01  1740  			bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
57a610f1c58fa4 Jie Meng                2021-10-01  1741  
57a610f1c58fa4 Jie Meng                2021-10-01  1742  			if (dst_reg != BPF_REG_0)
622582786c9e04 Alexei Starovoitov      2014-05-13  1743  				EMIT1(0x50); /* push rax */
57a610f1c58fa4 Jie Meng                2021-10-01  1744  			if (dst_reg != BPF_REG_3)
622582786c9e04 Alexei Starovoitov      2014-05-13  1745  				EMIT1(0x52); /* push rdx */
622582786c9e04 Alexei Starovoitov      2014-05-13  1746  
57a610f1c58fa4 Jie Meng                2021-10-01  1747  			if (BPF_SRC(insn->code) == BPF_X) {
57a610f1c58fa4 Jie Meng                2021-10-01  1748  				if (src_reg == BPF_REG_0 ||
57a610f1c58fa4 Jie Meng                2021-10-01  1749  				    src_reg == BPF_REG_3) {
e430f34ee5192c Alexei Starovoitov      2014-06-06  1750  					/* mov r11, src_reg */
e430f34ee5192c Alexei Starovoitov      2014-06-06  1751  					EMIT_mov(AUX_REG, src_reg);
57a610f1c58fa4 Jie Meng                2021-10-01  1752  					src_reg = AUX_REG;
57a610f1c58fa4 Jie Meng                2021-10-01  1753  				}
57a610f1c58fa4 Jie Meng                2021-10-01  1754  			} else {
e430f34ee5192c Alexei Starovoitov      2014-06-06  1755  				/* mov r11, imm32 */
e430f34ee5192c Alexei Starovoitov      2014-06-06  1756  				EMIT3_off32(0x49, 0xC7, 0xC3, imm32);
57a610f1c58fa4 Jie Meng                2021-10-01  1757  				src_reg = AUX_REG;
57a610f1c58fa4 Jie Meng                2021-10-01  1758  			}
622582786c9e04 Alexei Starovoitov      2014-05-13  1759  
57a610f1c58fa4 Jie Meng                2021-10-01  1760  			if (dst_reg != BPF_REG_0)
e430f34ee5192c Alexei Starovoitov      2014-06-06  1761  				/* mov rax, dst_reg */
57a610f1c58fa4 Jie Meng                2021-10-01  1762  				emit_mov_reg(&prog, is64, BPF_REG_0, dst_reg);
622582786c9e04 Alexei Starovoitov      2014-05-13  1763  
ec0e2da95f72d4 Yonghong Song           2023-07-27  1764  			if (insn->off == 0) {
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1765  				/*
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1766  				 * xor edx, edx
622582786c9e04 Alexei Starovoitov      2014-05-13  1767  				 * equivalent to 'xor rdx, rdx', but one byte less
d00a9dd21bdf79 Eric Dumazet            2012-01-18  1768  				 */
622582786c9e04 Alexei Starovoitov      2014-05-13  1769  				EMIT2(0x31, 0xd2);
622582786c9e04 Alexei Starovoitov      2014-05-13  1770  
57a610f1c58fa4 Jie Meng                2021-10-01  1771  				/* div src_reg */
6364d7d75a0e01 Jie Meng                2021-10-06  1772  				maybe_emit_1mod(&prog, src_reg, is64);
57a610f1c58fa4 Jie Meng                2021-10-01  1773  				EMIT2(0xF7, add_1reg(0xF0, src_reg));
ec0e2da95f72d4 Yonghong Song           2023-07-27  1774  			} else {
ec0e2da95f72d4 Yonghong Song           2023-07-27  1775  				if (BPF_CLASS(insn->code) == BPF_ALU)
ec0e2da95f72d4 Yonghong Song           2023-07-27  1776  					EMIT1(0x99); /* cdq */
ec0e2da95f72d4 Yonghong Song           2023-07-27  1777  				else
ec0e2da95f72d4 Yonghong Song           2023-07-27  1778  					EMIT2(0x48, 0x99); /* cqo */
ec0e2da95f72d4 Yonghong Song           2023-07-27  1779  
ec0e2da95f72d4 Yonghong Song           2023-07-27  1780  				/* idiv src_reg */
ec0e2da95f72d4 Yonghong Song           2023-07-27  1781  				maybe_emit_1mod(&prog, src_reg, is64);
ec0e2da95f72d4 Yonghong Song           2023-07-27  1782  				EMIT2(0xF7, add_1reg(0xF8, src_reg));
ec0e2da95f72d4 Yonghong Song           2023-07-27  1783  			}
622582786c9e04 Alexei Starovoitov      2014-05-13  1784  
57a610f1c58fa4 Jie Meng                2021-10-01  1785  			if (BPF_OP(insn->code) == BPF_MOD &&
57a610f1c58fa4 Jie Meng                2021-10-01  1786  			    dst_reg != BPF_REG_3)
57a610f1c58fa4 Jie Meng                2021-10-01  1787  				/* mov dst_reg, rdx */
57a610f1c58fa4 Jie Meng                2021-10-01  1788  				emit_mov_reg(&prog, is64, dst_reg, BPF_REG_3);
57a610f1c58fa4 Jie Meng                2021-10-01  1789  			else if (BPF_OP(insn->code) == BPF_DIV &&
57a610f1c58fa4 Jie Meng                2021-10-01  1790  				 dst_reg != BPF_REG_0)
57a610f1c58fa4 Jie Meng                2021-10-01  1791  				/* mov dst_reg, rax */
57a610f1c58fa4 Jie Meng                2021-10-01  1792  				emit_mov_reg(&prog, is64, dst_reg, BPF_REG_0);
622582786c9e04 Alexei Starovoitov      2014-05-13  1793  
57a610f1c58fa4 Jie Meng                2021-10-01  1794  			if (dst_reg != BPF_REG_3)
622582786c9e04 Alexei Starovoitov      2014-05-13  1795  				EMIT1(0x5A); /* pop rdx */
57a610f1c58fa4 Jie Meng                2021-10-01  1796  			if (dst_reg != BPF_REG_0)
622582786c9e04 Alexei Starovoitov      2014-05-13  1797  				EMIT1(0x58); /* pop rax */
aee636c4809fa5 Eric Dumazet            2014-01-15  1798  			break;
57a610f1c58fa4 Jie Meng                2021-10-01  1799  		}
622582786c9e04 Alexei Starovoitov      2014-05-13  1800  
622582786c9e04 Alexei Starovoitov      2014-05-13  1801  		case BPF_ALU | BPF_MUL | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1802  		case BPF_ALU64 | BPF_MUL | BPF_K:
6364d7d75a0e01 Jie Meng                2021-10-06  1803  			maybe_emit_mod(&prog, dst_reg, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1804  				       BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov      2014-05-13  1805  
c0354077439bc9 Jie Meng                2021-09-13  1806  			if (is_imm8(imm32))
c0354077439bc9 Jie Meng                2021-09-13  1807  				/* imul dst_reg, dst_reg, imm8 */
c0354077439bc9 Jie Meng                2021-09-13  1808  				EMIT3(0x6B, add_2reg(0xC0, dst_reg, dst_reg),
c0354077439bc9 Jie Meng                2021-09-13  1809  				      imm32);
622582786c9e04 Alexei Starovoitov      2014-05-13  1810  			else
c0354077439bc9 Jie Meng                2021-09-13  1811  				/* imul dst_reg, dst_reg, imm32 */
c0354077439bc9 Jie Meng                2021-09-13  1812  				EMIT2_off32(0x69,
c0354077439bc9 Jie Meng                2021-09-13  1813  					    add_2reg(0xC0, dst_reg, dst_reg),
c0354077439bc9 Jie Meng                2021-09-13  1814  					    imm32);
c0354077439bc9 Jie Meng                2021-09-13  1815  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1816  
c0354077439bc9 Jie Meng                2021-09-13  1817  		case BPF_ALU | BPF_MUL | BPF_X:
c0354077439bc9 Jie Meng                2021-09-13  1818  		case BPF_ALU64 | BPF_MUL | BPF_X:
6364d7d75a0e01 Jie Meng                2021-10-06  1819  			maybe_emit_mod(&prog, src_reg, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1820  				       BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov      2014-05-13  1821  
c0354077439bc9 Jie Meng                2021-09-13  1822  			/* imul dst_reg, src_reg */
c0354077439bc9 Jie Meng                2021-09-13  1823  			EMIT3(0x0F, 0xAF, add_2reg(0xC0, src_reg, dst_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  1824  			break;
c0354077439bc9 Jie Meng                2021-09-13  1825  
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1826  			/* Shifts */
622582786c9e04 Alexei Starovoitov      2014-05-13  1827  		case BPF_ALU | BPF_LSH | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1828  		case BPF_ALU | BPF_RSH | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1829  		case BPF_ALU | BPF_ARSH | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1830  		case BPF_ALU64 | BPF_LSH | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1831  		case BPF_ALU64 | BPF_RSH | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  1832  		case BPF_ALU64 | BPF_ARSH | BPF_K:
6364d7d75a0e01 Jie Meng                2021-10-06  1833  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1834  					BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov      2014-05-13  1835  
e5f02caccfae94 Brendan Jackman         2021-01-14  1836  			b3 = simple_alu_opcodes[BPF_OP(insn->code)];
88e69a1fcc1e67 Daniel Borkmann         2018-02-24  1837  			if (imm32 == 1)
88e69a1fcc1e67 Daniel Borkmann         2018-02-24  1838  				EMIT2(0xD1, add_1reg(b3, dst_reg));
88e69a1fcc1e67 Daniel Borkmann         2018-02-24  1839  			else
e430f34ee5192c Alexei Starovoitov      2014-06-06  1840  				EMIT3(0xC1, add_1reg(b3, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov      2014-05-13  1841  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1842  
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1843  		case BPF_ALU | BPF_LSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1844  		case BPF_ALU | BPF_RSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1845  		case BPF_ALU | BPF_ARSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1846  		case BPF_ALU64 | BPF_LSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1847  		case BPF_ALU64 | BPF_RSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1848  		case BPF_ALU64 | BPF_ARSH | BPF_X:
77d8f5d47bfbb5 Jie Meng                2022-10-07  1849  			/* BMI2 shifts aren't better when shift count is already in rcx */
77d8f5d47bfbb5 Jie Meng                2022-10-07  1850  			if (boot_cpu_has(X86_FEATURE_BMI2) && src_reg != BPF_REG_4) {
77d8f5d47bfbb5 Jie Meng                2022-10-07  1851  				/* shrx/sarx/shlx dst_reg, dst_reg, src_reg */
77d8f5d47bfbb5 Jie Meng                2022-10-07  1852  				bool w = (BPF_CLASS(insn->code) == BPF_ALU64);
77d8f5d47bfbb5 Jie Meng                2022-10-07  1853  				u8 op;
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1854  
77d8f5d47bfbb5 Jie Meng                2022-10-07  1855  				switch (BPF_OP(insn->code)) {
77d8f5d47bfbb5 Jie Meng                2022-10-07  1856  				case BPF_LSH:
77d8f5d47bfbb5 Jie Meng                2022-10-07  1857  					op = 1; /* prefix 0x66 */
77d8f5d47bfbb5 Jie Meng                2022-10-07  1858  					break;
77d8f5d47bfbb5 Jie Meng                2022-10-07  1859  				case BPF_RSH:
77d8f5d47bfbb5 Jie Meng                2022-10-07  1860  					op = 3; /* prefix 0xf2 */
77d8f5d47bfbb5 Jie Meng                2022-10-07  1861  					break;
77d8f5d47bfbb5 Jie Meng                2022-10-07  1862  				case BPF_ARSH:
77d8f5d47bfbb5 Jie Meng                2022-10-07  1863  					op = 2; /* prefix 0xf3 */
77d8f5d47bfbb5 Jie Meng                2022-10-07  1864  					break;
77d8f5d47bfbb5 Jie Meng                2022-10-07  1865  				}
77d8f5d47bfbb5 Jie Meng                2022-10-07  1866  
77d8f5d47bfbb5 Jie Meng                2022-10-07  1867  				emit_shiftx(&prog, dst_reg, src_reg, w, op);
77d8f5d47bfbb5 Jie Meng                2022-10-07  1868  
77d8f5d47bfbb5 Jie Meng                2022-10-07  1869  				break;
77d8f5d47bfbb5 Jie Meng                2022-10-07  1870  			}
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1871  
81b35e7cad790e Jie Meng                2022-10-07  1872  			if (src_reg != BPF_REG_4) { /* common case */
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1873  				/* Check for bad case when dst_reg == rcx */
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1874  				if (dst_reg == BPF_REG_4) {
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1875  					/* mov r11, dst_reg */
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1876  					EMIT_mov(AUX_REG, dst_reg);
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1877  					dst_reg = AUX_REG;
81b35e7cad790e Jie Meng                2022-10-07  1878  				} else {
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1879  					EMIT1(0x51); /* push rcx */
81b35e7cad790e Jie Meng                2022-10-07  1880  				}
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1881  				/* mov rcx, src_reg */
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1882  				EMIT_mov(BPF_REG_4, src_reg);
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1883  			}
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1884  
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1885  			/* shl %rax, %cl | shr %rax, %cl | sar %rax, %cl */
6364d7d75a0e01 Jie Meng                2021-10-06  1886  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  1887  					BPF_CLASS(insn->code) == BPF_ALU64);
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1888  
e5f02caccfae94 Brendan Jackman         2021-01-14  1889  			b3 = simple_alu_opcodes[BPF_OP(insn->code)];
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1890  			EMIT2(0xD3, add_1reg(b3, dst_reg));
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1891  
81b35e7cad790e Jie Meng                2022-10-07  1892  			if (src_reg != BPF_REG_4) {
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1893  				if (insn->dst_reg == BPF_REG_4)
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1894  					/* mov dst_reg, r11 */
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1895  					EMIT_mov(insn->dst_reg, AUX_REG);
81b35e7cad790e Jie Meng                2022-10-07  1896  				else
81b35e7cad790e Jie Meng                2022-10-07  1897  					EMIT1(0x59); /* pop rcx */
81b35e7cad790e Jie Meng                2022-10-07  1898  			}
81b35e7cad790e Jie Meng                2022-10-07  1899  
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1900  			break;
72b603ee8cfc6b Alexei Starovoitov      2014-08-25  1901  
622582786c9e04 Alexei Starovoitov      2014-05-13  1902  		case BPF_ALU | BPF_END | BPF_FROM_BE:
0845c3db7bf5c4 Yonghong Song           2023-07-27  1903  		case BPF_ALU64 | BPF_END | BPF_FROM_LE:
e430f34ee5192c Alexei Starovoitov      2014-06-06  1904  			switch (imm32) {
622582786c9e04 Alexei Starovoitov      2014-05-13  1905  			case 16:
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1906  				/* Emit 'ror %ax, 8' to swap lower 2 bytes */
622582786c9e04 Alexei Starovoitov      2014-05-13  1907  				EMIT1(0x66);
e430f34ee5192c Alexei Starovoitov      2014-06-06  1908  				if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov      2014-05-13  1909  					EMIT1(0x41);
e430f34ee5192c Alexei Starovoitov      2014-06-06  1910  				EMIT3(0xC1, add_1reg(0xC8, dst_reg), 8);
343f845b375989 Alexei Starovoitov      2015-05-11  1911  
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1912  				/* Emit 'movzwl eax, ax' */
343f845b375989 Alexei Starovoitov      2015-05-11  1913  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov      2015-05-11  1914  					EMIT3(0x45, 0x0F, 0xB7);
343f845b375989 Alexei Starovoitov      2015-05-11  1915  				else
343f845b375989 Alexei Starovoitov      2015-05-11  1916  					EMIT2(0x0F, 0xB7);
343f845b375989 Alexei Starovoitov      2015-05-11  1917  				EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  1918  				break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1919  			case 32:
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1920  				/* Emit 'bswap eax' to swap lower 4 bytes */
e430f34ee5192c Alexei Starovoitov      2014-06-06  1921  				if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov      2014-05-13  1922  					EMIT2(0x41, 0x0F);
622582786c9e04 Alexei Starovoitov      2014-05-13  1923  				else
622582786c9e04 Alexei Starovoitov      2014-05-13  1924  					EMIT1(0x0F);
e430f34ee5192c Alexei Starovoitov      2014-06-06  1925  				EMIT1(add_1reg(0xC8, dst_reg));
0a14842f5a3c0e Eric Dumazet            2011-04-20  1926  				break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1927  			case 64:
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1928  				/* Emit 'bswap rax' to swap 8 bytes */
e430f34ee5192c Alexei Starovoitov      2014-06-06  1929  				EMIT3(add_1mod(0x48, dst_reg), 0x0F,
e430f34ee5192c Alexei Starovoitov      2014-06-06  1930  				      add_1reg(0xC8, dst_reg));
0a14842f5a3c0e Eric Dumazet            2011-04-20  1931  				break;
0a14842f5a3c0e Eric Dumazet            2011-04-20  1932  			}
0a14842f5a3c0e Eric Dumazet            2011-04-20  1933  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1934  
622582786c9e04 Alexei Starovoitov      2014-05-13  1935  		case BPF_ALU | BPF_END | BPF_FROM_LE:
343f845b375989 Alexei Starovoitov      2015-05-11  1936  			switch (imm32) {
343f845b375989 Alexei Starovoitov      2015-05-11  1937  			case 16:
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1938  				/*
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1939  				 * Emit 'movzwl eax, ax' to zero extend 16-bit
343f845b375989 Alexei Starovoitov      2015-05-11  1940  				 * into 64 bit
343f845b375989 Alexei Starovoitov      2015-05-11  1941  				 */
343f845b375989 Alexei Starovoitov      2015-05-11  1942  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov      2015-05-11  1943  					EMIT3(0x45, 0x0F, 0xB7);
343f845b375989 Alexei Starovoitov      2015-05-11  1944  				else
343f845b375989 Alexei Starovoitov      2015-05-11  1945  					EMIT2(0x0F, 0xB7);
343f845b375989 Alexei Starovoitov      2015-05-11  1946  				EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
343f845b375989 Alexei Starovoitov      2015-05-11  1947  				break;
343f845b375989 Alexei Starovoitov      2015-05-11  1948  			case 32:
a2c7a98301d9f9 Ingo Molnar             2018-04-27  1949  				/* Emit 'mov eax, eax' to clear upper 32-bits */
343f845b375989 Alexei Starovoitov      2015-05-11  1950  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov      2015-05-11  1951  					EMIT1(0x45);
343f845b375989 Alexei Starovoitov      2015-05-11  1952  				EMIT2(0x89, add_2reg(0xC0, dst_reg, dst_reg));
343f845b375989 Alexei Starovoitov      2015-05-11  1953  				break;
343f845b375989 Alexei Starovoitov      2015-05-11  1954  			case 64:
343f845b375989 Alexei Starovoitov      2015-05-11  1955  				/* nop */
343f845b375989 Alexei Starovoitov      2015-05-11  1956  				break;
343f845b375989 Alexei Starovoitov      2015-05-11  1957  			}
0a14842f5a3c0e Eric Dumazet            2011-04-20  1958  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1959  
f5e81d11175015 Daniel Borkmann         2021-07-13  1960  			/* speculation barrier */
f5e81d11175015 Daniel Borkmann         2021-07-13  1961  		case BPF_ST | BPF_NOSPEC:
87c87ecd00c54e Peter Zijlstra          2021-10-26  1962  			EMIT_LFENCE();
f5e81d11175015 Daniel Borkmann         2021-07-13  1963  			break;
f5e81d11175015 Daniel Borkmann         2021-07-13  1964  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1965  			/* ST: *(u8*)(dst_reg + off) = imm */
622582786c9e04 Alexei Starovoitov      2014-05-13  1966  		case BPF_ST | BPF_MEM | BPF_B:
e430f34ee5192c Alexei Starovoitov      2014-06-06  1967  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov      2014-05-13  1968  				EMIT2(0x41, 0xC6);
0a14842f5a3c0e Eric Dumazet            2011-04-20  1969  			else
622582786c9e04 Alexei Starovoitov      2014-05-13  1970  				EMIT1(0xC6);
622582786c9e04 Alexei Starovoitov      2014-05-13  1971  			goto st;
622582786c9e04 Alexei Starovoitov      2014-05-13  1972  		case BPF_ST | BPF_MEM | BPF_H:
e430f34ee5192c Alexei Starovoitov      2014-06-06  1973  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov      2014-05-13  1974  				EMIT3(0x66, 0x41, 0xC7);
82c93fcc2e1737 Daniel Borkmann         2012-09-24  1975  			else
622582786c9e04 Alexei Starovoitov      2014-05-13  1976  				EMIT2(0x66, 0xC7);
622582786c9e04 Alexei Starovoitov      2014-05-13  1977  			goto st;
622582786c9e04 Alexei Starovoitov      2014-05-13  1978  		case BPF_ST | BPF_MEM | BPF_W:
e430f34ee5192c Alexei Starovoitov      2014-06-06  1979  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov      2014-05-13  1980  				EMIT2(0x41, 0xC7);
0a14842f5a3c0e Eric Dumazet            2011-04-20  1981  			else
622582786c9e04 Alexei Starovoitov      2014-05-13  1982  				EMIT1(0xC7);
622582786c9e04 Alexei Starovoitov      2014-05-13  1983  			goto st;
622582786c9e04 Alexei Starovoitov      2014-05-13  1984  		case BPF_ST | BPF_MEM | BPF_DW:
e430f34ee5192c Alexei Starovoitov      2014-06-06  1985  			EMIT2(add_1mod(0x48, dst_reg), 0xC7);
622582786c9e04 Alexei Starovoitov      2014-05-13  1986  
622582786c9e04 Alexei Starovoitov      2014-05-13  1987  st:			if (is_imm8(insn->off))
e430f34ee5192c Alexei Starovoitov      2014-06-06  1988  				EMIT2(add_1reg(0x40, dst_reg), insn->off);
0a14842f5a3c0e Eric Dumazet            2011-04-20  1989  			else
e430f34ee5192c Alexei Starovoitov      2014-06-06  1990  				EMIT1_off32(add_1reg(0x80, dst_reg), insn->off);
622582786c9e04 Alexei Starovoitov      2014-05-13  1991  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1992  			EMIT(imm32, bpf_size_to_x86_bytes(BPF_SIZE(insn->code)));
0a14842f5a3c0e Eric Dumazet            2011-04-20  1993  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  1994  
e430f34ee5192c Alexei Starovoitov      2014-06-06  1995  			/* STX: *(u8*)(dst_reg + off) = src_reg */
622582786c9e04 Alexei Starovoitov      2014-05-13  1996  		case BPF_STX | BPF_MEM | BPF_B:
622582786c9e04 Alexei Starovoitov      2014-05-13  1997  		case BPF_STX | BPF_MEM | BPF_H:
622582786c9e04 Alexei Starovoitov      2014-05-13  1998  		case BPF_STX | BPF_MEM | BPF_W:
622582786c9e04 Alexei Starovoitov      2014-05-13  1999  		case BPF_STX | BPF_MEM | BPF_DW:
3b2744e665206e Alexei Starovoitov      2019-11-14  2000  			emit_stx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn->off);
622582786c9e04 Alexei Starovoitov      2014-05-13  2001  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  2002  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2003  		case BPF_ST | BPF_PROBE_MEM32 | BPF_B:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2004  		case BPF_ST | BPF_PROBE_MEM32 | BPF_H:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2005  		case BPF_ST | BPF_PROBE_MEM32 | BPF_W:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2006  		case BPF_ST | BPF_PROBE_MEM32 | BPF_DW:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2007  			start_of_ldx = prog;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2008  			emit_st_r12(&prog, BPF_SIZE(insn->code), dst_reg, insn->off, insn->imm);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2009  			goto populate_extable;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2010  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2011  			/* LDX: dst_reg = *(u8*)(src_reg + r12 + off) */
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2012  		case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2013  		case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2014  		case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2015  		case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2016  		case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2017  		case BPF_STX | BPF_PROBE_MEM32 | BPF_H:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2018  		case BPF_STX | BPF_PROBE_MEM32 | BPF_W:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2019  		case BPF_STX | BPF_PROBE_MEM32 | BPF_DW:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2020  			start_of_ldx = prog;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2021  			if (BPF_CLASS(insn->code) == BPF_LDX)
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2022  				emit_ldx_r12(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn->off);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2023  			else
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2024  				emit_stx_r12(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn->off);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2025  populate_extable:
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2026  			{
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2027  				struct exception_table_entry *ex;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2028  				u8 *_insn = image + proglen + (start_of_ldx - temp);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2029  				s64 delta;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2030  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2031  				if (!bpf_prog->aux->extable)
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2032  					break;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2033  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2034  				if (excnt >= bpf_prog->aux->num_exentries) {
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2035  					pr_err("mem32 extable bug\n");
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2036  					return -EFAULT;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2037  				}
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2038  				ex = &bpf_prog->aux->extable[excnt++];
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2039  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2040  				delta = _insn - (u8 *)&ex->insn;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2041  				/* switch ex to rw buffer for writes */
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2042  				ex = (void *)rw_image + ((void *)ex - (void *)image);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2043  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2044  				ex->insn = delta;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2045  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2046  				ex->data = EX_TYPE_BPF;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2047  
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2048  				ex->fixup = (prog - start_of_ldx) |
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2049  					((BPF_CLASS(insn->code) == BPF_LDX ? reg2pt_regs[dst_reg] : DONT_CLEAR) << 8);
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2050  			}
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2051  			break;
2fe99eb0ccf2bb Alexei Starovoitov      2024-03-07  2052  
e430f34ee5192c Alexei Starovoitov      2014-06-06  2053  			/* LDX: dst_reg = *(u8*)(src_reg + off) */
622582786c9e04 Alexei Starovoitov      2014-05-13  2054  		case BPF_LDX | BPF_MEM | BPF_B:
3dec541b2e632d Alexei Starovoitov      2019-10-15  2055  		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
622582786c9e04 Alexei Starovoitov      2014-05-13  2056  		case BPF_LDX | BPF_MEM | BPF_H:
3dec541b2e632d Alexei Starovoitov      2019-10-15  2057  		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
622582786c9e04 Alexei Starovoitov      2014-05-13  2058  		case BPF_LDX | BPF_MEM | BPF_W:
3dec541b2e632d Alexei Starovoitov      2019-10-15  2059  		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
622582786c9e04 Alexei Starovoitov      2014-05-13  2060  		case BPF_LDX | BPF_MEM | BPF_DW:
3dec541b2e632d Alexei Starovoitov      2019-10-15  2061  		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2062  			/* LDXS: dst_reg = *(s8*)(src_reg + off) */
1f9a1ea821ff25 Yonghong Song           2023-07-27  2063  		case BPF_LDX | BPF_MEMSX | BPF_B:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2064  		case BPF_LDX | BPF_MEMSX | BPF_H:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2065  		case BPF_LDX | BPF_MEMSX | BPF_W:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2066  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2067  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
1f9a1ea821ff25 Yonghong Song           2023-07-27  2068  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
90156f4bfa21ad Dave Marchevsky         2022-12-16  2069  			insn_off = insn->off;
90156f4bfa21ad Dave Marchevsky         2022-12-16  2070  
1f9a1ea821ff25 Yonghong Song           2023-07-27  2071  			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  2072  			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
90156f4bfa21ad Dave Marchevsky         2022-12-16  2073  				/* Conservatively check that src_reg + insn->off is a kernel address:
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2074  				 *   src_reg + insn->off > TASK_SIZE_MAX + PAGE_SIZE
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2075  				 *   and
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2076  				 *   src_reg + insn->off < VSYSCALL_ADDR
588a25e92458c6 Alexei Starovoitov      2021-12-14  2077  				 */
588a25e92458c6 Alexei Starovoitov      2021-12-14  2078  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2079  				u64 limit = TASK_SIZE_MAX + PAGE_SIZE - VSYSCALL_ADDR;
90156f4bfa21ad Dave Marchevsky         2022-12-16  2080  				u8 *end_of_jmp;
90156f4bfa21ad Dave Marchevsky         2022-12-16  2081  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2082  				/* movabsq r10, VSYSCALL_ADDR */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2083  				emit_mov_imm64(&prog, BPF_REG_AX, (long)VSYSCALL_ADDR >> 32,
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2084  					       (u32)(long)VSYSCALL_ADDR);
588a25e92458c6 Alexei Starovoitov      2021-12-14  2085  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2086  				/* mov src_reg, r11 */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2087  				EMIT_mov(AUX_REG, src_reg);
90156f4bfa21ad Dave Marchevsky         2022-12-16  2088  
90156f4bfa21ad Dave Marchevsky         2022-12-16  2089  				if (insn->off) {
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2090  					/* add r11, insn->off */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2091  					maybe_emit_1mod(&prog, AUX_REG, true);
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2092  					EMIT2_off32(0x81, add_1reg(0xC0, AUX_REG), insn->off);
90156f4bfa21ad Dave Marchevsky         2022-12-16  2093  				}
90156f4bfa21ad Dave Marchevsky         2022-12-16  2094  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2095  				/* sub r11, r10 */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2096  				maybe_emit_mod(&prog, AUX_REG, BPF_REG_AX, true);
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2097  				EMIT2(0x29, add_2reg(0xC0, AUX_REG, BPF_REG_AX));
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2098  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2099  				/* movabsq r10, limit */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2100  				emit_mov_imm64(&prog, BPF_REG_AX, (long)limit >> 32,
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2101  					       (u32)(long)limit);
588a25e92458c6 Alexei Starovoitov      2021-12-14  2102  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2103  				/* cmp r10, r11 */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2104  				maybe_emit_mod(&prog, AUX_REG, BPF_REG_AX, true);
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2105  				EMIT2(0x39, add_2reg(0xC0, AUX_REG, BPF_REG_AX));
588a25e92458c6 Alexei Starovoitov      2021-12-14  2106  
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2107  				/* if unsigned '>', goto load */
b599d7d26d6ad1 Puranjay Mohan          2024-04-24  2108  				EMIT2(X86_JA, 0);
90156f4bfa21ad Dave Marchevsky         2022-12-16  2109  				end_of_jmp = prog;
588a25e92458c6 Alexei Starovoitov      2021-12-14  2110  
4c5de127598e1b Alexei Starovoitov      2021-02-01  2111  				/* xor dst_reg, dst_reg */
4c5de127598e1b Alexei Starovoitov      2021-02-01  2112  				emit_mov_imm32(&prog, false, dst_reg, 0);
4c5de127598e1b Alexei Starovoitov      2021-02-01  2113  				/* jmp byte_after_ldx */
4c5de127598e1b Alexei Starovoitov      2021-02-01  2114  				EMIT2(0xEB, 0);
4c5de127598e1b Alexei Starovoitov      2021-02-01  2115  
90156f4bfa21ad Dave Marchevsky         2022-12-16  2116  				/* populate jmp_offset for JAE above to jump to start_of_ldx */
4c5de127598e1b Alexei Starovoitov      2021-02-01  2117  				start_of_ldx = prog;
90156f4bfa21ad Dave Marchevsky         2022-12-16  2118  				end_of_jmp[-1] = start_of_ldx - end_of_jmp;
4c5de127598e1b Alexei Starovoitov      2021-02-01  2119  			}
1f9a1ea821ff25 Yonghong Song           2023-07-27  2120  			if (BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  2121  			    BPF_MODE(insn->code) == BPF_MEMSX)
1f9a1ea821ff25 Yonghong Song           2023-07-27  2122  				emit_ldsx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
1f9a1ea821ff25 Yonghong Song           2023-07-27  2123  			else
90156f4bfa21ad Dave Marchevsky         2022-12-16  2124  				emit_ldx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
1f9a1ea821ff25 Yonghong Song           2023-07-27  2125  			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
1f9a1ea821ff25 Yonghong Song           2023-07-27  2126  			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
3dec541b2e632d Alexei Starovoitov      2019-10-15  2127  				struct exception_table_entry *ex;
328aac5ecd119e Ravi Bangoria           2021-06-22  2128  				u8 *_insn = image + proglen + (start_of_ldx - temp);
3dec541b2e632d Alexei Starovoitov      2019-10-15  2129  				s64 delta;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2130  
4c5de127598e1b Alexei Starovoitov      2021-02-01  2131  				/* populate jmp_offset for JMP above */
4c5de127598e1b Alexei Starovoitov      2021-02-01  2132  				start_of_ldx[-1] = prog - start_of_ldx;
4c5de127598e1b Alexei Starovoitov      2021-02-01  2133  
3dec541b2e632d Alexei Starovoitov      2019-10-15  2134  				if (!bpf_prog->aux->extable)
3dec541b2e632d Alexei Starovoitov      2019-10-15  2135  					break;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2136  
3dec541b2e632d Alexei Starovoitov      2019-10-15  2137  				if (excnt >= bpf_prog->aux->num_exentries) {
3dec541b2e632d Alexei Starovoitov      2019-10-15  2138  					pr_err("ex gen bug\n");
3dec541b2e632d Alexei Starovoitov      2019-10-15  2139  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2140  				}
3dec541b2e632d Alexei Starovoitov      2019-10-15  2141  				ex = &bpf_prog->aux->extable[excnt++];
3dec541b2e632d Alexei Starovoitov      2019-10-15  2142  
3dec541b2e632d Alexei Starovoitov      2019-10-15  2143  				delta = _insn - (u8 *)&ex->insn;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2144  				if (!is_simm32(delta)) {
3dec541b2e632d Alexei Starovoitov      2019-10-15  2145  					pr_err("extable->insn doesn't fit into 32-bit\n");
3dec541b2e632d Alexei Starovoitov      2019-10-15  2146  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2147  				}
1022a5498f6f74 Song Liu                2022-02-04  2148  				/* switch ex to rw buffer for writes */
1022a5498f6f74 Song Liu                2022-02-04  2149  				ex = (void *)rw_image + ((void *)ex - (void *)image);
1022a5498f6f74 Song Liu                2022-02-04  2150  
3dec541b2e632d Alexei Starovoitov      2019-10-15  2151  				ex->insn = delta;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2152  
4b5305decc8436 Peter Zijlstra          2021-11-10  2153  				ex->data = EX_TYPE_BPF;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2154  
3dec541b2e632d Alexei Starovoitov      2019-10-15  2155  				if (dst_reg > BPF_REG_9) {
3dec541b2e632d Alexei Starovoitov      2019-10-15  2156  					pr_err("verifier error\n");
3dec541b2e632d Alexei Starovoitov      2019-10-15  2157  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov      2019-10-15  2158  				}
3dec541b2e632d Alexei Starovoitov      2019-10-15  2159  				/*
3dec541b2e632d Alexei Starovoitov      2019-10-15  2160  				 * Compute size of x86 insn and its target dest x86 register.
3dec541b2e632d Alexei Starovoitov      2019-10-15  2161  				 * ex_handler_bpf() will use lower 8 bits to adjust
3dec541b2e632d Alexei Starovoitov      2019-10-15  2162  				 * pt_regs->ip to jump over this x86 instruction
3dec541b2e632d Alexei Starovoitov      2019-10-15  2163  				 * and upper bits to figure out which pt_regs to zero out.
3dec541b2e632d Alexei Starovoitov      2019-10-15  2164  				 * End result: x86 insn "mov rbx, qword ptr [rax+0x14]"
3dec541b2e632d Alexei Starovoitov      2019-10-15  2165  				 * of 4 bytes will be ignored and rbx will be zero inited.
3dec541b2e632d Alexei Starovoitov      2019-10-15  2166  				 */
433956e9120073 Alexei Starovoitov      2021-12-15  2167  				ex->fixup = (prog - start_of_ldx) | (reg2pt_regs[dst_reg] << 8);
3dec541b2e632d Alexei Starovoitov      2019-10-15  2168  			}
0a14842f5a3c0e Eric Dumazet            2011-04-20  2169  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  2170  
5341c9a4d83300 Peilin Ye               2025-03-04  2171  		case BPF_STX | BPF_ATOMIC | BPF_B:
5341c9a4d83300 Peilin Ye               2025-03-04  2172  		case BPF_STX | BPF_ATOMIC | BPF_H:
5341c9a4d83300 Peilin Ye               2025-03-04  2173  			if (!bpf_atomic_is_load_store(insn)) {
5341c9a4d83300 Peilin Ye               2025-03-04  2174  				pr_err("bpf_jit: 1- and 2-byte RMW atomics are not supported\n");
5341c9a4d83300 Peilin Ye               2025-03-04  2175  				return -EFAULT;
5341c9a4d83300 Peilin Ye               2025-03-04  2176  			}
5341c9a4d83300 Peilin Ye               2025-03-04  2177  			fallthrough;
91c960b0056672 Brendan Jackman         2021-01-14  2178  		case BPF_STX | BPF_ATOMIC | BPF_W:
91c960b0056672 Brendan Jackman         2021-01-14  2179  		case BPF_STX | BPF_ATOMIC | BPF_DW:
981f94c3e92146 Brendan Jackman         2021-01-14  2180  			if (insn->imm == (BPF_AND | BPF_FETCH) ||
981f94c3e92146 Brendan Jackman         2021-01-14  2181  			    insn->imm == (BPF_OR | BPF_FETCH) ||
981f94c3e92146 Brendan Jackman         2021-01-14  2182  			    insn->imm == (BPF_XOR | BPF_FETCH)) {
981f94c3e92146 Brendan Jackman         2021-01-14  2183  				bool is64 = BPF_SIZE(insn->code) == BPF_DW;
b29dd96b905f3d Brendan Jackman         2021-02-16  2184  				u32 real_src_reg = src_reg;
ced185824c89b6 Johan Almbladh          2021-09-27  2185  				u32 real_dst_reg = dst_reg;
ced185824c89b6 Johan Almbladh          2021-09-27  2186  				u8 *branch_target;
981f94c3e92146 Brendan Jackman         2021-01-14  2187  
981f94c3e92146 Brendan Jackman         2021-01-14  2188  				/*
981f94c3e92146 Brendan Jackman         2021-01-14  2189  				 * Can't be implemented with a single x86 insn.
981f94c3e92146 Brendan Jackman         2021-01-14  2190  				 * Need to do a CMPXCHG loop.
981f94c3e92146 Brendan Jackman         2021-01-14  2191  				 */
981f94c3e92146 Brendan Jackman         2021-01-14  2192  
981f94c3e92146 Brendan Jackman         2021-01-14  2193  				/* Will need RAX as a CMPXCHG operand so save R0 */
981f94c3e92146 Brendan Jackman         2021-01-14  2194  				emit_mov_reg(&prog, true, BPF_REG_AX, BPF_REG_0);
b29dd96b905f3d Brendan Jackman         2021-02-16  2195  				if (src_reg == BPF_REG_0)
b29dd96b905f3d Brendan Jackman         2021-02-16  2196  					real_src_reg = BPF_REG_AX;
ced185824c89b6 Johan Almbladh          2021-09-27  2197  				if (dst_reg == BPF_REG_0)
ced185824c89b6 Johan Almbladh          2021-09-27  2198  					real_dst_reg = BPF_REG_AX;
b29dd96b905f3d Brendan Jackman         2021-02-16  2199  
981f94c3e92146 Brendan Jackman         2021-01-14  2200  				branch_target = prog;
981f94c3e92146 Brendan Jackman         2021-01-14  2201  				/* Load old value */
981f94c3e92146 Brendan Jackman         2021-01-14  2202  				emit_ldx(&prog, BPF_SIZE(insn->code),
ced185824c89b6 Johan Almbladh          2021-09-27  2203  					 BPF_REG_0, real_dst_reg, insn->off);
981f94c3e92146 Brendan Jackman         2021-01-14  2204  				/*
981f94c3e92146 Brendan Jackman         2021-01-14  2205  				 * Perform the (commutative) operation locally,
981f94c3e92146 Brendan Jackman         2021-01-14  2206  				 * put the result in the AUX_REG.
981f94c3e92146 Brendan Jackman         2021-01-14  2207  				 */
981f94c3e92146 Brendan Jackman         2021-01-14  2208  				emit_mov_reg(&prog, is64, AUX_REG, BPF_REG_0);
b29dd96b905f3d Brendan Jackman         2021-02-16  2209  				maybe_emit_mod(&prog, AUX_REG, real_src_reg, is64);
981f94c3e92146 Brendan Jackman         2021-01-14  2210  				EMIT2(simple_alu_opcodes[BPF_OP(insn->imm)],
b29dd96b905f3d Brendan Jackman         2021-02-16  2211  				      add_2reg(0xC0, AUX_REG, real_src_reg));
981f94c3e92146 Brendan Jackman         2021-01-14  2212  				/* Attempt to swap in new value */
5341c9a4d83300 Peilin Ye               2025-03-04  2213  				err = emit_atomic_rmw(&prog, BPF_CMPXCHG,
ced185824c89b6 Johan Almbladh          2021-09-27  2214  						      real_dst_reg, AUX_REG,
ced185824c89b6 Johan Almbladh          2021-09-27  2215  						      insn->off,
981f94c3e92146 Brendan Jackman         2021-01-14  2216  						      BPF_SIZE(insn->code));
981f94c3e92146 Brendan Jackman         2021-01-14  2217  				if (WARN_ON(err))
981f94c3e92146 Brendan Jackman         2021-01-14  2218  					return err;
981f94c3e92146 Brendan Jackman         2021-01-14  2219  				/*
981f94c3e92146 Brendan Jackman         2021-01-14  2220  				 * ZF tells us whether we won the race. If it's
981f94c3e92146 Brendan Jackman         2021-01-14  2221  				 * cleared we need to try again.
981f94c3e92146 Brendan Jackman         2021-01-14  2222  				 */
981f94c3e92146 Brendan Jackman         2021-01-14  2223  				EMIT2(X86_JNE, -(prog - branch_target) - 2);
981f94c3e92146 Brendan Jackman         2021-01-14  2224  				/* Return the pre-modification value */
b29dd96b905f3d Brendan Jackman         2021-02-16  2225  				emit_mov_reg(&prog, is64, real_src_reg, BPF_REG_0);
981f94c3e92146 Brendan Jackman         2021-01-14  2226  				/* Restore R0 after clobbering RAX */
981f94c3e92146 Brendan Jackman         2021-01-14  2227  				emit_mov_reg(&prog, true, BPF_REG_0, BPF_REG_AX);
981f94c3e92146 Brendan Jackman         2021-01-14  2228  				break;
981f94c3e92146 Brendan Jackman         2021-01-14  2229  			}
981f94c3e92146 Brendan Jackman         2021-01-14  2230  
5341c9a4d83300 Peilin Ye               2025-03-04  2231  			if (bpf_atomic_is_load_store(insn))
5341c9a4d83300 Peilin Ye               2025-03-04 @2232  				err = emit_atomic_ld_st(&prog, insn->imm, dst_reg, src_reg,
5341c9a4d83300 Peilin Ye               2025-03-04  2233  							insn->off, BPF_SIZE(insn->code));
5341c9a4d83300 Peilin Ye               2025-03-04  2234  			else
5341c9a4d83300 Peilin Ye               2025-03-04  2235  				err = emit_atomic_rmw(&prog, insn->imm, dst_reg, src_reg,
91c960b0056672 Brendan Jackman         2021-01-14  2236  						      insn->off, BPF_SIZE(insn->code));
91c960b0056672 Brendan Jackman         2021-01-14  2237  			if (err)
91c960b0056672 Brendan Jackman         2021-01-14  2238  				return err;
622582786c9e04 Alexei Starovoitov      2014-05-13  2239  			break;
622582786c9e04 Alexei Starovoitov      2014-05-13  2240  
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2241  		case BPF_STX | BPF_PROBE_ATOMIC | BPF_W:
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2242  		case BPF_STX | BPF_PROBE_ATOMIC | BPF_DW:
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2243  			start_of_ldx = prog;
db494b13c593e5 Alexei Starovoitov      2024-04-05  2244  			err = emit_atomic_index(&prog, insn->imm, BPF_SIZE(insn->code),
db494b13c593e5 Alexei Starovoitov      2024-04-05  2245  						dst_reg, src_reg, X86_REG_R12, insn->off);
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2246  			if (err)
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2247  				return err;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2248  			goto populate_extable;
d503a04f8bc0c7 Alexei Starovoitov      2024-04-05  2249  
622582786c9e04 Alexei Starovoitov      2014-05-13  2250  			/* call */
b2e9dfe54be4d0 Thomas Gleixner         2022-09-15  2251  		case BPF_JMP | BPF_CALL: {
6a537453000a91 Joan Bruguera Micó      2024-04-01  2252  			u8 *ip = image + addrs[i - 1];
b2e9dfe54be4d0 Thomas Gleixner         2022-09-15  2253  
e430f34ee5192c Alexei Starovoitov      2014-06-06  2254  			func = (u8 *) __bpf_call_base + imm32;
a1087da9d11e5b Leon Hwang              2024-11-07  2255  			if (src_reg == BPF_PSEUDO_CALL && tail_call_reachable) {
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  2256  				LOAD_TAIL_CALL_CNT_PTR(stack_depth);
6a537453000a91 Joan Bruguera Micó      2024-04-01  2257  				ip += 7;
6a537453000a91 Joan Bruguera Micó      2024-04-01  2258  			}
b2e9dfe54be4d0 Thomas Gleixner         2022-09-15  2259  			if (!imm32)
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  2260  				return -EINVAL;
7d1cd70d4b16ff Yonghong Song           2024-11-12  2261  			if (priv_frame_ptr) {
7d1cd70d4b16ff Yonghong Song           2024-11-12  2262  				push_r9(&prog);
7d1cd70d4b16ff Yonghong Song           2024-11-12  2263  				ip += 2;
7d1cd70d4b16ff Yonghong Song           2024-11-12  2264  			}
6a537453000a91 Joan Bruguera Micó      2024-04-01  2265  			ip += x86_call_depth_emit_accounting(&prog, func, ip);
6a537453000a91 Joan Bruguera Micó      2024-04-01  2266  			if (emit_call(&prog, func, ip))
b2e9dfe54be4d0 Thomas Gleixner         2022-09-15  2267  				return -EINVAL;
7d1cd70d4b16ff Yonghong Song           2024-11-12  2268  			if (priv_frame_ptr)
7d1cd70d4b16ff Yonghong Song           2024-11-12  2269  				pop_r9(&prog);
622582786c9e04 Alexei Starovoitov      2014-05-13  2270  			break;
b2e9dfe54be4d0 Thomas Gleixner         2022-09-15  2271  		}
622582786c9e04 Alexei Starovoitov      2014-05-13  2272  
71189fa9b092ef Alexei Starovoitov      2017-05-30  2273  		case BPF_JMP | BPF_TAIL_CALL:
428d5df1fa4f28 Daniel Borkmann         2019-11-22  2274  			if (imm32)
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  2275  				emit_bpf_tail_call_direct(bpf_prog,
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  2276  							  &bpf_prog->aux->poke_tab[imm32 - 1],
dceba0817ca329 Peter Zijlstra          2021-10-26  2277  							  &prog, image + addrs[i - 1],
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  2278  							  callee_regs_used,
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  2279  							  stack_depth,
dceba0817ca329 Peter Zijlstra          2021-10-26  2280  							  ctx);
428d5df1fa4f28 Daniel Borkmann         2019-11-22  2281  			else
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  2282  				emit_bpf_tail_call_indirect(bpf_prog,
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  2283  							    &prog,
ebf7d1f508a738 Maciej Fijalkowski      2020-09-16  2284  							    callee_regs_used,
f4b21ed0b9d6c9 Yonghong Song           2024-11-12  2285  							    stack_depth,
dceba0817ca329 Peter Zijlstra          2021-10-26  2286  							    image + addrs[i - 1],
dceba0817ca329 Peter Zijlstra          2021-10-26  2287  							    ctx);
b52f00e6a71543 Alexei Starovoitov      2015-05-19  2288  			break;
b52f00e6a71543 Alexei Starovoitov      2015-05-19  2289  
622582786c9e04 Alexei Starovoitov      2014-05-13  2290  			/* cond jump */
622582786c9e04 Alexei Starovoitov      2014-05-13  2291  		case BPF_JMP | BPF_JEQ | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  2292  		case BPF_JMP | BPF_JNE | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  2293  		case BPF_JMP | BPF_JGT | BPF_X:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2294  		case BPF_JMP | BPF_JLT | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  2295  		case BPF_JMP | BPF_JGE | BPF_X:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2296  		case BPF_JMP | BPF_JLE | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  2297  		case BPF_JMP | BPF_JSGT | BPF_X:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2298  		case BPF_JMP | BPF_JSLT | BPF_X:
622582786c9e04 Alexei Starovoitov      2014-05-13  2299  		case BPF_JMP | BPF_JSGE | BPF_X:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2300  		case BPF_JMP | BPF_JSLE | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2301  		case BPF_JMP32 | BPF_JEQ | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2302  		case BPF_JMP32 | BPF_JNE | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2303  		case BPF_JMP32 | BPF_JGT | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2304  		case BPF_JMP32 | BPF_JLT | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2305  		case BPF_JMP32 | BPF_JGE | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2306  		case BPF_JMP32 | BPF_JLE | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2307  		case BPF_JMP32 | BPF_JSGT | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2308  		case BPF_JMP32 | BPF_JSLT | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2309  		case BPF_JMP32 | BPF_JSGE | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2310  		case BPF_JMP32 | BPF_JSLE | BPF_X:
e430f34ee5192c Alexei Starovoitov      2014-06-06  2311  			/* cmp dst_reg, src_reg */
74007cfc1f71e4 Brendan Jackman         2021-01-14  2312  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman         2021-01-14  2313  				       BPF_CLASS(insn->code) == BPF_JMP);
3f5d6525f21990 Jiong Wang              2019-01-26  2314  			EMIT2(0x39, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  2315  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov      2014-05-13  2316  
622582786c9e04 Alexei Starovoitov      2014-05-13  2317  		case BPF_JMP | BPF_JSET | BPF_X:
3f5d6525f21990 Jiong Wang              2019-01-26  2318  		case BPF_JMP32 | BPF_JSET | BPF_X:
e430f34ee5192c Alexei Starovoitov      2014-06-06  2319  			/* test dst_reg, src_reg */
74007cfc1f71e4 Brendan Jackman         2021-01-14  2320  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman         2021-01-14  2321  				       BPF_CLASS(insn->code) == BPF_JMP);
3f5d6525f21990 Jiong Wang              2019-01-26  2322  			EMIT2(0x85, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov      2014-05-13  2323  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov      2014-05-13  2324  
622582786c9e04 Alexei Starovoitov      2014-05-13  2325  		case BPF_JMP | BPF_JSET | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2326  		case BPF_JMP32 | BPF_JSET | BPF_K:
e430f34ee5192c Alexei Starovoitov      2014-06-06  2327  			/* test dst_reg, imm32 */
6364d7d75a0e01 Jie Meng                2021-10-06  2328  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  2329  					BPF_CLASS(insn->code) == BPF_JMP);
e430f34ee5192c Alexei Starovoitov      2014-06-06  2330  			EMIT2_off32(0xF7, add_1reg(0xC0, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov      2014-05-13  2331  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov      2014-05-13  2332  
622582786c9e04 Alexei Starovoitov      2014-05-13  2333  		case BPF_JMP | BPF_JEQ | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  2334  		case BPF_JMP | BPF_JNE | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  2335  		case BPF_JMP | BPF_JGT | BPF_K:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2336  		case BPF_JMP | BPF_JLT | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  2337  		case BPF_JMP | BPF_JGE | BPF_K:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2338  		case BPF_JMP | BPF_JLE | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  2339  		case BPF_JMP | BPF_JSGT | BPF_K:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2340  		case BPF_JMP | BPF_JSLT | BPF_K:
622582786c9e04 Alexei Starovoitov      2014-05-13  2341  		case BPF_JMP | BPF_JSGE | BPF_K:
52afc51e94b1c7 Daniel Borkmann         2017-08-10  2342  		case BPF_JMP | BPF_JSLE | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2343  		case BPF_JMP32 | BPF_JEQ | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2344  		case BPF_JMP32 | BPF_JNE | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2345  		case BPF_JMP32 | BPF_JGT | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2346  		case BPF_JMP32 | BPF_JLT | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2347  		case BPF_JMP32 | BPF_JGE | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2348  		case BPF_JMP32 | BPF_JLE | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2349  		case BPF_JMP32 | BPF_JSGT | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2350  		case BPF_JMP32 | BPF_JSLT | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2351  		case BPF_JMP32 | BPF_JSGE | BPF_K:
3f5d6525f21990 Jiong Wang              2019-01-26  2352  		case BPF_JMP32 | BPF_JSLE | BPF_K:
38f51c07054ff4 Daniel Borkmann         2019-10-03  2353  			/* test dst_reg, dst_reg to save one extra byte */
38f51c07054ff4 Daniel Borkmann         2019-10-03  2354  			if (imm32 == 0) {
74007cfc1f71e4 Brendan Jackman         2021-01-14  2355  				maybe_emit_mod(&prog, dst_reg, dst_reg,
74007cfc1f71e4 Brendan Jackman         2021-01-14  2356  					       BPF_CLASS(insn->code) == BPF_JMP);
38f51c07054ff4 Daniel Borkmann         2019-10-03  2357  				EMIT2(0x85, add_2reg(0xC0, dst_reg, dst_reg));
38f51c07054ff4 Daniel Borkmann         2019-10-03  2358  				goto emit_cond_jmp;
38f51c07054ff4 Daniel Borkmann         2019-10-03  2359  			}
38f51c07054ff4 Daniel Borkmann         2019-10-03  2360  
e430f34ee5192c Alexei Starovoitov      2014-06-06  2361  			/* cmp dst_reg, imm8/32 */
6364d7d75a0e01 Jie Meng                2021-10-06  2362  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng                2021-10-06  2363  					BPF_CLASS(insn->code) == BPF_JMP);
622582786c9e04 Alexei Starovoitov      2014-05-13  2364  
e430f34ee5192c Alexei Starovoitov      2014-06-06  2365  			if (is_imm8(imm32))
e430f34ee5192c Alexei Starovoitov      2014-06-06  2366  				EMIT3(0x83, add_1reg(0xF8, dst_reg), imm32);
0a14842f5a3c0e Eric Dumazet            2011-04-20  2367  			else
e430f34ee5192c Alexei Starovoitov      2014-06-06  2368  				EMIT2_off32(0x81, add_1reg(0xF8, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov      2014-05-13  2369  

:::::: The code at line 2232 was first introduced by commit
:::::: 5341c9a4d833009071595230e3a038a823265a86 bpf, x86: Support load-acquire and store-release instructions

:::::: TO: Peilin Ye <yepeilin@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
