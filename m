Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5005694
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688487842; x=1720023842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pQ+KgVJZxgyfoqpOc0mtdzRwSNqb4Gx833XeJ+Qep4M=;
  b=bj5uq/6Q76rjppEhzUo0LtohNaH7XzcSTCUTYZT3nRq1aNe88iYRFy5E
   C0/8fKaGEGPrB7ohn+klqOqhaaSMcnYwTrRaUDksF20s1PQ5ouFEEQvcp
   zUJqgE7DmoNPWr35G3HIno4Je6ELmUwyu5aw7bxMOcT9dzBXXkNFH2NQ6
   vfI36TyY1PPENgMLaA8LVCleC4Nl9F7QvzfcsuvM+YpSTgvpG9G8712cN
   uXvIwg3gnzKMJkY9navlNAWDnYjlxufiXRevVrvwOE43ztAFLW0Z5XSNR
   0GC5TpuCSGfjbo43WeucY9ZNg2TZvOJuwHIEq1qT+HYfwjJ1YVbQ/T0wx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360633117"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360633117"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788905111"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788905111"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 09:24:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGiop-000INJ-2o;
	Tue, 04 Jul 2023 16:23:59 +0000
Date: Wed, 5 Jul 2023 00:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for
 memory_failure()
Message-ID: <202307050025.piXqvNt6-lkp@intel.com>
References: <20230704121948.1331846-1-linmiaohe@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704121948.1331846-1-linmiaohe@huawei.com>

Hi Miaohe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaohe-Lin/mm-memory-failure-add-missing-set_mce_nospec-for-memory_failure/20230704-202035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230704121948.1331846-1-linmiaohe%40huawei.com
patch subject: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for memory_failure()
config: arm64-randconfig-r021-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050025.piXqvNt6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050025.piXqvNt6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050025.piXqvNt6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from mm/memory-failure.c:39:
   mm/memory-failure.c: In function 'memory_failure_work_func':
>> mm/memory-failure.c:2406:37: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   mm/memory-failure.c:2406:33: note: in expansion of macro 'if'
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                 ^~
>> mm/memory-failure.c:2406:37: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   mm/memory-failure.c:2406:33: note: in expansion of macro 'if'
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                 ^~
>> mm/memory-failure.c:2406:37: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                     ^~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   mm/memory-failure.c:2406:33: note: in expansion of macro 'if'
    2406 |                                 if (!entry.flags & MF_SW_SIMULATED)
         |                                 ^~


vim +2406 mm/memory-failure.c

  2387	
  2388	static void memory_failure_work_func(struct work_struct *work)
  2389	{
  2390		struct memory_failure_cpu *mf_cpu;
  2391		struct memory_failure_entry entry = { 0, };
  2392		unsigned long proc_flags;
  2393		int gotten;
  2394	
  2395		mf_cpu = container_of(work, struct memory_failure_cpu, work);
  2396		for (;;) {
  2397			spin_lock_irqsave(&mf_cpu->lock, proc_flags);
  2398			gotten = kfifo_get(&mf_cpu->fifo, &entry);
  2399			spin_unlock_irqrestore(&mf_cpu->lock, proc_flags);
  2400			if (!gotten)
  2401				break;
  2402			if (entry.flags & MF_SOFT_OFFLINE)
  2403				soft_offline_page(entry.pfn, entry.flags);
  2404			else
  2405				if (!memory_failure(entry.pfn, entry.flags))
> 2406					if (!entry.flags & MF_SW_SIMULATED)
  2407						set_mce_nospec(entry.pfn);
  2408		}
  2409	}
  2410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
