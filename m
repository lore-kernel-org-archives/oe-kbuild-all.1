Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9402EAD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691700561; x=1723236561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wnckkzulRBl8tlMPH3umoFuVqtvfQZ8FOwDQIb6NP0=;
  b=N1dW3mTJjxVYWOYqASsUg8D5jZ/zkpf/+PqgXDYJZZpVGdQG37hLVceX
   dKu6FSU5CluA5OkZKo1PwZS9NxXP+26lcs/lJTLe4iELuk2/21zeeFqBt
   K7OC3vj1KrhLqhh6cK6N+LHNIcGPxTVrMiHoKAGQRMz78ZLnfMQARMmtn
   raXJsBoDU72WRvm9E3t2YQJpHIxeCMBHi6imuhJfWsOxxdRj/FNYTt8Va
   jBmStpPzXGHu77olj3hEVqY8+ktr6LcoaDeDGy8AL3O0PZe8bthG0TaWi
   /1UURBLL+wFtx8b1DTn33KWi4IhZpUfQTYJB0jQP6HFelz2mxkFSso6sq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375234684"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="375234684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 13:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875881644"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2023 13:49:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUCas-0007FC-2m;
	Thu, 10 Aug 2023 20:49:18 +0000
Date: Fri, 11 Aug 2023 04:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: [axboe-block:for-6.6/block 43/44] include/linux/lockdep.h:291:61:
 error: invalid type argument of '->' (have 'struct mutex')
Message-ID: <202308110439.vJ8KE4K3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   d21fed50c523d87af6456697ad09378060c4f09a
commit: 4eb44d10766ac0fae5973998fd2a0103df1d3fe1 [43/44] block: remove init_mutex and open-code blk_iolatency_try_init
config: arm64-randconfig-r035-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110439.vJ8KE4K3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110439.vJ8KE4K3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110439.vJ8KE4K3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from block/blk-iolatency.c:68:
   block/blk-iolatency.c: In function 'iolatency_set_limit':
>> include/linux/lockdep.h:291:61: error: invalid type argument of '->' (have 'struct mutex')
     291 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/lockdep.h:324:9: note: in expansion of macro 'lockdep_assert'
     324 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^~~~~~~~~~~~~~
   include/linux/lockdep.h:324:24: note: in expansion of macro 'lockdep_is_held'
     324 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |                        ^~~~~~~~~~~~~~~
   block/blk-iolatency.c:849:9: note: in expansion of macro 'lockdep_assert_held'
     849 |         lockdep_assert_held(ctx.bdev->bd_queue->rq_qos_mutex);
         |         ^~~~~~~~~~~~~~~~~~~


vim +291 include/linux/lockdep.h

f607c668577481 Peter Zijlstra 2009-07-20  290  
f8319483f57f1c Peter Zijlstra 2016-11-30 @291  #define lockdep_is_held(lock)		lock_is_held(&(lock)->dep_map)
f8319483f57f1c Peter Zijlstra 2016-11-30  292  #define lockdep_is_held_type(lock, r)	lock_is_held_type(&(lock)->dep_map, (r))
f607c668577481 Peter Zijlstra 2009-07-20  293  

:::::: The code at line 291 was first introduced by commit
:::::: f8319483f57f1ca22370f4150bb990aca7728a67 locking/lockdep: Provide a type check for lock_is_held

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
