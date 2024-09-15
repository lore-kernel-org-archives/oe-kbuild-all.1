Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C93441760
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726393182; cv=none; b=HyhnfIHpa8NF8rZlFWBx1Z0b1s6Jt917weayf/rttAMcVWoomO8RBN8dekPn7l8WOn10pUAKTypVQdz6Xiw+U/aWx/gSotQbr7NCNahRac6SlcWB0GAu3o9Yh17/gLh5CGv4ChQAMBBjW6VkEIs6E+V2CjumhhrIAct6Dm+3pWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726393182; c=relaxed/simple;
	bh=uppLv4VECLNYt7cYjEM7pGpC2x2Ntif9ubs2PQBulAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5/2Psm5nD7YRljPsl9Ub+GlTsueisTVzPu3JTSKh5R9E5UbAsqqellgSZyjGsk5kqJXHdHYwG+W0fDt8NDGETyql8JEEpOoVtLVv0mwPaQfQmEFdlSDni0EKnoLvVsJv2HvbOfDSU4x6oXaM/S6Qg8+NvTvsuUeQqvL0WM6nyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeUoUgE1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeUoUgE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726393181; x=1757929181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uppLv4VECLNYt7cYjEM7pGpC2x2Ntif9ubs2PQBulAU=;
  b=ZeUoUgE16cCQNW9fmT+SHckeqJigqPTTnpVHTDkKN+rDGpZuT5jCjFK2
   AavSt5ESXh+/PVccB/TJAc/AnIgtxFi+Im5XRC9L3hsE1gnLQuTCFXzVX
   r5ROWDxNR06JjVwHHuA9XbP49OL5KgO36fjha/Db6pJaV3b6DthrN1aUj
   S0f9uVGZazhmIY1xZnrdsJx/nbvfxUEGQhYrsHgHTimUoZ7MkMxh0uGdN
   3YkQIbY74u7zYToxqVxGKPvXMxDeARrpFeifiauBkbFDnBhzpUrepn4Ag
   uqPzk1HlRrvCNE+qvg/RmwDR7MvP3L0JQgEWan0lrPMbD8mzOU7VJ6qoh
   A==;
X-CSE-ConnectionGUID: tUPmnGDGQOWSDyVvX9+xFA==
X-CSE-MsgGUID: yABKs7lLRVqia3lJSUXdnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="50663002"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="50663002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 02:39:40 -0700
X-CSE-ConnectionGUID: jI3vppVcRf2AVxXpwHQ1rg==
X-CSE-MsgGUID: PanJnT5WRGqRkD71wVFRyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="106035271"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2024 02:39:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spljE-0008aA-1n;
	Sun, 15 Sep 2024 09:39:36 +0000
Date: Sun, 15 Sep 2024 17:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2547/13950] kernel/sched/core.c:11514:74:
 warning: format '%llu' expects argument of type 'long long unsigned int',
 but argument 6 has type 'int'
Message-ID: <202409151723.cHHy97fz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2547/13950] sched: Introduce smart grid scheduling strategy for cfs
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240915/202409151723.cHHy97fz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409151723.cHHy97fz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151723.cHHy97fz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:23,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from kernel/sched/core.c:9:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:160:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     160 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_allbutcpu_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:165:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     165 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_cpumask_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:170:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     170 |         return arch_trigger_cpumask_backtrace(mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
   arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:175:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     175 |         return arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:11374:5: warning: no previous prototype for 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
   11374 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:11415:5: warning: no previous prototype for 'tg_set_affinity_period' [-Wmissing-prototypes]
   11415 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:11429:5: warning: no previous prototype for 'tg_get_affinity_period' [-Wmissing-prototypes]
   11429 | u64 tg_get_affinity_period(struct task_group *tg)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'cpu_affinity_stat_show':
>> kernel/sched/core.c:11514:74: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type 'int' [-Wformat=]
   11514 |                 seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
         |                                                                       ~~~^
         |                                                                          |
         |                                                                          long long unsigned int
         |                                                                       %u
   In file included from kernel/sched/core.c:54:
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
   include/linux/nmi.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
     176 | }
         | ^


vim +11514 kernel/sched/core.c

 11493	
 11494	static int cpu_affinity_stat_show(struct seq_file *sf, void *v)
 11495	{
 11496		struct task_group *tg = css_tg(seq_css(sf));
 11497		struct auto_affinity *auto_affi = tg->auto_affinity;
 11498		struct affinity_domain *ad;
 11499		int i;
 11500	
 11501		/* No stat when dynamic affinity disabled */
 11502		if (!dynamic_affinity_enabled())
 11503			return -EPERM;
 11504	
 11505		if (unlikely(!auto_affi))
 11506			return -EPERM;
 11507	
 11508		ad = &auto_affi->ad;
 11509		seq_printf(sf, "period_active %d\n", auto_affi->period_active);
 11510		seq_printf(sf, "dcount %d\n", ad->dcount);
 11511		seq_printf(sf, "domain_mask 0x%x\n", ad->domain_mask);
 11512		seq_printf(sf, "curr_level %d\n", ad->curr_level);
 11513		for (i = 0; i < ad->dcount; i++)
 11514			seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
 11515				i, cpumask_pr_args(ad->domains[i]),
 11516				schedstat_val(ad->stay_cnt[i]));
 11517	
 11518		return 0;
 11519	}
 11520	#endif /* CONFIG_QOS_SCHED_SMART_GRID */
 11521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
