Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8964E22DFBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 03:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740539700; cv=none; b=FihEZxRzX8xWElUDKRmGr6lP6SpSQFJfBOzsBv7nJpO9ELKslG8SvEkxJ6neINY/ymYNcV3WedjOsRcDuYcS+J88ETomysc8WEgDXeNWCvyZAQEgEfj9ZP6Q6E7vL7WfwTecqsYTryJmNUC33q3GUrhuEbJqMzChE8IyI5/rJ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740539700; c=relaxed/simple;
	bh=W6XD2/MQZj2eOwyfRfUaZAX9Y5USvTF+h2+B2TL0ACg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oyxDUxtwL+mIzSvp+ml9m9rRaZch+OMOIeVPW13tL8PAcGGqqKpVRVxmwHOeVOlGXFcJzUC1jHrN440C/5736acm3H3QKxovhHl9CwfJsHyADtO4p4oCuv1BTCdwqNiQemxuxjALRXhzm108XMoAqI9XIwNRKuZRs/IxVqbU8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fiMxDIK4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fiMxDIK4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740539698; x=1772075698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6XD2/MQZj2eOwyfRfUaZAX9Y5USvTF+h2+B2TL0ACg=;
  b=fiMxDIK4WtVm2YFLpYeiYkQZWET1NMdZby1LjE8IBYhqVFkpdaHNm0Pu
   tUe+2FLtzWaki1LxwV7984KiKcijA7ST+bqb/+nZgXqQEVxcvllD9qciA
   SBaKteFxzHUStCsHjtLBJtlU6q3iJe95ZNCUvVu6UL40eEKRlfH2wXhlG
   TiFDYZGca4v/W0bko4DozS5aIylQvKwPxtcyfSJYZ4IF1xz3shEhKQaBS
   OoUTSfeaUwzep4oPssJKEBC4oyJ0v5ANcvFmdWrWePL5zelyteYQ34K6/
   s/kl9/u8j/1RRP3LD8wO9YwYl6ghCzcES7lqDwKsvQt+lrXyCQVronqbK
   w==;
X-CSE-ConnectionGUID: DCZedVobSpa2s/bpMa6fsw==
X-CSE-MsgGUID: ccNP59OnRc+OOobuwrwJqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41505484"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41505484"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 19:14:57 -0800
X-CSE-ConnectionGUID: eGwp2gxVRXmGIRIsM0oS1w==
X-CSE-MsgGUID: hQ/Zktp5RIaOYIAYB6czNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121193736"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2025 19:14:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn7sA-000B4M-0f;
	Wed, 26 Feb 2025 03:14:10 +0000
Date: Wed, 26 Feb 2025 11:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2768/2768] arch/x86/kernel/fpu/core.c:452:15:
 warning: no previous prototype for function 'get_fpu_registers_pos'
Message-ID: <202502261100.jDFUgPr4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a3384275f6f1faae9ddfeb8d95a66345f1e58b94
commit: 0cd6fd52741f659d2a57501ca933ab33040cb911 [2768/2768] mm: Enhanced copy capabilities for Hygon processor
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250226/202502261100.jDFUgPr4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261100.jDFUgPr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261100.jDFUgPr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/fpu/core.c:14:
   In file included from arch/x86/include/asm/traps.h:6:
   In file included from include/linux/kprobes.h:29:
   In file included from include/linux/ftrace.h:11:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/fpu/core.c:444:14: warning: no previous prototype for function 'get_fpustate_free_space' [-Wmissing-prototypes]
     444 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         |              ^
   arch/x86/kernel/fpu/core.c:444:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     444 | unsigned int get_fpustate_free_space(struct fpu *fpu)
         | ^
         | static 
>> arch/x86/kernel/fpu/core.c:452:15: warning: no previous prototype for function 'get_fpu_registers_pos' [-Wmissing-prototypes]
     452 | unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
         |               ^
   arch/x86/kernel/fpu/core.c:452:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     452 | unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
         | ^
         | static 
>> arch/x86/kernel/fpu/core.c:533:6: warning: no previous prototype for function 'save_fpregs_to_fpkernelstate' [-Wmissing-prototypes]
     533 | void save_fpregs_to_fpkernelstate(struct fpu *kfpu)
         |      ^
   arch/x86/kernel/fpu/core.c:533:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     533 | void save_fpregs_to_fpkernelstate(struct fpu *kfpu)
         | ^
         | static 
   8 warnings generated.


vim +/get_fpu_registers_pos +452 arch/x86/kernel/fpu/core.c

   451	
 > 452	unsigned long get_fpu_registers_pos(struct fpu *fpu, unsigned int off)
   453	{
   454		unsigned long addr = 0;
   455	
   456		if (fpu && (fpu_kernel_nonatomic_xstate_size > off)) {
   457			addr = (unsigned long)&fpu->__fpstate.regs.__padding[0];
   458			addr += fpu_kernel_cfg.default_size + off;
   459		}
   460		return addr;
   461	}
   462	
   463	/*
   464	 * We can call kernel_fpu_begin_nonatomic in non-atomic task context.
   465	 */
   466	int kernel_fpu_begin_nonatomic_mask(unsigned int kfpu_mask)
   467	{
   468		preempt_disable();
   469		/* we not support Nested call */
   470		if (test_thread_flag(TIF_USING_FPU_NONATOMIC))
   471			goto err;
   472	
   473		if (KERNEL_FPU_NONATOMIC_SIZE >
   474		    get_fpustate_free_space(&current->thread.fpu))
   475			goto err;
   476	
   477		/*
   478		 * This means we call kernel_fpu_begin_nonatomic after kernel_fpu_begin,
   479		 * but before kernel_fpu_end.
   480		 */
   481		if (this_cpu_read(in_kernel_fpu))
   482			goto err;
   483	
   484		if (in_interrupt())
   485			goto err;
   486	
   487		if (current->flags & PF_KTHREAD)
   488			goto err;
   489	
   490		if (!test_thread_flag(TIF_NEED_FPU_LOAD)) {
   491			set_thread_flag(TIF_NEED_FPU_LOAD);
   492			save_fpregs_to_fpstate(&current->thread.fpu);
   493		}
   494		/* Set thread flag: TIC_USING_FPU_NONATOMIC */
   495		set_thread_flag(TIF_USING_FPU_NONATOMIC);
   496	
   497		__cpu_invalidate_fpregs_state();
   498	
   499		/* Put sane initial values into the control registers. */
   500		if (likely(kfpu_mask & KFPU_MXCSR) && boot_cpu_has(X86_FEATURE_XMM))
   501			ldmxcsr(MXCSR_DEFAULT);
   502	
   503		if (unlikely(kfpu_mask & KFPU_387) && boot_cpu_has(X86_FEATURE_FPU))
   504			asm volatile ("fninit");
   505	
   506		preempt_enable();
   507	
   508		return 0;
   509	
   510	err:
   511		preempt_enable();
   512	
   513		return -1;
   514	}
   515	EXPORT_SYMBOL_GPL(kernel_fpu_begin_nonatomic_mask);
   516	
   517	void kernel_fpu_end_nonatomic(void)
   518	{
   519		preempt_disable();
   520		/*
   521		 * This means we call kernel_fpu_end_nonatomic after kernel_fpu_begin,
   522		 * but before kernel_fpu_end.
   523		 */
   524		WARN_ON_FPU(this_cpu_read(in_kernel_fpu));
   525	
   526		WARN_ON_FPU(!test_thread_flag(TIF_USING_FPU_NONATOMIC));
   527	
   528		clear_thread_flag(TIF_USING_FPU_NONATOMIC);
   529		preempt_enable();
   530	}
   531	EXPORT_SYMBOL_GPL(kernel_fpu_end_nonatomic);
   532	
 > 533	void save_fpregs_to_fpkernelstate(struct fpu *kfpu)
   534	{
   535		kernel_fpu_states_save((void *)get_fpu_registers_pos(kfpu,
   536								     MAX_FPU_CTX_SIZE),
   537				       NULL, MAX_FPU_CTX_SIZE);
   538	}
   539	#endif
   540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
