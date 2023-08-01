Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4981E503
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690900081; x=1722436081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIGPCnCQZrkN/AjzE0N8NiLFDXp8X4Om/VN5uje0JLA=;
  b=UKHsdYaA1n93Fuj8hrUkB3wE7rG4CaX6XQaa+HFqT+SanLrLzPKv3JQs
   aMT5z+SlQBlgyGAvY6JRlFxupQf9H8N0PGGVzNA0wbpblZwic7it63rsI
   wurIAjYik+o2DX8rdgxMNyaQPFtro89ZGl8oL8AD6DSeNqlIteTw8rUx3
   eblFLHdXm6IiRZB5X+7YRiyM+GrjiKk9PagODk5ycmneyPjtko89Xt1AN
   Ego3ELCiOpFqA8axuZUnLUz39iSxeaNSrodLyGGZfEGR47lD5vJI702X3
   lqA3W/IY+4DKcImS22Za1P17Ctzbm0i2MI2Gi9LOoxo7JA3puShgrdPtm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368206605"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="368206605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732007338"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="732007338"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 07:28:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQqLv-0000M9-1N;
	Tue, 01 Aug 2023 14:27:59 +0000
Date: Tue, 1 Aug 2023 22:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/softirq-preemptible 5/6]
 kernel/time/timer.c:1700:17: error: implicit declaration of function
 'local_bh_vec_disable'; did you mean 'local_bh_disable'?
Message-ID: <202308012208.qT7Pir6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/softirq-preemptible
head:   c233aee141ddb78d07b2f7311be38cfc286de654
commit: e54180a8daee54a469b182cd7e753d17e52394ef [5/6] timers: Introduce soft-interruptible timers
config: m68k-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230801/202308012208.qT7Pir6j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012208.qT7Pir6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012208.qT7Pir6j-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/timer.c: In function 'call_timer_fn':
>> kernel/time/timer.c:1700:17: error: implicit declaration of function 'local_bh_vec_disable'; did you mean 'local_bh_disable'? [-Werror=implicit-function-declaration]
    1700 |                 local_bh_vec_disable(1 << TIMER_SOFTIRQ);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 local_bh_disable
>> kernel/time/timer.c:1719:17: error: implicit declaration of function 'local_bh_vec_enable'; did you mean 'local_bh_enable'? [-Werror=implicit-function-declaration]
    1719 |                 local_bh_vec_enable(1 << TIMER_SOFTIRQ);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 local_bh_enable
   cc1: some warnings being treated as errors


vim +1700 kernel/time/timer.c

  1693	
  1694		if (IS_ENABLED(CONFIG_PREEMPT_RT) &&
  1695		    IS_ENABLED(CONFIG_ARCH_HAS_SOFTIRQ_DISABLED_MASK) &&
  1696		    timer->flags & TIMER_SOFTINTERRUPTIBLE)
  1697			softinterruptible = true;
  1698	
  1699		if (softinterruptible) {
> 1700			local_bh_vec_disable(1 << TIMER_SOFTIRQ);
  1701			local_bh_exit();
  1702		}
  1703	
  1704		/*
  1705		 * Couple the lock chain with the lock chain at
  1706		 * timer_delete_sync() by acquiring the lock_map around the fn()
  1707		 * call here and in timer_delete_sync().
  1708		 */
  1709		lock_map_acquire(&lockdep_map);
  1710	
  1711		trace_timer_expire_entry(timer, baseclk);
  1712		fn(timer);
  1713		trace_timer_expire_exit(timer);
  1714	
  1715		lock_map_release(&lockdep_map);
  1716	
  1717		if (softinterruptible) {
  1718			local_bh_enter();
> 1719			local_bh_vec_enable(1 << TIMER_SOFTIRQ);
  1720		}
  1721	
  1722	
  1723		if (count != preempt_count()) {
  1724			WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
  1725				  fn, count, preempt_count());
  1726			/*
  1727			 * Restore the preempt count. That gives us a decent
  1728			 * chance to survive and extract information. If the
  1729			 * callback kept a lock held, bad luck, but not worse
  1730			 * than the BUG() we had.
  1731			 */
  1732			preempt_count_set(count);
  1733		}
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
