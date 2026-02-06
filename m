Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA932FA3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770348534; cv=none; b=kDQ65iEvu1bmaQ3Y7hl7Vq9Muhw88/eDvy2v4cajS9zhyFmZoPNC21rQWHj9UWs3h6zc5otCrXXw+SQZyrkzXXAw0khyXH6sEmC7t4EL0ubFKj8cqNM2/cN7MOGKdcYnmrmflm7uZgJ+XauzlXJV1OkS6OBkoDixAxhhqrsRR4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770348534; c=relaxed/simple;
	bh=bCZqQAyl7eg2lSpGjd6RT6eXFmsXMIqqb1A7kHhJFNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ca19YNi70IUoA4NwNMzbVEoBtLjlVoeAuwmEYE9vvXEVewUAWwfYFiyLGQdPieXvrqTY4BjvRs9ZQNO4kBAJlDDVQ67poE7dJvgc7zC9KkTcveWeLrHkWvrRzj3idnXq/PgqvTpPlGV6qYJtfuq4kFfeuSJwejHa2/yu6DCRpVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoFWz3Me; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoFWz3Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770348535; x=1801884535;
  h=date:from:to:cc:subject:message-id;
  bh=bCZqQAyl7eg2lSpGjd6RT6eXFmsXMIqqb1A7kHhJFNs=;
  b=EoFWz3Med+eiFT87zmk8wfuTLRwQ0FMM26AheUm8pERE+OvRNL6ccQD4
   gpzQvymn8zVpW+Z17/OlwZuVGaf42qdaM7djbHoTubeuVR04m5wixZBCO
   V//adrCFXhAx5d8m3qMpw37b0Nyi26qRLB4/4vcdOlMB4SMC+p1nsnN3G
   gZCPg0UPZrOlCZAUCvQ+6BF4fsPe2bnXXRo10BCWVMJ/Ax84MXbIT6EV8
   zrJ4U6qUAzBZ7Bd3/XcHfRqg1DRsGytdnS+9dZC5skAUZlDDf1vhz8RsY
   yieZUR2AZcou35+vFtkkr7iQOYF8tvCmyzdt4qWpjTp5yD2F53AeGC9vo
   A==;
X-CSE-ConnectionGUID: Wsjqy0iVR2mKBkZYH8zt0w==
X-CSE-MsgGUID: 3OlQ9zSjStGEUqOn1h4L9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="94204713"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="94204713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 19:28:44 -0800
X-CSE-ConnectionGUID: ZwAgx3abR8qDuHToarYrgw==
X-CSE-MsgGUID: gKa7gVlrRn6mRhAV7ezwYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210131778"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2026 19:28:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voCWN-00000000kP2-3BIA;
	Fri, 06 Feb 2026 03:28:39 +0000
Date: Fri, 06 Feb 2026 11:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/sched/core.c:8867:6: error:
 conflicting types for '__cant_sleep'; have 'void(const char *, int,  long
 int)'
Message-ID: <202602061130.vvWbm7SS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: sparc-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260206/202602061130.vvWbm7SS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061130.vvWbm7SS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061130.vvWbm7SS-lkp@intel.com/

All errors (new ones prefixed by >>):

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
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/sparc/include/asm/current.h:15,
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


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
