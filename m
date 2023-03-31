Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A7823BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680254433; x=1711790433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STAd9w6l6VGg0VH72iBd10fAlaJz7l+QjP25KRcnSBs=;
  b=cO5BdTiwWA+TGZSIZXBcCjqx6UDgt42TUE717gxQnzSG7eojGslBj2JY
   ZBjda2k1sq19MHbrMQ9HH4emZdWVAyZvnsgjxzlVBfmj9TpeghV6CIDOl
   4AMDJo441u9hEaLhhAx/8LlT9zRpvK2L5qzDgNIqSEhU0CBT7plS88WWW
   R87tZDC1e+OnmQO/GjrQDiBe+uo47kTb1BoWTFRfLESveOOtA9ue7Il7z
   rFRK+akdA+pvtglZ++8LEo12Xh1RQtSmzFDelN8mTsLF8RU/tnbF3d9uk
   RK7yQ0R9E0SrbhT/O1E2RtTDn1nmsjzC+ht05MSyyMhCW6Wve5+IxScT0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343063100"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="343063100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 02:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="685060471"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="685060471"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Mar 2023 02:20:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piAvu-000LeC-1E;
	Fri, 31 Mar 2023 09:20:30 +0000
Date: Fri, 31 Mar 2023 17:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Dai <davidai@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/6] sched/fair: Add util_guest for tasks
Message-ID: <202303311702.lGyTiDJn-lkp@intel.com>
References: <20230331014356.1033759-2-davidai@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331014356.1033759-2-davidai@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kvm/queue]
[also build test ERROR on kvmarm/next tip/sched/core linus/master v6.3-rc4 next-20230331]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-094936
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230331014356.1033759-2-davidai%40google.com
patch subject: [RFC PATCH v2 1/6] sched/fair: Add util_guest for tasks
config: csky-randconfig-r006-20230329 (https://download.01.org/0day-ci/archive/20230331/202303311702.lGyTiDJn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/80e880c6cbaadfdac1b7da1672f571d1d7331166
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-094936
        git checkout 80e880c6cbaadfdac1b7da1672f571d1d7331166
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303311702.lGyTiDJn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:2034:14: error: 'struct sched_entity' has no member named 'avg'
    2034 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^
--
   kernel/sched/fair.c:6076:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6076 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:353:27: note: in definition of macro '__unqual_scalar_typeof'
     353 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   In file included from ./arch/csky/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/kernel.h:20,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:6217:28: error: 'struct sched_entity' has no member named 'avg'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:6217:13: note: in expansion of macro 'READ_ONCE'
    6217 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:12500:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12500 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12502:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12502 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12507:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12507 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12509:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12509 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2034 kernel/sched/core.c

  2030	
  2031		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  2032			return;
  2033	
> 2034		p->se.avg.util_guest = attr->sched_util_min;
  2035	}
  2036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
