Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D8636
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693385652; x=1724921652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=giswzioyuDgRplMy66pWmEh46A4AP01OAwmoRZ5WRAs=;
  b=Hvtgk8mXUA6k2nYZ6l2BvSgSYrzybf/LcAzmzOH9UKc2yFyI1QdYQM1h
   IcB2j9Niw2s5vufRAXjo2di44EgYeK4Tu7QoxSPAo6ZPx048ivLWYYvCM
   HWKkkg6wFSalvabT1i3XgZt/sjjQUZUxYm5OGAWx394QvAWhir6DGclsO
   o4J8NOrvrqvGNVowHpbdhvKraeVtLE8u6kARl36cVorG29cs78+ZXc+3V
   jVdu9eSRsy6RO1g8QYkieq529I5r/b+CqKwBvhgwWcFpOeNuPg6IsTJgj
   SpXvCgkH42IBtbRr63FWooAs0hKrYLi6J0VTQMXKkw5XhzYXAPXIrNU5a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378304869"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="378304869"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 01:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688810840"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="688810840"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 01:54:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbGxk-0009dv-09;
	Wed, 30 Aug 2023 08:54:08 +0000
Date: Wed, 30 Aug 2023 16:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Hui Li <lihui@loongson.cn>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [linux-next:master 13043/13390]
 arch/loongarch/kernel/traps.c:707:21: error: implicit declaration of
 function 'kgdb_breakpoint_handler'; did you mean
 'kprobe_breakpoint_handler'?
Message-ID: <202308301605.1sXs81Sf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   56585460cc2ec44fc5d66924f0a116f57080f0dc
commit: 2888e8718e96bc7c4261da90b5967ae0c4dcb320 [13043/13390] LoongArch: Add basic KGDB & KDB support
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230830/202308301605.1sXs81Sf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301605.1sXs81Sf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301605.1sXs81Sf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/traps.c:373:6: warning: no previous prototype for 'show_registers' [-Wmissing-prototypes]
     373 | void show_registers(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~
   arch/loongarch/kernel/traps.c:441:6: warning: no previous prototype for 'force_fcsr_sig' [-Wmissing-prototypes]
     441 | void force_fcsr_sig(unsigned long fcsr, void __user *fault_addr,
         |      ^~~~~~~~~~~~~~
   arch/loongarch/kernel/traps.c:460:5: warning: no previous prototype for 'process_fpemu_return' [-Wmissing-prototypes]
     460 | int process_fpemu_return(int sig, void __user *fault_addr, unsigned long fcsr)
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/traps.c:495:25: warning: no previous prototype for 'do_fpe' [-Wmissing-prototypes]
     495 | asmlinkage void noinstr do_fpe(struct pt_regs *regs, unsigned long fcsr)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:522:25: warning: no previous prototype for 'do_ade' [-Wmissing-prototypes]
     522 | asmlinkage void noinstr do_ade(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:536:25: warning: no previous prototype for 'do_ale' [-Wmissing-prototypes]
     536 | asmlinkage void noinstr do_ale(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:597:25: warning: no previous prototype for 'do_bce' [-Wmissing-prototypes]
     597 | asmlinkage void noinstr do_bce(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:686:25: warning: no previous prototype for 'do_bp' [-Wmissing-prototypes]
     686 | asmlinkage void noinstr do_bp(struct pt_regs *regs)
         |                         ^~~~~
   arch/loongarch/kernel/traps.c: In function 'do_bp':
>> arch/loongarch/kernel/traps.c:707:21: error: implicit declaration of function 'kgdb_breakpoint_handler'; did you mean 'kprobe_breakpoint_handler'? [-Werror=implicit-function-declaration]
     707 |                 if (kgdb_breakpoint_handler(regs))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
         |                     kprobe_breakpoint_handler
   arch/loongarch/kernel/traps.c: At top level:
   arch/loongarch/kernel/traps.c:770:25: warning: no previous prototype for 'do_watch' [-Wmissing-prototypes]
     770 | asmlinkage void noinstr do_watch(struct pt_regs *regs)
         |                         ^~~~~~~~
   arch/loongarch/kernel/traps.c:823:25: warning: no previous prototype for 'do_ri' [-Wmissing-prototypes]
     823 | asmlinkage void noinstr do_ri(struct pt_regs *regs)
         |                         ^~~~~
   arch/loongarch/kernel/traps.c: In function 'do_ri':
   arch/loongarch/kernel/traps.c:826:22: warning: variable 'opcode' set but not used [-Wunused-but-set-variable]
     826 |         unsigned int opcode = 0;
         |                      ^~~~~~
   arch/loongarch/kernel/traps.c: At top level:
   arch/loongarch/kernel/traps.c:918:25: warning: no previous prototype for 'do_fpu' [-Wmissing-prototypes]
     918 | asmlinkage void noinstr do_fpu(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:935:25: warning: no previous prototype for 'do_lsx' [-Wmissing-prototypes]
     935 | asmlinkage void noinstr do_lsx(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:957:25: warning: no previous prototype for 'do_lasx' [-Wmissing-prototypes]
     957 | asmlinkage void noinstr do_lasx(struct pt_regs *regs)
         |                         ^~~~~~~
   arch/loongarch/kernel/traps.c:992:25: warning: no previous prototype for 'do_lbt' [-Wmissing-prototypes]
     992 | asmlinkage void noinstr do_lbt(struct pt_regs *regs)
         |                         ^~~~~~
   arch/loongarch/kernel/traps.c:1023:25: warning: no previous prototype for 'do_reserved' [-Wmissing-prototypes]
    1023 | asmlinkage void noinstr do_reserved(struct pt_regs *regs)
         |                         ^~~~~~~~~~~
   arch/loongarch/kernel/traps.c:1042:17: warning: no previous prototype for 'cache_parity_error' [-Wmissing-prototypes]
    1042 | asmlinkage void cache_parity_error(void)
         |                 ^~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/traps.c:1051:25: warning: no previous prototype for 'handle_loongarch_irq' [-Wmissing-prototypes]
    1051 | asmlinkage void noinstr handle_loongarch_irq(struct pt_regs *regs)
         |                         ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/traps.c:1062:25: warning: no previous prototype for 'do_vint' [-Wmissing-prototypes]
    1062 | asmlinkage void noinstr do_vint(struct pt_regs *regs, unsigned long sp)
         |                         ^~~~~~~
   cc1: some warnings being treated as errors


vim +707 arch/loongarch/kernel/traps.c

   685	
   686	asmlinkage void noinstr do_bp(struct pt_regs *regs)
   687	{
   688		bool user = user_mode(regs);
   689		unsigned int opcode, bcode;
   690		unsigned long era = exception_era(regs);
   691		irqentry_state_t state = irqentry_enter(regs);
   692	
   693		if (regs->csr_prmd & CSR_PRMD_PIE)
   694			local_irq_enable();
   695	
   696		if (__get_inst(&opcode, (u32 *)era, user))
   697			goto out_sigsegv;
   698	
   699		bcode = (opcode & 0x7fff);
   700	
   701		/*
   702		 * notify the kprobe handlers, if instruction is likely to
   703		 * pertain to them.
   704		 */
   705		switch (bcode) {
   706		case BRK_KDB:
 > 707			if (kgdb_breakpoint_handler(regs))
   708				goto out;
   709			else
   710				break;
   711		case BRK_KPROBE_BP:
   712			if (kprobe_breakpoint_handler(regs))
   713				goto out;
   714			else
   715				break;
   716		case BRK_KPROBE_SSTEPBP:
   717			if (kprobe_singlestep_handler(regs))
   718				goto out;
   719			else
   720				break;
   721		case BRK_UPROBE_BP:
   722			if (uprobe_breakpoint_handler(regs))
   723				goto out;
   724			else
   725				break;
   726		case BRK_UPROBE_XOLBP:
   727			if (uprobe_singlestep_handler(regs))
   728				goto out;
   729			else
   730				break;
   731		default:
   732			current->thread.trap_nr = read_csr_excode();
   733			if (notify_die(DIE_TRAP, "Break", regs, bcode,
   734				       current->thread.trap_nr, SIGTRAP) == NOTIFY_STOP)
   735				goto out;
   736			else
   737				break;
   738		}
   739	
   740		switch (bcode) {
   741		case BRK_BUG:
   742			bug_handler(regs);
   743			break;
   744		case BRK_DIVZERO:
   745			die_if_kernel("Break instruction in kernel code", regs);
   746			force_sig_fault(SIGFPE, FPE_INTDIV, (void __user *)regs->csr_era);
   747			break;
   748		case BRK_OVERFLOW:
   749			die_if_kernel("Break instruction in kernel code", regs);
   750			force_sig_fault(SIGFPE, FPE_INTOVF, (void __user *)regs->csr_era);
   751			break;
   752		default:
   753			die_if_kernel("Break instruction in kernel code", regs);
   754			force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->csr_era);
   755			break;
   756		}
   757	
   758	out:
   759		if (regs->csr_prmd & CSR_PRMD_PIE)
   760			local_irq_disable();
   761	
   762		irqentry_exit(regs, state);
   763		return;
   764	
   765	out_sigsegv:
   766		force_sig(SIGSEGV);
   767		goto out;
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
