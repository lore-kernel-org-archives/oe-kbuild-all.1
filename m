Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F842451A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691616227; x=1723152227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdmnaO8xyE/h3BNtZmi3U0nEluBf2QoOBfnOuWbbSIM=;
  b=ebJFULZMkljHt5Mq7tLm6+aQtt56XzjymwupSX0uKlsLtE2g/L/XB/O2
   Wg36/+smwU1w4xol++/Enc/GlwQpASnU/YAbFyW+kiiHIcMiXoafoCmkR
   MDUNJHANPzbdMGT7Lco8s7fPRCle/jVgYifUkRL5d4++NIjp42/HqMJS8
   dkkTHdGi6juufU6w+a66+axNRUwJO2YWAEnvrY2R9o5FPQUDvnPxXp90A
   qjvYqMQ5ZXXNWug2OrxA6QBP9LRBFmYqDYchBZxmZuZQ9jbM7acQ5fFut
   Ghp692J1sc3CS1ckIbB2Bn+YgIfPoy9Cq+jFbqzVt4Qwx1gELyh6qnOAq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370135941"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="370135941"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 14:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846134017"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="846134017"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 14:23:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTqee-0006Pq-2m;
	Wed, 09 Aug 2023 21:23:44 +0000
Date: Thu, 10 Aug 2023 05:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 5/7] include/asm-generic/current.h:7:23:
 error: 'typeof' applied to a bit-field
Message-ID: <202308100554.MBGJbzAA-lkp@intel.com>
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
config: openrisc-randconfig-r015-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100554.MBGJbzAA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100554.MBGJbzAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100554.MBGJbzAA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/openrisc/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'rt_mutex_pre_schedule':
>> include/asm-generic/current.h:7:23: error: 'typeof' applied to a bit-field
       7 | #define get_current() (current_thread_info()->task)
         |                       ^
   include/asm-generic/bug.h:168:32: note: in definition of macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7068:9: note: in expansion of macro 'lockdep_assert'
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |         ^~~~~~~~~~~~~~
   kernel/sched/core.c:7068:25: note: in expansion of macro 'fetch_and_set'
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |                         ^~~~~~~~~~~~~
   include/asm-generic/current.h:8:17: note: in expansion of macro 'get_current'
       8 | #define current get_current()
         |                 ^~~~~~~~~~~
   kernel/sched/core.c:7068:39: note: in expansion of macro 'current'
    7068 |         lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
         |                                       ^~~~~~~
   kernel/sched/core.c: In function 'rt_mutex_post_schedule':
>> include/asm-generic/current.h:7:23: error: 'typeof' applied to a bit-field
       7 | #define get_current() (current_thread_info()->task)
         |                       ^
   include/asm-generic/bug.h:168:32: note: in definition of macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/sched/core.c:7081:9: note: in expansion of macro 'lockdep_assert'
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |         ^~~~~~~~~~~~~~
   kernel/sched/core.c:7081:24: note: in expansion of macro 'fetch_and_set'
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |                        ^~~~~~~~~~~~~
   include/asm-generic/current.h:8:17: note: in expansion of macro 'get_current'
       8 | #define current get_current()
         |                 ^~~~~~~~~~~
   kernel/sched/core.c:7081:38: note: in expansion of macro 'current'
    7081 |         lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
         |                                      ^~~~~~~


vim +/typeof +7 include/asm-generic/current.h

aafe4dbed0bf6c Arnd Bergmann 2009-05-13  6  
aafe4dbed0bf6c Arnd Bergmann 2009-05-13 @7  #define get_current() (current_thread_info()->task)
aafe4dbed0bf6c Arnd Bergmann 2009-05-13  8  #define current get_current()
aafe4dbed0bf6c Arnd Bergmann 2009-05-13  9  

:::::: The code at line 7 was first introduced by commit
:::::: aafe4dbed0bf6cbdb2e9f03e1d42f8a540d8541d asm-generic: add generic versions of common headers

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
