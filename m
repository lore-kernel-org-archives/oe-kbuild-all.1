Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05191A585
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmJeoNJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699023699; x=1730559699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7n3Gc3/UVTgs6tSUNsSNAprogErgzmx1iOLpeRwvbyU=;
  b=CmJeoNJLK/Rvd1n4//zVeqq9kKrd9gp8sL0Iz0XZS2IgMLEUpa2iXPBb
   aKX/08PamE60WwxirO3nJsmIMXtcu6sAnqopvigwTS9DQ/MYs5CPDjDix
   LW2ZXyOqZnbBJV3VBALDosvDovwpB4nYOn5zig9rgvpxg/C/KW3WeTc9v
   MTZpfxQbQEe08WLXMymDkVMye7FhwVL1+fwxGXZJXJ0pkSq+sT8S1ZDvR
   KVxwp6N1b3bCEbJSk5dCxW5xhCKMCfyKconPcHTi2dh+bMt6ZjgiHlVRz
   ViPrVIoHb3mfVak2qoHzBynuPfC94flsssx3KD6oHiCeVonI1ivjCgz5U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420072154"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="420072154"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 08:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738098325"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738098325"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 08:01:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyvfp-0002bo-1z;
	Fri, 03 Nov 2023 15:01:25 +0000
Date: Fri, 3 Nov 2023 23:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>
Subject: arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous
 prototype for 'output_kvm_defines'
Message-ID: <202311032304.GygSbRbE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 39fdf4be72f2b81238acbd4da48c75c135a6f1e0 LoongArch: KVM: Implement vcpu world switch
date:   5 weeks ago
config: loongarch-randconfig-r023-20230808 (https://download.01.org/0day-ci/archive/20231103/202311032304.GygSbRbE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032304.GygSbRbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032304.GygSbRbE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
--
   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/output_kvm_defines +294 arch/loongarch/kernel/asm-offsets.c

   214	
 > 215	void output_sc_defines(void)
   216	{
   217		COMMENT("Linux sigcontext offsets.");
   218		OFFSET(SC_REGS, sigcontext, sc_regs);
   219		OFFSET(SC_PC, sigcontext, sc_pc);
   220		BLANK();
   221	}
   222	
   223	void output_signal_defines(void)
   224	{
   225		COMMENT("Linux signal numbers.");
   226		DEFINE(_SIGHUP, SIGHUP);
   227		DEFINE(_SIGINT, SIGINT);
   228		DEFINE(_SIGQUIT, SIGQUIT);
   229		DEFINE(_SIGILL, SIGILL);
   230		DEFINE(_SIGTRAP, SIGTRAP);
   231		DEFINE(_SIGIOT, SIGIOT);
   232		DEFINE(_SIGABRT, SIGABRT);
   233		DEFINE(_SIGFPE, SIGFPE);
   234		DEFINE(_SIGKILL, SIGKILL);
   235		DEFINE(_SIGBUS, SIGBUS);
   236		DEFINE(_SIGSEGV, SIGSEGV);
   237		DEFINE(_SIGSYS, SIGSYS);
   238		DEFINE(_SIGPIPE, SIGPIPE);
   239		DEFINE(_SIGALRM, SIGALRM);
   240		DEFINE(_SIGTERM, SIGTERM);
   241		DEFINE(_SIGUSR1, SIGUSR1);
   242		DEFINE(_SIGUSR2, SIGUSR2);
   243		DEFINE(_SIGCHLD, SIGCHLD);
   244		DEFINE(_SIGPWR, SIGPWR);
   245		DEFINE(_SIGWINCH, SIGWINCH);
   246		DEFINE(_SIGURG, SIGURG);
   247		DEFINE(_SIGIO, SIGIO);
   248		DEFINE(_SIGSTOP, SIGSTOP);
   249		DEFINE(_SIGTSTP, SIGTSTP);
   250		DEFINE(_SIGCONT, SIGCONT);
   251		DEFINE(_SIGTTIN, SIGTTIN);
   252		DEFINE(_SIGTTOU, SIGTTOU);
   253		DEFINE(_SIGVTALRM, SIGVTALRM);
   254		DEFINE(_SIGPROF, SIGPROF);
   255		DEFINE(_SIGXCPU, SIGXCPU);
   256		DEFINE(_SIGXFSZ, SIGXFSZ);
   257		BLANK();
   258	}
   259	
   260	#ifdef CONFIG_SMP
   261	void output_smpboot_defines(void)
   262	{
   263		COMMENT("Linux smp cpu boot offsets.");
   264		OFFSET(CPU_BOOT_STACK, secondary_data, stack);
   265		OFFSET(CPU_BOOT_TINFO, secondary_data, thread_info);
   266		BLANK();
   267	}
   268	#endif
   269	
   270	#ifdef CONFIG_HIBERNATION
   271	void output_pbe_defines(void)
   272	{
   273		COMMENT("Linux struct pbe offsets.");
   274		OFFSET(PBE_ADDRESS, pbe, address);
   275		OFFSET(PBE_ORIG_ADDRESS, pbe, orig_address);
   276		OFFSET(PBE_NEXT, pbe, next);
   277		DEFINE(PBE_SIZE, sizeof(struct pbe));
   278		BLANK();
   279	}
   280	#endif
   281	
   282	#ifdef CONFIG_FUNCTION_GRAPH_TRACER
   283	void output_fgraph_ret_regs_defines(void)
   284	{
   285		COMMENT("LoongArch fgraph_ret_regs offsets.");
   286		OFFSET(FGRET_REGS_A0, fgraph_ret_regs, regs[0]);
   287		OFFSET(FGRET_REGS_A1, fgraph_ret_regs, regs[1]);
   288		OFFSET(FGRET_REGS_FP, fgraph_ret_regs, fp);
   289		DEFINE(FGRET_REGS_SIZE, sizeof(struct fgraph_ret_regs));
   290		BLANK();
   291	}
   292	#endif
   293	
 > 294	void output_kvm_defines(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
