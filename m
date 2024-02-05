Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D9D32C92
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707150009; cv=none; b=nCCSm3mMfqosVTcKmSvGnjRGv8E/ORDLlGpMvbvxIYzyN9vO0KhDcQDsNQeHHMYsITJHme9TU+IKa+IGcebxBBJqjZROXRbNf7mbY29f4cEiTOlo6aFGLGo/igmlDHgAH9WMOl4fWwcWGTcPNTZderxCYn9IEYvRKDWnbPHOLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707150009; c=relaxed/simple;
	bh=lnp3rqevVSDp9ZREHTz2gvHeKNRKHytovhcjhcB+MB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cVi1gSTfi7eMISV0Exz8aXqT6SpoT853TkHmyb6u88PG9yK/gTZB2iNV2Nl9FpV6/w7aBaISzoi47ioRGHgcd7OonkhH/jGcMq7m01HmkHdMys1c4LApTBH+b2vRoGSWdUNKny8gVDcTFXAXbchwp2ECjJ/sgFxaqpBwqAVu+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNbTB4sa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNbTB4sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707150007; x=1738686007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnp3rqevVSDp9ZREHTz2gvHeKNRKHytovhcjhcB+MB0=;
  b=SNbTB4saaQmVJ/fpI4T9iULFEf1EKYibS0E26grEv0XibNsBI1yrGbor
   zcfHScIUm2ZHT/sGQGx03mT7XPcbeDXUxgUwNIXZlO1v4yZJ6oYT8Ixwb
   v5HANDooXKsdLfhOHHd0vTW1FLCGvDQeDDYYPXHlANVJRTLa0IMvIYnFZ
   ElJkJq3tJlx+xZ8TW4h4RQdZYBduWVgRoE1B7bgVudg8xl0Cvm0ygpwmf
   KpUY1WbVZsg+w3x6vy9Z9iStJlSkRMBP5DGe9LyuJSAK7FNS8pUAseFzs
   LUr8hhxL7dsCLOL9gZ7QrC5mZ+wT6MQVeeY2IwAFxm3zqQdSgDQh3n+Pd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="704665"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="704665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 08:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933190211"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="933190211"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2024 08:17:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX1f1-0000dq-0B;
	Mon, 05 Feb 2024 16:17:31 +0000
Date: Tue, 6 Feb 2024 00:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2533/3004] kernel/sched/core.c:11514:74: warning:
 format '%llu' expects argument of type 'long long unsigned int', but
 argument 6 has type 'int'
Message-ID: <202402060056.fYdLYVrs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fa30d756edd690da32744e72880e2ff10c01208f
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2533/3004] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-002-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060056.fYdLYVrs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060056.fYdLYVrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060056.fYdLYVrs-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
