Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757E176ADE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735254151; cv=none; b=qic2Qa8/+1ZIYrWGudXj/FM+euG7Rsw5bvsLFcFfy+vvmPsRhVBlfrC1b4p/gevde8CtYQMSj9oo6zrOEUJcTezZl4CET7O8E/RI7vBJ+6rb/Kb/hYF7A18EmYkmhdIrWodvrpXJJVkC+uAthEs0cmuJT5EvaC3lcTf2sGYkfBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735254151; c=relaxed/simple;
	bh=tSqTbZPJlxPHwRDMKxPF6j/TBXlDHeMvmq+xppgoj6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQ8pqHusmqJxfbcm0Eu7bmR/h4vLqq9zU2Lv7GODtNxTm4lNgimGfUvxIpXO90Kdq2fCPr2Li2KIwNrYHD2oTUXMKpa6LCZa5vefOLN8dnkGTm8Hv5m8bzGklz20TkZZQfcG0a/5GCiQoakbsleB+39DJMIE/IFpoUB8NMh2TlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHrxqLLr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHrxqLLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735254148; x=1766790148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tSqTbZPJlxPHwRDMKxPF6j/TBXlDHeMvmq+xppgoj6A=;
  b=BHrxqLLrEe2N3+WkymfwbWFBw28ixf0GHC9g6D4VvIFFZp09vLUO6BmW
   Z+LltdYcAcek12nOB8x4G7nJYRfvxECID8dG9x0XIhFWgVGqF7NBz6ByB
   bJv+wjf+m5wI13bRlIyzJcKkt9HDYQMgq/SJ3QCwJrI85lSaSgEn9xbY4
   iDpf2dLpCmwXGNwtR26iblkgXdB4oXra/QpAN1YFNdhU3IcbRBpFqQTQA
   8H3bxRMmsxnf+vWxGyIkP7hqxbPW6eS+e7Ue7f/+atCCRJV+HomBJIS5B
   ZOP1zVEbZuXxbmHgC6WPDujXglHE8EnXZr9DgAXCew4/sUya/Bz/q8xsv
   Q==;
X-CSE-ConnectionGUID: ElWZg9MySPOCjviL2nwziQ==
X-CSE-MsgGUID: 18YEHuycSceT2QNsUk6MzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="46666633"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="46666633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 15:02:28 -0800
X-CSE-ConnectionGUID: vy21rOaHRJuiF8wG0tQC2Q==
X-CSE-MsgGUID: cD9RkeaKSymlzU4lJudLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="130873121"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Dec 2024 15:02:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQws5-0002qA-0J;
	Thu, 26 Dec 2024 23:02:25 +0000
Date: Fri, 27 Dec 2024 07:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1667/1667] mm/page_cache_limit.c:35:5: sparse:
 sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be
 static?
Message-ID: <202412270644.ScfyxcPp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   16a0cbac6609f8ba10a91a9d52b15bf28243c3ee
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [1667/1667] mm: support periodical memory reclaim
config: loongarch-randconfig-r121-20241227 (https://download.01.org/0day-ci/archive/20241227/202412270644.ScfyxcPp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412270644.ScfyxcPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270644.ScfyxcPp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_cache_limit.c:35:5: sparse: sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be static?
>> mm/page_cache_limit.c:51:5: sparse: sparse: symbol 'cache_reclaim_sysctl_handler' was not declared. Should it be static?

vim +/cache_reclaim_enable_handler +35 mm/page_cache_limit.c

    34	
  > 35	int cache_reclaim_enable_handler(struct ctl_table *table, int write,
    36				void *buffer, size_t *length, loff_t *ppos)
    37	{
    38		int ret;
    39	
    40		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    41		if (ret || !write)
    42			return ret;
    43	
    44		if (should_periodical_reclaim())
    45			schedule_delayed_work(&shepherd, round_jiffies_relative(
    46				(unsigned long)vm_cache_reclaim_s * HZ));
    47	
    48		return 0;
    49	}
    50	
  > 51	int cache_reclaim_sysctl_handler(struct ctl_table *table, int write,
    52			void *buffer, size_t *length, loff_t *ppos)
    53	{
    54		int ret;
    55	
    56		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
    57		if (ret || !write)
    58			return ret;
    59	
    60		if (should_periodical_reclaim())
    61			mod_delayed_work(system_unbound_wq, &shepherd,
    62					round_jiffies_relative(
    63					(unsigned long)vm_cache_reclaim_s * HZ));
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
