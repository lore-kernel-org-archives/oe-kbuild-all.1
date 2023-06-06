Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C915ACE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 12:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686053184; x=1717589184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z1WVqlpLuRGsIb6Fdwc1Cm1h3vhkf5cb07vrzkJL13c=;
  b=hfnbsarTANDZHxaOzKzWIe5K87qBbqrSZgolXlN5nYgKvHEYW85jLW1k
   XdXkOWmpbYy/vDf7EktCZlePDTK/TrY3ju6HFabSXjunE7wPdWWepPjV6
   jiBFAgblzDDGl+NOdAYTK8KVFkYzEsHt+ItHINYnAc2X1SdQ0+y+nSKb8
   iw/scQJh/MWmEvKKPSKoi+dZNEiEI46r4QxRmV0anfSfwrc1j7RxZXZMY
   UVe8hErSBi+WAe4tbMx5ImKwhpn6QtnTqXKK+zsDJVWOmS7NkCtLUo3Fj
   bccot1pcWZ4Cn+IcorKi6hUFOMdK40B9edIps0pVGQZlsn0tlqQ42va6C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359104449"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="359104449"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 05:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1039150975"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="1039150975"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2023 05:06:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6VS8-0005D3-3A;
	Tue, 06 Jun 2023 12:06:20 +0000
Date: Tue, 6 Jun 2023 20:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 4/7] include/linux/guards.h:101:9: error:
 implicit declaration of function 'guard_double_rq_lock_init'; did you mean
 'guard_task_rq_lock_init'?
Message-ID: <202306061913.0c70smg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   718ea1d26c96cdbfb623f89189b4eb3f0d48f889
commit: 80d892642a62e09af33f8c43ebcbf9f8918e214c [4/7] sched: Use fancy new guards
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20230606/202306061913.0c70smg0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=80d892642a62e09af33f8c43ebcbf9f8918e214c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout 80d892642a62e09af33f8c43ebcbf9f8918e214c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061913.0c70smg0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:86:
   kernel/sched/sched.h:2797:36: error: expected ')' before 'struct'
    2797 | DEFINE_LOCK_GUARD_2(double_rq_lock, struct rq,
         |                                    ^~~~~~~
         |                                    )
   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'yield_to':
   include/linux/guards.h:73:9: error: unknown type name 'guard_double_rq_lock_t'; did you mean 'guard_task_rq_lock_t'?
      73 |         guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro '__ptr_guard'
      91 |         __ptr_guard(_guard, _name)
         |         ^~~~~~~~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   In file included from include/linux/compiler_types.h:125,
                    from <command-line>:
   include/linux/compiler-gcc.h:132:33: error: cleanup argument not a function
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:90:9: note: in expansion of macro '__diag'
      90 |         __diag(ignored "-Wdeclaration-after-statement")                 \
         |         ^~~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
>> include/linux/guards.h:101:9: error: implicit declaration of function 'guard_double_rq_lock_init'; did you mean 'guard_task_rq_lock_init'? [-Werror=implicit-function-declaration]
     101 |         guard_##_guard##_init(_var)
         |         ^~~~~~
   include/linux/guards.h:104:36: note: in expansion of macro 'guard_init'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |                                    ^~~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   include/linux/compiler-gcc.h:42:45: warning: unused variable '__UNIQUE_ID_guard385' [-Wunused-variable]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/guards.h:73:28: note: in definition of macro '__ptr_guard'
      73 |         guard_##_guard##_t _name __cleanup(guard_##_guard##_cleanup)
         |                            ^~~~~
   include/linux/guards.h:104:9: note: in expansion of macro 'ptr_guard'
     104 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:107:9: note: in expansion of macro 'named_guard'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/guards.h:107:29: note: in expansion of macro '__UNIQUE_ID'
     107 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |                             ^~~~~~~~~~~
   kernel/sched/core.c:8800:17: note: in expansion of macro 'guard'
    8800 |                 guard(double_rq_lock, rq, p_rq);
         |                 ^~~~~
   cc1: some warnings being treated as errors


vim +101 include/linux/guards.h

e19b0467399532 Peter Zijlstra 2023-05-26   99  
e19b0467399532 Peter Zijlstra 2023-05-26  100  #define guard_init(_guard, _var...)					\
e19b0467399532 Peter Zijlstra 2023-05-26 @101  	guard_##_guard##_init(_var)
e19b0467399532 Peter Zijlstra 2023-05-26  102  

:::::: The code at line 101 was first introduced by commit
:::::: e19b0467399532cf5c988bb7ae35b587f3b61ed3 locking: Introduce __cleanup() based guards

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
