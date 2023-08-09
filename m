Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D331D2F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691618103; x=1723154103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJxdvKDmnbnHnemv6y8MquLCSVzdwia65bHyiGMt4C4=;
  b=TVDPID0ekn/bF5VGxxG/YUUTQAMEz/s8B0lZF9Eb6o1flnH+fZn247lu
   rGWsPCHJ3IPWcXaJS6EzXLaGBzEf4PUeYHwvrPmp0FbhrYR20zmEKV9yp
   7K9wwXcwXhdP2J7ozXqdFWDralbU2HAlEa9fEyaE/vSmzzqhYDqiLLE2H
   +hCcblnMZytLT7u2EZaH0zq6Lvoqo7q/16y5+pgbVnEuNlGXScdHR+zAM
   xT8llnKNY6nHgnWfwlX2MsR8hhHu5RfQGrfl67IIgpLLr8VlgLOPEyR8/
   oEzVuLMAA/oesLgQxqpuJq8mXSqAaM+djlpUdRWAe/okOQSqXXvvDWc2O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368698642"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="368698642"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821991733"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="821991733"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 14:54:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTr8f-0006R4-2R;
	Wed, 09 Aug 2023 21:54:45 +0000
Date: Thu, 10 Aug 2023 05:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 5/7] kernel/sched/core.c:7068:39: error:
 'typeof' applied to a bit-field
Message-ID: <202308100509.mqnyhiNY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   47a35f56e63994577fabd8fbc58b6551416f8250
commit: 876dda04d9e0849c1d112180ec0e35cab6fbe494 [5/7] sched: Provide rt_mutex specific scheduler helpers
config: microblaze-randconfig-r014-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100509.mqnyhiNY-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100509.mqnyhiNY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100509.mqnyhiNY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/microblaze/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'rt_mutex_pre_schedule':
>> kernel/sched/core.c:7068:39: error: 'typeof' applied to a bit-field
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |                                       ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7068:9: note: in expansion of macro 'lockdep_assert'
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |         ^~~~~~~~~~~~~~
   kernel/sched/core.c:7068:25: note: in expansion of macro 'fetch_and_set'
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |                         ^~~~~~~~~~~~~
   kernel/sched/core.c: In function 'rt_mutex_post_schedule':
   kernel/sched/core.c:7081:38: error: 'typeof' applied to a bit-field
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |                                      ^~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7081:9: note: in expansion of macro 'lockdep_assert'
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |         ^~~~~~~~~~~~~~
   kernel/sched/core.c:7081:24: note: in expansion of macro 'fetch_and_set'
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |                        ^~~~~~~~~~~~~


vim +/typeof +7068 kernel/sched/core.c

  7065	
  7066	void rt_mutex_pre_schedule(void)
  7067	{
> 7068		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  7069		sched_submit_work(current);
  7070	}
  7071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
