Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95E395
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692248659; x=1723784659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpQBiNxATTfmlBk675SdGXW59eNURu+ZA3ur+AqlHTY=;
  b=Un0MGN/gAibcaAFoRYbVNObVDcQm8Pn8gSOvWn3Bv1pQyyeESicr1Fzi
   R9zgX9+XtX0NfY0FIDMCPPd2kF46VlFMFZCG+XOkJv50TDctgfy0fZZlC
   3CvouZwF2IMR2LqdgNpleLvrcTZbT09d7cr8S6R+LSTBtFLzzpazP6yDf
   IaXakWBP2C7jm9myrp4xoEWAWCROSJQu9ByqQcQlNciGNyPnhYbBfcKoz
   IejXgVv/8OFJE2s+v0cYY2zwnWRiobXpaY6KPo/kSP7y5N9Kml39u1Iv+
   3drZpJnWLW+DrJvFu9HMaToJEnuIwmTF3RfbpvEnLlpGrCxKmssbqDfrJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375478312"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="375478312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 22:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848747888"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848747888"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 22:04:17 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWVBA-0000ny-3B;
	Thu, 17 Aug 2023 05:04:16 +0000
Date: Thu, 17 Aug 2023 13:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:fixes 19/22] arch/riscv/kernel/traps.c:384:1: error: s0
 cannot be used in 'asm' here
Message-ID: <202308171302.u4AGBLsg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git fixes
head:   ca09f772cccaeec4cd05a21528c37a260aa2dd2c
commit: 8d0be64154cf24660a947b84340e8d5bb1af855a [19/22] riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
config: riscv-randconfig-r072-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171302.u4AGBLsg-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171302.u4AGBLsg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171302.u4AGBLsg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps.c: In function 'do_irq':
>> arch/riscv/kernel/traps.c:384:1: error: s0 cannot be used in 'asm' here
     384 | }
         | ^
>> arch/riscv/kernel/traps.c:384:1: error: s0 cannot be used in 'asm' here


vim +/asm +384 arch/riscv/kernel/traps.c

163e76cc6ef43b Guo Ren        2023-06-13  349  
163e76cc6ef43b Guo Ren        2023-06-13  350  asmlinkage void noinstr do_irq(struct pt_regs *regs)
163e76cc6ef43b Guo Ren        2023-06-13  351  {
163e76cc6ef43b Guo Ren        2023-06-13  352  	irqentry_state_t state = irqentry_enter(regs);
163e76cc6ef43b Guo Ren        2023-06-13  353  #ifdef CONFIG_IRQ_STACKS
163e76cc6ef43b Guo Ren        2023-06-13  354  	if (on_thread_stack()) {
163e76cc6ef43b Guo Ren        2023-06-13  355  		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
163e76cc6ef43b Guo Ren        2023-06-13  356  					+ IRQ_STACK_SIZE/sizeof(ulong);
163e76cc6ef43b Guo Ren        2023-06-13  357  		__asm__ __volatile(
163e76cc6ef43b Guo Ren        2023-06-13  358  		"addi	sp, sp, -"RISCV_SZPTR  "\n"
163e76cc6ef43b Guo Ren        2023-06-13  359  		REG_S"  ra, (sp)		\n"
163e76cc6ef43b Guo Ren        2023-06-13  360  		"addi	sp, sp, -"RISCV_SZPTR  "\n"
163e76cc6ef43b Guo Ren        2023-06-13  361  		REG_S"  s0, (sp)		\n"
163e76cc6ef43b Guo Ren        2023-06-13  362  		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
163e76cc6ef43b Guo Ren        2023-06-13  363  		"move	sp, %[sp]		\n"
163e76cc6ef43b Guo Ren        2023-06-13  364  		"move	a0, %[regs]		\n"
163e76cc6ef43b Guo Ren        2023-06-13  365  		"call	handle_riscv_irq	\n"
163e76cc6ef43b Guo Ren        2023-06-13  366  		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
163e76cc6ef43b Guo Ren        2023-06-13  367  		REG_L"  s0, (sp)		\n"
163e76cc6ef43b Guo Ren        2023-06-13  368  		"addi	sp, sp, "RISCV_SZPTR   "\n"
163e76cc6ef43b Guo Ren        2023-06-13  369  		REG_L"  ra, (sp)		\n"
163e76cc6ef43b Guo Ren        2023-06-13  370  		"addi	sp, sp, "RISCV_SZPTR   "\n"
163e76cc6ef43b Guo Ren        2023-06-13  371  		:
163e76cc6ef43b Guo Ren        2023-06-13  372  		: [sp] "r" (sp), [regs] "r" (regs)
163e76cc6ef43b Guo Ren        2023-06-13  373  		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
163e76cc6ef43b Guo Ren        2023-06-13  374  		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
8d0be64154cf24 Guo Ren        2023-07-15  375  #ifndef CONFIG_FRAME_POINTER
8d0be64154cf24 Guo Ren        2023-07-15  376  		  "s0",
8d0be64154cf24 Guo Ren        2023-07-15  377  #endif
163e76cc6ef43b Guo Ren        2023-06-13  378  		  "memory");
163e76cc6ef43b Guo Ren        2023-06-13  379  	} else
163e76cc6ef43b Guo Ren        2023-06-13  380  #endif
163e76cc6ef43b Guo Ren        2023-06-13  381  		handle_riscv_irq(regs);
f0bddf50586da8 Guo Ren        2023-02-21  382  
f0bddf50586da8 Guo Ren        2023-02-21  383  	irqentry_exit(regs, state);
f0bddf50586da8 Guo Ren        2023-02-21 @384  }
76d2a0493a17d4 Palmer Dabbelt 2017-07-10  385  

:::::: The code at line 384 was first introduced by commit
:::::: f0bddf50586da81360627a772be0e355b62f071e riscv: entry: Convert to generic entry

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
