Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6133F8C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 15:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441465; cv=none; b=lJXow6B6OLFIl5FgDOaPWrUC0O5igXOKPNeWfOX2LE/2kqHa10J1FxQm+TLXUPhhJoegvfTA3Mv07aHPjvUH9epIT4IA5AbId4FC7Camyf0CrY4AdtTSSZqVgGKHfmqEobefO9sSzjGZKeKbA/ryh4QSmm0+4MpSh98+q5R5Crs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441465; c=relaxed/simple;
	bh=6PXdi1088MWNhPjDiFs9VXCuNQaaigqJ491IXJQkS9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVdgdtdfS6COk8ZKXDLci80gDYbrbesc01bADZpj3DAkAEMFou7IWIbhxSUnCzZBujVALxUBSlynczSSlxOB9pZGkBaQvSPBH8UIWAUmANHPSX6hSGYNo++GkJWkegMqZb9FgzgzZMDHu9injcUZ6WC/bQXws3FBXh26SFZdjBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQzwVpZN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQzwVpZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769441462; x=1800977462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6PXdi1088MWNhPjDiFs9VXCuNQaaigqJ491IXJQkS9Q=;
  b=gQzwVpZNsnY7I3CAYH4zi2qrseOmnWMGAeype0sfoRDg6yPpPfKkmgvQ
   B/W3z6ND3CbCKW/gX+4vjFFMhqyckB4QXbREF10Sbj2QdhZUfMHkh/aFp
   Ca5fzyi+SvJhN+gEpLOykindtLYaJ6K7/CNtd4bBsojUGeMta0u+TJNDo
   UKgyu/frJIqhnMNXhivzxLW8hSGbS0xPP5H2ox9t9LiyoyhRCcwdy9TNd
   57Ds1r3lu+TxstxhksGkkxWfIBhEUN/DRhGzaSzAoVq6PKJWjPJQe716h
   rEBfs5W22MK5UBYlKSZfkGZk70/HGptkb6KbGAxeMOxVqG++eYYIjDB7y
   w==;
X-CSE-ConnectionGUID: gAGBmDdtToSkOmxsk0noiw==
X-CSE-MsgGUID: nY7cnPHKQtiNiN2/ogtwFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70677336"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70677336"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:31:01 -0800
X-CSE-ConnectionGUID: SzHE+xC8TzGzllcS1B8DrQ==
X-CSE-MsgGUID: sHK29it8QFK3yNLcFj+yUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="208128007"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2026 07:30:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkOYJ-00000000XQs-3zAU;
	Mon, 26 Jan 2026 15:30:55 +0000
Date: Mon, 26 Jan 2026 23:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>, kprateek.nayak@amd.com
Cc: oe-kbuild-all@lists.linux.dev, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	peterz@infradead.org, realwujing@gmail.com, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com,
	yuanql9@chinatelecom.cn
Subject: Re: [PATCH v3] sched/fair: Cache NUMA node statistics to avoid O(N)
 scanning
Message-ID: <202601262359.B2LmQ3KH-lkp@intel.com>
References: <20260126110250.1060512-1-realwujing@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126110250.1060512-1-realwujing@gmail.com>

Hi Qiliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.19-rc7 next-20260123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-fair-Cache-NUMA-node-statistics-to-avoid-O-N-scanning/20260126-190546
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260126110250.1060512-1-realwujing%40gmail.com
patch subject: [PATCH v3] sched/fair: Cache NUMA node statistics to avoid O(N) scanning
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260126/202601262359.B2LmQ3KH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262359.B2LmQ3KH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262359.B2LmQ3KH-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_sg_lb_stats':
>> kernel/sched/fair.c:10524:51: error: 'node_stats_cache' undeclared (first use in this function); did you mean 'numa_stats_cache'?
   10524 |                 struct numa_stats_cache *cache = &node_stats_cache[nid];
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   numa_stats_cache
   kernel/sched/fair.c:10524:51: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
   In file included from ./arch/nios2/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:380,
                    from include/linux/cleanup.h:5,
                    from include/linux/irqflags.h:17,
                    from include/asm-generic/cmpxchg.h:15,
                    from ./arch/nios2/include/generated/asm/cmpxchg.h:1,
                    from include/asm-generic/atomic.h:12,
                    from ./arch/nios2/include/generated/asm/atomic.h:1,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
>> kernel/sched/fair.c:10526:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                                 ^~
   include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   kernel/sched/fair.c:10526:17: note: in expansion of macro 'WRITE_ONCE'
   10526 |                 WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
         |                 ^~~~~~~~~~
   In file included from <command-line>:
   kernel/sched/fair.c:10527:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10527:17: note: in expansion of macro 'WRITE_ONCE'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                 ^~~~~~~~~~
   kernel/sched/fair.c:10527:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10527:17: note: in expansion of macro 'WRITE_ONCE'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                 ^~~~~~~~~~
   kernel/sched/fair.c:10527:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10527:17: note: in expansion of macro 'WRITE_ONCE'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                 ^~~~~~~~~~
   kernel/sched/fair.c:10527:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'
     649 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:10527:17: note: in expansion of macro 'WRITE_ONCE'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                 ^~~~~~~~~~
   kernel/sched/fair.c:10527:33: error: invalid use of undefined type 'struct numa_stats_cache'
   10527 |                 WRITE_ONCE(cache->load, sgs->group_load);
         |                                 ^~
   include/linux/compiler_types.h:629:23: note: in definition of macro '__compiletime_assert'
     629 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:649:9: note: in expansion of macro '_compiletime_assert'


vim +10524 kernel/sched/fair.c

 10426	
 10427	/**
 10428	 * update_sg_lb_stats - Update sched_group's statistics for load balancing.
 10429	 * @env: The load balancing environment.
 10430	 * @sds: Load-balancing data with statistics of the local group.
 10431	 * @group: sched_group whose statistics are to be updated.
 10432	 * @sgs: variable to hold the statistics for this group.
 10433	 * @sg_overloaded: sched_group is overloaded
 10434	 * @sg_overutilized: sched_group is overutilized
 10435	 */
 10436	static inline void update_sg_lb_stats(struct lb_env *env,
 10437					      struct sd_lb_stats *sds,
 10438					      struct sched_group *group,
 10439					      struct sg_lb_stats *sgs,
 10440					      bool *sg_overloaded,
 10441					      bool *sg_overutilized)
 10442	{
 10443		int i, nr_running, local_group, sd_flags = env->sd->flags;
 10444		bool balancing_at_rd = !env->sd->parent;
 10445	
 10446		memset(sgs, 0, sizeof(*sgs));
 10447	
 10448		local_group = group == sds->local;
 10449	
 10450		for_each_cpu_and(i, sched_group_span(group), env->cpus) {
 10451			struct rq *rq = cpu_rq(i);
 10452			unsigned long load = cpu_load(rq);
 10453	
 10454			sgs->group_load += load;
 10455			sgs->group_util += cpu_util_cfs(i);
 10456			sgs->group_runnable += cpu_runnable(rq);
 10457			sgs->sum_h_nr_running += rq->cfs.h_nr_runnable;
 10458	
 10459			nr_running = rq->nr_running;
 10460			sgs->sum_nr_running += nr_running;
 10461	
 10462			if (cpu_overutilized(i))
 10463				*sg_overutilized = 1;
 10464	
 10465			/*
 10466			 * No need to call idle_cpu() if nr_running is not 0
 10467			 */
 10468			if (!nr_running && idle_cpu(i)) {
 10469				sgs->idle_cpus++;
 10470				/* Idle cpu can't have misfit task */
 10471				continue;
 10472			}
 10473	
 10474			/* Overload indicator is only updated at root domain */
 10475			if (balancing_at_rd && nr_running > 1)
 10476				*sg_overloaded = 1;
 10477	
 10478	#ifdef CONFIG_NUMA_BALANCING
 10479			/* Only fbq_classify_group() uses this to classify NUMA groups */
 10480			if (sd_flags & SD_NUMA) {
 10481				sgs->nr_numa_running += rq->nr_numa_running;
 10482				sgs->nr_preferred_running += rq->nr_preferred_running;
 10483			}
 10484	#endif
 10485			if (local_group)
 10486				continue;
 10487	
 10488			if (sd_flags & SD_ASYM_CPUCAPACITY) {
 10489				/* Check for a misfit task on the cpu */
 10490				if (sgs->group_misfit_task_load < rq->misfit_task_load) {
 10491					sgs->group_misfit_task_load = rq->misfit_task_load;
 10492					*sg_overloaded = 1;
 10493				}
 10494			} else if (env->idle && sched_reduced_capacity(rq, env->sd)) {
 10495				/* Check for a task running on a CPU with reduced capacity */
 10496				if (sgs->group_misfit_task_load < load)
 10497					sgs->group_misfit_task_load = load;
 10498			}
 10499		}
 10500	
 10501		sgs->group_capacity = group->sgc->capacity;
 10502	
 10503		sgs->group_weight = group->group_weight;
 10504	
 10505		/* Check if dst CPU is idle and preferred to this group */
 10506		if (!local_group && env->idle && sgs->sum_h_nr_running &&
 10507		    sched_group_asym(env, sgs, group))
 10508			sgs->group_asym_packing = 1;
 10509	
 10510		/* Check for loaded SMT group to be balanced to dst CPU */
 10511		if (!local_group && smt_balance(env, sgs, group))
 10512			sgs->group_smt_balance = 1;
 10513	
 10514		sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
 10515	
 10516		/* Computing avg_load makes sense only when group is overloaded */
 10517		if (sgs->group_type == group_overloaded)
 10518			sgs->avg_load = (sgs->group_load * SCHED_CAPACITY_SCALE) /
 10519					sgs->group_capacity;
 10520	
 10521		/* Algorithmic Optimization: Cache node stats for O(1) NUMA lookups */
 10522		if (env->sd->flags & SD_NUMA) {
 10523			int nid = cpu_to_node(cpumask_first(sched_group_span(group)));
 10524			struct numa_stats_cache *cache = &node_stats_cache[nid];
 10525	
 10526			WRITE_ONCE(cache->nr_running, sgs->sum_h_nr_running);
 10527			WRITE_ONCE(cache->load, sgs->group_load);
 10528			WRITE_ONCE(cache->util, sgs->group_util);
 10529			WRITE_ONCE(cache->runnable, sgs->group_runnable);
 10530			WRITE_ONCE(cache->capacity, sgs->group_capacity);
 10531			WRITE_ONCE(cache->last_update, jiffies);
 10532		}
 10533	}
 10534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
