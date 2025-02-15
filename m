Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD13917799F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739592659; cv=none; b=EbN+K8rvqvKx1p8XVWis4ZeJSWib3ZQO++syg2MwKdLtKn9D1xQwm5q+tjxJDrIq+wOq4ySaKV3ViETLXJpaC+2Umx5BM0jTAEx3ya8+Fw1Gzz6ciY05WIjSEX4FM8TJ3tnv4MmIi74JH8zXlc8Khba8DgVpi9cWsgH+QQDBnbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739592659; c=relaxed/simple;
	bh=mCMavwOCCnJ0TOG2DThdzzRyGjAbYhgr3tu7QKpOXGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcKMM39ph8T+TFUmcYOLV3j4fOE7TkOWlY2KQvfmuRl1yBcv410joIFk7xUo05ZgSHJVMlsSWK3bnmlwaVSkH/ItqWJNfUvzUQunh7KIiezm/0iKTti30vftiyag61YCdHX1DtWhSOguhwI9SzQQZlR4KvPe6NxadRPR7HrTfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g09J0kLM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g09J0kLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739592657; x=1771128657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCMavwOCCnJ0TOG2DThdzzRyGjAbYhgr3tu7QKpOXGo=;
  b=g09J0kLMS3Wjl/CgLZqDA3wsftFOOWesQHOC5QMhzl4XtV1QepMvVDWM
   5pfLrApjkGkeFLdqz65BcGKxoHp4q8hzJKmSsA4yp6hX08My/dkHYWYTf
   KUjAc9XfiEG8bpHbecy7ejlCV0ZHbZ99ytq8pfY+FgxYJFH5uy90Ml5Gm
   C3wprqVVsK1g/2A1iS9S0NTAX6P+ThUg+I4lj5J8xJZwdE7D4fwy1ivUq
   hvbsHRCmtpX6J1Tn1cRnJGHpEDhSqAHEFX0GYLesopgCowT38TPpxaYon
   4zW6zGnw5Ddx6dAJ6HHElsNAyx/+WuNoiWGBonrVL3Lsv0s30p/dDpS4L
   g==;
X-CSE-ConnectionGUID: LAKxTkprS7OLXYJPHi+cCA==
X-CSE-MsgGUID: cIKTE4QfTEm7/ZOShYXdmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40221659"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40221659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 20:10:56 -0800
X-CSE-ConnectionGUID: 1In7FhtXSWiw39906RchYQ==
X-CSE-MsgGUID: UnSsvTDBTz2DPiqcFJEy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118831897"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2025 20:10:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj9W0-001AUX-12;
	Sat, 15 Feb 2025 04:10:52 +0000
Date: Sat, 15 Feb 2025 12:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 31/31] ARM: entry: Straighten syscall returns
Message-ID: <202502151209.8ghkZFWt-lkp@intel.com>
References: <20250212-arm-generic-entry-v4-31-a457ff0a61d6@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-arm-generic-entry-v4-31-a457ff0a61d6@linaro.org>

Hi Linus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/ARM-Prepare-includes-for-generic-entry/20250212-193300
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250212-arm-generic-entry-v4-31-a457ff0a61d6%40linaro.org
patch subject: [PATCH v4 31/31] ARM: entry: Straighten syscall returns
config: arm-randconfig-r122-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151209.8ghkZFWt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502151209.8ghkZFWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151209.8ghkZFWt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/kernel/entry-common.S:201:2: error: invalid instruction, any one of the following would fix this:
    b 9002
    ^
   arch/arm/kernel/entry-common.S:201:4: note: invalid operand for instruction
    b 9002
      ^
   arch/arm/kernel/entry-common.S:201:2: note: instruction requires: thumb
    b 9002
    ^


vim +201 arch/arm/kernel/entry-common.S

   166	
   167		/* saved_psr and saved_pc are now dead */
   168	
   169		uaccess_disable tbl
   170		get_thread_info tsk
   171		/* Save a per-task copy of SP for sigreturn */
   172		str	sp, [tsk, #TI_SP_SYSCALL]
   173	
   174		adr	tbl, sys_call_table		@ load syscall table pointer
   175	
   176	#if defined(CONFIG_OABI_COMPAT)
   177		/*
   178		 * If the swi argument is zero, this is an EABI call and we do nothing.
   179		 *
   180		 * If this is an old ABI call, get the syscall number into scno and
   181		 * get the old ABI syscall table address.
   182		 */
   183		bics	r10, r10, #0xff000000
   184		strne	r10, [tsk, #TI_ABI_SYSCALL]
   185		streq	scno, [tsk, #TI_ABI_SYSCALL]
   186		eorne	scno, r10, #__NR_OABI_SYSCALL_BASE
   187		ldrne	tbl, =sys_oabi_call_table
   188	#elif !defined(CONFIG_AEABI)
   189		bic	scno, scno, #0xff000000		@ mask off SWI op-code
   190		str	scno, [tsk, #TI_ABI_SYSCALL]
   191		eor	scno, scno, #__NR_SYSCALL_BASE	@ check OS number
   192	#else
   193		str	scno, [tsk, #TI_ABI_SYSCALL]
   194	#endif
   195		mov	r1, sp				@ put regs into r1
   196		stmdb	sp!, {r4, r5}			@ push fifth and sixth args
   197		mov	r0, tbl
   198		mov	r2, scno			@ syscall number from r7
   199		bl	invoke_syscall
   200	#if defined(CONFIG_OABI_COMPAT) || !defined(CONFIG_AEABI)
 > 201		b	9002
   202	
   203		/*
   204		 * We failed to handle a fault trying to access the page
   205		 * containing the swi instruction, but we're not really in a
   206		 * position to return -EFAULT. Instead, return back to the
   207		 * instruction and re-enter the user fault handling path trying
   208		 * to page it in. This will likely result in sending SEGV to the
   209		 * current task.
   210		 */
   211	9001:
   212		sub	lr, saved_pc, #4
   213		str	lr, [sp, #S_PC]
   214		get_thread_info tsk
   215	9002:
   216		/* Exit !AEABI clause */
   217	#endif
   218	
   219		/* Return from syscall */
   220		add	sp, sp, #(S_R0 + S_OFF)
   221	#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
   222		bl	stackleak_erase_on_task_stack
   223	#endif
   224		restore_user_regs
   225	 UNWIND(.fnend		)
   226	ENDPROC(vector_swi)
   227		.ltorg
   228	
   229		.macro	syscall_table_start, sym
   230		.equ	__sys_nr, 0
   231		.type	\sym, #object
   232	ENTRY(\sym)
   233		.endm
   234	
   235		.macro	syscall, nr, func
   236		.ifgt	__sys_nr - \nr
   237		.error	"Duplicated/unorded system call entry"
   238		.endif
   239		.rept	\nr - __sys_nr
   240		.long	sys_ni_syscall
   241		.endr
   242		.long	\func
   243		.equ	__sys_nr, \nr + 1
   244		.endm
   245	
   246		.macro	syscall_table_end, sym
   247		.ifgt	__sys_nr - __NR_syscalls
   248		.error	"System call table too big"
   249		.endif
   250		.rept	__NR_syscalls - __sys_nr
   251		.long	sys_ni_syscall
   252		.endr
   253		.size	\sym, . - \sym
   254		.endm
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
