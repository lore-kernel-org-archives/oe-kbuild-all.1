Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641DAD2E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9ejJBHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702353573; x=1733889573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Afw15phHVe1Jt4mVG0qU1/2iUMnOrh9UOSr/5QymW6g=;
  b=L9ejJBHQrp8f4PBISQ8AoL8byYOdw3WEISOJJw6T9SrSkjFl8AZRIxtO
   F+R5R4ll9G56BUCkksKQavJO/D3IzxZr9xcHmwL/1UB4kKeR5qBfj1/bp
   oaioaouAGRUddE/xO9K4FpwUaQx4+bySVSmbJpfL5oFxRnOVBKhgvcu02
   RK7/O5NzkbQzTXJmg4Yy1CyXNvZnVNuqMiuc5WIXMC7+e+ZoRvDfFwDiu
   DjeA6vPHLGMrFGznm9AO9GhkjMR11SuOr84nY4aIkXkwjiu+Md3tJfZcz
   PIumDNXZIPhtSF9bdk9tCcEn0EH5/q1QwxNdIgG27IRxdWrCPsvX0kt3b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374907657"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="374907657"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 19:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020525995"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1020525995"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2023 19:59:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCtvd-000IkJ-0C;
	Tue, 12 Dec 2023 03:59:29 +0000
Date: Tue, 12 Dec 2023 11:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/signal.c:77:31: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202312121137.0sza62Xl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26aff849438cebcd05f1a647390c4aa700d5c0f1
commit: 96f1b00138cb8f04c742c82d0a7c460b2202e887 ARCv2: save ABI registers across signal handling
date:   2 years, 6 months ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231212/202312121137.0sza62Xl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312121137.0sza62Xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121137.0sza62Xl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arc/kernel/signal.c:77:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct user_regs_arcv2 * @@
   arch/arc/kernel/signal.c:77:31: sparse:     expected void [noderef] __user *to
   arch/arc/kernel/signal.c:77:31: sparse:     got struct user_regs_arcv2 *
>> arch/arc/kernel/signal.c:88:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct user_regs_arcv2 * @@
   arch/arc/kernel/signal.c:88:41: sparse:     expected void const [noderef] __user *from
   arch/arc/kernel/signal.c:88:41: sparse:     got struct user_regs_arcv2 *
>> arch/arc/kernel/signal.c:134:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sigcontext *mctx @@     got struct sigcontext [noderef] __user * @@
   arch/arc/kernel/signal.c:134:42: sparse:     expected struct sigcontext *mctx
   arch/arc/kernel/signal.c:134:42: sparse:     got struct sigcontext [noderef] __user *
   arch/arc/kernel/signal.c:153:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sigcontext *mctx @@     got struct sigcontext [noderef] __user * @@
   arch/arc/kernel/signal.c:153:45: sparse:     expected struct sigcontext *mctx
   arch/arc/kernel/signal.c:153:45: sparse:     got struct sigcontext [noderef] __user *

vim +77 arch/arc/kernel/signal.c

    63	
    64	static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
    65	{
    66		int err = 0;
    67	#ifndef CONFIG_ISA_ARCOMPACT
    68		struct user_regs_arcv2 v2abi;
    69	
    70		v2abi.r30 = regs->r30;
    71	#ifdef CONFIG_ARC_HAS_ACCL_REGS
    72		v2abi.r58 = regs->r58;
    73		v2abi.r59 = regs->r59;
    74	#else
    75		v2abi.r58 = v2abi.r59 = 0;
    76	#endif
  > 77		err = __copy_to_user(&mctx->v2abi, &v2abi, sizeof(v2abi));
    78	#endif
    79		return err;
    80	}
    81	
    82	static int restore_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
    83	{
    84		int err = 0;
    85	#ifndef CONFIG_ISA_ARCOMPACT
    86		struct user_regs_arcv2 v2abi;
    87	
  > 88		err = __copy_from_user(&v2abi, &mctx->v2abi, sizeof(v2abi));
    89	
    90		regs->r30 = v2abi.r30;
    91	#ifdef CONFIG_ARC_HAS_ACCL_REGS
    92		regs->r58 = v2abi.r58;
    93		regs->r59 = v2abi.r59;
    94	#endif
    95	#endif
    96		return err;
    97	}
    98	
    99	static int
   100	stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
   101		       sigset_t *set)
   102	{
   103		int err;
   104		struct user_regs_struct uregs;
   105	
   106		uregs.scratch.bta	= regs->bta;
   107		uregs.scratch.lp_start	= regs->lp_start;
   108		uregs.scratch.lp_end	= regs->lp_end;
   109		uregs.scratch.lp_count	= regs->lp_count;
   110		uregs.scratch.status32	= regs->status32;
   111		uregs.scratch.ret	= regs->ret;
   112		uregs.scratch.blink	= regs->blink;
   113		uregs.scratch.fp	= regs->fp;
   114		uregs.scratch.gp	= regs->r26;
   115		uregs.scratch.r12	= regs->r12;
   116		uregs.scratch.r11	= regs->r11;
   117		uregs.scratch.r10	= regs->r10;
   118		uregs.scratch.r9	= regs->r9;
   119		uregs.scratch.r8	= regs->r8;
   120		uregs.scratch.r7	= regs->r7;
   121		uregs.scratch.r6	= regs->r6;
   122		uregs.scratch.r5	= regs->r5;
   123		uregs.scratch.r4	= regs->r4;
   124		uregs.scratch.r3	= regs->r3;
   125		uregs.scratch.r2	= regs->r2;
   126		uregs.scratch.r1	= regs->r1;
   127		uregs.scratch.r0	= regs->r0;
   128		uregs.scratch.sp	= regs->sp;
   129	
   130		err = __copy_to_user(&(sf->uc.uc_mcontext.regs.scratch), &uregs.scratch,
   131				     sizeof(sf->uc.uc_mcontext.regs.scratch));
   132	
   133		if (is_isa_arcv2())
 > 134			err |= save_arcv2_regs(&(sf->uc.uc_mcontext), regs);
   135	
   136		err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
   137	
   138		return err ? -EFAULT : 0;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
