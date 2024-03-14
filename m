Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AD1A38C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 07:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710402026; cv=none; b=W5khuZfGTsCMIi+2MCVPN/cPRRyXnB2eQd6gbsVt9/ZP/4P/mJCjI28M7S7/GpXTsB550e3VcL0CMWh69U8fGM1z0iznbiR7UyqTWXlk2X2XMREuy/jmSft/qQT+PrKiYD9f/De+IN+OK3p2gM+QathcQwY5N1HkQZYcF+WdTxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710402026; c=relaxed/simple;
	bh=beZFq4X3jh4gn/FkCWz6hYFMp77ljhki9AFLvoFbk4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ObLNWOIfxmfKaySBEytUZLk25Qg74trkAFTj9oaBGWIrOswyMvVubZFQsmklpv9jZ3vHSn3sAly+IZ5C36S36fUFrELTkpJMZiJjRwTc9i2qSjee0g0kpDbEVJ9Kp48Xrfv2qZbUrbo3Qh8pK+nOxOxhWmNijPPy/b3J7uWG5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuBkfZeP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuBkfZeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710402024; x=1741938024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=beZFq4X3jh4gn/FkCWz6hYFMp77ljhki9AFLvoFbk4E=;
  b=VuBkfZePo4jfga6QxmgLUBdv+y/nFwFjA5DuPYJciawe+t5Jrb3fW/1n
   O0Q7IbJebjHoa1gcv0tq4atHDtqd7qATlyEktkDpDqUG7ADkfLYQCykGy
   YO1rzkdV5lXU4ebD8+2smLBUmeR9pvo/1em+IgmyGSUEAdyvh9JjghNyW
   XFd/FNuqre63PyYNOck0DOC8VCY1nUJ3v0/SbTCy8H+WAdGRc971fxYpj
   CXfXcX6JQ0kgrDdOD0tSk6lIVHCaL94es4zgZrdZNVGFHjSLAIIYreTMV
   5iKOHeyILEDQ8yTHR8nRyAUpLxOjHFwyb67KGeuA+h66t1eETCMPvlSyQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30644628"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="30644628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 00:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16798285"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Mar 2024 00:40:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkfhK-000DDb-2M;
	Thu, 14 Mar 2024 07:40:18 +0000
Date: Thu, 14 Mar 2024 15:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yipeng Zou <zouyipeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27244/30000] kernel/sched/core.c:9634:4:
 warning: format specifies type 'unsigned long long' but the argument has
 type 'int'
Message-ID: <202403141540.Qo9LqVrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: 00d37128abe2687fac974c5d21aa67fac6518c7c [27244/30000] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-buildonly-randconfig-001-20240314 (https://download.01.org/0day-ci/archive/20240314/202403141540.Qo9LqVrW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141540.Qo9LqVrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141540.Qo9LqVrW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:13:
   kernel/sched/sched.h:1837:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1837 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:2746:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    2746 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:2746:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2746 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:4121:10: warning: cast from 'void (*)(struct callback_head *)' to 'void (*)(struct rq *)' converts to incompatible function type [-Wcast-function-type-strict]
    4121 |                 func = (void (*)(struct rq *))head->func;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9530:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    9530 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         |     ^
   kernel/sched/core.c:9530:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9530 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         | ^
         | static 
   kernel/sched/core.c:9567:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
    9567 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         |     ^
   kernel/sched/core.c:9567:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9567 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         | ^
         | static 
   kernel/sched/core.c:9578:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
    9578 | u64 tg_get_affinity_period(struct task_group *tg)
         |     ^
   kernel/sched/core.c:9578:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    9578 | u64 tg_get_affinity_period(struct task_group *tg)
         | ^
         | static 
>> kernel/sched/core.c:9634:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
    9632 |                 seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
         |                                                                       ~~~~
         |                                                                       %d
    9633 |                         i, cpumask_pr_args(ad->domains[i]),
    9634 |                         schedstat_val(ad->stay_cnt[i]));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/stats.h:72:32: note: expanded from macro 'schedstat_val'
      72 | # define   schedstat_val(var)           0
         |                                         ^
   7 warnings generated.


vim +9634 kernel/sched/core.c

  9619	
  9620	static int cpu_affinity_stat_show(struct seq_file *sf, void *v)
  9621	{
  9622		struct task_group *tg = css_tg(seq_css(sf));
  9623		struct auto_affinity *auto_affi = tg->auto_affinity;
  9624		struct affinity_domain *ad = &auto_affi->ad;
  9625		int i;
  9626	
  9627		seq_printf(sf, "period_active %d\n", auto_affi->period_active);
  9628		seq_printf(sf, "dcount %d\n", ad->dcount);
  9629		seq_printf(sf, "domain_mask 0x%x\n", ad->domain_mask);
  9630		seq_printf(sf, "curr_level %d\n", ad->curr_level);
  9631		for (i = 0; i < ad->dcount; i++)
  9632			seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
  9633				i, cpumask_pr_args(ad->domains[i]),
> 9634				schedstat_val(ad->stay_cnt[i]));
  9635	
  9636		return 0;
  9637	}
  9638	#endif /* CONFIG_QOS_SCHED_SMART_GRID */
  9639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
