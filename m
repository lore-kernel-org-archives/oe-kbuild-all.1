Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C3029A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 06:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733206611; cv=none; b=gRCANQjuiOWe7M3rN+msloR0dsTtnM5TU0ZIUclmR6lLLL7r3WY4dHY4ezVwH1GU33vz/LJzMMKpc75+i4aOA0bRxYV3vLN+0dizYz+KdOoYqClmtke5tUHohBqSww+Ev6Aw8xzXgj65glXEoOHAR26XyW8ELArj2X3IJSsL21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733206611; c=relaxed/simple;
	bh=NDrnABWomb3zNNg4ExofUtXNEkGI9qJKJUo/6FC6+0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RwJqmY0HvlOAiVu8l/Ayt6x/u3h86Avn/MyyJ89aoLkYTsLhT7YiEwyaObqvNzH5CxhuSqZypkZhgjyPR5mQYAs283BOVnzGaLRtughEibTl5nytUGdT/qN+oHyGORv3qjGxpqHmbMp8KtYoeVNPKXiq5LN7kMJDIOT44q/G+Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIgvDXWw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIgvDXWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733206608; x=1764742608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDrnABWomb3zNNg4ExofUtXNEkGI9qJKJUo/6FC6+0o=;
  b=hIgvDXWw4/XhkOhBWetEP/dYxMAvvLP4JZ7fPMf8FVKlK22tU1r5OtGB
   sj4rbVEgEpnuoWiiNWuUG5q0Q/jGFeSTZqEvSMxPcZ6R+MFRVBJDTBO1y
   snS2gVJAZ7MUOtWhdZ/kXvojbboQyEfUFJlgc0mMMN6QLQoCiRMdUyrt1
   BwZVbTE9uNDBbVOgkV7/TvjmS3Vi11xxAr/4muEQBzSwmWuPF8Fb0GCp/
   2NPXSIaUu/JPr8+orkflaPy7RgDgbfAOMcx9xnp/koTaKpPd4qLeyCUY+
   Ftmy1kWgepHKgCN6p/Y9wZ8Sm+5jBAFLF1/NhxJvsncFAUZs9Zi9bsNq/
   A==;
X-CSE-ConnectionGUID: K3YVtq9gQk+vkb4u49wJMw==
X-CSE-MsgGUID: 3GzNSKu2QU+w0AIGIJGrRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33323960"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33323960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:16:48 -0800
X-CSE-ConnectionGUID: hVnRTzNGSF+BPe/+k165uQ==
X-CSE-MsgGUID: GtssbvWdTxiAMIVuHEyKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97396963"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 22:16:47 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIMDE-0000D7-1k;
	Tue, 03 Dec 2024 06:16:44 +0000
Date: Tue, 3 Dec 2024 14:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 include/linux/android_kabi.h:43:17: error: static assertion failed:
 "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8
 __attribute__((__aligned__(8)))
 android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
Message-ID: <202412031408.YivwsbGS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   fa2752f439942a680289ebfcc83a4ae05282e5a7
commit: d66e9166bfa175691dd2d0ad7f65c9fec54aa520 [4/4] ANDROID: fix ABI-break in struct cgroup_root
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20241203/202412031408.YivwsbGS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031408.YivwsbGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031408.YivwsbGS-lkp@intel.com/

Note: the android-common/android15-6.6 HEAD fa2752f439942a680289ebfcc83a4ae05282e5a7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from init/main.c:17:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/sched/signal.h:7,
                    from include/linux/oom.h:6,
                    from mm/oom_kill.c:21:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:426:6: warning: no previous prototype for 'dump_tasks' [-Wmissing-prototypes]
     426 | void dump_tasks(struct oom_control *oc)
         |      ^~~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/vmscan.c:15:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1043:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    1043 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
--
   In file included from include/linux/dcache.h:17,
                    from include/linux/fs.h:8,
                    from mm/shmem.c:24:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/shmem.c:2196:12: warning: no previous prototype for 'shmem_fault' [-Wmissing-prototypes]
    2196 | vm_fault_t shmem_fault(struct vm_fault *vmf)
         |            ^~~~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from mm/workingset.c:8:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/workingset.c:210:6: warning: no previous prototype for 'unpack_shadow' [-Wmissing-prototypes]
     210 | void unpack_shadow(void *shadow, int *memcgidp, pg_data_t **pgdat,
         |      ^~~~~~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from include/linux/clk.h:14,
                    from lib/vsprintf.c:22:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/energy_model.h:5,
                    from kernel/sched/fair.c:23:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5425:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    5425 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:13216:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13216 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13218:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13218 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13223:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13223 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13225:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13225 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from kernel/power/wakeup_reason.c:20:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/power/wakeup_reason.c: In function '__log_abort_or_abnormal_wake':
   kernel/power/wakeup_reason.c:234:9: warning: function '__log_abort_or_abnormal_wake' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     234 |         vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
         |         ^~~~~~~~~
--
   In file included from include/linux/timer.h:10,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
>> include/linux/android_kabi.h:43:17: error: static assertion failed: "include/linux/cgroup-defs.h:588: struct callback_head rcu is larger than u8 __attribute__((__aligned__(8))) android_backport_reserved1[CGROUP_SUBSYS_COUNT * sizeof(atomic_t)]"
      43 |                 _Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}), \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:67:17: note: in expansion of macro '__ANDROID_KABI_CHECK_SIZE_ALIGN'
      67 |                 __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new);   \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:157:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     157 |         _ANDROID_KABI_REPLACE(_ANDROID_BACKPORT_RESERVE_ARRAY(number, bytes), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cgroup-defs.h:588:9: note: in expansion of macro 'ANDROID_BACKPORT_USE_ARRAY'
     588 |         ANDROID_BACKPORT_USE_ARRAY(1, CGROUP_SUBSYS_COUNT * sizeof(atomic_t),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')


vim +43 include/linux/android_kabi.h

804873a198f8dcb Greg Kroah-Hartman 2020-03-11  36  
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  37  /*
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  38   * Worker macros, don't use these, use the ones without a leading '_'
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  39   */
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  40  
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  41  #define __ANDROID_KABI_CHECK_SIZE_ALIGN(_orig, _new)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  42  	union {									\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11 @43  		_Static_assert(sizeof(struct{_new;}) <= sizeof(struct{_orig;}),	\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  44  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  45  			       __stringify(_new)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  46  			       " is larger than "				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  47  			       __stringify(_orig) );				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  48  		_Static_assert(__alignof__(struct{_new;}) <= __alignof__(struct{_orig;}),	\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  49  			       __FILE__ ":" __stringify(__LINE__) ": "		\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  50  			       __stringify(_orig)				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  51  			       " is not aligned the same as "			\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  52  			       __stringify(_new) );				\
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  53  	}
804873a198f8dcb Greg Kroah-Hartman 2020-03-11  54  

:::::: The code at line 43 was first introduced by commit
:::::: 804873a198f8dcb3f9c414ab5dcf40a1fd14b918 ANDROID: GKI: add android_kabi.h

:::::: TO: Greg Kroah-Hartman <gregkh@google.com>
:::::: CC: Jaskaran Singh <quic_jasksing@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
