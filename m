Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05013C17
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742698909; cv=none; b=bm047f7uIZcakHsN2EJMDf3i+4Y2u4lgPgOuC10KZB4IYbt6gR85ii6aoe7Ubuc7SBep0wf3ij0pD0DA7Zp1Tyk+uoQoSyUHrPKmYEc4MCGrIzugrvkRsXeNHikkMUpt/kC8SAZ/W/8GOx5iuSDeW9ViO7dJ/KJHwVAkdK1RwEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742698909; c=relaxed/simple;
	bh=s/Utmy+xEpHLmF63iiDOy7+/LMwLF63il3VXuO4TAfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELaLS0SkJuwSgHRorgyW9Zj5WmR9ZBcxdZO+VQqp4cqGeeXKo1nCMYqrWS7mzKPIziYLMElQMlOtm3dNOmypteNWA2FnvhIvuVs2dBHIa3fjFslENMyqcfDYhpIzusW7OuJmfxVKQxqqQse3taxzf4jTsHoY4zy6KOnfbACc12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwqVZsZC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwqVZsZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742698908; x=1774234908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/Utmy+xEpHLmF63iiDOy7+/LMwLF63il3VXuO4TAfs=;
  b=OwqVZsZCcecc0Vtb+KfBC9Wl1J8SuAMxqHp9/XfX6+yJvB69rCQ9rJVX
   WTzp/qQ3WzxGU5xJ0eILogKNPEjXOJusu5M0do9Mb2jJlTf0C/lf2A1l/
   SUZbzzEo4zZ0TvzAX88aI1nz87AkpfjPy+qR3tswPrgMw271yB2T+DNWc
   LhqOAGicQRutZ4kErdR9iGQToQR/cZlXcwZ1+gURMXWAXbVsAChSl8AE1
   SaD85jWeU2BOsiThGFC6BrhMNwz0dxoMrIPXn0A0ano6c7+wtuQHGeDoP
   KmHqbr6s687cWR4trFvFnNMOCruWH7bJGW2lOMG7EvtWd346vKsbv9O/D
   Q==;
X-CSE-ConnectionGUID: HsuwthDPT5amKKgSbgShDA==
X-CSE-MsgGUID: VcE7eCSyR7aWVwAP0Ku/LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="66391065"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="66391065"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 20:01:47 -0700
X-CSE-ConnectionGUID: wUYEyO2JTmit0BdCoUA0qQ==
X-CSE-MsgGUID: xSkIRit+QQOErn3vEbKyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="128550815"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2025 20:01:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twBao-0002Y3-3D;
	Sun, 23 Mar 2025 03:01:42 +0000
Date: Sun, 23 Mar 2025 11:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] kernel/sched/core.c:11516:4: warning:
 format specifies type 'unsigned long long' but the argument has type 'int'
Message-ID: <202503231038.JR2kOoEd-lkp@intel.com>
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
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2051/2051] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-r061-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231038.JR2kOoEd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503231038.JR2kOoEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231038.JR2kOoEd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:11374:5: warning: no previous prototype for function 'tg_set_dynamic_affinity_mode' [-Wmissing-prototypes]
   int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
       ^
   kernel/sched/core.c:11374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
   ^
   static 
   kernel/sched/core.c:11415:5: warning: no previous prototype for function 'tg_set_affinity_period' [-Wmissing-prototypes]
   int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
       ^
   kernel/sched/core.c:11415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
   ^
   static 
   kernel/sched/core.c:11429:5: warning: no previous prototype for function 'tg_get_affinity_period' [-Wmissing-prototypes]
   u64 tg_get_affinity_period(struct task_group *tg)
       ^
   kernel/sched/core.c:11429:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 tg_get_affinity_period(struct task_group *tg)
   ^
   static 
>> kernel/sched/core.c:11516:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
                           schedstat_val(ad->stay_cnt[i]));
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/stats.h:100:32: note: expanded from macro 'schedstat_val'
   # define   schedstat_val(var)           0
                                           ^
   4 warnings generated.


vim +11516 kernel/sched/core.c

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
