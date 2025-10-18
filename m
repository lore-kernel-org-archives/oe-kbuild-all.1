Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583F261B99
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 04:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760762238; cv=none; b=ncNytfRpPmQFq5PZFh6Co/UKJx2FocFe8U8gGosOV9a8x0d2xttf3Ri9tPaCEPBmQkJboz6N9vohfFUDc6SUnJ1Y9qU+BfLMg475B2rAbjE4VMmh516i/zvP6YMfz2h8YEbiq60L17G3c2ykDgRK7lPy8EuFttJ+yu7lyx8oAg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760762238; c=relaxed/simple;
	bh=3MEWCP47IBh0orjhpuFMEj4nWjceUJ5BMgwaC+cEW00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgttMyo/IKFe6KdLYEgwBUZ8wH+AmUXhghM5IPAWddNWpG4q2+PoLEYx9KxJsuz+jbFoRjX1CCBDvuVv4swIatGV7+ffRKwgzbcHbKVun7tzrvMju/wTZ0+Br+PcjyTmwcLRY1bRAxzjdXCtr5E1AmIOWL05oVKl2Bs2t5mnnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5ohbu/o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5ohbu/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760762237; x=1792298237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3MEWCP47IBh0orjhpuFMEj4nWjceUJ5BMgwaC+cEW00=;
  b=n5ohbu/orv32j/yLlhoibdohkiVIrt9aWQaxFiE/UvB4C6kGLCmFd1h7
   N1M+l3o76fzK8kLuRe55lXvXzPrw4E5WSd6UjFWqnBN/PR7mRhPOtjjWz
   D1I+Hf/9vOCJFWNWn8Yw5gEUhnwxuACtuvBJtuxpGe2A+Bx7guPaCQC9N
   7PSPoXHy28u8fJU25n2NHECbxHHojsC254Ag72xhdNgIo6tSUqYX5jkO8
   Ef26FlY5YatqIOYy99CYFJL9LAg5usKwAC8dgOsFRGOX7VyqudR8JuSUF
   hv6E8saH5WbRH+3RtaB1V7jZw3JSGVxuv8LzBaPnVmE5CrJPhnYUl1lJ4
   g==;
X-CSE-ConnectionGUID: sgmoBhHQTv2Nihh7+4xZ2Q==
X-CSE-MsgGUID: Atg7MO02Q0ysSCTk19uFtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="65593260"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="65593260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 21:37:16 -0700
X-CSE-ConnectionGUID: DcLNXD1jQfODv71VsT7KLQ==
X-CSE-MsgGUID: l6rbrS4SRuCK1WC8xJz+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182082181"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 21:37:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ygj-00083n-2t;
	Sat, 18 Oct 2025 04:37:07 +0000
Date: Sat, 18 Oct 2025 12:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pingfan Liu <piliu@redhat.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCHv3] sched/deadline: Walk up cpuset hierarchy to decide
 root domain when hot-unplug
Message-ID: <202510181259.vccVb2DD-lkp@intel.com>
References: <20251017122636.17671-1-piliu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017122636.17671-1-piliu@redhat.com>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core tip/master linus/master v6.18-rc1 next-20251017]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/sched-deadline-Walk-up-cpuset-hierarchy-to-decide-root-domain-when-hot-unplug/20251017-202902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20251017122636.17671-1-piliu%40redhat.com
patch subject: [PATCHv3] sched/deadline: Walk up cpuset hierarchy to decide root domain when hot-unplug
config: i386-randconfig-141-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181259.vccVb2DD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181259.vccVb2DD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181259.vccVb2DD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:53:
   include/linux/cpuset.h: In function 'task_get_rd_effective_cpus':
   include/linux/cpuset.h:286:18: error: implicit declaration of function 'housekeeping_cpumask' [-Wimplicit-function-declaration]
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:286:39: error: 'HK_TYPE_DOMAIN' undeclared (first use in this function)
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                                       ^~~~~~~~~~~~~~
   include/linux/cpuset.h:286:39: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/cpuset.h:287:13: error: implicit declaration of function 'housekeeping_enabled' [-Wimplicit-function-declaration]
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from init/main.c:57:
   include/linux/sched/isolation.h: At top level:
>> include/linux/sched/isolation.h:43:37: error: conflicting types for 'housekeeping_cpumask'; have 'const struct cpumask *(enum hk_type)'
      43 | static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
         |                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:286:18: note: previous implicit declaration of 'housekeeping_cpumask' with type 'int()'
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^~~~~~~~~~~~~~~~~~~~
>> include/linux/sched/isolation.h:48:20: error: conflicting types for 'housekeeping_enabled'; have 'bool(enum hk_type)' {aka '_Bool(enum hk_type)'}
      48 | static inline bool housekeeping_enabled(enum hk_type type)
         |                    ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:287:13: note: previous implicit declaration of 'housekeeping_enabled' with type 'int()'
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/sched/isolation.h:5,
                    from kernel/cpu.c:13:
   include/linux/cpuset.h: In function 'task_get_rd_effective_cpus':
   include/linux/cpuset.h:286:18: error: implicit declaration of function 'housekeeping_cpumask' [-Wimplicit-function-declaration]
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:286:39: error: 'HK_TYPE_DOMAIN' undeclared (first use in this function); did you mean 'TOPO_TILE_DOMAIN'?
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                                       ^~~~~~~~~~~~~~
         |                                       TOPO_TILE_DOMAIN
   include/linux/cpuset.h:286:39: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/cpuset.h:287:13: error: implicit declaration of function 'housekeeping_enabled' [-Wimplicit-function-declaration]
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched/isolation.h: At top level:
>> include/linux/sched/isolation.h:43:37: error: conflicting types for 'housekeeping_cpumask'; have 'const struct cpumask *(enum hk_type)'
      43 | static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
         |                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:286:18: note: previous implicit declaration of 'housekeeping_cpumask' with type 'int()'
     286 |         hk_msk = housekeeping_cpumask(HK_TYPE_DOMAIN);
         |                  ^~~~~~~~~~~~~~~~~~~~
>> include/linux/sched/isolation.h:48:20: error: conflicting types for 'housekeeping_enabled'; have 'bool(enum hk_type)' {aka '_Bool(enum hk_type)'}
      48 | static inline bool housekeeping_enabled(enum hk_type type)
         |                    ^~~~~~~~~~~~~~~~~~~~
   include/linux/cpuset.h:287:13: note: previous implicit declaration of 'housekeeping_enabled' with type 'int()'
     287 |         if (housekeeping_enabled(HK_TYPE_DOMAIN)) {
         |             ^~~~~~~~~~~~~~~~~~~~


vim +43 include/linux/sched/isolation.h

7863406143d8bb Frederic Weisbecker 2017-10-27  42  
04d4e665a60902 Frederic Weisbecker 2022-02-07 @43  static inline const struct cpumask *housekeeping_cpumask(enum hk_type type)
7863406143d8bb Frederic Weisbecker 2017-10-27  44  {
7863406143d8bb Frederic Weisbecker 2017-10-27  45  	return cpu_possible_mask;
7863406143d8bb Frederic Weisbecker 2017-10-27  46  }
7863406143d8bb Frederic Weisbecker 2017-10-27  47  
04d4e665a60902 Frederic Weisbecker 2022-02-07 @48  static inline bool housekeeping_enabled(enum hk_type type)
0c5f81dad46c90 Wanpeng Li          2019-07-06  49  {
0c5f81dad46c90 Wanpeng Li          2019-07-06  50  	return false;
0c5f81dad46c90 Wanpeng Li          2019-07-06  51  }
0c5f81dad46c90 Wanpeng Li          2019-07-06  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
