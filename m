Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669F2248AF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 03:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770347676; cv=none; b=srCD01QTyt+W+wDc/ivrzO315QRbFupH4gvnt+pC6Gb/CRuP2VAIjuGfvcuQ77OrRACpMY3N/EBB5kuCpW+6MhmoATDkhpcjBUKR3nN7zCrZxIVmtPdydfInAAY4Dd36JJ2MdBhLxhntIgEikaNRItGb9ijEU2Vavz32W9l/NLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770347676; c=relaxed/simple;
	bh=7Lte7yJJtmCM44pJ9KyeTIpRka/mpQ/OoPFnGEXVaCw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YI35anCTXGIT6jYwuHuW3e97TlKQYN+FOx5umfRzlZUHUPyPyXxHSe3lMTFiv6niYBQJtIPwrRzathmpRhh+nvN/D9ktnJ534QDsWaUaNzlzxaCc5UZQ9sUs8xsEjalNdbKfxG+5I085IrKLxetIXF/GLArhlx8nlA/9THdFdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN0sCDQv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN0sCDQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770347675; x=1801883675;
  h=date:from:to:cc:subject:message-id;
  bh=7Lte7yJJtmCM44pJ9KyeTIpRka/mpQ/OoPFnGEXVaCw=;
  b=UN0sCDQvImExaQj4Ifuy3CrRbs2L9WdfbPy+SBM46SsZJDsFd+gQ6hAV
   4dALOLwm4fvPuhlxMiFMQ3NF3QKjC1hjIBqHYcH+WkoHXc4Zfzf65hjjo
   8KnfH2A49d1QhrCVP6XC9uJUXYzWA1t1Y12/350DweIjKf54VNxMZaIua
   cwyADWYWM5C9neMWpNq5lO9J7PHVD64F7OlVb0yDohdZxJY1+L6QioNz6
   FAjtzMFE0b+XX30+4roHx2voPjK+TEpZe41llN94tXl0QMGMVlXyFb7/O
   sixqwe7RH0jxVB0aYDE8WP7ZRgPCX8Gb0jGm15AxGK4Sa46RJETbGSEc7
   g==;
X-CSE-ConnectionGUID: lVMdEBx0Qs+koX3FQSKXqQ==
X-CSE-MsgGUID: lwPUO0H+Q7qxDiKziJKPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71447478"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71447478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:14:35 -0800
X-CSE-ConnectionGUID: oEB2DpHlQmugRVeA8GeMLA==
X-CSE-MsgGUID: tXg0hM23Tj633qFdCNEbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210673973"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 19:14:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voCIg-000000004Jt-3V5a;
	Fri, 06 Feb 2026 03:14:30 +0000
Date: Fri, 06 Feb 2026 04:13:46 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/sched/core.c:8867:6: error:
 conflicting types for '__cant_sleep'; have 'void(const char *, int,  long
 int)'
Message-ID: <202602060417.9K70cRen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260206/202602060417.9K70cRen-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060417.9K70cRen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060417.9K70cRen-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from include/linux/kernel_stat.h:5,
                    from kernel/softirq.c:13:
   kernel/softirq.c: In function 'handle_softirqs':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:555:9: note: in expansion of macro 'printk'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/softirq.c:633:25: note: in expansion of macro 'pr_err'
     633 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
         |                         ^~~~~~
--
>> kernel/sched/core.c:8867:6: error: conflicting types for '__cant_sleep'; have 'void(const char *, int,  long int)'
    8867 | void __cant_sleep(const char *file, int line, long preempt_offset)
         |      ^~~~~~~~~~~~
   In file included from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/core.c:11:
   include/linux/kernel.h:78:13: note: previous declaration of '__cant_sleep' with type 'void(const char *, int,  int)'
      78 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12:
   kernel/sched/core.c:8893:19: error: conflicting types for '__cant_sleep'; have 'void(const char *, int,  long int)'
    8893 | EXPORT_SYMBOL_GPL(__cant_sleep);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/core.c:8893:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    8893 | EXPORT_SYMBOL_GPL(__cant_sleep);
         | ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:78:13: note: previous declaration of '__cant_sleep' with type 'void(const char *, int,  int)'
      78 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~


vim +8867 kernel/sched/core.c

  8866	
> 8867	void __cant_sleep(const char *file, int line, long preempt_offset)
  8868	{
  8869		static unsigned long prev_jiffy;
  8870	
  8871		if (irqs_disabled())
  8872			return;
  8873	
  8874		if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
  8875			return;
  8876	
  8877		if (preempt_count() > preempt_offset)
  8878			return;
  8879	
  8880		if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
  8881			return;
  8882		prev_jiffy = jiffies;
  8883	
  8884		printk(KERN_ERR "BUG: assuming atomic context at %s:%d\n", file, line);
  8885		printk(KERN_ERR "in_atomic(): %d, irqs_disabled(): %d, pid: %d, name: %s\n",
  8886				in_atomic(), irqs_disabled(),
  8887				current->pid, current->comm);
  8888	
  8889		debug_show_held_locks(current);
  8890		dump_stack();
  8891		add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
  8892	}
  8893	EXPORT_SYMBOL_GPL(__cant_sleep);
  8894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
