Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D622D52C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689671662; x=1721207662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmo0ENbDlNfLYIM4sxtXPzPqEyCujDq1EqGIU0bgo2I=;
  b=VrbgQUH3nkKlLEEg9GyoLm7x/zKQxrZubYhOLwzqH6bCIPrpgv6Z01Tz
   qU9tBAQqLL+yK5lkcsl4iGF0J+DPPZK+4xNHw3TBMI7+D8YRBbBeHhsjE
   VwBscHzzdKmKPtJaLlTxXTeHeghezP+j5C3sdaP+dfo9Hc7iQGImpeBiF
   fDK1LRHhzgDklf165J3o4KxrXdL09s/Vmzpm/YbOeCJ1JKW2aloAUl8wD
   xn/IPsJlXydRx9BwlYWv//1cFZYIwAyTenFt3SHdL3eBfL5sA7aOtj5+a
   0LKqp4NBVXhDDIcB4lmOlf0L/oX8/oETBa40cnV2vNibAi72HS+VVS8rj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363621566"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="363621566"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 02:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837214607"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="837214607"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2023 02:14:19 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLgmG-0000QL-2D;
	Tue, 18 Jul 2023 09:14:05 +0000
Date: Tue, 18 Jul 2023 17:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Hu <huqi@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 3/9]
 arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype
 for 'output_thread_lbt_defines'
Message-ID: <202307181721.OrQq4iI6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   c2296cc3968f8a84161cb0b72f64e53c377f3acc
commit: 61ad9ba4af0b84e5f3f4c8528353454f34cc5883 [3/9] LoongArch: Add Loongson Binary Translation (LBT) extension support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307181721.OrQq4iI6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181721.OrQq4iI6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181721.OrQq4iI6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:270:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     270 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:282:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     282 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/loongarch/kernel/asm-offsets.c:17:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      17 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:64:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      64 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:79:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      79 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:95:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      95 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:131:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     131 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:172:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     172 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:182:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     182 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:214:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     214 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:222:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     222 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:260:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     260 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:270:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
     270 | void output_pbe_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:282:6: warning: no previous prototype for 'output_fgraph_ret_regs_defines' [-Wmissing-prototypes]
     282 | void output_fgraph_ret_regs_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/output_thread_lbt_defines +172 arch/loongarch/kernel/asm-offsets.c

    78	
  > 79	void output_thread_info_defines(void)
    80	{
    81		COMMENT("LoongArch thread_info offsets.");
    82		OFFSET(TI_TASK, thread_info, task);
    83		OFFSET(TI_FLAGS, thread_info, flags);
    84		OFFSET(TI_TP_VALUE, thread_info, tp_value);
    85		OFFSET(TI_CPU, thread_info, cpu);
    86		OFFSET(TI_PRE_COUNT, thread_info, preempt_count);
    87		OFFSET(TI_REGS, thread_info, regs);
    88		DEFINE(_THREAD_SIZE, THREAD_SIZE);
    89		DEFINE(_THREAD_MASK, THREAD_MASK);
    90		DEFINE(_IRQ_STACK_SIZE, IRQ_STACK_SIZE);
    91		DEFINE(_IRQ_STACK_START, IRQ_STACK_START);
    92		BLANK();
    93	}
    94	
    95	void output_thread_defines(void)
    96	{
    97		COMMENT("LoongArch specific thread_struct offsets.");
    98		OFFSET(THREAD_REG01, task_struct, thread.reg01);
    99		OFFSET(THREAD_REG03, task_struct, thread.reg03);
   100		OFFSET(THREAD_REG22, task_struct, thread.reg22);
   101		OFFSET(THREAD_REG23, task_struct, thread.reg23);
   102		OFFSET(THREAD_REG24, task_struct, thread.reg24);
   103		OFFSET(THREAD_REG25, task_struct, thread.reg25);
   104		OFFSET(THREAD_REG26, task_struct, thread.reg26);
   105		OFFSET(THREAD_REG27, task_struct, thread.reg27);
   106		OFFSET(THREAD_REG28, task_struct, thread.reg28);
   107		OFFSET(THREAD_REG29, task_struct, thread.reg29);
   108		OFFSET(THREAD_REG30, task_struct, thread.reg30);
   109		OFFSET(THREAD_REG31, task_struct, thread.reg31);
   110		OFFSET(THREAD_SCHED_RA, task_struct, thread.sched_ra);
   111		OFFSET(THREAD_SCHED_CFA, task_struct, thread.sched_cfa);
   112		OFFSET(THREAD_CSRCRMD, task_struct,
   113		       thread.csr_crmd);
   114		OFFSET(THREAD_CSRPRMD, task_struct,
   115		       thread.csr_prmd);
   116		OFFSET(THREAD_CSREUEN, task_struct,
   117		       thread.csr_euen);
   118		OFFSET(THREAD_CSRECFG, task_struct,
   119		       thread.csr_ecfg);
   120	
   121		OFFSET(THREAD_FPU, task_struct, thread.fpu);
   122	
   123		OFFSET(THREAD_BVADDR, task_struct, \
   124		       thread.csr_badvaddr);
   125		OFFSET(THREAD_ECODE, task_struct, \
   126		       thread.error_code);
   127		OFFSET(THREAD_TRAPNO, task_struct, thread.trap_nr);
   128		BLANK();
   129	}
   130	
   131	void output_thread_fpu_defines(void)
   132	{
   133		OFFSET(THREAD_FPR0, loongarch_fpu, fpr[0]);
   134		OFFSET(THREAD_FPR1, loongarch_fpu, fpr[1]);
   135		OFFSET(THREAD_FPR2, loongarch_fpu, fpr[2]);
   136		OFFSET(THREAD_FPR3, loongarch_fpu, fpr[3]);
   137		OFFSET(THREAD_FPR4, loongarch_fpu, fpr[4]);
   138		OFFSET(THREAD_FPR5, loongarch_fpu, fpr[5]);
   139		OFFSET(THREAD_FPR6, loongarch_fpu, fpr[6]);
   140		OFFSET(THREAD_FPR7, loongarch_fpu, fpr[7]);
   141		OFFSET(THREAD_FPR8, loongarch_fpu, fpr[8]);
   142		OFFSET(THREAD_FPR9, loongarch_fpu, fpr[9]);
   143		OFFSET(THREAD_FPR10, loongarch_fpu, fpr[10]);
   144		OFFSET(THREAD_FPR11, loongarch_fpu, fpr[11]);
   145		OFFSET(THREAD_FPR12, loongarch_fpu, fpr[12]);
   146		OFFSET(THREAD_FPR13, loongarch_fpu, fpr[13]);
   147		OFFSET(THREAD_FPR14, loongarch_fpu, fpr[14]);
   148		OFFSET(THREAD_FPR15, loongarch_fpu, fpr[15]);
   149		OFFSET(THREAD_FPR16, loongarch_fpu, fpr[16]);
   150		OFFSET(THREAD_FPR17, loongarch_fpu, fpr[17]);
   151		OFFSET(THREAD_FPR18, loongarch_fpu, fpr[18]);
   152		OFFSET(THREAD_FPR19, loongarch_fpu, fpr[19]);
   153		OFFSET(THREAD_FPR20, loongarch_fpu, fpr[20]);
   154		OFFSET(THREAD_FPR21, loongarch_fpu, fpr[21]);
   155		OFFSET(THREAD_FPR22, loongarch_fpu, fpr[22]);
   156		OFFSET(THREAD_FPR23, loongarch_fpu, fpr[23]);
   157		OFFSET(THREAD_FPR24, loongarch_fpu, fpr[24]);
   158		OFFSET(THREAD_FPR25, loongarch_fpu, fpr[25]);
   159		OFFSET(THREAD_FPR26, loongarch_fpu, fpr[26]);
   160		OFFSET(THREAD_FPR27, loongarch_fpu, fpr[27]);
   161		OFFSET(THREAD_FPR28, loongarch_fpu, fpr[28]);
   162		OFFSET(THREAD_FPR29, loongarch_fpu, fpr[29]);
   163		OFFSET(THREAD_FPR30, loongarch_fpu, fpr[30]);
   164		OFFSET(THREAD_FPR31, loongarch_fpu, fpr[31]);
   165	
   166		OFFSET(THREAD_FCSR, loongarch_fpu, fcsr);
   167		OFFSET(THREAD_FCC,  loongarch_fpu, fcc);
   168		OFFSET(THREAD_FTOP, loongarch_fpu, ftop);
   169		BLANK();
   170	}
   171	
 > 172	void output_thread_lbt_defines(void)
   173	{
   174		OFFSET(THREAD_SCR0,  loongarch_lbt, scr0);
   175		OFFSET(THREAD_SCR1,  loongarch_lbt, scr1);
   176		OFFSET(THREAD_SCR2,  loongarch_lbt, scr2);
   177		OFFSET(THREAD_SCR3,  loongarch_lbt, scr3);
   178		OFFSET(THREAD_EFLAGS, loongarch_lbt, eflags);
   179		BLANK();
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
