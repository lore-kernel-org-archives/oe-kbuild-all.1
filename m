Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792804930;
	b=pjeUYrGdxxPWXTc2JJzOyeLue8XIIbovg4NhFUQPmOBaa+uiCi2Wai9fLQoTHNhfzF/s
	 zWvYobRtC4aRc368oG75YnV4G7+bdFbnP2aOnjX6kJeNEGfJQaUH/13GZBBxVqDF0W/oI
	 qKMtOFnzR+m3tdhq2XSbBM9K5H8Z0wDoTZese8ltbbbS1BdSqEMzSfwQVv5jkSgoswQEI
	 bXsf50rRZ8Ma9kkvkoLZopiK3IKu+88zrkIRRBSYBl3HpWyKv+zYixwPlfeBlnAMwcNpB
	 ulp5wE40Nh6ZRQ+9/5qlM4UW1skgcRm8Rg8BD1i4dQCvGsQiBffz/oaJARh4UCAuYCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792804930;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7G/lfqi4GaLqG9sdNXNrAua7Dz4xnPAGie1bK9TBfiU=;
	b=q+yh+7OrMhfpwdBuF4XXzcwsGYWKYMSD9q2WAOJ+bZ3NdFpcuuuq/2kO6cp03jMYHWes
	 Uu8Ra74Kg5hR10l6LL1Lpo08I3+u2lytiGBIjzSb0nIt7okVFY0w0n/Qfj+UD8o8NgBAF
	 /NztzjGjhIMnkAMIWt+fKPwGvTH5Q/wY+PnPukfquT2BP/ehd1ix80sk9hVxwmtNdMOwj
	 JYM9dqy4e6xtpvu/HqrgzL3zAeGidUFltQjnRlaDYcDtc4/IxL/IMTbHXjdZAGCD+YTxA
	 Q2csb+I/KrHLGPbeWb6CHoWRCs62fH2njbMIunGbWuygX39VDF7hJ01NnMjeFFwUdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxlEvSZX;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 01:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A141D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxlEvSZX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792804929; x=1824340929;
  h=date:from:to:cc:subject:message-id;
  bh=AFHulHI98gPx0evrdCtxVtGBjvOCq11Za8suBFXCKBU=;
  b=dxlEvSZXaLdJPwEpbPrO3yzmj2hF9sw73q1o3yy9pv+VUJqmXBvu+Fh2
   1w2ar/eG0NeTfItD0sfhRdesDVuhzf/GyOAqjrn2z8SiobXZikRpPTvGB
   7kryvR3r6qNuuKL8UOik95E4c9PinyLzQ3HdrtGQ5HCcRIq7A2MnZcoE3
   0lJFZIb7pMrxmiqlsI+bdS60HCZnj3Sqim+/0AqCciRi3Pyc2K1jambFy
   qiONK5/buyzDl8cOO7KMViPVdhY1YWDfNCKd8xlj/d1RY1+qAYhfOifeX
   WhGmXRtaitRn4QgLalJ4X2Bd+xg8vAwtnIQyeMtHAon8tuQv+ga/k/0uw
   A==;
X-CSE-ConnectionGUID: rrK2ZqEdSOurAWiCBBEdVQ==
X-CSE-MsgGUID: 6FPsScorRBC+dPltNvFR3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1452287"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1452287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 18:22:09 -0700
X-CSE-ConnectionGUID: SwmLBDyNTfW8jX2fF51zjA==
X-CSE-MsgGUID: odTGu1QLTNap8RjlyDrCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3739228"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 18:22:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKQSS-0000000034J-306F;
	Sat, 24 Oct 2026 01:22:04 +0000
Date: Sat, 24 Oct 2026 03:21:54 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-23 25/25]
 arch/x86/kernel/cet.c:351:24: error: 'struct thread_struct' has no member
 named 'kshstk_ssp'
Message-ID: <202610240302.dne62y4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-23
head:   b6fa923e47fcecf329844fd91ed615de35478ea3
commit: b6fa923e47fcecf329844fd91ed615de35478ea3 [25/25] x86/boot: Add CPU shadow stack bootstrapping
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261024/202610240302.dne62y4D-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240302.dne62y4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240302.dne62y4D-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cet.c:277:17: warning: no previous prototype for 'kshstk_build' [-Wmissing-prototypes]
     277 | asmlinkage void kshstk_build(unsigned long *root_sp)
         |                 ^~~~~~~~~~~~
   arch/x86/kernel/cet.c:330:6: error: redefinition of 'arch_kernel_stack_lock_current'
     330 | void arch_kernel_stack_lock_current(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/processor.h:30,
                    from include/linux/sched.h:13,
                    from include/linux/ptrace.h:6,
                    from arch/x86/kernel/cet.c:3:
   arch/x86/include/asm/shstk.h:49:20: note: previous definition of 'arch_kernel_stack_lock_current' with type 'void(void)'
      49 | static inline void arch_kernel_stack_lock_current(void) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cet.c: In function 'arch_kernel_stack_lock_current':
>> arch/x86/kernel/cet.c:351:24: error: 'struct thread_struct' has no member named 'kshstk_ssp'
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |                        ^
>> arch/x86/kernel/cet.c:351:38: error: implicit declaration of function 'kshstk_enable_current'; did you mean 'kmsan_enable_current'? [-Wimplicit-function-declaration]
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |                                      ^~~~~~~~~~~~~~~~~~~~~
         |                                      kmsan_enable_current


vim +351 arch/x86/kernel/cet.c

   320	
   321	/*
   322	 * This "locks" the stack in place and does not allow any control
   323	 * flow manipulation to occur because of changes to the stack.
   324	 *
   325	 * CPU enters with shadow stacks disabled and leaves with them
   326	 * enabled.
   327	 *
   328	 * Must be called before the CPU does its first context switch.
   329	 */
   330	void arch_kernel_stack_lock_current(void)
   331	{
   332		unsigned long flags;
   333	
   334		if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
   335			return;
   336	
   337		kshstk_prepare_pages();
   338	
   339		/*
   340		 * Regular interrupts are delivered on stack level 0. There
   341		 * is a window within the enabling where CET_SHSTK_EN=1 but
   342		 * SSP is not yet set. If an interrupt is delivered in that
   343		 * window, it would try to push on to this stack. Disable
   344		 * regular interrupts over this window.
   345		 *
   346		 * Interrupts that use other stack levels (like NMI) are OK
   347		 * because FRED switches stacks for them and does not push
   348		 * on stack level 0.
   349		 */
   350		local_irq_save(flags);
 > 351		current->thread.kshstk_ssp = kshstk_enable_current();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
