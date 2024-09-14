Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D01642B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726284401; cv=none; b=Dp2iGNZ2e+kZuhKiSSYYFM9lYD4OZefOexqTj5TEWtwym2GkrJ05yHLVIAiUberl+oLpemlyHSqQPJEmq3HzInW07u5jZMtyJYP6jXVlRyiLjqckuVQJChJE0RQlzIg986tLN7vb4/ZhSm4Oze20A3qmHhW6RRG1j+Z+TbKYPkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726284401; c=relaxed/simple;
	bh=tU7LtkPPzxBQ3Yco9V1/dO8KgGWkqwPlQiC9wDFkEB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JATzVEmMvcl87tsmcnQqmQK2uQEeJc6XO0l+3bwFRwa4JqT4VH0zbYu2DEVEG0qQ0SAjYYTzqLtUD+Xhaq6s1yWJRv2YYSS/MfMkU2eU/XgQVtppOnbokq2hb6nKUfSJxq6EozedrCkweIRec+Xc1diyiCTuRR4lNNnHe6otAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXyFM2eC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXyFM2eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726284399; x=1757820399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tU7LtkPPzxBQ3Yco9V1/dO8KgGWkqwPlQiC9wDFkEB4=;
  b=dXyFM2eCRDYpg6qk5mB5ciiSp0fbnaBkaCR+I7PrKc1YDjWenhCrpGDx
   GkpjAQs/z1vYcBRVqPdu6x67XGdXuiJytJrxB0Zbr4OfoHhavSVrJ+gUe
   E7BaxC9y/zp2HMHGSfrgNM1u4Vtj/D8f3UoP7u6ab93fTXcvZxs3pnC/f
   z04D28Uz2gGEivU/CLVogNLdL3bYTHNXWUwxhRS3mK7rxY6c7OMAz3ND1
   Re+aIgPOTVP1oCQeWVgi79y5VYVIYHdpaCrEzJcDbboMLFMa52yjdHMcM
   ByTDxp0Lrb0X0qeidLNd960gusJvOd/DBOqst3zuMP7rXbZ5awOIT7V/q
   A==;
X-CSE-ConnectionGUID: HtpgoM/+QUuU5wjp+hjaPw==
X-CSE-MsgGUID: 1Ma7K4eKSfi7BE2kvPqTAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24681056"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="24681056"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 20:26:38 -0700
X-CSE-ConnectionGUID: YjphYCdERXKt7l0a33grvg==
X-CSE-MsgGUID: WZiHuMzlT/65N5BauZamMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="91566203"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2024 20:26:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJQh-0007Jg-13;
	Sat, 14 Sep 2024 03:26:35 +0000
Date: Sat, 14 Sep 2024 11:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/13938] mm/page_cache_limit.c:35:5: sparse:
 sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be
 static?
Message-ID: <202409141142.ffRDmgO2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   292de9750592324fa903dc314670538f50b4c19a
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [1834/13938] mm: support periodical memory reclaim
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141142.ffRDmgO2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409141142.ffRDmgO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141142.ffRDmgO2-lkp@intel.com/

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
