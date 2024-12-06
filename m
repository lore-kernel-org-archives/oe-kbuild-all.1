Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0419F170A11
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504581; cv=none; b=OF7hhQUkzBu+FTekKGyULTPKcvLQpWtYAmE3jSNbfhgokSwb7jplmiG1zuxgK7vrwTJS4AQgje1yBdOZoCWn0rd/tRyVKM01ZkIwHr2PF6XlVOMeTKCSnqgAo9xSINHlWO6M7l7ytLeVj6mShtOTRiDVLwdCCJkTNM6UMs72ne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504581; c=relaxed/simple;
	bh=ux0yYXEb1iC9mXDwPqR6kY3Tu9X3mqmnqOo1y4A/1No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I95xBy7qZGAPk+j8Gj3QYBxxTs8RcG6vRerTy1eK/iXRpTDycht6vmt6yXTun+9+GNenrriEseUhBqZffnNPNrniaSuAPC++otSKW6YHhpxpu6SRmEGdtpL7gdSUngKc9TjOXtKuHh2lKHUUpKoKZLjNYMheoqc8SvBt0fsilFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZzsc32N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZzsc32N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733504580; x=1765040580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ux0yYXEb1iC9mXDwPqR6kY3Tu9X3mqmnqOo1y4A/1No=;
  b=VZzsc32N3qOPGHupfxpENw84snoSAMzM41X79RUq5pnaTrQntOqo/DCv
   M2Ns4HDyfn5o/oJ9Gkcb5DoEAhSyQ/7Pnxf38XRAJndLePcoh1Zr6AzNX
   Jv8rVx++oYEY2laKXuU2vGqZgSnpqTr4MTAYzmCN4rm5EI0bkHJj/szu0
   m362zLMlSppsscMxWHm7Ubfc10MgDi8WsxQx/L/DxSDA/LrL7QrNiiqL+
   O5l483fLkRxUIwba4GWqFtAT1rhQulhI4uW69EDZBDvr7k7n8xlIaCVg0
   aWKkPy3gREDogMul903ow9uukeUE5TsZIvo2lPVEfyv9YyhlQRvHru4iG
   g==;
X-CSE-ConnectionGUID: Zt+nUW4pRIOVXV/eRpjltA==
X-CSE-MsgGUID: Xf0rb6D+TCuoSWucZPjLuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33599513"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33599513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:02:58 -0800
X-CSE-ConnectionGUID: ZZhvRsQ7R9KErjCWDQCrlA==
X-CSE-MsgGUID: 9tSE8WBwRny3zmQW2QFSZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99268400"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Dec 2024 09:02:56 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbjC-00026f-0p;
	Fri, 06 Dec 2024 17:02:54 +0000
Date: Sat, 7 Dec 2024 01:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo:devfreq-next 2/4]
 drivers/devfreq/event/rockchip-dfi.c:645:9: error: implicit declaration of
 function 'hrtimer_setup'; did you mean 'timer_setup'?
Message-ID: <202412070000.0qhtOPGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-next
head:   27d1a5d95c5202f927f1155ad8f919778cd9f155
commit: ba13bb7cee6699cfa97ea0f9f84f8d683a5c001d [2/4] PM / devfreq: rockchip-dfi: Switch to use hrtimer_setup()
config: arm-randconfig-002-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070000.0qhtOPGl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070000.0qhtOPGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070000.0qhtOPGl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/devfreq/event/rockchip-dfi.c: In function 'rockchip_ddr_perf_init':
>> drivers/devfreq/event/rockchip-dfi.c:645:9: error: implicit declaration of function 'hrtimer_setup'; did you mean 'timer_setup'? [-Wimplicit-function-declaration]
     645 |         hrtimer_setup(&dfi->timer, rockchip_dfi_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
         |         ^~~~~~~~~~~~~
         |         timer_setup


vim +645 drivers/devfreq/event/rockchip-dfi.c

   596	
   597	static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
   598	{
   599		struct pmu *pmu = &dfi->pmu;
   600		int ret;
   601	
   602		seqlock_init(&dfi->count_seqlock);
   603	
   604		pmu->module = THIS_MODULE;
   605		pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
   606		pmu->task_ctx_nr = perf_invalid_context;
   607		pmu->attr_groups = attr_groups;
   608		pmu->event_init  = rockchip_ddr_perf_event_init;
   609		pmu->add = rockchip_ddr_perf_event_add;
   610		pmu->del = rockchip_ddr_perf_event_del;
   611		pmu->start = rockchip_ddr_perf_event_start;
   612		pmu->stop = rockchip_ddr_perf_event_stop;
   613		pmu->read = rockchip_ddr_perf_event_update;
   614	
   615		dfi->cpu = raw_smp_processor_id();
   616	
   617		ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
   618					      "rockchip_ddr_perf_pmu",
   619					      NULL,
   620					      ddr_perf_offline_cpu);
   621	
   622		if (ret < 0) {
   623			dev_err(dfi->dev, "cpuhp_setup_state_multi failed: %d\n", ret);
   624			return ret;
   625		}
   626	
   627		dfi->cpuhp_state = ret;
   628	
   629		rockchip_dfi_enable(dfi);
   630	
   631		ret = devm_add_action_or_reset(dfi->dev, rockchip_ddr_cpuhp_remove_state, dfi);
   632		if (ret)
   633			return ret;
   634	
   635		ret = cpuhp_state_add_instance_nocalls(dfi->cpuhp_state, &dfi->node);
   636		if (ret) {
   637			dev_err(dfi->dev, "Error %d registering hotplug\n", ret);
   638			return ret;
   639		}
   640	
   641		ret = devm_add_action_or_reset(dfi->dev, rockchip_ddr_cpuhp_remove_instance, dfi);
   642		if (ret)
   643			return ret;
   644	
 > 645		hrtimer_setup(&dfi->timer, rockchip_dfi_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
   646	
   647		switch (dfi->ddr_type) {
   648		case ROCKCHIP_DDRTYPE_LPDDR2:
   649		case ROCKCHIP_DDRTYPE_LPDDR3:
   650			dfi->burst_len = 8;
   651			break;
   652		case ROCKCHIP_DDRTYPE_LPDDR4:
   653		case ROCKCHIP_DDRTYPE_LPDDR4X:
   654			dfi->burst_len = 16;
   655			break;
   656		}
   657	
   658		ret = perf_pmu_register(pmu, "rockchip_ddr", -1);
   659		if (ret)
   660			return ret;
   661	
   662		return devm_add_action_or_reset(dfi->dev, rockchip_ddr_perf_remove, dfi);
   663	}
   664	#else
   665	static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
   666	{
   667		return 0;
   668	}
   669	#endif
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
