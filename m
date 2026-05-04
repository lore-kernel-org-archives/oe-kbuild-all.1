Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F51EEA3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777874716; cv=none; b=QykVyQ3vc67AskdGvqWHTqjSy6ZWIxi1FOcEIte96tEVrMiKq+CeZg+u4+GNQ7bxkJII/Oxm9NEr1Rtmy1ZORfNsBkVzStptTEtDYDLmkehn+mtjMBBDxyGladqS40ecVHb2QnYGnQceYMYiNYSI+kg/JB4rUqlBpdqARn+wpQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777874716; c=relaxed/simple;
	bh=61U9NgOEKTRMz60Bn6VssmLpBzvaSs4cSD4KE3LwyjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZgnHhye9k2pEISsm0ZLtdMWXN7d6B0CSyJj0qpokH9AFKWzSvYHGaSf9bVyBFubkXZQmVK2lpDtoM4yKGTmbgEIWLQ9LlOLj7zAOqhBXyGYnkiJkoX1M524SSFDQwqwD3zBYQiWuNdkT1ahmm7Z9WGJsr8p08ISHvaqTxNxPIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URzAOIGi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URzAOIGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777874715; x=1809410715;
  h=date:from:to:cc:subject:message-id;
  bh=61U9NgOEKTRMz60Bn6VssmLpBzvaSs4cSD4KE3LwyjA=;
  b=URzAOIGiGZdnhMpNaAW4JwyVJuLUhxyI04v83EfpaS/zP307pkO5lxTA
   chvmxxShL3dQeKsm5lU9zHkNF/jbb44aA7aIuFGfXK9bJq359qY5RfmBL
   hMZDahGCB7WRiC4uAt8yyBZgMEJuHQh3iQIwPc77wE6CpLUm7V7WzoSCn
   wOaWRJzgBZyz2Uooxe8hlw7SlzrMNj2v3DjXjlY53OhFqXGVWPwRcX9p+
   YEO7oD4MxiAm6ld08UEuSxqO3fm9/WRBG2h4NSlOVE0xju2U9BTdJtC6J
   iv2zspjQUZ2va1ugeFgMybFsinm+AkMDxSAho5asLOguaBC3uSqoIWw0g
   g==;
X-CSE-ConnectionGUID: I9Xxciz7T+GrLdwfNf+ozw==
X-CSE-MsgGUID: TbYrFv12T/aL49uepUcXiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89314902"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89314902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:05:14 -0700
X-CSE-ConnectionGUID: pzFGNFoATuejR6Sb8NCCgQ==
X-CSE-MsgGUID: mdQX8APXQWO8k21cOE5HFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="240414548"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2026 23:05:12 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJmQU-000000003XN-0qNH;
	Mon, 04 May 2026 06:05:07 +0000
Date: Mon, 04 May 2026 14:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] kernel/sched/core.c:9167:6: error:
 conflicting types for '__cant_sleep'; have 'void(const char *, int,  long
 int)'
Message-ID: <202605041449.W95XqAgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   25f8ae3956f6e747f0eedaca70ed975a79068ec4
commit: 06213534538c49fcab99613e767100580c940910 [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: nios2-randconfig-002-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041449.W95XqAgd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041449.W95XqAgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041449.W95XqAgd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/kernel_stat.h:5,
                    from kernel/softirq.c:13:
   kernel/softirq.c: In function 'handle_softirqs':
>> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:554:16: note: in expansion of macro 'KERN_ERR'
     554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   kernel/softirq.c:636:25: note: in expansion of macro 'pr_err'
     636 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
         |                         ^~~~~~
--
>> kernel/sched/core.c:9167:6: error: conflicting types for '__cant_sleep'; have 'void(const char *, int,  long int)'
    9167 | void __cant_sleep(const char *file, int line, long preempt_offset)
         |      ^~~~~~~~~~~~
   In file included from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64,
                    from include/linux/sched.h:37,
                    from kernel/sched/core.c:11:
   include/linux/kernel.h:75:13: note: previous declaration of '__cant_sleep' with type 'void(const char *, int,  int)'
      75 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/nios2/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/core.c:11:
   kernel/sched/core.c:9193:19: error: conflicting types for '__cant_sleep'; have 'void(const char *, int,  long int)'
    9193 | EXPORT_SYMBOL_GPL(__cant_sleep);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/sched/core.c:9193:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    9193 | EXPORT_SYMBOL_GPL(__cant_sleep);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:64,
                    from include/linux/sched.h:37,
                    from kernel/sched/core.c:11:
   include/linux/kernel.h:75:13: note: previous declaration of '__cant_sleep' with type 'void(const char *, int,  int)'
      75 | extern void __cant_sleep(const char *file, int line, int preempt_offset);
         |             ^~~~~~~~~~~~
--
   In file included from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
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


vim +9167 kernel/sched/core.c

  9166	
> 9167	void __cant_sleep(const char *file, int line, long preempt_offset)
  9168	{
  9169		static unsigned long prev_jiffy;
  9170	
  9171		if (irqs_disabled())
  9172			return;
  9173	
  9174		if (!IS_ENABLED(CONFIG_PREEMPT_COUNT))
  9175			return;
  9176	
  9177		if (preempt_count() > preempt_offset)
  9178			return;
  9179	
  9180		if (time_before(jiffies, prev_jiffy + HZ) && prev_jiffy)
  9181			return;
  9182		prev_jiffy = jiffies;
  9183	
  9184		printk(KERN_ERR "BUG: assuming atomic context at %s:%d\n", file, line);
  9185		printk(KERN_ERR "in_atomic(): %d, irqs_disabled(): %d, pid: %d, name: %s\n",
  9186				in_atomic(), irqs_disabled(),
  9187				current->pid, current->comm);
  9188	
  9189		debug_show_held_locks(current);
  9190		dump_stack();
  9191		add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
  9192	}
  9193	EXPORT_SYMBOL_GPL(__cant_sleep);
  9194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
