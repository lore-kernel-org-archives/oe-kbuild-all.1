Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC953EBF07
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 01:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770341622; cv=none; b=W90CnGna9/JkudRYFg7E+cYaI5iIQpHvKGdDdhlR17Byei+OHmSFfV11Nt6U1notDjvZ05b7vnA03dQH7nVJDk0JF8HGHchhVaZZJqEoxD7Ge7dX/sxM5l3ZYsPCehf5LgnsTba1EBv1Qs1no/cQLRWJ+xBxFgxxdGBKrnXE3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770341622; c=relaxed/simple;
	bh=bieg/SQVlOnuixCHn0nbcmflMQY7+oKeg30fXM22LpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VTU6iTUTCXEjcQCrJvkMRhWxpypf1ssv1QY2nr74AqhYb8dyaK17+mopi9YFa9KfxkoMvFjZgvGmIZAZ4nBIoTq7p51wSLh2J9KBtM+jYBt8xHZ5M1TZWT3I1jH1tjjVesUuEiuO1wMvOSo3ONfwcPUj8KWQK6YsWBGLrN937wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgjJ/tlk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgjJ/tlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770341622; x=1801877622;
  h=date:from:to:cc:subject:message-id;
  bh=bieg/SQVlOnuixCHn0nbcmflMQY7+oKeg30fXM22LpE=;
  b=NgjJ/tlk4JgzZhTwRDUerjEPDeMLKR+fMTuH+IDTYT1PI9iSZ2WQ9tkN
   kwy9IRUX5QJRxVV31KHkmHtW9uqGclA4EH3TbhLAMK9TdA7Lx5nQWZqlS
   Z/jls6qHzxFNg8ccRixjh7D8gXPTFg3htaNDLobkq4cyk4Tr3JB8h546s
   4sPdalyMiqnq0yzXu3fBB5Ahs12F96BmXX6Eh4fKdCTxKSv2RLLgB7PeT
   xNUep3DVl3TB/CESWX5vV2zt7QoQgqVwmnmZwHm0BNMpx2i/J/W949sxc
   +G/MISkAVnMKyhfUguNglawTd1dhfBAQjj7DzleZWn/4h0bi04ymwZl9m
   A==;
X-CSE-ConnectionGUID: JAF11gywTGm5L2HRya0OpA==
X-CSE-MsgGUID: n1ddZVUmTAmPXofr8Qkrwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75407473"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="75407473"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 17:33:41 -0800
X-CSE-ConnectionGUID: NJvWipQlQ62LbHeuL7KNpw==
X-CSE-MsgGUID: pLrtO8BITDeOsaK+8/ckSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="209820880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2026 17:33:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voAj2-00000000kLp-3i51;
	Fri, 06 Feb 2026 01:33:36 +0000
Date: Fri, 06 Feb 2026 09:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/time/timer.c:1754:30:
 warning: format '%x' expects argument of type 'unsigned int', but argument 6
 has type 'long int'
Message-ID: <202602060923.uRfnJm0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260206/202602060923.uRfnJm0i-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060923.uRfnJm0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060923.uRfnJm0i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
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
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/kernel_stat.h:5,
                    from kernel/time/timer.c:21:
   kernel/time/timer.c: In function 'call_timer_fn':
>> kernel/time/timer.c:1754:30: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'long int' [-Wformat=]
    1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1755 |                           fn, count, preempt_count());
         |                               ~~~~~
         |                               |
         |                               long int
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   kernel/time/timer.c:1754:17: note: in expansion of macro 'WARN_ONCE'
    1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
         |                 ^~~~~~~~~
   kernel/time/timer.c:1754:59: note: format string is defined here
    1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
         |                                                        ~~~^
         |                                                           |
         |                                                           unsigned int
         |                                                        %08lx


vim +1754 kernel/time/timer.c

f571faf6e443b6 kernel/time/timer.c Thomas Gleixner     2022-11-23  1721  
f28d3d5346e97e kernel/time/timer.c Anna-Maria Gleixner 2019-03-21  1722  static void call_timer_fn(struct timer_list *timer,
f28d3d5346e97e kernel/time/timer.c Anna-Maria Gleixner 2019-03-21  1723  			  void (*fn)(struct timer_list *),
f28d3d5346e97e kernel/time/timer.c Anna-Maria Gleixner 2019-03-21  1724  			  unsigned long baseclk)
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1725  {
6969095afa2073 kernel/time/timer.c Peter Zijlstra      2026-02-04  1726  	long count = preempt_count();
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1727  
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1728  #ifdef CONFIG_LOCKDEP
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1729  	/*
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1730  	 * It is permissible to free the timer from inside the
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1731  	 * function that is called from it, this we need to take into
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1732  	 * account for lockdep too. To avoid bogus "held lock freed"
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1733  	 * warnings as well as problems when looking into
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1734  	 * timer->lockdep_map, make a copy and use that here.
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1735  	 */
4d82a1debbffec kernel/timer.c      Peter Zijlstra      2012-05-15  1736  	struct lockdep_map lockdep_map;
4d82a1debbffec kernel/timer.c      Peter Zijlstra      2012-05-15  1737  
4d82a1debbffec kernel/timer.c      Peter Zijlstra      2012-05-15  1738  	lockdep_copy_map(&lockdep_map, &timer->lockdep_map);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1739  #endif
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1740  	/*
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1741  	 * Couple the lock chain with the lock chain at
9b13df3fb64ee9 kernel/time/timer.c Thomas Gleixner     2022-11-23  1742  	 * timer_delete_sync() by acquiring the lock_map around the fn()
9b13df3fb64ee9 kernel/time/timer.c Thomas Gleixner     2022-11-23  1743  	 * call here and in timer_delete_sync().
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1744  	 */
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1745  	lock_map_acquire(&lockdep_map);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1746  
f28d3d5346e97e kernel/time/timer.c Anna-Maria Gleixner 2019-03-21  1747  	trace_timer_expire_entry(timer, baseclk);
354b46b1a0adda kernel/time/timer.c Kees Cook           2017-10-22  1748  	fn(timer);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1749  	trace_timer_expire_exit(timer);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1750  
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1751  	lock_map_release(&lockdep_map);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1752  
4a2b4b222743bb kernel/timer.c      Peter Zijlstra      2013-08-14  1753  	if (count != preempt_count()) {
d75f773c86a2b8 kernel/time/timer.c Sakari Ailus        2019-03-25 @1754  		WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
4a2b4b222743bb kernel/timer.c      Peter Zijlstra      2013-08-14  1755  			  fn, count, preempt_count());
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1756  		/*
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1757  		 * Restore the preempt count. That gives us a decent
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1758  		 * chance to survive and extract information. If the
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1759  		 * callback kept a lock held, bad luck, but not worse
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1760  		 * than the BUG() we had.
802702e0c26184 kernel/timer.c      Thomas Gleixner     2010-03-12  1761  		 */
4a2b4b222743bb kernel/timer.c      Peter Zijlstra      2013-08-14  1762  		preempt_count_set(count);
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1763  	}
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1764  }
576da126a6c736 kernel/timer.c      Thomas Gleixner     2010-03-12  1765  

:::::: The code at line 1754 was first introduced by commit
:::::: d75f773c86a2b8b7278e2c33343b46a4024bc002 treewide: Switch printk users from %pf and %pF to %ps and %pS, respectively

:::::: TO: Sakari Ailus <sakari.ailus@linux.intel.com>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
