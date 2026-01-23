Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6E2F6920
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169171; cv=none; b=L6shC1RrxAsgfmwpavJsHB6hNP/Vai6OhTn5HdII68d/TcwbA0+u40o3lRxJ+ve/ZBYk9zxAa49z/a3csySAb2xBNuiaR3rL0tfxC9aKrkBSRnzwxIJSlZO1qECYvtGtTQGA12vXdR0uLuElQUipJUHzoFiQPBxsqYhtHl1CMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169171; c=relaxed/simple;
	bh=59fFVD6u7M3ky47jT/vdP2lyNylcbR3/YA6u1pAWyoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4gwvohyS2asbgipmsMBMGn8F8xLHHPsI0Q/i3A0azgvVsyaD9oSUX9EB4yC4ZbHGkHtbVdH7dAMkgujhTkY7EPy4Hr5EdfC0UWSnOzNZxQ2E2pbZAFS9E+v8Fi1pNHWWSsHEaOIPjnbDFbicILvnWVlFadrO3FvWkMjNeBA7LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h55cvcZs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h55cvcZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769169168; x=1800705168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=59fFVD6u7M3ky47jT/vdP2lyNylcbR3/YA6u1pAWyoQ=;
  b=h55cvcZsefjLRyrhxJF04w74FeRPwBYYuwZ4JG9Dm4lsHhjbnF4KT/gU
   gW5efwf9+QjOjCmIVbNQeVcEHo2IRraa5+tY5wwqprumvwCrDHH/WxRB/
   8owjrpKNgE0QAn3VWrdfQNWElbSzUcSXfb7xPxISsBgYMpTLkFMZBFF9n
   T2hJ78VBRxr8Tk3Fc/42syz9igy1OgjJbCJ1mAJIKFOsbZPbrn+xOsB9s
   mCociHRMTCZ8PkMY7RFd7CLl4aEQYuHEwXD809U1xpTgigky2KW0ElEDk
   6IvgBleHwU05AaLKRjAkl1ahYULV6gOp1nxFpeLCaCZrJa5OtymnSvGZ0
   g==;
X-CSE-ConnectionGUID: 0rA3VE66SfW0C8IFvWzFFw==
X-CSE-MsgGUID: vYot0ep8Shi5jp9FB4YXtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70585511"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70585511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:52:47 -0800
X-CSE-ConnectionGUID: NjnJEjjfTCSoLBfNKCJMGg==
X-CSE-MsgGUID: 6BOy0ktDQE2ZhFoeeEtM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206269766"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 03:52:44 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjFiT-000000000hd-2Ksg;
	Fri, 23 Jan 2026 11:52:41 +0000
Date: Fri, 23 Jan 2026 12:51:48 +0100
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <202601231209.7Aqyec0v-lkp@intel.com>
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
[also build test WARNING on tip/master peterz-queue/sched/core linus/master v6.16-rc1 next-20260122]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Optimize-EAS-energy-calculation-complexity-from-O-N-to-O-1-inside-inner-loop/20260123-000924
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260122154227.130767-1-realwujing%40gmail.com
patch subject: [PATCH] sched/fair: Optimize EAS energy calculation complexity from O(N) to O(1) inside inner loop
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601231209.7Aqyec0v-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231209.7Aqyec0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231209.7Aqyec0v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/bitmap.h:11,
                    from ./include/linux/cpumask.h:11,
                    from ./include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'find_energy_efficient_cpu':
   ./include/linux/cpumask_types.h:18:37: warning: dereferencing 'void *' pointer
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   ./include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   ./include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
   ./include/linux/cpumask_types.h:18:37: error: request for member 'bits' in something not a structure or union
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   ./include/linux/find.h:586:48: note: in definition of macro 'for_each_set_bit'
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                ^~~~
   ./include/linux/cpumask.h:380:31: note: in expansion of macro 'cpumask_bits'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |                               ^~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~
>> ./include/linux/find.h:586:69: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                     ^
   ./include/linux/cpumask.h:380:9: note: in expansion of macro 'for_each_set_bit'
     380 |         for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8345:17: note: in expansion of macro 'for_each_cpu'
    8345 |                 for_each_cpu(i, perf_domain_span(tmp_pd)) {
         |                 ^~~~~~~~~~~~


vim +586 ./include/linux/find.h

6b8ecb84f8f640 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  584  
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  585  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov 2022-09-19 @586  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
