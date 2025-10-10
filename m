Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D471F5435
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081286; cv=none; b=hQP193vRI8nXkO2byiwT64m1A9vwj9nk7CIIGhSv12gyWb3r6mYRCHvpTG6tPkmJH6mKV5M3IIQFA1FpYsm70Q6JWkd7nJA0TybqwiLTiNOXTHeBIbvkcEQXf/4L7pQf9KsbDF2lEi0SgrNI3/2TZQ2AOHqaJ0NvoRWBPuXD8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081286; c=relaxed/simple;
	bh=ClRIefqeUJtiXvNpxnvg4LwVv+2sw3P639q7gjNGjmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xna3xHnyX2foOXtrMXT4dbTqwyDlgV6Cg2ypp3z0uvTB9SuhSqXkXCHVPVr985e9ZvlTh7sW0IGytJiCc5wFvlt8m4EwCJxbfVtkMpZmN6aCAnlamI6SUAmj4hsBg2rlJJyJCeZvSDEL5iisaKesYMlvTLfxBySQfULmEghUSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baK2sUas; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baK2sUas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760081284; x=1791617284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ClRIefqeUJtiXvNpxnvg4LwVv+2sw3P639q7gjNGjmg=;
  b=baK2sUask0RuL2wNggaKo0mOEmMxzo/Tj+vsk1od6ltf66yQio6YttTb
   nh4WflotmbJxeGFSY7dTF422L5+AAtmFqBtuyt2Vrr3S+5ST9F3hJw3C9
   s1SbMnbuMRH+rXicpD7/MmJcP3uJpyMdPRY+s4zdwj31LLVI3cSQ5KNzz
   O/FxInNeJicfGZwYgd2yzHOV7xx8KRir2uHL5iT5tUkDqLJ2cAH4qsxG3
   J3x5FVD1GaEfGUbkLYQ/9mcv+lb9PNn8QCIdouWMbBJWCMPwZmMT1NoGq
   or1sE438PUHeR8EW6r7YN485XrXmqpaxm8w0pkygZtTs/+W6oy05RdaSl
   g==;
X-CSE-ConnectionGUID: 5Aco8Ss4T/SmIkjWn0Igsw==
X-CSE-MsgGUID: 6/yEjsYVTQKsOmhRjbwE4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64920711"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="64920711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 00:28:03 -0700
X-CSE-ConnectionGUID: Iz1HxXK+RzKc3tOw+oQvqQ==
X-CSE-MsgGUID: +8yBkJqFS+23yQ5HjgzitA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="184949953"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Oct 2025 00:28:03 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v77Xk-0002PL-18;
	Fri, 10 Oct 2025 07:28:00 +0000
Date: Fri, 10 Oct 2025 15:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath-syncstack4all
 13/13] arch/arm64/mm/fault.c:305:64: error: 'sync_stack_ptr' undeclared; did
 you mean 'sync_stack'?
Message-ID: <202510101559.JPHz9bQo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath-syncstack4all
head:   b1b798131387a63cead97374f3a68db539aa6709
commit: b1b798131387a63cead97374f3a68db539aa6709 [13/13] Print stack whereabouts info on kernel paging fault
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251010/202510101559.JPHz9bQo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101559.JPHz9bQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101559.JPHz9bQo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from arch/arm64/mm/fault.c:10:
   arch/arm64/mm/fault.c: In function 'die_kernel_fault':
>> arch/arm64/mm/fault.c:305:64: error: 'sync_stack_ptr' undeclared (first use in this function); did you mean 'sync_stack'?
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^~~~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:412:41: note: in expansion of macro '__pcpu_size_call_return'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/fault.c:305:51: note: in expansion of macro 'raw_cpu_read'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~
   arch/arm64/mm/fault.c:305:64: note: each undeclared identifier is reported only once for each function it appears in
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^~~~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:412:41: note: in expansion of macro '__pcpu_size_call_return'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/fault.c:305:51: note: in expansion of macro 'raw_cpu_read'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~


vim +305 arch/arm64/mm/fault.c

   299	
   300	static void die_kernel_fault(const char *msg, unsigned long addr,
   301				     unsigned long esr, struct pt_regs *regs)
   302	{
   303		unsigned long stack = (unsigned long)current->stack;
   304		unsigned long irq_stack = (unsigned long)raw_cpu_read(irq_stack_ptr);
 > 305		unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
   306		bust_spinlocks(1);
   307	
   308		pr_alert("Unable to handle kernel %s at virtual address %016lx\n", msg,
   309			 addr);
   310	
   311		pr_alert("TASK STACK: 0x%08lx-0x%08lx\n",
   312			 stack, stack + THREAD_SIZE - 1);
   313		pr_alert("IRQ STACK: 0x%08lx-0x%08lx\n",
   314			 irq_stack, irq_stack + IRQ_STACK_SIZE - 1);
   315		pr_alert("SYNC STACK: 0x%08lx-0x%08lx\n",
   316			 sync_stack, sync_stack + SYNC_STACK_SIZE - 1);
   317	
   318		kasan_non_canonical_hook(addr);
   319	
   320		mem_abort_decode(esr);
   321	
   322		show_pte(addr);
   323		die("Oops", regs, esr);
   324		bust_spinlocks(0);
   325		make_task_dead(SIGKILL);
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
