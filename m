Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1512E92DA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762707442; cv=none; b=oodsoXVL2ucwNQmmSIM6zeN6w7U+cjtBNKn5clNOoWr7S37UEfWvQBJIBSxFW7dIZlPcCP5Oxk52eTusv0HcOHeCJiVx9gJJehg2g7HdUrjbIVeFE7mrzMN1i5/bHvCyjMAMe9mJjZfEGiNsqQZ1KZjVBs+uwvqofqZCQ9QwFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762707442; c=relaxed/simple;
	bh=jaecpBiGxdCTCjQDD+9zv59gnEFk7LhUJrF7Yyancec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWXLKCkKeuwGyofKJiWw0GPLR6OWRE4pn7dglK1VdtnV4IQvfuboIzNqx7kgnHlMIlkpcTHMNlTOtqIzxHvWZ0jWZr75fQKRo9uq1uZqofOqTe7TXTmJa5Rlo4lrTMQ9bOGH0JZYmHpyzIwq5y3k7MGUTSEGDmL2VF3nYPSHfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFmfoFAM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFmfoFAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762707441; x=1794243441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jaecpBiGxdCTCjQDD+9zv59gnEFk7LhUJrF7Yyancec=;
  b=RFmfoFAMedwy85u2/BXiJeBNrhfsZOyGG7irDkENDtxsdr35U5rjBM6g
   RbUiBEfDyWySbYNLOXKwXGwrY7IEsFor704PzdtS9KCb05CXmG3y6Dk5Q
   l9H07/xYTx0WsmCKR6C2clbXhNDl2zqHOV0oyF9PTMCN4WMlPpTHMx4nv
   FCsHe/QiVGiJmUzx3ZVkDqDsoc5d7XVYZB9P45nsZ7BNar67AwR5qFUOC
   bxvcWx56fgW7OEnmhRlrbFr7f+WMOcPaRvQk8stxEigHs5r4ius48Nt6z
   CyH/aSo4TyStYoTwQcRhh4wXsVd6oZfO9mdUH65rjUzhIT0lpNnEF71SD
   g==;
X-CSE-ConnectionGUID: T2jJXl+VSy2l7cune8Bwcw==
X-CSE-MsgGUID: QNITpu3RTHuxgFJ+f1kXUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64476391"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="64476391"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 08:57:20 -0800
X-CSE-ConnectionGUID: G3FM2qbTRP+iSJUy5hLlJA==
X-CSE-MsgGUID: EiEP1WmYQkSWy0xjbIQiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188325663"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2025 08:57:13 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI8j1-0002DL-02;
	Sun, 09 Nov 2025 16:57:11 +0000
Date: Mon, 10 Nov 2025 00:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com,
	tglx@linutronix.de, segher@kernel.crashing.org, riel@surriel.com,
	peterz@infradead.org, linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, luto@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
Message-ID: <202511100042.ZklpqjOY-lkp@intel.com>
References: <20251108172346.263590-2-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108172346.263590-2-qq570070308@gmail.com>

Hi Xie,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/x86/core tip/x86/mm s390/features perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.18-rc4 next-20251107]
[cannot apply to acme/perf/core tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xie-Yuanbin/Make-enter_lazy_tlb-inline-on-x86/20251109-013003
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251108172346.263590-2-qq570070308%40gmail.com
patch subject: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
config: i386-randconfig-014-20251109 (https://download.01.org/0day-ci/archive/20251110/202511100042.ZklpqjOY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100042.ZklpqjOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100042.ZklpqjOY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:108,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/include/asm/mmu_context.h: In function 'enter_lazy_tlb':
>> arch/x86/include/asm/mmu_context.h:155:27: error: 'cpu_tlbstate' undeclared (first use in this function); did you mean 'cpuhp_state'?
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                           ^~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:13: note: in expansion of macro 'this_cpu_read'
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |             ^~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:27: note: each undeclared identifier is reported only once for each function it appears in
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                           ^~~~~~~~~~~~
   include/linux/compiler.h:244:47: note: in definition of macro 'TYPEOF_UNQUAL'
     244 | # define TYPEOF_UNQUAL(exp) __typeof_unqual__(exp)
         |                                               ^~~
   include/linux/percpu-defs.h:499:41: note: in expansion of macro '__pcpu_size_call_return'
     499 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:155:13: note: in expansion of macro 'this_cpu_read'
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |             ^~~~~~~~~~~~~
   In file included from arch/x86/kvm/vmx/vmx.c:46:
   arch/x86/include/asm/mmu_context.h:155:51: warning: comparison between pointer and integer
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                                                   ^~
   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:597,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7:
>> arch/x86/include/asm/mmu_context.h:158:24: error: 'cpu_tlbstate_shared' undeclared (first use in this function)
     158 |         this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:500:41: note: in expansion of macro '__pcpu_size_call'
     500 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/mmu_context.h:158:9: note: in expansion of macro 'this_cpu_write'
     158 |         this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
         |         ^~~~~~~~~~~~~~


vim +155 arch/x86/include/asm/mmu_context.h

   138	
   139	/*
   140	 * Please ignore the name of this function.  It should be called
   141	 * switch_to_kernel_thread().
   142	 *
   143	 * enter_lazy_tlb() is a hint from the scheduler that we are entering a
   144	 * kernel thread or other context without an mm.  Acceptable implementations
   145	 * include doing nothing whatsoever, switching to init_mm, or various clever
   146	 * lazy tricks to try to minimize TLB flushes.
   147	 *
   148	 * The scheduler reserves the right to call enter_lazy_tlb() several times
   149	 * in a row.  It will notify us that we're going back to a real mm by
   150	 * calling switch_mm_irqs_off().
   151	 */
   152	#define enter_lazy_tlb enter_lazy_tlb
   153	static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
   154	{
 > 155		if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
   156			return;
   157	
 > 158		this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
