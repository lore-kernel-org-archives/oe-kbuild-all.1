Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0038FA3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 00:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473891; cv=none; b=B2OfTJNAa3pcVWecHqqjezjw8SdEPlrt6nJWuHrn9IErmb2o+xZtEt3KBYEYax2c82a2F1rGXrEjL98oXaXOlzs2DYUjUw+kd/RAAGYq6/Mx4d8pFE4NggjeKgRogPu2vlQD22zvjihLBIBj1E12upJacczHEH6k+0CGxWyMgY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473891; c=relaxed/simple;
	bh=oIlRl11TKzaBFc3P5GY9CvKp9tgVEI64TOBxM9vFf3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=seD9hTz+u38c3rkqsDQbhDR76LkmvCBBqBkcW4PVFGnsbrjmzqqvYa1wDRQXu33CzadgBuDVwd+yYe37bg7qZJtb1o5b4Qxow7m27gnz3msZmMEU+LzlnsGrvEf9A69XhlutfurOZ2U0S0xSf9W09QJkg7pcQegIFZBZAipUuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4vRbPg5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4vRbPg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769473889; x=1801009889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oIlRl11TKzaBFc3P5GY9CvKp9tgVEI64TOBxM9vFf3w=;
  b=m4vRbPg5UM1nE+y2K7RCgVWrwbsZu+75g1lLKKoGh9U6+1CYNKTmOZXt
   KZpjhFDzVPcc51rWOLqU8DTFRYjBjHR9WTwCf5liB1W88Ebu2yTOERwab
   ecXK2no14DSUZ3+FiPUkNrvoJzLZ8yeA42DdXzEb2hlKCB3WDJ4BNAx3l
   wXVDBSQKJuSmY+wSogc9H0Z3+HOmo8cDOup8AaXQGfPABkyak4UP7awbX
   PCHsTi/oR24D7mmnLoya05p8RW4dYt9N/79jX1ZHNCUiZeYVcICkXPGOM
   nvKiglHExC6NWjCnWQmfOOYcPe4LwrwqJbCRNqLyDbIOMRC9hX91FcruN
   w==;
X-CSE-ConnectionGUID: 5OnDzGslT72Uc2YYwJQ9eg==
X-CSE-MsgGUID: LkjfswjPTsa5cvPXWLfRBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96122492"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96122492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:31:28 -0800
X-CSE-ConnectionGUID: VsOsXZOLTNmDPktDB1k+wg==
X-CSE-MsgGUID: 9fJyw7mHQiGspdoXKnrHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207626827"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Jan 2026 16:31:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkWzL-000000001e1-39Df;
	Tue, 27 Jan 2026 00:31:23 +0000
Date: Tue, 27 Jan 2026 01:30:38 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/42]
 kernel/time/hrtimer.c:121:63: error: expression in static assertion is not
 constant
Message-ID: <202601270110.jum0a4Ph-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   80461d79725e9de0ffda5d621552a2db3608f64d
commit: 2969d9693803a8bfd1c8bfcf3943af5a920be88f [41/42] hrtimer: Add support for auxiliary clocks
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260127/202601270110.jum0a4Ph-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270110.jum0a4Ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270110.jum0a4Ph-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
>> kernel/time/hrtimer.c:121:63: error: expression in static assertion is not constant
     121 | static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   kernel/time/hrtimer.c:121:1: note: in expansion of macro 'static_assert'
     121 | static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
         | ^~~~~~~~~~~~~


vim +121 kernel/time/hrtimer.c

  > 25	#include <linux/cpu.h>
    26	#include <linux/export.h>
    27	#include <linux/percpu.h>
    28	#include <linux/hrtimer.h>
    29	#include <linux/notifier.h>
    30	#include <linux/syscalls.h>
    31	#include <linux/interrupt.h>
    32	#include <linux/tick.h>
    33	#include <linux/err.h>
    34	#include <linux/debugobjects.h>
    35	#include <linux/sched/signal.h>
    36	#include <linux/sched/sysctl.h>
    37	#include <linux/sched/rt.h>
    38	#include <linux/sched/deadline.h>
    39	#include <linux/sched/nohz.h>
    40	#include <linux/sched/debug.h>
    41	#include <linux/sched/isolation.h>
    42	#include <linux/timer.h>
    43	#include <linux/freezer.h>
    44	#include <linux/compat.h>
    45	
    46	#include <linux/uaccess.h>
    47	
    48	#include <trace/events/timer.h>
    49	
    50	#include "tick-internal.h"
    51	
    52	/*
    53	 * The resolution of the clocks. The resolution value is returned in
    54	 * the clock_getres() system call to give application programmers an
    55	 * idea of the (in)accuracy of timers. Timer values are rounded up to
    56	 * this resolution values.
    57	 */
    58	#define HIGH_RES_NSEC		1
    59	
    60	/*
    61	 * Masks for selecting the soft and hard context timers from
    62	 * cpu_base->active
    63	 */
    64	#define MASK_SHIFT		(HRTIMER_BASE_MONOTONIC_SOFT)
    65	#define HRTIMER_ACTIVE_HARD	((1U << MASK_SHIFT) - 1)
    66	#define HRTIMER_ACTIVE_SOFT	(HRTIMER_ACTIVE_HARD << MASK_SHIFT)
    67	#define HRTIMER_ACTIVE_ALL	(HRTIMER_ACTIVE_SOFT | HRTIMER_ACTIVE_HARD)
    68	
    69	static void retrigger_next_event(void *arg);
    70	static ktime_t __hrtimer_cb_get_time(clockid_t clock_id);
    71	static inline int hrtimer_clockid_to_base(clockid_t clock_id);
    72	
    73	/*
    74	 * The timer bases:
    75	 *
    76	 * There are more clockids than hrtimer bases. Thus, we index
    77	 * into the timer bases by the hrtimer_base_type enum. When trying
    78	 * to reach a base using a clockid, hrtimer_clockid_to_base()
    79	 * is used to convert from clockid to the proper hrtimer_base_type.
    80	 */
    81	#define HRTIMER_CLOCK_BASE(_index, _clockid) \
    82		[(_index)] = { .index = (_index), .clockid = (_clockid) }
    83	
    84	DEFINE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases) =
    85	{
    86		.lock = __RAW_SPIN_LOCK_UNLOCKED(hrtimer_bases.lock),
    87		.clock_base =
    88		{
    89			HRTIMER_CLOCK_BASE(HRTIMER_BASE_MONOTONIC,	CLOCK_MONOTONIC),
    90			HRTIMER_CLOCK_BASE(HRTIMER_BASE_REALTIME,	CLOCK_REALTIME),
    91			HRTIMER_CLOCK_BASE(HRTIMER_BASE_BOOTTIME,	CLOCK_BOOTTIME),
    92			HRTIMER_CLOCK_BASE(HRTIMER_BASE_TAI,		CLOCK_TAI),
    93	#ifdef CONFIG_POSIX_AUX_CLOCKS
    94			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX0,		CLOCK_AUX + 0),
    95			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX1,		CLOCK_AUX + 1),
    96			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX2,		CLOCK_AUX + 2),
    97			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX3,		CLOCK_AUX + 3),
    98			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX4,		CLOCK_AUX + 4),
    99			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX5,		CLOCK_AUX + 5),
   100			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX6,		CLOCK_AUX + 6),
   101			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX7,		CLOCK_AUX + 7),
   102	#endif /* CONFIG_POSIX_AUX_CLOCKS */
   103			HRTIMER_CLOCK_BASE(HRTIMER_BASE_MONOTONIC_SOFT,	CLOCK_MONOTONIC),
   104			HRTIMER_CLOCK_BASE(HRTIMER_BASE_REALTIME_SOFT,	CLOCK_REALTIME),
   105			HRTIMER_CLOCK_BASE(HRTIMER_BASE_BOOTTIME_SOFT,	CLOCK_BOOTTIME),
   106			HRTIMER_CLOCK_BASE(HRTIMER_BASE_TAI_SOFT,	CLOCK_TAI),
   107	#ifdef CONFIG_POSIX_AUX_CLOCKS
   108			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX0_SOFT,	CLOCK_AUX + 0),
   109			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX1_SOFT,	CLOCK_AUX + 1),
   110			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX2_SOFT,	CLOCK_AUX + 2),
   111			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX3_SOFT,	CLOCK_AUX + 3),
   112			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX4_SOFT,	CLOCK_AUX + 4),
   113			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX5_SOFT,	CLOCK_AUX + 5),
   114			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX6_SOFT,	CLOCK_AUX + 6),
   115			HRTIMER_CLOCK_BASE(HRTIMER_BASE_AUX7_SOFT,	CLOCK_AUX + 7),
   116	#endif /* CONFIG_POSIX_AUX_CLOCKS */
   117		},
   118		.csd = CSD_INIT(retrigger_next_event, NULL)
   119	};
   120	
 > 121	static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
