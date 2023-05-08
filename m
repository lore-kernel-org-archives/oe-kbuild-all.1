Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84806DDAA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683584506; x=1715120506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vTQ3ZSUboa9aTv//VdIAl9rITrQkoQQDyB4J/u+wCEQ=;
  b=NVk8fU1kRmHqQk+JYVz9NwkRaP+r2WeZbZNFe41d3GK9GyjbLMM7MtIb
   5x31aJI41i4sN3J3aPyk+twkxXTJR8iV0/y/C02LULxfFzechFnvZxUC7
   +YHUcfPUlxGVUinc8YsLcywc3xVJ25qWk+i4bXzi4N8P3gy9MrBGCCe4R
   GB6exLrZJgHDwvCgfhzvozrrkq6vpfUilOYwx+/wIzz+mjZWu4h14c0Nj
   gTZWj93ZgzmYVy6QDJpN9npbUpMohnHyIwL3B01xOzhhwRFuEAzimtXxi
   VwJzJAPDMOLoQ8TiCSRTjrXeI/bw47S712nMHZt755iE0RqLRfpkdrnW+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="352828489"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="352828489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 15:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676213739"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="676213739"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 15:21:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw9El-0001RR-2N;
	Mon, 08 May 2023 22:21:43 +0000
Date: Tue, 9 May 2023 06:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 46/50] kernel/sched/core.c:1976:14: error:
 'struct sched_entity' has no member named 'avg'
Message-ID: <202305090611.KXO0EtRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   e50c14a9ffc09f9bf323426b6c5bea44fddd1bcb
commit: a43d2bc1ca2ae1d7f8ba7fea5e1da454b9421403 [46/50] CHROMIUM: FROMLIST: sched/fair: Add util_guest for tasks
config: arm-randconfig-r046-20230507 (https://download.01.org/0day-ci/archive/20230509/202305090611.KXO0EtRi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout a43d2bc1ca2ae1d7f8ba7fea5e1da454b9421403
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090611.KXO0EtRi-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:1976:14: error: 'struct sched_entity' has no member named 'avg'
    1976 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^
--
   kernel/sched/fair.c:623:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     623 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c: In function 'enqueue_task_fair':
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:314:23: note: in definition of macro '__compiletime_assert'
     314 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:314:23: note: in definition of macro '__compiletime_assert'
     314 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:314:23: note: in definition of macro '__compiletime_assert'
     314 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:314:23: note: in definition of macro '__compiletime_assert'
     314 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:314:23: note: in definition of macro '__compiletime_assert'
     314 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:334:9: note: in expansion of macro '_compiletime_assert'
     334 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/linux/compiler_types.h:291:27: note: in definition of macro '__unqual_scalar_typeof'
     291 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:255,
                    from arch/arm/include/uapi/asm/swab.h:19,
                    from arch/arm/include/asm/swab.h:19,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:5808:28: error: 'struct sched_entity' has no member named 'avg'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |                            ^
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   kernel/sched/fair.c:5808:13: note: in expansion of macro 'READ_ONCE'
    5808 |         if (READ_ONCE(p->se.avg.util_guest))
         |             ^~~~~~~~~


vim +1976 kernel/sched/core.c

  1972	
  1973		if (likely(!(attr->sched_flags & SCHED_FLAG_UTIL_GUEST)))
  1974			return;
  1975	
> 1976		p->se.avg.util_guest = attr->sched_util_min;
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
