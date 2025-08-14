Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A992FF646
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755131705; cv=none; b=i63V4P+0KVrxYgDmYGXP8UVNFoVOH5lU6cEgfRwpakgkw+z0SHWQ5hh8ZYW61D6nsnXhSqEldFZpKrZyNfCVpVBxfgOTBd4cim570McKeaFRSv8pLckR2Q233hrh4KgJGoY3wRB452yZmUPLp62/+Mk8CQhpUg7ED5998NPW/gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755131705; c=relaxed/simple;
	bh=vXOPQh/qz16JyRhlgzFhmCZ4viuNCeS2x0zC4j0T8KM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPbJtChve0NDKqtuQIt1ek5N+VNdChYCchIPXKUvAflXE7GoIBKtw99jLn5HlJVrxccs0MlgmDSrljVXzTAdYTJh18HCsr4TOv9P157D3oKMz9Z3+8yPSm6R6OzPygJGPeyoK+n3wbUOX195CNbmq8kiAjxRTr6VC8xY8+f1Jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9BmuUgZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9BmuUgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755131702; x=1786667702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXOPQh/qz16JyRhlgzFhmCZ4viuNCeS2x0zC4j0T8KM=;
  b=Q9BmuUgZ7we6w2e2SfUxKThyQPW3h/mDYm6K8fPCeDAFz4hnLkGjEx8s
   q2W2ypW/tbCo9zGzOASaU1b9HFWDw5KcvoqFVYRppwTlcwEhjjS4fkoog
   yOzTg9CdI0fE+3HDEvJcKV1FoNuDFEAo/g31gSTzFBo149HsGfjs88fhG
   oxYsz4nEMdhwavS17qXCAwNSarh3MJBJAL513Ybb+fZft9uJAXg4KzJRu
   AhJwJ3rAKwgx4XBy3ly5pfIUoJeq31vZTPD3I6/IvL3RBBkf2hyb0eITS
   aEZO0I63a0nHVz/k6T59JGr20VJrKYMX+eGehvJSfZ4TxdX0/eX1KYl8l
   Q==;
X-CSE-ConnectionGUID: uOIhbegIQJeYYlDNVXX6mQ==
X-CSE-MsgGUID: JLs4xmDCStyBz0fwsVIyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68521435"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68521435"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:35:00 -0700
X-CSE-ConnectionGUID: 3H1gJZYOTBqGxsGhen1l6w==
X-CSE-MsgGUID: iAjk/wDOTPSFE9t402AyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="203794120"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2025 17:34:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLvk-000ASE-0H;
	Thu, 14 Aug 2025 00:34:56 +0000
Date: Thu, 14 Aug 2025 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 11/19] arch/powerpc/kernel/interrupt.c:280:9:
 error: implicit declaration of function 'rseq_syscall'; did you mean
 'si_syscall'?
Message-ID: <202508140831.VeQ8Olrg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   c3f9d97d82881880460dacf48da60a280f4797cd
commit: 96865448a688c962fe6cbf23ff46c92a2f2b14d7 [11/19] rseq: Rename rseq_syscall() to rseq_debug_syscall_exit()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250814/202508140831.VeQ8Olrg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140831.VeQ8Olrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140831.VeQ8Olrg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/interrupt.c: In function 'syscall_exit_prepare':
>> arch/powerpc/kernel/interrupt.c:280:9: error: implicit declaration of function 'rseq_syscall'; did you mean 'si_syscall'? [-Wimplicit-function-declaration]
     280 |         rseq_syscall(regs);
         |         ^~~~~~~~~~~~
         |         si_syscall


vim +280 arch/powerpc/kernel/interrupt.c

6cc0c16d82f889 arch/powerpc/kernel/syscall_64.c Nicholas Piggin    2020-02-26  255  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  256  /*
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  257   * This should be called after a syscall returns, with r3 the return value
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  258   * from the syscall. If this function returns non-zero, the system call
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  259   * exit assembly should additionally load all GPR registers and CTR and XER
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  260   * from the interrupt frame.
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  261   *
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  262   * The function graph tracer can not trace the return side of this function,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  263   * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  264   */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  265  notrace unsigned long syscall_exit_prepare(unsigned long r3,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  266  					   struct pt_regs *regs,
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  267  					   long scv)
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  268  {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  269  	unsigned long ti_flags;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  270  	unsigned long ret = 0;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  271  	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  272  
d65d411c9259a2 arch/powerpc/kernel/interrupt.c  Valentin Schneider 2023-07-25  273  	CT_WARN_ON(ct_state() == CT_STATE_USER);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  274  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  275  	kuap_assert_locked();
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  276  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  277  	regs->result = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  278  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  279  	/* Check whether the syscall is issued inside a restartable sequence */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18 @280  	rseq_syscall(regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  281  
985faa78687de6 arch/powerpc/kernel/interrupt.c  Mark Rutland       2021-11-29  282  	ti_flags = read_thread_flags();
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  283  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  284  	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  285  		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  286  			r3 = -r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  287  			regs->ccr |= 0x10000000; /* Set SO bit in CR */
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  288  		}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  289  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  290  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  291  	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  292  		if (ti_flags & _TIF_RESTOREALL)
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  293  			ret = _TIF_RESTOREALL;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  294  		else
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  295  			regs->gpr[3] = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  296  		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  297  	} else {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  298  		regs->gpr[3] = r3;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  299  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  300  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  301  	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  302  		do_syscall_trace_leave(regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  303  		ret |= _TIF_RESTOREALL;
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  304  	}
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  305  
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  306  	local_irq_disable();
f84aa284947f32 arch/powerpc/kernel/interrupt.c  Christophe Leroy   2021-06-18  307  	ret = interrupt_exit_user_prepare_main(ret, regs);
13799748b957bc arch/powerpc/kernel/interrupt.c  Nicholas Piggin    2021-06-18  308  

:::::: The code at line 280 was first introduced by commit
:::::: 13799748b957bc5659f97c036224b0f4b42172e2 powerpc/64: use interrupt restart table to speed up return from interrupt

:::::: TO: Nicholas Piggin <npiggin@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
