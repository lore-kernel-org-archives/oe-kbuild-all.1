Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CEB1AF0BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734038265; cv=none; b=P46YGXc0UmTosdGO6kBp/dVw9YNc7TN7oIA50j0Nez7EsDCukz7P39vCNgVXdpsAwN5X2DAL6cQIMutDH+7T3+VKsZIPdyjt8/CUBgE1baOdTml1WfvdSPRYiw/hzaFiTuh9T4/5lsf4QlcrO3KIQaOIc90xoReELPKXAgCAwR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734038265; c=relaxed/simple;
	bh=/ruvZGVmuKqNfAvpGcaVcjh+K2u5IXlSSb9vA2G88r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TrZsOdFsW+3FV/kaatv9prLjE2oUT1wGn0SOo32P0XtDSFDwDM788t8fgZVxsmF6mXsjYhwDoSYqhFWnbAXJ5CG2n0IySjKZUlJNtxHCCA/oJalthVXHHeX4Z2mp+P+5qS1Qo6s5l4rhe1NRutqvCEZrYfnR8Udr4HKKzlKPlmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtS4m0Wr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtS4m0Wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734038264; x=1765574264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ruvZGVmuKqNfAvpGcaVcjh+K2u5IXlSSb9vA2G88r4=;
  b=XtS4m0Wr/0cluKkK8lruyzhefSfNCPIo17teX9yDRFz+9EPrLD4WFwgw
   FTPLkSi72tmAIxwnx2smbtpSv0NHjFoYjRCoXpuf3wtbiMXrtSYx7vHv4
   5/6CDUkwnfReQJjiP5eFIeUTGZzWqX9aHVpjCVE5MaFE07KuY6KSeAyjM
   QxDUcACN13Xa78CFD4sTXKciKv9iwNcvR+N0TiU6/Yzo3Q/sLRuWh/xPA
   trlOgNIhpCqtce32w84ThEnjWEoJ1fDkCsofxFeD/lUOzc52HIthMo1Ur
   lU4+Ho2O20kSKjD2oIOX/TZHZkPT7IqL/rrqUmTyCvFqtL36qgwOVSBR/
   w==;
X-CSE-ConnectionGUID: 8tf92GkLRUeYjBSyS2YZVw==
X-CSE-MsgGUID: jPnGIt42Q1Kis5jHku+mtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="56950610"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="56950610"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 13:17:42 -0800
X-CSE-ConnectionGUID: zIw8gg+AQn+o2R5CrI0+wA==
X-CSE-MsgGUID: KHbmzv8qRDG1vZ49BMdLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96780110"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Dec 2024 13:17:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLqYz-000BNZ-2E;
	Thu, 12 Dec 2024 21:17:37 +0000
Date: Fri, 13 Dec 2024 05:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yipeng Zou <zouyipeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] kernel/sched/core.c:9632:74: warning:
 format '%llu' expects argument of type 'long long unsigned int', but
 argument 6 has type 'int'
Message-ID: <202412130534.AeGefPCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ff5378fff024fcb2552e6da22811cf933fe4a4c0
commit: 00d37128abe2687fac974c5d21aa67fac6518c7c [2579/2579] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-002-20241213 (https://download.01.org/0day-ci/archive/20241213/202412130534.AeGefPCj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241213/202412130534.AeGefPCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412130534.AeGefPCj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:2746:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    2746 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9530:5: warning: no previous prototype for 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
    9530 | int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9567:5: warning: no previous prototype for 'tg_set_affinity_period' [-Wmissing-prototypes]
    9567 | int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:9578:5: warning: no previous prototype for 'tg_get_affinity_period' [-Wmissing-prototypes]
    9578 | u64 tg_get_affinity_period(struct task_group *tg)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'cpu_affinity_stat_show':
>> kernel/sched/core.c:9632:74: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type 'int' [-Wformat=]
    9632 |                 seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
         |                                                                       ~~~^
         |                                                                          |
         |                                                                          long long unsigned int
         |                                                                       %u


vim +9632 kernel/sched/core.c

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
> 9632			seq_printf(sf, "sd_level %d, cpu list %*pbl, stay_cnt %llu\n",
  9633				i, cpumask_pr_args(ad->domains[i]),
  9634				schedstat_val(ad->stay_cnt[i]));
  9635	
  9636		return 0;
  9637	}
  9638	#endif /* CONFIG_QOS_SCHED_SMART_GRID */
  9639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
