Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2B283141
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644985; cv=none; b=kiTS2aZOE8UiUmhSTHlgDLfJo1NOv0+V/Kpsw3Bv7mPvEconiEYvMONSHkMmXdf4noIlWTpvJcxDtuAZS1uO55pHS/BNfc9xer2vbn29CmvRPCjmK0iwKipIGrDnfxvRjcCMC/q8VlgF1jXj5oPXYiEJ/hZ4yMfydEK0WhUc47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644985; c=relaxed/simple;
	bh=RQtk/AEEJaPkw2updW0UyJrQqNLKZ8iqFS4juirWoY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kp634jC8b2/ZJkgjXE7UvMbnsinmSc2xHPIobhuRs1jnB+i1ikDCTUmpItyhRtySquJJbFJ4dRcS05XhbRe7+2rHokYSOw7cWS0hrceYtzpqhjs3Ges2X4xz+ytVz8s1B1kGt0Oo4lqZnmweuFWpDoNQt7S4AkZM4IY6myEjTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkPUqSk8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkPUqSk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749644983; x=1781180983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQtk/AEEJaPkw2updW0UyJrQqNLKZ8iqFS4juirWoY4=;
  b=nkPUqSk8h9Y/iQnCFO5CwwSqIrHpLQIYeVzvVmAqnjBlYUu74SA1XjQd
   YDhWn/Gjf+N1Lj2No/m8ozebvanbt+tiCAr6XrqaVhFizaZlPns7tK0gv
   NJtpumzsE+qv2gTQ4PqLJTNNc/SxdVcoYs3iKlcEU2r5YOIaqZefvJkZa
   keivIrb1RHQjJLuEXJAqHByzDnkgZEdaQ7JAUmytBViHuhdHfjKFLZd35
   1exA7kw6UCTEu0CotNhrQZimS/7YkEkHiNcBBhw2fXgmMI+PVVcJb96GK
   nKUkj2OHtm0R2TBnVXrBzRY1ClRQaLiwISTyjiyKlMJazxO4e8cDT3NCl
   g==;
X-CSE-ConnectionGUID: d+jmkHF4TfeczWXuDw0hbg==
X-CSE-MsgGUID: Xe/fnQW3TEiKzk+7GPDiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55580449"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="55580449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 05:29:42 -0700
X-CSE-ConnectionGUID: kzUwzSYoS26WzSa8YXo2eg==
X-CSE-MsgGUID: e7Pi4oRPSXCeCX6uTLzzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="148096712"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2025 05:29:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPKaJ-000AQe-0g;
	Wed, 11 Jun 2025 12:29:39 +0000
Date: Wed, 11 Jun 2025 20:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954]
 arch/arm64/net/bpf_jit_comp.c:1647:73: sparse: sparse: incorrect type in
 argument 5 (different base types)
Message-ID: <202506112030.xet5A4D9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: 43be0c0544c8e70723951433fd2dae258fff3dff [2954/2954] bpf, arm64: Fix bpf trampoline instruction endianness
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250611/202506112030.xet5A4D9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506112030.xet5A4D9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112030.xet5A4D9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/net/bpf_jit_comp.c:1515:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] * @@     got restricted __le32 [usertype] * @@
   arch/arm64/net/bpf_jit_comp.c:1515:29: sparse:     expected unsigned int [usertype] *
   arch/arm64/net/bpf_jit_comp.c:1515:29: sparse:     got restricted __le32 [usertype] *
>> arch/arm64/net/bpf_jit_comp.c:1647:73: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] **branches @@     got restricted __le32 [usertype] **[assigned] branches @@
   arch/arm64/net/bpf_jit_comp.c:1647:73: sparse:     expected unsigned int [usertype] **branches
   arch/arm64/net/bpf_jit_comp.c:1647:73: sparse:     got restricted __le32 [usertype] **[assigned] branches

vim +1647 arch/arm64/net/bpf_jit_comp.c

2a5ab77af7f94d Xu Kuohai 2024-04-13  1496  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1497  static void invoke_bpf_mod_ret(struct jit_ctx *ctx, struct bpf_tramp_progs *tp,
2a5ab77af7f94d Xu Kuohai 2024-04-13  1498  			       int args_off, int retval_off, u32 **branches)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1499  {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1500  	int i;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1501  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1502  	/* The first fmod_ret program will receive a garbage return value.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1503  	 * Set this to 0 to avoid confusing the program.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1504  	 */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1505  	emit(A64_STR64I(A64_ZR, A64_SP, retval_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1506  	for (i = 0; i < tp->nr_progs; i++) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1507  		invoke_bpf_prog(ctx, tp->progs[i], args_off, retval_off, true);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1508  		/* if (*(u64 *)(sp + retval_off) !=  0)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1509  		 *	goto do_fexit;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1510  		 */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1511  		emit(A64_LDR64I(A64_R(10), A64_SP, retval_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1512  		/* Save the location of branch, and generate a nop.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1513  		 * This nop will be replaced with a cbnz later.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1514  		 */
2a5ab77af7f94d Xu Kuohai 2024-04-13 @1515  		branches[i] = ctx->image + ctx->idx;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1516  		emit(A64_NOP, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1517  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1518  }
2a5ab77af7f94d Xu Kuohai 2024-04-13  1519  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1520  static void save_args(struct jit_ctx *ctx, int args_off, int nargs)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1521  {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1522  	int i;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1523  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1524  	for (i = 0; i < nargs; i++) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1525  		emit(A64_STR64I(i, A64_SP, args_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1526  		args_off += 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1527  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1528  }
2a5ab77af7f94d Xu Kuohai 2024-04-13  1529  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1530  static void restore_args(struct jit_ctx *ctx, int args_off, int nargs)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1531  {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1532  	int i;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1533  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1534  	for (i = 0; i < nargs; i++) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1535  		emit(A64_LDR64I(i, A64_SP, args_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1536  		args_off += 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1537  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1538  }
2a5ab77af7f94d Xu Kuohai 2024-04-13  1539  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1540  /* Based on the x86's implementation of arch_prepare_bpf_trampoline().
2a5ab77af7f94d Xu Kuohai 2024-04-13  1541   *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1542   * bpf prog and function entry before bpf trampoline hooked:
2a5ab77af7f94d Xu Kuohai 2024-04-13  1543   *   mov x9, lr
2a5ab77af7f94d Xu Kuohai 2024-04-13  1544   *   nop
2a5ab77af7f94d Xu Kuohai 2024-04-13  1545   *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1546   * bpf prog and function entry after bpf trampoline hooked:
2a5ab77af7f94d Xu Kuohai 2024-04-13  1547   *   mov x9, lr
2a5ab77af7f94d Xu Kuohai 2024-04-13  1548   *   bl  <bpf_trampoline or plt>
2a5ab77af7f94d Xu Kuohai 2024-04-13  1549   *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1550   */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1551  static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
2a5ab77af7f94d Xu Kuohai 2024-04-13  1552  			      struct bpf_tramp_progs *tprogs, void *orig_call,
2a5ab77af7f94d Xu Kuohai 2024-04-13  1553  			      int nargs, u32 flags)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1554  {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1555  	int i;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1556  	int stack_size;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1557  	int retaddr_off;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1558  	int regs_off;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1559  	int retval_off;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1560  	int args_off;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1561  	struct bpf_tramp_progs *fentry = &tprogs[BPF_TRAMP_FENTRY];
2a5ab77af7f94d Xu Kuohai 2024-04-13  1562  	struct bpf_tramp_progs *fexit = &tprogs[BPF_TRAMP_FEXIT];
2a5ab77af7f94d Xu Kuohai 2024-04-13  1563  	struct bpf_tramp_progs *fmod_ret = &tprogs[BPF_TRAMP_MODIFY_RETURN];
2a5ab77af7f94d Xu Kuohai 2024-04-13  1564  	bool save_ret;
43be0c0544c8e7 Xu Kuohai 2024-04-13  1565  	__le32 **branches = NULL;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1566  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1567  	/* trampoline stack layout:
2a5ab77af7f94d Xu Kuohai 2024-04-13  1568  	 *                  [ parent ip         ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1569  	 *                  [ FP                ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1570  	 * SP + retaddr_off [ self ip           ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1571  	 *                  [ FP                ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1572  	 *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1573  	 *                  [ padding           ] align SP to multiples of 16
2a5ab77af7f94d Xu Kuohai 2024-04-13  1574  	 *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1575  	 * SP + regs_off    [ x19               ] callee saved reg x19
2a5ab77af7f94d Xu Kuohai 2024-04-13  1576  	 *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1577  	 * SP + retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG or
2a5ab77af7f94d Xu Kuohai 2024-04-13  1578  	 *                                        BPF_TRAMP_F_RET_FENTRY_RET
2a5ab77af7f94d Xu Kuohai 2024-04-13  1579  	 *
2a5ab77af7f94d Xu Kuohai 2024-04-13  1580  	 *                  [ argN              ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1581  	 *                  [ ...               ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1582  	 * SP + args_off    [ arg1              ]
2a5ab77af7f94d Xu Kuohai 2024-04-13  1583  	 */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1584  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1585  	stack_size = 0;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1586  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1587  	args_off = stack_size;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1588  	/* room for args */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1589  	stack_size += nargs * 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1590  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1591  	/* room for return value */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1592  	retval_off = stack_size;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1593  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1594  	if (save_ret)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1595  		stack_size += 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1596  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1597  	/* room for callee saved registers, currently only x19 is used */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1598  	regs_off = stack_size;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1599  	stack_size += 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1600  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1601  	/* round up to multiples of 16 to avoid SPAlignmentFault */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1602  	stack_size = round_up(stack_size, 16);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1603  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1604  	/* return address locates above FP */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1605  	retaddr_off = stack_size + 8;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1606  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1607  	/* bpf trampoline may be invoked by 3 instruction types:
2a5ab77af7f94d Xu Kuohai 2024-04-13  1608  	 * 1. bl, attached to bpf prog or kernel function via short jump
2a5ab77af7f94d Xu Kuohai 2024-04-13  1609  	 * 2. br, attached to bpf prog or kernel function via long jump
2a5ab77af7f94d Xu Kuohai 2024-04-13  1610  	 * 3. blr, working as a function pointer, used by struct_ops.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1611  	 * So BTI_JC should used here to support both br and blr.
2a5ab77af7f94d Xu Kuohai 2024-04-13  1612  	 */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1613  	emit_bti(A64_BTI_JC, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1614  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1615  	/* frame for parent function */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1616  	emit(A64_PUSH(A64_FP, A64_R(9), A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1617  	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1618  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1619  	/* frame for patched function */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1620  	emit(A64_PUSH(A64_FP, A64_LR, A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1621  	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1622  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1623  	/* allocate stack space */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1624  	emit(A64_SUB_I(1, A64_SP, A64_SP, stack_size), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1625  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1626  	/* save args */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1627  	save_args(ctx, args_off, nargs);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1628  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1629  	/* save callee saved registers */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1630  	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1631  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1632  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1633  		emit_addr_mov_i64(A64_R(0), (const u64)im, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1634  		emit_call((const u64)__bpf_tramp_enter, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1635  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1636  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1637  	for (i = 0; i < fentry->nr_progs; i++)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1638  		invoke_bpf_prog(ctx, fentry->progs[i], args_off,
2a5ab77af7f94d Xu Kuohai 2024-04-13  1639  				retval_off, flags & BPF_TRAMP_F_RET_FENTRY_RET);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1640  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1641  	if (fmod_ret->nr_progs) {
43be0c0544c8e7 Xu Kuohai 2024-04-13  1642  		branches = kcalloc(fmod_ret->nr_progs, sizeof(__le32 *),
2a5ab77af7f94d Xu Kuohai 2024-04-13  1643  				   GFP_KERNEL);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1644  		if (!branches)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1645  			return -ENOMEM;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1646  
2a5ab77af7f94d Xu Kuohai 2024-04-13 @1647  		invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off, branches);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1648  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1649  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1650  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1651  		restore_args(ctx, args_off, nargs);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1652  		/* call original func */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1653  		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1654  		emit(A64_BLR(A64_R(10)), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1655  		/* store return value */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1656  		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1657  		/* reserve a nop for bpf_tramp_image_put */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1658  		im->ip_after_call = ctx->image + ctx->idx;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1659  		emit(A64_NOP, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1660  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1661  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1662  	/* update the branches saved in invoke_bpf_mod_ret with cbnz */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1663  	for (i = 0; i < fmod_ret->nr_progs && ctx->image != NULL; i++) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1664  		int offset = &ctx->image[ctx->idx] - branches[i];
43be0c0544c8e7 Xu Kuohai 2024-04-13  1665  		*branches[i] = cpu_to_le32(A64_CBNZ(1, A64_R(10), offset));
2a5ab77af7f94d Xu Kuohai 2024-04-13  1666  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1667  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1668  	for (i = 0; i < fexit->nr_progs; i++)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1669  		invoke_bpf_prog(ctx, fexit->progs[i], args_off, retval_off, false);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1670  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1671  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1672  		im->ip_epilogue = ctx->image + ctx->idx;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1673  		emit_addr_mov_i64(A64_R(0), (const u64)im, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1674  		emit_call((const u64)__bpf_tramp_exit, ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1675  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1676  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1677  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1678  		restore_args(ctx, args_off, nargs);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1679  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1680  	/* restore callee saved register x19 */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1681  	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1682  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1683  	if (save_ret)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1684  		emit(A64_LDR64I(A64_R(0), A64_SP, retval_off), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1685  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1686  	/* reset SP  */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1687  	emit(A64_MOV(1, A64_SP, A64_FP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1688  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1689  	/* pop frames  */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1690  	emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1691  	emit(A64_POP(A64_FP, A64_R(9), A64_SP), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1692  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1693  	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1694  		/* skip patched function, return to parent */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1695  		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1696  		emit(A64_RET(A64_R(9)), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1697  	} else {
2a5ab77af7f94d Xu Kuohai 2024-04-13  1698  		/* return to patched function */
2a5ab77af7f94d Xu Kuohai 2024-04-13  1699  		emit(A64_MOV(1, A64_R(10), A64_LR), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1700  		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1701  		emit(A64_RET(A64_R(10)), ctx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1702  	}
2a5ab77af7f94d Xu Kuohai 2024-04-13  1703  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1704  	if (ctx->image)
2a5ab77af7f94d Xu Kuohai 2024-04-13  1705  		bpf_flush_icache(ctx->image, ctx->image + ctx->idx);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1706  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1707  	kfree(branches);
2a5ab77af7f94d Xu Kuohai 2024-04-13  1708  
2a5ab77af7f94d Xu Kuohai 2024-04-13  1709  	return ctx->idx;
2a5ab77af7f94d Xu Kuohai 2024-04-13  1710  }
2a5ab77af7f94d Xu Kuohai 2024-04-13  1711  

:::::: The code at line 1647 was first introduced by commit
:::::: 2a5ab77af7f94dc99ac894566927f4f934ed675b bpf, arm64: Add bpf trampoline for arm64

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Pu Lehui <pulehui@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
