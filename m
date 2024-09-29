Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924338396
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727641454; cv=none; b=IQa2p9rllQ66eea3IHu2cHZGDHKc1rhoBSEUB07Mwyluwr7UJH6ufsxs1+acYByh6SIe4wJaNUNUgDL4YP16TlC4wvmGucH3pe1A13zvve95tgASWvXP9FBtbhihGAfCNqa96zP/Iu28djj3IALImDGqtvQPTVeZY4neUTpo7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727641454; c=relaxed/simple;
	bh=vsE5jEOMxKB/yAljOc5YO33naIWSiCpDgoHGS5C8cgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uk6jhGzf2qR0DHjijuabVQicoXs1RMUmea+B2k/8zPO2qnZkeNwzltu+eVRpfLAZi97HVDEeQOjkyIkd59O69VDmpbYpNW1CoxaGoWnEJ+vat1E5KJfRByHqjULyWoEA9ZZpQ4UpmZ46Gyb8054Cn3B50quQylj1a0eoXXQqGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWuc5yq3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWuc5yq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727641452; x=1759177452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsE5jEOMxKB/yAljOc5YO33naIWSiCpDgoHGS5C8cgI=;
  b=AWuc5yq3loa8aAAfBYz/XopwZke5l1QGdE5o8ko5CvYlr1Yvx57k8pYg
   b+diyxtl8pdKQDQRZwwpYygLBsoWutMojtnm/aH2H09zzjXobHaC3nXau
   wS98Zf4T1dezLTblOIEUkkNUcudsxR2S8du+GXZv5VMa3uKMlwUZvLcV0
   HVvdB6glIZwlj7kTGc5r+XFUnjVgHTXPTaIgAYlRINsFFMn8xP3rgbt/X
   n6d66r/hMob1UNRK5sndIUAbL7TvHnQb1u3q4ft8S+ME4yGmXYMB0UgHE
   liV66xhzMHGjpVneRpAZe0xcBzlK3fQ9zuHNojvjhlcyTHssC3QQZU4zW
   A==;
X-CSE-ConnectionGUID: /6npguIFQ52O3oEjjwvHoQ==
X-CSE-MsgGUID: V0r0+fV4Tiic6QhzCoKkmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37396211"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="37396211"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:24:11 -0700
X-CSE-ConnectionGUID: DyqIURdeSSuGNl/Wqt8uig==
X-CSE-MsgGUID: hunnwRcGSZGXjyowDknF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="110577034"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 13:24:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0Sd-000Ofj-2X;
	Sun, 29 Sep 2024 20:24:07 +0000
Date: Mon, 30 Sep 2024 04:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2547/14244] kernel/sched/core.c:11514:74:
 warning: format '%llu' expects argument of type 'long long unsigned int',
 but argument 6 has type 'int'
Message-ID: <202409300437.ZymNl30Z-lkp@intel.com>
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
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2547/14244] sched: Introduce smart grid scheduling strategy for cfs
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300437.ZymNl30Z-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300437.ZymNl30Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300437.ZymNl30Z-lkp@intel.com/

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
