Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A0764D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738814485; cv=none; b=lcJrwp5R/7q8Rsv9k76nDPucSWCKAtV1CO71HMb38cjdMvSkL2R3aPdhX1WQOCe9HJIsjNR6cQoiitTIcswHbKqqvCWlh9SPgW/tCCQUXoN5fyY6/1o8MAA6wU9OyBzq0QulJuY8EgclqyFXdgKZ+4TnwBKMCYP1X+p4VvrUpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738814485; c=relaxed/simple;
	bh=213zxA3EGaqAgLKa8QoE+8l/VIEmC9+c9hqtuf4Woew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8UwRhg+8uGgYr5X0ZSgQTDw323OyBiS0vJ5NkjfApLG0E5VVq6Uzfhp42n84Ph+csOxVxr6ymKu35ydZLyXQMqh4140gZucO24BWTiDRtTj4uVpreVA72H9sJEzUiKHJpVWVQjgz+zCB7jFpuDmwRpO7Hc/FIkPHALr+A1lSD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1wPcpnM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1wPcpnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738814483; x=1770350483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=213zxA3EGaqAgLKa8QoE+8l/VIEmC9+c9hqtuf4Woew=;
  b=a1wPcpnMH+14+Ev8TnFAMfZvUgdTnjuXFy3HVPPdeuCeR1yUGGZ9/U7d
   rxzGY637/ZTq00vNkKwnEC2vM4jhYHivgnwEj7gUZiG5kROIxTYfflfe8
   oQDxYH/Y3dH48sLinguOdb5mOPk71ed6R9fHh7ApYb88kT/7UmSjV+obM
   +Q1uSVUCYysV4ilhW2/EruBI+hgKgxkDRUZ5xI78sVP7i+Zf3DxvsS7TS
   piBG5DyFYI0W2WiPSHk86y55k/NtEMdWu4rZvu2ILl4p6LzCA77xqzCzk
   nJ7irOFS4tY0swFPAAJVJVHK3jML2+/7dvXoMbpEMYkkdMOpygPBNV2Rh
   A==;
X-CSE-ConnectionGUID: WaqbvD+TTUyky6fR2QoBPw==
X-CSE-MsgGUID: 1YSRYVvuRqObmB2bhAj2Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49648574"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="49648574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 20:01:23 -0800
X-CSE-ConnectionGUID: 3S4O7vV4So2PNimh2p5LdA==
X-CSE-MsgGUID: lXSa0L4tR5+7E6vwOCWpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148289458"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Feb 2025 20:01:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tft4p-000wQV-04;
	Thu, 06 Feb 2025 04:01:19 +0000
Date: Thu, 6 Feb 2025 12:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 17/21]
 include/linux/local_lock_internal.h:32:13: error: use of undeclared
 identifier 'current'
Message-ID: <202502061132.K0WpcCEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   54cd719532c3784e74f9773c6be7005dec2c74bb
commit: e283c1f3a2ae347061eb98f4a3b46af0ed80eded [17/21] locking/local_lock: Support Clang's capability analysis
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250206/202502061132.K0WpcCEC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061132.K0WpcCEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061132.K0WpcCEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_capability-analysis.c:8:
   In file included from include/linux/local_lock.h:5:
>> include/linux/local_lock_internal.h:32:13: error: use of undeclared identifier 'current'
      32 |         l->owner = current;
         |                    ^
   include/linux/local_lock_internal.h:37:34: error: use of undeclared identifier 'current'
      37 |         DEBUG_LOCKS_WARN_ON(l->owner != current);
         |                                         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:59:7: error: call to undeclared function 'local_irq_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      59 |                     local_unlock_irq(_T->lock))
         |                     ^
   include/linux/local_lock.h:43:33: note: expanded from macro 'local_unlock_irq'
      43 | #define local_unlock_irq(lock)          __local_unlock_irq(lock)
         |                                         ^
   include/linux/local_lock_internal.h:111:3: note: expanded from macro '__local_unlock_irq'
     111 |                 local_irq_enable();                             \
         |                 ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:58:7: error: call to undeclared function 'local_irq_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |                     local_lock_irq(_T->lock),
         |                     ^
   include/linux/local_lock.h:22:31: note: expanded from macro 'local_lock_irq'
      22 | #define local_lock_irq(lock)            __local_lock_irq(lock)
         |                                         ^
   include/linux/local_lock_internal.h:88:3: note: expanded from macro '__local_lock_irq'
      88 |                 local_irq_disable();                            \
         |                 ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:62:7: error: call to undeclared function 'local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |                     local_unlock_irqrestore(_T->lock, _T->flags),
         |                     ^
   include/linux/local_lock.h:52:2: note: expanded from macro 'local_unlock_irqrestore'
      52 |         __local_unlock_irqrestore(lock, flags)
         |         ^
   include/linux/local_lock_internal.h:118:3: note: expanded from macro '__local_unlock_irqrestore'
     118 |                 local_irq_restore(flags);                       \
         |                 ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:61:7: error: call to undeclared function 'local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                     local_lock_irqsave(_T->lock, _T->flags),
         |                     ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_irqsave'
      31 |         __local_lock_irqsave(lock, flags)
         |         ^
   include/linux/local_lock_internal.h:95:3: note: expanded from macro '__local_lock_irqsave'
      95 |                 local_irq_save(flags);                          \
         |                 ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |                     local_lock_nested_bh(_T->lock),
         |                     ^
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:375:31: note: expanded from macro 'this_cpu_read_1'
     375 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:136:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     136 |         raw_local_irq_save(___flags);                                   \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:375:31: note: expanded from macro 'this_cpu_read_1'
     375 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:138:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     138 |         raw_local_irq_restore(___flags);                                \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:378:31: note: expanded from macro 'this_cpu_read_2'
     378 | #define this_cpu_read_2(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:136:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     136 |         raw_local_irq_save(___flags);                                   \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:378:31: note: expanded from macro 'this_cpu_read_2'
     378 | #define this_cpu_read_2(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:138:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     138 |         raw_local_irq_restore(___flags);                                \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:381:31: note: expanded from macro 'this_cpu_read_4'
     381 | #define this_cpu_read_4(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:136:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     136 |         raw_local_irq_save(___flags);                                   \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:381:31: note: expanded from macro 'this_cpu_read_4'
     381 | #define this_cpu_read_4(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:138:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     138 |         raw_local_irq_restore(___flags);                                \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_save'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:384:31: note: expanded from macro 'this_cpu_read_8'
     384 | #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:136:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     136 |         raw_local_irq_save(___flags);                                   \
         |         ^
   In file included from lib/test_capability-analysis.c:8:
>> include/linux/local_lock.h:72:7: error: call to undeclared function 'raw_local_irq_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/local_lock.h:66:2: note: expanded from macro 'local_lock_nested_bh'
      66 |         __local_lock_nested_bh(_lock)
         |         ^
   include/linux/local_lock_internal.h:123:3: note: expanded from macro '__local_lock_nested_bh'
     123 |                 lockdep_assert_in_softirq();                    \
         |                 ^
   include/linux/lockdep.h:618:15: note: expanded from macro 'lockdep_assert_in_softirq'
     618 |         WARN_ON_ONCE(__lockdep_enabled                  &&              \
         |                      ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:384:31: note: expanded from macro 'this_cpu_read_8'
     384 | #define this_cpu_read_8(pcp)            this_cpu_generic_read(pcp)
         |                                         ^
   include/asm-generic/percpu.h:148:11: note: expanded from macro 'this_cpu_generic_read'
     148 |                 __ret = __this_cpu_generic_read_noirq(pcp);             \
         |                         ^
   include/asm-generic/percpu.h:138:2: note: expanded from macro '__this_cpu_generic_read_noirq'
     138 |         raw_local_irq_restore(___flags);                                \
         |         ^
   14 errors generated.


vim +/current +32 include/linux/local_lock_internal.h

91710728d1725d Thomas Gleixner 2020-05-27  18  
91710728d1725d Thomas Gleixner 2020-05-27  19  #ifdef CONFIG_DEBUG_LOCK_ALLOC
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  20  # define LOCAL_LOCK_DEBUG_INIT(lockname)		\
91710728d1725d Thomas Gleixner 2020-05-27  21  	.dep_map = {					\
91710728d1725d Thomas Gleixner 2020-05-27  22  		.name = #lockname,			\
91710728d1725d Thomas Gleixner 2020-05-27  23  		.wait_type_inner = LD_WAIT_CONFIG,	\
dfd5e3f5fe27bd Peter Zijlstra  2020-12-09  24  		.lock_type = LD_LOCK_PERCPU,		\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  25  	},						\
d8bbd97ad0b99a Thomas Gleixner 2021-08-15  26  	.owner = NULL,
91710728d1725d Thomas Gleixner 2020-05-27  27  
91710728d1725d Thomas Gleixner 2020-05-27  28  static inline void local_lock_acquire(local_lock_t *l)
91710728d1725d Thomas Gleixner 2020-05-27  29  {
91710728d1725d Thomas Gleixner 2020-05-27  30  	lock_map_acquire(&l->dep_map);
91710728d1725d Thomas Gleixner 2020-05-27  31  	DEBUG_LOCKS_WARN_ON(l->owner);
91710728d1725d Thomas Gleixner 2020-05-27 @32  	l->owner = current;
91710728d1725d Thomas Gleixner 2020-05-27  33  }
91710728d1725d Thomas Gleixner 2020-05-27  34  

:::::: The code at line 32 was first introduced by commit
:::::: 91710728d1725de51d06b40674abf6e860d592c7 locking: Introduce local_lock()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
