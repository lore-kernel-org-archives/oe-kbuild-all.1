Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F91C3B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 07:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691651528; x=1723187528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=07NFToZiRu93+q+YP5AYVi+vMiMQ/VG7Ym/meIlzwnI=;
  b=ju5HF+bWyxjwdYXzj7T90H7rYW9nsPL43B2LIsXiGSoakLunJufv0dSl
   TFYGJkfaHKOkNg4YJOeRnz6/OqMoc9CCylOVzK+xeBIGl10X/tzMbFFhU
   aKVLt1hqraGPZyeJ5wmaP1z+zJowEvkZFAedomC4AWa5Wyp2qI32wyTIJ
   nS9KieDL639dHTCPYwpp2VfLUqVSUkeG6U0HpRq+p0Dq2HpGBn7/ZUTsq
   ahuJVHXAf5JvzWQBDp4TfpPexrXiCWUOxT0icg5LrPlUMkPSWex6yBNjZ
   QxXl021IOuCEF4PyoXwmXVPaZ3bZKxtNGistF4YD9lgIYVGY1/d5tORMP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437672552"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="437672552"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 00:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822125691"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="822125691"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Aug 2023 00:12:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTzpy-0006oy-0q;
	Thu, 10 Aug 2023 07:12:02 +0000
Date: Thu, 10 Aug 2023 15:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Vernet <void@manifault.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	tj@kernel.org, roman.gushchin@linux.dev, gautham.shenoy@amd.com,
	kprateek.nayak@amd.com, aaron.lu@intel.com,
	wuyun.abel@bytedance.com, kernel-team@meta.com
Subject: Re: [PATCH v3 6/7] sched: Implement shared runqueue in CFS
Message-ID: <202308101517.FuIh97h7-lkp@intel.com>
References: <20230809221218.163894-7-void@manifault.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809221218.163894-7-void@manifault.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[cannot apply to linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Vernet/sched-Expose-move_queued_task-from-core-c/20230810-061611
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230809221218.163894-7-void%40manifault.com
patch subject: [PATCH v3 6/7] sched: Implement shared runqueue in CFS
config: sparc-randconfig-r015-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101517.FuIh97h7-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101517.FuIh97h7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101517.FuIh97h7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/sched/core.c:9768:6: warning: no previous prototype for 'sched_update_domains' [-Wmissing-prototypes]
    9768 | void sched_update_domains(void)
         |      ^~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/build_utility.c:89:
   kernel/sched/topology.c: In function 'sched_init_domains':
>> kernel/sched/topology.c:2580:17: error: implicit declaration of function 'sched_update_domains'; did you mean 'sched_update_scaling'? [-Werror=implicit-function-declaration]
    2580 |                 sched_update_domains();
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 sched_update_scaling
   cc1: some warnings being treated as errors


vim +2580 kernel/sched/topology.c

  2558	
  2559	/*
  2560	 * Set up scheduler domains and groups.  For now this just excludes isolated
  2561	 * CPUs, but could be used to exclude other special cases in the future.
  2562	 */
  2563	int __init sched_init_domains(const struct cpumask *cpu_map)
  2564	{
  2565		int err;
  2566	
  2567		zalloc_cpumask_var(&sched_domains_tmpmask, GFP_KERNEL);
  2568		zalloc_cpumask_var(&sched_domains_tmpmask2, GFP_KERNEL);
  2569		zalloc_cpumask_var(&fallback_doms, GFP_KERNEL);
  2570	
  2571		arch_update_cpu_topology();
  2572		asym_cpu_capacity_scan();
  2573		ndoms_cur = 1;
  2574		doms_cur = alloc_sched_domains(ndoms_cur);
  2575		if (!doms_cur)
  2576			doms_cur = &fallback_doms;
  2577		cpumask_and(doms_cur[0], cpu_map, housekeeping_cpumask(HK_TYPE_DOMAIN));
  2578		err = build_sched_domains(doms_cur[0], NULL);
  2579		if (!err)
> 2580			sched_update_domains();
  2581	
  2582		return err;
  2583	}
  2584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
