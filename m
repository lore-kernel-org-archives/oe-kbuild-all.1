Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6074F378D76
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769115570; cv=none; b=tI2WTZNCwSKQg1osShTKGqs4XFWRPz5bQyJGqrKvHUj0FzUQRFpUBdKwLC4Ooa5wsjWrgt5Z7a/p2I/Bp3MCZ5uTW217APkIz7qVnEEX/l3gtmpLS19JzU5SZNYzjEKa5b+S7Gu/D1phhiV7cu8I1sBsP3LucR8ZyoV6cd3LXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769115570; c=relaxed/simple;
	bh=AEWwC9CI+0lTMrsDJAH1bWaUGtZGIygV3AR+RojvyGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFrGl8uPjZtLiByjUOok3/iRexTF9cf8MGyApCfwU6em0FgPT00T/wnWM8blq1BJxBknU56Eq9/6zUEkqhnjGc9vOgVBA9TPNEx3mVPsB/7JiogWMQj3rQgjWsCMEGtbQJjWQCBQpCj5axWP7mNxnxTvnP4KpypFpVRQiw0A9WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmZ2mLi6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmZ2mLi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769115565; x=1800651565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AEWwC9CI+0lTMrsDJAH1bWaUGtZGIygV3AR+RojvyGg=;
  b=gmZ2mLi66NO4TtfZ2jvjnQg4tlNxd/jABZnO0f3ylnQZ9XKDqZJrhfSh
   24vToupJdIUtYCh7alCpkffP/ECuVNN6Qy1Y+MUGQimgp56JEvQHrWAIT
   LGkZoDOjyCBvW3H9adhQ9GBX/7gwIoEDywhsfe/gcWK3Zba6DitLMkjEw
   mMs8OoeMbEpDTm6CUiVn3werYGbR8uEO9zBLsMkyHQtTMJJh6impdqQeP
   /Vq3MN4U2a36sx8iZMG+0fr9ZDYmnOlBK3aPEJB0l6K8F5KBe/u2+/Z+l
   Uwg7BM8wJc0MlAkPRkkn32cMP2zd0Z/nn5a4T2YYBn8qR4iauQNgFw62B
   w==;
X-CSE-ConnectionGUID: Vl+WeSxMROu0+hFu62VnFw==
X-CSE-MsgGUID: RvNzrkYZQpmI0IlxuybdFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73998285"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="73998285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 12:59:23 -0800
X-CSE-ConnectionGUID: tVuWW1ttQdS1JcrXmyXNCw==
X-CSE-MsgGUID: v18nlH8NQSeVY8ytl0ucvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="210966287"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2026 12:59:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj1lu-00000000TF0-0R3r;
	Thu, 22 Jan 2026 20:59:18 +0000
Date: Fri, 23 Jan 2026 04:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
Subject: Re: [PATCH] sched/fair: Optimize EAS energy calculation complexity
 from O(N) to O(1) inside inner loop
Message-ID: <202601230422.1xw7nG4T-lkp@intel.com>
References: <20260122154227.130767-1-realwujing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122154227.130767-1-realwujing@gmail.com>

Hi Qiliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v6.19-rc6 next-20260122]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Optimize-EAS-energy-calculation-complexity-from-O-N-to-O-1-inside-inner-loop/20260123-000924
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260122154227.130767-1-realwujing%40gmail.com
patch subject: [PATCH] sched/fair: Optimize EAS energy calculation complexity from O(N) to O(1) inside inner loop
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260123/202601230422.1xw7nG4T-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230422.1xw7nG4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230422.1xw7nG4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'find_energy_efficient_cpu':
>> include/linux/cpumask_types.h:18:37: warning: dereferencing 'void *' pointer
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: request for member 'bits' in something not a structure or union
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
>> include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   include/linux/cpumask.h:380:9: note: in expansion of macro 'for_each_set_bit'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~


vim +18 include/linux/cpumask_types.h

eb4faa36d674ee Yury Norov 2024-05-27  10  
eb4faa36d674ee Yury Norov 2024-05-27  11  /**
eb4faa36d674ee Yury Norov 2024-05-27  12   * cpumask_bits - get the bits in a cpumask
eb4faa36d674ee Yury Norov 2024-05-27  13   * @maskp: the struct cpumask *
eb4faa36d674ee Yury Norov 2024-05-27  14   *
eb4faa36d674ee Yury Norov 2024-05-27  15   * You should only assume nr_cpu_ids bits of this mask are valid.  This is
eb4faa36d674ee Yury Norov 2024-05-27  16   * a macro so it's const-correct.
eb4faa36d674ee Yury Norov 2024-05-27  17   */
eb4faa36d674ee Yury Norov 2024-05-27 @18  #define cpumask_bits(maskp) ((maskp)->bits)
eb4faa36d674ee Yury Norov 2024-05-27  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
