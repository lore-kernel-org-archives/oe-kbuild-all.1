Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E561F5842
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 03:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770349125; cv=none; b=r01ZqLTMG1alt63xhWwZBmtO0O2WwWgkfWPZQXUXe/gYMXyHnEYBAQnrCPyraGQZlQ8aRZhHskah4IulYbxGFl+qtEO62cCyHIr1pyy268coFzcgATHQFDlj3T+DoudC/sR2kKyFdP0uB3CvEI2vYlloHwhLCZ2qbDC+DYyWHpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770349125; c=relaxed/simple;
	bh=wuFPgNznlgOamkXOaVoPD9ZDqZ4rvCB4+qzAR72BkM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FOY1HWL/Ko5CvTvcmnrJtyBPrIR/RM4jIsUyE+vosFilfIpmrXceYyckQCgBxlAm8gFH3AFbu/3f+mkbs5toNebm7j0UD63OJuSA+A7FYxl4rLX6VedXKJ8N+B2OhQnvIuSNT33EcTaw/0JDgPFUIJLLFTl7t+N66jABImU7dfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fg/YYeXf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fg/YYeXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770349125; x=1801885125;
  h=date:from:to:cc:subject:message-id;
  bh=wuFPgNznlgOamkXOaVoPD9ZDqZ4rvCB4+qzAR72BkM4=;
  b=Fg/YYeXfz8jl4Jjc0QkpH4+LI79qS8KkGWYxiEpxO8syUy0L3wm43vXL
   CVzQUQYzyYwSQrnql7rh85hTeNoRWIc4b/hL5rvA1TNN4B4aj3vgnsIHQ
   aWE75TFyk7edoEsvLsO/+lymDukp3sY9w7FdJ/CtRvceOS/jH9RMaXT3v
   3A0jjQUg4oIRsVNSvM6mxK5kGzdTptUOZ/iUF619xR3gCwNLGJc8B1V9R
   3dfwmDKxupYi6IbafryY4PaEg47R8FTsfBgGW9S5RZVa88aYEhldmyDR+
   dFqLp6WD0WgubzFQf5rCJUMmg50hC8apg64xPJiGWRm87uFznAw+R4Z74
   A==;
X-CSE-ConnectionGUID: zcuzjiw8Rte+6OB22PnKuw==
X-CSE-MsgGUID: LBpSoh1WS3a3cyIBbC1XSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71449567"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71449567"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:38:45 -0800
X-CSE-ConnectionGUID: p3Uoa8LATg2OD8VsG6wdNA==
X-CSE-MsgGUID: 5yb5f0mvQba5xz6epQsoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210678727"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 19:38:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voCg4-00000000kPI-00Hy;
	Fri, 06 Feb 2026 03:38:40 +0000
Date: Fri, 06 Feb 2026 11:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/sched/core.c:8867:6: error:
 conflicting types for '__cant_sleep'
Message-ID: <202602061153.Ua8gONk9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: arc-randconfig-001-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061153.Ua8gONk9-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061153.Ua8gONk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061153.Ua8gONk9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:8867:6: error: conflicting types for '__cant_sleep'
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
   include/linux/kernel.h:78:13: note: previous declaration of '__cant_sleep' was here
      78 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from kernel/sched/core.c:11:
   kernel/sched/core.c:8893:19: error: conflicting types for '__cant_sleep'
    8893 | EXPORT_SYMBOL_GPL(__cant_sleep);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
      76 |  extern typeof(sym) sym;     \
         |                     ^~~
   include/linux/export.h:90:33: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
         |                                 ^~~~~~~~~~~~~~
   kernel/sched/core.c:8893:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    8893 | EXPORT_SYMBOL_GPL(__cant_sleep);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from kernel/sched/core.c:11:
   include/linux/kernel.h:78:13: note: previous declaration of '__cant_sleep' was here
      78 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~


vim +/__cant_sleep +8867 kernel/sched/core.c

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
