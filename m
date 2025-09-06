Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8738F245022
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757173741; cv=none; b=uuBXhfOHW//jKc9ScbNVmtEP/XPbRZ9nP6nA2oBxe6Be2iyxbgICa1AzoIV8j4B47QteLDSdhUzRqmR2es0sdkcsirlxd+GjbzHOnkIKGe8qL0RQddrlzo264IEzIRzsW6CZS98v8f+si5Uj66sVnX9NaqFog2fGtQPgeSoUGng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757173741; c=relaxed/simple;
	bh=43RwbcUq8xMQgPqpKalWBFfcktEWCKP/YblLWhwp7iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJjhAe5sn8P81SdibhcTZss+RTLpE92K5xkd4u2TaH3d9kjY2TEVXGwCm8UvoUYo5XMSRPG1SCO9XMkVlK6Wn4kqMb3u/Sk8z/RsvetL0kI0yLBjoyKjycedITAUu9+QyIQ4+SbEYI/eKJgoSeo/fBfLNzhjGMqIoISgYEOWL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/M/Z2X2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/M/Z2X2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757173739; x=1788709739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43RwbcUq8xMQgPqpKalWBFfcktEWCKP/YblLWhwp7iA=;
  b=S/M/Z2X2h64tU9/ULb/ntCaGl7QOQxPM3pj78ax+MSwvB7oLce8b4TlY
   LL+wUMQNKjiPggBrMzOCbJUpZ0Aea8QjpYhk6ni+TqRCj1VkToXcshLqG
   RVk061d+Ubev5oIiqmB9os/TmY9SWtSPOpjD2DXY+0v/IngLg41k4DpZl
   FmcVUBwHoXrseLkEXEgcYDTiXQORFcMDvfxuKsi1kbiFAGjf+YTF/qxCe
   jTyJJ6YIlAw/MEt57q1k69hU3iqyVukzDjkK3PCWYg22n+MXXXHeJjGVq
   DB8TnYiCdCaQrgNE47jwDXEEAmDG1fHs4GY09ipj3NuVtloqFhKibhttj
   w==;
X-CSE-ConnectionGUID: rZw9htueRzqLxIpSUoyMhQ==
X-CSE-MsgGUID: WU+onj7RSDy3VfuPJErCag==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="63134055"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="63134055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 08:48:59 -0700
X-CSE-ConnectionGUID: WO0g/3maQB69EJlXYwmcPQ==
X-CSE-MsgGUID: RR+YssVgSlquC2hTDQ7Bbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="172760257"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2025 08:48:57 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuv9r-0001at-1W;
	Sat, 06 Sep 2025 15:48:55 +0000
Date: Sat, 6 Sep 2025 23:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/20]
 include/rv/ha_monitor.h:124:36: error: section attribute cannot be specified
 for local variables
Message-ID: <202509062333.9YKfkhXX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   d0a99d11f00051b8cee88d40d9a29a4a315d0d09
commit: d0a99d11f00051b8cee88d40d9a29a4a315d0d09 [20/20] rv: Add deadline monitors
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250906/202509062333.9YKfkhXX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062333.9YKfkhXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062333.9YKfkhXX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/sh/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:19,
                    from arch/sh/include/asm/cmpxchg-irq.h:5,
                    from arch/sh/include/asm/cmpxchg.h:21,
                    from arch/sh/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/sh/include/asm/bitops.h:23,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/interrupt.h:6,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from kernel/trace/rv/monitors/nomiss/nomiss.c:2:
   include/rv/ha_monitor.h: In function '__ha_ktime_cache':
   include/linux/percpu-defs.h:91:40: error: section attribute cannot be specified for local variables
      91 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:114:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     114 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:92:33: error: section attribute cannot be specified for local variables
      92 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:114:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     114 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
>> include/linux/percpu-defs.h:92:33: error: declaration of '__pcpu_unique_ktime_cache' with no linkage follows extern declaration
      92 |         __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
         |                                 ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:114:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     114 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:91:40: note: previous declaration of '__pcpu_unique_ktime_cache' with type 'char'
      91 |         extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
         |                                        ^~~~~~~~~~~~~~
   include/linux/percpu-defs.h:114:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     114 |         DEFINE_PER_CPU_SECTION(type, name, "")
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
>> include/rv/ha_monitor.h:124:36: error: section attribute cannot be specified for local variables
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:93:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      93 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
>> include/rv/ha_monitor.h:124:36: error: section attribute cannot be specified for local variables
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
>> include/rv/ha_monitor.h:124:36: error: weak declaration of 'ktime_cache' must be public
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
>> include/rv/ha_monitor.h:124:36: error: declaration of 'ktime_cache' with no linkage follows extern declaration
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:94:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      94 |         __PCPU_ATTRS(sec) __weak __typeof__(type) name
         |                                                   ^~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
   include/rv/ha_monitor.h:124:36: note: previous declaration of 'ktime_cache' with type 'u64' {aka 'long long unsigned int'}
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:93:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      93 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   include/rv/ha_monitor.h:124:16: note: in expansion of macro 'DEFINE_PER_CPU'
     124 |         static DEFINE_PER_CPU(u64, ktime_cache);
         |                ^~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:7:
   include/rv/ha_monitor.h: In function 'ha_check_invariant_jiffy':
   include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
      12 |         (void)(&__dummy == &__dummy2); \
         |                         ^~
   include/linux/jiffies.h:128:10: note: in expansion of macro 'typecheck'
     128 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/rv/ha_monitor.h:348:16: note: in expansion of macro 'time_after'
     348 |         return time_after(READ_ONCE(ha_mon->env_store[env]), jiffies);
         |                ^~~~~~~~~~


vim +124 include/rv/ha_monitor.h

119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  108  
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  109  /*
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  110   * ktime_get_ns is expensive, since we usually don't require precise accounting
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  111   * of changes within the same event, cache the current time at the beginning of
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  112   * the constraint handler and use the cache for subsequent calls.
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  113   * Use a static per-cpu variable to avoid changing all function prototypes of
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  114   * _ns functions to pass the cache around.
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  115   * Can be disabled per-monitor with HA_SKIP_KTIME_CACHE. Monitors without ns
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  116   * clocks automatically skip this.
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  117   */
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  118  #ifdef HA_SKIP_KTIME_CACHE
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  119  #define ha_set_ktime_cache()
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  120  #define ha_get_ktime_cache() ktime_get_ns()
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  121  #else
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  122  static inline u64 __ha_ktime_cache(bool set)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  123  {
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13 @124  	static DEFINE_PER_CPU(u64, ktime_cache);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  125  
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  126  	if (set)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  127  		this_cpu_write(ktime_cache, ktime_get_ns());
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  128  	return this_cpu_read(ktime_cache);
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  129  }
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  130  #define ha_set_ktime_cache() ((void)__ha_ktime_cache(true))
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  131  #define ha_get_ktime_cache() __ha_ktime_cache(false)
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  132  #endif /* HA_SKIP_KTIME_CACHE */
119cf0b7b4fcf8 Gabriele Monaco 2025-05-13  133  

:::::: The code at line 124 was first introduced by commit
:::::: 119cf0b7b4fcf8d8a1248d7d9620b9e292559008 rv: Add Hybrid Automata monitor type

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
