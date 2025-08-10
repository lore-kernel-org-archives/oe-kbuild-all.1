Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762B1D5ADC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754821775; cv=none; b=kRWUjgAP/jJ/dHsl6bo5uPuH8tcGaiCc7Wl190/qt3fHl2xgqBrOespGABV7zQ2NAZmI0AN9E3P3q9HvmXxJXWwLd/BStfggsthmbyBk7i/D0f+yGXPSta+tnrtMdDs+i4NkqvOj2dEVYCYVAGfWb2iFvBxMaizoWTr/Q8DyZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754821775; c=relaxed/simple;
	bh=c9D/WFGW4Dr3Xt7ILd8MHvZRmpmZ8wSiENLB5ArsPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FEm5bEKEEtUOJKKZmdLOuvwrPzrW+gIA0SBKmgfLBmN15x+GjSzG6T0JcMx2xWwEXyT07Rrxpoaqwe762XxDF9cvozQFf9Qqb1305NwjCw4EvPFkr7BsgVcw9nrxh1bqBzF/ex/2nLYMktreOdZqMS3GpukWF5KzEWh9jUsj4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD3wlRGu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD3wlRGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754821773; x=1786357773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9D/WFGW4Dr3Xt7ILd8MHvZRmpmZ8wSiENLB5ArsPk4=;
  b=bD3wlRGuGClTTLyRi47IuNSTOfr7RQ6mL6KdUlR1cTzIV0k8/DzKvyP/
   qpV+q+0bFvSVMB0TF+vAQZEmLjfU13sgdJ3xEukJMYbxigYOMNvsAHylT
   zRPCnOMbYqq0Sizrbc+ZjOZJ4N/E+iTsfKFUGeMRCSvbUIx1+QGhd5ZuK
   R2EHjKVIg/A8rfBiqHkPy6d+EGna9fx1ozeaT2xDtFbc61wPkAH1QLAsk
   uJDPUv+5riWNXi4rwPBHbRHanuF3nVmkYWc7CremRn+/T3Bc0jO1e9Ww9
   WOLQovxx5ox4kwyGBFyd1lyjbFBeJaov+rYiXj7eCbnBEPGNxAORQw7pT
   w==;
X-CSE-ConnectionGUID: DW7OD1/oTHqY9VGoOhXbyQ==
X-CSE-MsgGUID: QJzXXLpbTsGCDM5kviCVNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57179877"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57179877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 03:29:33 -0700
X-CSE-ConnectionGUID: GCQZFdFUQ6aKfDAeaqGG2Q==
X-CSE-MsgGUID: zBPoKD9qSFy5b6ZhCtAByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196667123"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2025 03:29:32 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul3Iv-0002vx-07;
	Sun, 10 Aug 2025 10:29:29 +0000
Date: Sun, 10 Aug 2025 12:29:27 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:rust-spinlock-irq 2/21]
 arch/s390/include/asm/preempt.h:109:38: error: void value not ignored as it
 ought to be
Message-ID: <202508101209.7X3CLRPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rust-spinlock-irq
head:   5b23adbb23dac965774935c047cc510bfaaa91c5
commit: 0c303a0d1f2100cb288a6ec2bc374c899c9d0cbf [2/21] preempt: Introduce __preempt_count_{sub, add}_return()
config: s390-randconfig-2005-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101209.7X3CLRPq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508101209.7X3CLRPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508101209.7X3CLRPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/preempt.h:85,
                    from arch/s390/include/asm/percpu.h:5,
                    from include/linux/irqflags.h:19,
                    from arch/s390/include/asm/processor.h:33,
                    from include/linux/sched.h:13,
                    from arch/s390/kernel/asm-offsets.c:9:
   arch/s390/include/asm/preempt.h: In function '__preempt_count_add_return':
>> arch/s390/include/asm/preempt.h:109:38: error: void value not ignored as it ought to be
     109 |                         return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=3659763643
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=3659763643
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3659763643
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3659763643
   make: Target 'prepare' not remade because of errors.


vim +109 arch/s390/include/asm/preempt.h

   100	
   101	static __always_inline int __preempt_count_add_return(int val)
   102	{
   103		/*
   104		 * With some obscure config options and CONFIG_PROFILE_ALL_BRANCHES
   105		 * enabled, gcc 12 fails to handle __builtin_constant_p().
   106		 */
   107		if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES)) {
   108			if (__builtin_constant_p(val) && (val >= -128) && (val <= 127)) {
 > 109				return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
   110			}
   111		}
   112		return val + __atomic_add(val, &get_lowcore()->preempt_count);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
