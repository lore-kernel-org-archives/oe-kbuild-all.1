Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C515A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 02:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680228081; x=1711764081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zXATIJzNxirykcpOZ6AYhkadzsrIxw4+jcle0UHkvUw=;
  b=ToU3thhHAUtuOSFQ1COyFDsRLwJDU8M5SX1n3giWrhIvDvio5d4Miq5P
   xmPvyaeR+pIs5U4roUeuyrQvc6vNlBobE3ClQA7kKTiNB0x3aLo9FtdzD
   brrUPuGSQbQT9LZflxJlZ6PMBdBVbexB5giZtRAlotnW3AmWwb0ouDkiW
   +0+bGQAA9Wy1NtffTx9wxZF1cKHkW093hiM7whWvKhd8f6QUnenwyy99n
   T/rDVUKWN2xTRt6/5TtC1MzADRNYMCbaJE81uTJuHPLnd+5YFPN9HAoJe
   UOnkQ7JGOLqLZi3QYfXwLQrJbzuKTJYlOwqAFj59rTvf0BuoeggIhcNpW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321717268"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="321717268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 19:01:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749425939"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="749425939"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2023 19:01:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi44t-000LPO-0l;
	Fri, 31 Mar 2023 02:01:19 +0000
Date: Fri, 31 Mar 2023 10:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Dai <davidai@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] sched/fair: Add util_guest for tasks
Message-ID: <202303310934.4HBBW7CP-lkp@intel.com>
References: <20230330224348.1006691-2-davidai@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330224348.1006691-2-davidai@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kvm/queue]
[also build test ERROR on kvmarm/next tip/sched/core linus/master v6.3-rc4 next-20230330]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-064552
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230330224348.1006691-2-davidai%40google.com
patch subject: [RFC PATCH 1/6] sched/fair: Add util_guest for tasks
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230331/202303310934.4HBBW7CP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46af8d926505b6a0fcfe75ca1063439ae35ba84a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Dai/sched-fair-Add-util_guest-for-tasks/20230331-064552
        git checkout 46af8d926505b6a0fcfe75ca1063439ae35ba84a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310934.4HBBW7CP-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function '__setscheduler_task_util':
>> kernel/sched/core.c:2034:14: error: 'struct sched_entity' has no member named 'avg'
    2034 |         p->se.avg.util_guest = attr->sched_util_min;
         |              ^
--
   kernel/sched/fair.c:688:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     688 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
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
   In file included from ./arch/sh/include/generated/asm/rwonce.h:1,
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
