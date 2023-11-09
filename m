Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD72031D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQI52Fhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699544061; x=1731080061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJuv2sBLZKlIPaZcWCrmk9THPNU7zWgT8cmVTBGmX9Y=;
  b=EQI52FhgKixDYHaEW0ICYfbMT+/FcLA+QWDoV83xT777nfUmCli6KVDA
   JOptYlHBfB0+OuT+26HQczv0lV1ecG4W9j/hGLql5hcvykgIiIgeOiFPi
   EgBdJEvKJBwjvYyIDRl75vUdp5db0orFco5wOSRO8dWthHaTa5q6TgMwk
   osYmDJB8WrrePRpT+WNfdoKvdcS7fIC/LnlO4RVnaub205PuLd5LTThKp
   TnPpqY2iwjsv0aQNj4uFhKtUOymxME3cdF6AufrA+h96ty8GnSHaBnnUK
   xzNpHmMMa3qWa88JokO07U/OtidvshpQwzs66GV7gVG3vKYBYaY5GqOUw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380400313"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="380400313"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 07:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="880639964"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="880639964"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2023 07:34:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r172w-0008qu-0W;
	Thu, 09 Nov 2023 15:34:18 +0000
Date: Thu, 9 Nov 2023 23:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 1/2] arch/x86/entry/entry_64.S:608: Error: no
 such instruction: `switch_to_user_cr3 scratch_reg=%rdi scratch_reg2=%rax'
Message-ID: <202311092321.ATXn0Qkl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   ed03ac062608e85cad7072179595ebbeaa1fb9c7
commit: 1be2b8f8190fa5ce67fb17b7b32062eeaed75e79 [1/2] x86/entry: Optimize common_interrupt_return()
config: x86_64-buildonly-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311092321.ATXn0Qkl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092321.ATXn0Qkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092321.ATXn0Qkl-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/entry/entry_64.S: Assembler messages:
>> arch/x86/entry/entry_64.S:608: Error: no such instruction: `switch_to_user_cr3 scratch_reg=%rdi scratch_reg2=%rax'


vim +608 arch/x86/entry/entry_64.S

   553	
   554		__ALIGN
   555		.globl __irqentry_text_end
   556	__irqentry_text_end:
   557		ANNOTATE_NOENDBR
   558	
   559	SYM_CODE_START_LOCAL(common_interrupt_return)
   560	SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
   561		IBRS_EXIT
   562	#ifdef CONFIG_DEBUG_ENTRY
   563		/* Assert that pt_regs indicates user mode. */
   564		testb	$3, CS(%rsp)
   565		jnz	1f
   566		ud2
   567	1:
   568	#endif
   569	#ifdef CONFIG_XEN_PV
   570		ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
   571	#endif
   572		ALTERNATIVE "", "jmp .Lpti_restore_regs_and_return_to_usermode", X86_FEATURE_PTI
   573	
   574		STACKLEAK_ERASE
   575		POP_REGS
   576		swapgs
   577		jmp	.Lnative_iret
   578	
   579	
   580	.Lpti_restore_regs_and_return_to_usermode:
   581		POP_REGS pop_rdi=0
   582	
   583		/*
   584		 * The stack is now user RDI, orig_ax, RIP, CS, EFLAGS, RSP, SS.
   585		 * Save old stack pointer and switch to trampoline stack.
   586		 */
   587		movq	%rsp, %rdi
   588		movq	PER_CPU_VAR(cpu_tss_rw + TSS_sp0), %rsp
   589		UNWIND_HINT_END_OF_STACK
   590	
   591		/* Copy the IRET frame to the trampoline stack. */
   592		pushq	6*8(%rdi)	/* SS */
   593		pushq	5*8(%rdi)	/* RSP */
   594		pushq	4*8(%rdi)	/* EFLAGS */
   595		pushq	3*8(%rdi)	/* CS */
   596		pushq	2*8(%rdi)	/* RIP */
   597	
   598		/* Push user RDI on the trampoline stack. */
   599		pushq	(%rdi)
   600	
   601		/*
   602		 * We are on the trampoline stack.  All regs except RDI are live.
   603		 * We can do future final exit work right here.
   604		 */
   605		STACKLEAK_ERASE_NOCLOBBER
   606	
   607		push	%rax
 > 608		SWITCH_TO_USER_CR3 scratch_reg=%rdi scratch_reg2=%rax
   609		pop	%rax
   610	
   611		/* Restore RDI. */
   612		popq	%rdi
   613		swapgs
   614		jmp	.Lnative_iret
   615	
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
