Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B723218BA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788603037; cv=none; b=iv2PRJ9W4zOigUuxRmGV7jshIfFdHMHKMs4MUh9Jenk4ToxKBPBHfN1zRO22DKikUP8PFfN0c8q3NF42/mWvmSlmyCs2LOLW/RX5DhwcfWWNSFerM+tryn9vwjEL052Slg/FvhMgXp7dw1iyeb09cOxsnnWlyT/32fH/ZAkOImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788603037; c=relaxed/simple;
	bh=b/L5iIKk2j/f639fvZfVOx1j+aaOcRw3L+GGACFbZww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IETIDC+pJzAUVe6C3utEFk+3oZ082kDh2pL1ZABkNWQOWr3movQMPPcFtDb0vwnPbsiwlhMFodN8MR0bBDd82dN69pOhYpDOlzkYkk9QvnfsskXaZI3ar12muEEvnG42XHPn+5Gj8bCjHyhQbNb6RAaJiokvk+9CxAyySPCntSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A362llj1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A362llj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788603035; x=1820139035;
  h=date:from:to:cc:subject:message-id;
  bh=b/L5iIKk2j/f639fvZfVOx1j+aaOcRw3L+GGACFbZww=;
  b=A362llj1ySHE75DgiYLwZqmiUM/4baRrkzN038Y8v4ZpDYJyu/tPWfXw
   O3lx29Zq69+cxBdckmAC0C2UaWiGXXxLXcG9wNMKMLInFa16DrBsxr3/Z
   5xlQ8Q8KUpUa6J5ljQIfMb/bhmT9WIHsXAMMoaqOUveFeM3NTovRIR+3a
   6mTqzXg9ZJ5lIxz+H3JK3b//FxTvwaG+854PzLEMTjtNa3nzrFTHAo/ZH
   SLnHgKLqCFRRif/4YCakgkVJc3rzWIjhMwQlyZqnITqScpQcwdPbC8Tfc
   edyvcjJ4bIHkcnxqitHMN//81+/SnLIkWWZf47iaktKiJiG2AvcLPBYF/
   g==;
X-CSE-ConnectionGUID: sihQfdSDRTy/cgj8QYqOUw==
X-CSE-MsgGUID: vIboMs0lSry64+9eAtdfEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92905031"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="92905031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 03:10:34 -0700
X-CSE-ConnectionGUID: rx0qrqkeSnqKLbd5RtMgTA==
X-CSE-MsgGUID: mwTCUVjpRxiafMo2HDdaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="265910142"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2026 03:10:32 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2nLy-000000000OF-16gn;
	Sat, 05 Sep 2026 10:10:30 +0000
Date: Sat, 05 Sep 2026 18:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 18/22]
 arch/mips/include/asm/processor.h:252:9: error: unknown type name 'cpumask_t'
Message-ID: <202609051820.rkRdnwdG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   60735555f9a14d6c3e0a576e9ea7bcdb883ce747
commit: 882f996705954c7f6847b915286bbd3d437c3bc7 [18/22] irqflags: Provide refcounted local_irq_*() variants
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260905/202609051820.rkRdnwdG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051820.rkRdnwdG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051820.rkRdnwdG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:109,
                    from include/linux/irqflags.h:16,
                    from arch/mips/include/asm/atomic.h:17,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:14:
>> arch/mips/include/asm/processor.h:252:9: error: unknown type name 'cpumask_t'
     252 |         cpumask_t user_cpus_allowed;
         |         ^~~~~~~~~
   include/linux/irqflags.h: In function 'raw_safe_halt':
   include/linux/irqflags.h:299:9: error: implicit declaration of function 'arch_safe_halt'; did you mean 'raw_safe_halt'? [-Wimplicit-function-declaration]
     299 |         arch_safe_halt();
         |         ^~~~~~~~~~~~~~
         |         raw_safe_halt
   make[3]: *** [scripts/Makefile.build:185: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cpumask_t +252 arch/mips/include/asm/processor.h

e50c0a8fa60da9 include/asm-mips/processor.h      Ralf Baechle   2005-05-31  225  
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  226  /*
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  227   * If you change thread_struct remember to change the #defines below too!
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  228   */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  229  struct thread_struct {
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  230  	/* Saved main processor registers. */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  231  	unsigned long reg16;
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  232  	unsigned long reg17, reg18, reg19, reg20, reg21, reg22, reg23;
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  233  	unsigned long reg29, reg30, reg31;
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  234  
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  235  	/* Saved cp0 stuff. */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  236  	unsigned long cp0_status;
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  237  
2725f3778fddb7 arch/mips/include/asm/processor.h Paul Burton    2018-11-07  238  #ifdef CONFIG_MIPS_FP_SUPPORT
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  239  	/* Saved fpu/fpu emulator stuff. */
37cddff8e330a8 arch/mips/include/asm/processor.h Paul Burton    2014-07-11  240  	struct mips_fpu_struct fpu FPU_ALIGN;
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  241  	/* Assigned branch delay slot 'emulation' frame */
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  242  	atomic_t bd_emu_frame;
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  243  	/* PC of the branch from a branch delay slot 'emulation' */
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  244  	unsigned long bd_emu_branch_pc;
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  245  	/* PC to continue from following a branch delay slot 'emulation' */
432c6bacbd0c16 arch/mips/include/asm/processor.h Paul Burton    2016-07-08  246  	unsigned long bd_emu_cont_pc;
aebdc6ff3b2e79 arch/mips/include/asm/processor.h Yousong Zhou   2020-03-24  247  #endif
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05  248  #ifdef CONFIG_MIPS_MT_FPAFF
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05  249  	/* Emulated instruction count */
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05  250  	unsigned long emulated_fp;
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05  251  	/* Saved per-thread scheduler affinity mask */
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05 @252  	cpumask_t user_cpus_allowed;
f088fc84f94c1a include/asm-mips/processor.h      Ralf Baechle   2006-04-05  253  #endif /* CONFIG_MIPS_MT_FPAFF */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  254  
e50c0a8fa60da9 include/asm-mips/processor.h      Ralf Baechle   2005-05-31  255  	/* Saved state of the DSP ASE, if available. */
e50c0a8fa60da9 include/asm-mips/processor.h      Ralf Baechle   2005-05-31  256  	struct mips_dsp_state dsp;
e50c0a8fa60da9 include/asm-mips/processor.h      Ralf Baechle   2005-05-31  257  
6aa3524c182c01 arch/mips/include/asm/processor.h David Daney    2008-09-23  258  	/* Saved watch register state, if available. */
6aa3524c182c01 arch/mips/include/asm/processor.h David Daney    2008-09-23  259  	union mips_watch_reg_state watch;
6aa3524c182c01 arch/mips/include/asm/processor.h David Daney    2008-09-23  260  
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  261  	/* Other stuff associated with the thread. */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  262  	unsigned long cp0_badvaddr;	/* Last user fault */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  263  	unsigned long cp0_baduaddr;	/* Last kernel fault accessing USEG */
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  264  	unsigned long error_code;
e3b28831c18c6c arch/mips/include/asm/processor.h Ralf Baechle   2015-07-28  265  	unsigned long trap_nr;
b5e00af81f298f arch/mips/include/asm/processor.h David Daney    2008-12-11  266  #ifdef CONFIG_CPU_CAVIUM_OCTEON
b5e00af81f298f arch/mips/include/asm/processor.h David Daney    2008-12-11  267  	struct octeon_cop2_state cp2 __attribute__ ((__aligned__(128)));
b6007ff8096823 arch/mips/include/asm/processor.h Jiaxun Yang    2023-04-04  268  #if defined(CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE) && \
b6007ff8096823 arch/mips/include/asm/processor.h Jiaxun Yang    2023-04-04  269  	CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE > 0
b5e00af81f298f arch/mips/include/asm/processor.h David Daney    2008-12-11  270  	struct octeon_cvmseg_state cvmseg __attribute__ ((__aligned__(128)));
b6007ff8096823 arch/mips/include/asm/processor.h Jiaxun Yang    2023-04-04  271  #endif
b5e00af81f298f arch/mips/include/asm/processor.h David Daney    2008-12-11  272  #endif
e50c0a8fa60da9 include/asm-mips/processor.h      Ralf Baechle   2005-05-31  273  	struct mips_abi *abi;
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  274  };
^1da177e4c3f41 include/asm-mips/processor.h      Linus Torvalds 2005-04-16  275  

:::::: The code at line 252 was first introduced by commit
:::::: f088fc84f94c1a36943e28ad704a9a740a35f877 [MIPS] FPU affinity for MT ASE.

:::::: TO: Ralf Baechle <ralf@linux-mips.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
