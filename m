Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B5424212
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9ZaOemP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698167301; x=1729703301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3PedOvQB7PeECj7IyvVGDw8p5iBWo1h2SsC5PjG19lo=;
  b=G9ZaOemPmFWRVKQyHh+6XtFDv4X8i06QSWRi6vKCzpuX13lCy8f3qKcy
   lWATZfDJXFxgIkGQM5tV3JEaNswDWhkl6W1Oy+UNDf+4TgciD1EjelU9E
   WSBzjt3nevgm+XLvYCH7yR5Xz+/svXDfKODHk0+kKw7H2UqdQs00M8o4P
   iIUD0Qr01Rvrxha2YGYrwVxvUBUl+Qp/Yhubs0cKFXTdrvZDTQFkw0+Hl
   JMJCQzG9nFwWBVNjpjZlFlI9NiQCJ8fshZCMlot4vNPdML5iMt4v5zDDD
   p1joNXrK93/THP/11gZtCxlCzvMeq+D5nD6qX06aqUUUC5sS7eFB3Enc1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453588229"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="453588229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 10:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="6242167"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2023 10:06:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvKt0-000849-2h;
	Tue, 24 Oct 2023 17:08:10 +0000
Date: Wed, 25 Oct 2023 01:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, kent.overstreet@linux.dev,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	ldufour@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	tj@kernel.org
Subject: Re: [PATCH v2 33/39] mm: vmalloc: Enable memory allocation profiling
Message-ID: <202310250044.EcVcVHW4-lkp@intel.com>
References: <20231024134637.3120277-34-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024134637.3120277-34-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on kees/for-next/hardening linus/master v6.6-rc7]
[cannot apply to akpm-mm/mm-everything next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20231024-215116
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231024134637.3120277-34-surenb%40google.com
patch subject: [PATCH v2 33/39] mm: vmalloc: Enable memory allocation profiling
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310250044.EcVcVHW4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250044.EcVcVHW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250044.EcVcVHW4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:12,
                    from include/linux/vmalloc.h:6,
                    from include/asm-generic/io.h:994,
                    from arch/sparc/include/asm/io.h:22,
                    from arch/sparc/vdso/vclock_gettime.c:18:
>> arch/sparc/include/asm/current.h:18:30: warning: call-clobbered register used for global register variable
      18 | register struct task_struct *current asm("g4");
         |                              ^~~~~~~
   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:30,
                    from arch/sparc/vdso/vclock_gettime.c:15:
   include/linux/seqlock.h: In function '__seqprop_assert':
   arch/sparc/include/asm/percpu_64.h:19:25: error: '__local_per_cpu_offset' undeclared (first use in this function); did you mean 'per_cpu_offset'?
      19 | #define __my_cpu_offset __local_per_cpu_offset
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:644:9: note: in expansion of macro 'WARN_ON_ONCE'
     644 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)   &&              \
         |         ^~~~~~~~~~~~
   include/linux/compiler_types.h:413:9: note: in expansion of macro '__compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:127:18: note: in expansion of macro 'READ_ONCE'
     127 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                  ^~~~~~~~~
   include/linux/percpu-defs.h:231:9: note: in expansion of macro 'RELOC_HIDE'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |         ^~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: in expansion of macro 'SHIFT_PERCPU_PTR'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                               ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:53: note: in expansion of macro '__my_cpu_offset'
      44 | #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
         |                                                     ^~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:9: note: in expansion of macro 'arch_raw_cpu_ptr'
     242 |         arch_raw_cpu_ptr(ptr);                                          \
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:127:29: note: in expansion of macro 'raw_cpu_ptr'
     127 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                             ^~~~~~~~~~~
   include/asm-generic/percpu.h:146:25: note: in expansion of macro '__this_cpu_generic_read_nopreempt'
     146 |                 __ret = __this_cpu_generic_read_nopreempt(pcp);         \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:375:41: note: in expansion of macro 'this_cpu_generic_read'
     375 | #define this_cpu_read_1(pcp)            this_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:30: note: in expansion of macro 'this_cpu_read_1'
     321 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~
   include/linux/percpu-defs.h:489:41: note: in expansion of macro '__pcpu_size_call_return'
     489 | #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:611:50: note: in expansion of macro 'this_cpu_read'
     611 | #define __lockdep_enabled       (debug_locks && !this_cpu_read(lockdep_recursion))
         |                                                  ^~~~~~~~~~~~~
   include/linux/lockdep.h:645:22: note: in expansion of macro '__lockdep_enabled'
     645 |                      __lockdep_enabled                  &&              \
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/seqlock.h:269:9: note: in expansion of macro 'lockdep_assert_preemption_disabled'
     269 |         lockdep_assert_preemption_disabled();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/percpu_64.h:19:25: note: each undeclared identifier is reported only once for each function it appears in
      19 | #define __my_cpu_offset __local_per_cpu_offset
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/linux/lockdep.h:644:9: note: in expansion of macro 'WARN_ON_ONCE'
     644 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)   &&              \
         |         ^~~~~~~~~~~~
   include/linux/compiler_types.h:413:9: note: in expansion of macro '__compiletime_assert'
     413 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:127:18: note: in expansion of macro 'READ_ONCE'
     127 |         ___ret = READ_ONCE(*raw_cpu_ptr(&(pcp)));                       \
         |                  ^~~~~~~~~
   include/linux/percpu-defs.h:231:9: note: in expansion of macro 'RELOC_HIDE'
     231 |         RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
         |         ^~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: in expansion of macro 'SHIFT_PERCPU_PTR'


vim +18 arch/sparc/include/asm/current.h

^1da177e4c3f41 include/asm-sparc/current.h Linus Torvalds  2005-04-16  16  
ba89f59ab825d4 include/asm-sparc/current.h David S. Miller 2007-11-16  17  #ifdef CONFIG_SPARC64
ba89f59ab825d4 include/asm-sparc/current.h David S. Miller 2007-11-16 @18  register struct task_struct *current asm("g4");
ba89f59ab825d4 include/asm-sparc/current.h David S. Miller 2007-11-16  19  #endif
^1da177e4c3f41 include/asm-sparc/current.h Linus Torvalds  2005-04-16  20  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
