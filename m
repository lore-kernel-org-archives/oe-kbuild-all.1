Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60FA182
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 00:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675817923; x=1707353923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhHIa39DjFK5eoW8OEmjJbe6deQE7rp5Mf0z818j30k=;
  b=cwYW6wtm4qErUDtL1z0Pyl7opp227DVznCe2cLg0fAs5ZLpuWup5bZ5K
   AJlCfzXgLZ99geMJXl9MjRrsDqu3DRuJgeForNOslxdoPameXjJs7ygO6
   1z9FiYoCM9MdKiWoGCOvhFxkI3LCezvywlD/ddozQtwLEIaYvUomy8+Ny
   eOul2zg/2k9JmJXJpJTiAYdseUK5V/X/Cnl2l2KY/gaZ2j+tXnuu/dqZ6
   Ddslu4ld2lK/oBS+mXwpH0YWgWhXg8kJAPPuVogW7fM4ZP19XiyBi0Nxz
   R4EXa+sBAiRWsShKLK0o7gQa2gAt2aIpR4Ekc3T9ooQSPzkDmhiFks+8F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394264299"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="394264299"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 16:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="699450981"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="699450981"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2023 16:58:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPYnJ-00041O-0G;
	Wed, 08 Feb 2023 00:58:41 +0000
Date: Wed, 8 Feb 2023 08:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandan.babu@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chandanr:dio-inode-completion-chain 1/1]
 include/linux/spinlock.h:403:29: error: inlining failed in call to
 'always_inline' 'spin_unlock_irqrestore': target specific option mismatch
Message-ID: <202302080803.ZXmIkRDU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chandanr/linux dio-inode-completion-chain
head:   5f08e3ed4dcab37394794c13e3b79402ca05f3ca
commit: 5f08e3ed4dcab37394794c13e3b79402ca05f3ca [1/1] changes
config: sh-randconfig-c042-20230205 (https://download.01.org/0day-ci/archive/20230208/202302080803.ZXmIkRDU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/chandanr/linux/commit/5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        git remote add chandanr https://github.com/chandanr/linux
        git fetch --no-tags chandanr dio-inode-completion-chain
        git checkout 5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from fs/xfs/kmem.h:9,
                    from fs/xfs/xfs_linux.h:24,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_aops.c:7:
   include/linux/spinlock.h: In function 'xfs_end_dio':
>> include/linux/spinlock.h:403:29: error: inlining failed in call to 'always_inline' 'spin_unlock_irqrestore': target specific option mismatch
     403 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_aops.c:190:9: note: called from here
     190 |         spin_unlock_irqrestore(&ip->i_dio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/spinlock.h:323:40: error: inlining failed in call to 'always_inline' 'spinlock_check': target specific option mismatch
     323 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
         |                                        ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:313:
   include/linux/spinlock.h:380:31: note: called from here
     380 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
   include/linux/spinlock_api_up.h:28:32: note: in definition of macro '___LOCK'
      28 |   do { __acquire(lock); (void)(lock); } while (0)
         |                                ^~~~
   include/linux/spinlock_api_up.h:40:31: note: in expansion of macro '__LOCK'
      40 |   do { local_irq_save(flags); __LOCK(lock); } while (0)
         |                               ^~~~~~
   include/linux/spinlock_api_up.h:69:49: note: in expansion of macro '__LOCK_IRQSAVE'
      69 | #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, flags)
         |                                                 ^~~~~~~~~~~~~~
   include/linux/spinlock.h:265:17: note: in expansion of macro '_raw_spin_lock_irqsave'
     265 |                 _raw_spin_lock_irqsave(lock, flags);    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:380:9: note: in expansion of macro 'raw_spin_lock_irqsave'
     380 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_aops.c:188:9: note: in expansion of macro 'spin_lock_irqsave'
     188 |         spin_lock_irqsave(&ip->i_dio_lock, flags);
         |         ^~~~~~~~~~~~~~~~~


vim +403 include/linux/spinlock.h

342a93247e0837 Thomas Gleixner 2021-08-15  318  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  319  /*
c2f21ce2e31286 Thomas Gleixner 2009-12-02  320   * Map the spin_lock functions to the raw variants for PREEMPT_RT=n
c2f21ce2e31286 Thomas Gleixner 2009-12-02  321   */
c2f21ce2e31286 Thomas Gleixner 2009-12-02  322  
3490565b633c70 Denys Vlasenko  2015-07-13 @323  static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  324  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  325  	return &lock->rlock;
c2f21ce2e31286 Thomas Gleixner 2009-12-02  326  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  327  
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  328  #ifdef CONFIG_DEBUG_SPINLOCK
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  329  
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  330  # define spin_lock_init(lock)					\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  331  do {								\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  332  	static struct lock_class_key __key;			\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  333  								\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  334  	__raw_spin_lock_init(spinlock_check(lock),		\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  335  			     #lock, &__key, LD_WAIT_CONFIG);	\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  336  } while (0)
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  337  
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  338  #else
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  339  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  340  # define spin_lock_init(_lock)			\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  341  do {						\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  342  	spinlock_check(_lock);			\
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  343  	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  344  } while (0)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  345  
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  346  #endif
de8f5e4f2dc1f0 Peter Zijlstra  2020-03-21  347  
3490565b633c70 Denys Vlasenko  2015-07-13  348  static __always_inline void spin_lock(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  349  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  350  	raw_spin_lock(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  351  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  352  
3490565b633c70 Denys Vlasenko  2015-07-13  353  static __always_inline void spin_lock_bh(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  354  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  355  	raw_spin_lock_bh(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  356  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  357  
3490565b633c70 Denys Vlasenko  2015-07-13  358  static __always_inline int spin_trylock(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  359  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  360  	return raw_spin_trylock(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  361  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  362  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  363  #define spin_lock_nested(lock, subclass)			\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  364  do {								\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  365  	raw_spin_lock_nested(spinlock_check(lock), subclass);	\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  366  } while (0)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  367  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  368  #define spin_lock_nest_lock(lock, nest_lock)				\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  369  do {									\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  370  	raw_spin_lock_nest_lock(spinlock_check(lock), nest_lock);	\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  371  } while (0)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  372  
3490565b633c70 Denys Vlasenko  2015-07-13  373  static __always_inline void spin_lock_irq(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  374  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  375  	raw_spin_lock_irq(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  376  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  377  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  378  #define spin_lock_irqsave(lock, flags)				\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  379  do {								\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  380  	raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  381  } while (0)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  382  
c2f21ce2e31286 Thomas Gleixner 2009-12-02  383  #define spin_lock_irqsave_nested(lock, flags, subclass)			\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  384  do {									\
c2f21ce2e31286 Thomas Gleixner 2009-12-02  385  	raw_spin_lock_irqsave_nested(spinlock_check(lock), flags, subclass); \
c2f21ce2e31286 Thomas Gleixner 2009-12-02  386  } while (0)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  387  
3490565b633c70 Denys Vlasenko  2015-07-13  388  static __always_inline void spin_unlock(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  389  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  390  	raw_spin_unlock(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  391  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  392  
3490565b633c70 Denys Vlasenko  2015-07-13  393  static __always_inline void spin_unlock_bh(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  394  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  395  	raw_spin_unlock_bh(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  396  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  397  
3490565b633c70 Denys Vlasenko  2015-07-13  398  static __always_inline void spin_unlock_irq(spinlock_t *lock)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  399  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  400  	raw_spin_unlock_irq(&lock->rlock);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  401  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  402  
3490565b633c70 Denys Vlasenko  2015-07-13 @403  static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
c2f21ce2e31286 Thomas Gleixner 2009-12-02  404  {
c2f21ce2e31286 Thomas Gleixner 2009-12-02  405  	raw_spin_unlock_irqrestore(&lock->rlock, flags);
c2f21ce2e31286 Thomas Gleixner 2009-12-02  406  }
c2f21ce2e31286 Thomas Gleixner 2009-12-02  407  

:::::: The code at line 403 was first introduced by commit
:::::: 3490565b633c705d2fb1f6ede51228952664663d locking/spinlocks: Force inlining of spinlock ops

:::::: TO: Denys Vlasenko <dvlasenk@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
