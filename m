Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE9137C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 01:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8qujbu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702949698; x=1734485698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QijOo+n3bWnIrnSMG3d2BMKzzJobhGykW2LBrYUMiC4=;
  b=i8qujbu8rdjZPAV5t693ZxJnau78qy9+JGPtYgaXVPsh8jAsi6pRqDTi
   fVj+D/FmeuOo6Ag710pM5vTg3XV0bl3j+5I2HytXlEkSauCk0C9hyAljZ
   Gv2jGmaoqfUY+mrnDUZk/93/Mx+zuHnldHMJZR8ZDjV0PC4WrNks3xe2T
   gZ0UKxIinZ0F7b9rRBWWUcyR0y2vggQrG8404oaX3DTduRoQFaiLnua+I
   83tdGUBvcAHL/+9vbH7QBB3X7WcOFjY35g4y11uiFewmc5Jkoh9wkCQBt
   8X7iVOs9CtufcqVzwPD7o/Z7CP+BaXq+hAKzhotI7fPe2fEf3i202ts2S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="17149663"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="17149663"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 17:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107169217"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="1107169217"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2023 17:34:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFP0X-0004iv-2A;
	Tue, 19 Dec 2023 01:34:53 +0000
Date: Tue, 19 Dec 2023 09:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 44/49]
 arch/powerpc/kernel/interrupt.c:275:9: error: implicit declaration of
 function 'rseq_syscall'; did you mean 'si_syscall'?
Message-ID: <202312190953.8hOg47jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 1b622ac62853a6a2053ea97898b55014e0c25ea0 [44/49] rseq: Split out rseq.h from sched.h
config: powerpc-randconfig-001-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190953.8hOg47jm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190953.8hOg47jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190953.8hOg47jm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:17,
                    from include/linux/context_tracking.h:5,
                    from arch/powerpc/kernel/interrupt.c:3:
   include/linux/shm.h: In function 'do_shmat':
   include/linux/shm.h:31:17: error: 'ENOSYS' undeclared (first use in this function)
      31 |         return -ENOSYS;
         |                 ^~~~~~
   include/linux/shm.h:31:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/kernel/interrupt.c: In function 'syscall_exit_prepare':
>> arch/powerpc/kernel/interrupt.c:275:9: error: implicit declaration of function 'rseq_syscall'; did you mean 'si_syscall'? [-Werror=implicit-function-declaration]
     275 |         rseq_syscall(regs);
         |         ^~~~~~~~~~~~
         |         si_syscall
   cc1: some warnings being treated as errors


vim +275 arch/powerpc/kernel/interrupt.c

6cc0c16d82f889f arch/powerpc/kernel/syscall_64.c Nicholas Piggin  2020-02-26  250  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  251  /*
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  252   * This should be called after a syscall returns, with r3 the return value
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  253   * from the syscall. If this function returns non-zero, the system call
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  254   * exit assembly should additionally load all GPR registers and CTR and XER
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  255   * from the interrupt frame.
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  256   *
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  257   * The function graph tracer can not trace the return side of this function,
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  258   * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  259   */
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  260  notrace unsigned long syscall_exit_prepare(unsigned long r3,
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  261  					   struct pt_regs *regs,
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  262  					   long scv)
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  263  {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  264  	unsigned long ti_flags;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  265  	unsigned long ret = 0;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  266  	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  267  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  268  	CT_WARN_ON(ct_state() == CONTEXT_USER);
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  269  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  270  	kuap_assert_locked();
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  271  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  272  	regs->result = r3;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  273  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  274  	/* Check whether the syscall is issued inside a restartable sequence */
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18 @275  	rseq_syscall(regs);
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  276  
985faa78687de6e arch/powerpc/kernel/interrupt.c  Mark Rutland     2021-11-29  277  	ti_flags = read_thread_flags();
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  278  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  279  	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  280  		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  281  			r3 = -r3;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  282  			regs->ccr |= 0x10000000; /* Set SO bit in CR */
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  283  		}
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  284  	}
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  285  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  286  	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  287  		if (ti_flags & _TIF_RESTOREALL)
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  288  			ret = _TIF_RESTOREALL;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  289  		else
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  290  			regs->gpr[3] = r3;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  291  		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  292  	} else {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  293  		regs->gpr[3] = r3;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  294  	}
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  295  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  296  	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  297  		do_syscall_trace_leave(regs);
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  298  		ret |= _TIF_RESTOREALL;
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  299  	}
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  300  
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  301  	local_irq_disable();
f84aa284947f325 arch/powerpc/kernel/interrupt.c  Christophe Leroy 2021-06-18  302  	ret = interrupt_exit_user_prepare_main(ret, regs);
13799748b957bc5 arch/powerpc/kernel/interrupt.c  Nicholas Piggin  2021-06-18  303  

:::::: The code at line 275 was first introduced by commit
:::::: 13799748b957bc5659f97c036224b0f4b42172e2 powerpc/64: use interrupt restart table to speed up return from interrupt

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
