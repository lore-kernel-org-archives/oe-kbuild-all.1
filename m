Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2D3D9E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712863046; cv=none; b=P3ZgU8lSnxPcloabcrY1vmUdnlb9/0bIFko9wGpE/a0/SKmnfsbGOvEbqreCbnlWFQJoWnkvQqSmdPssRN3rpmcSEp9/V2fJ76pk963+LXSklR1eR28v+pI9b7gI+mvRRSQ2d0rnr8x2JxNJDy9Md+VGcW8dDwz5VloToMori2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712863046; c=relaxed/simple;
	bh=ac2bgYD+sloHO+BfzapGJ4MHhBnWh42Ra8wjQsPklcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fg5zIQSufs1q03opWlS+VFQrL1Ewn3+CBoMI2vdGwxKgrOEELPzMCKDsBZ5tCeZ3RWXazfxyeIechrlVYPMUQ1ts3DpXPTxT647oFHjUJe2HjZwATUQW9GH88sVtWYjHoXx6ceqpY9Neqa+W4L7sFcJCVivaOqDrdJIocyhawnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9ummJ5H; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9ummJ5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712863044; x=1744399044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ac2bgYD+sloHO+BfzapGJ4MHhBnWh42Ra8wjQsPklcc=;
  b=L9ummJ5HZ2IGwPLTUrfJd/s+Ooe78ddz10xdNh7aGVk1L7xyWKIp+xIE
   yvBQiiPnYNkAUnJP1q3poCmg7mZ2yYxWiri/lcGgZMH0GZoiFv1fifEpD
   cbX8Lof8QEvHwlccNwfUCoSUWNc77B2eTigjxRPPGDYpZGaEpiDc9TdW6
   SMwDQxKW5dmubv+hWUfTnps6WnM4Y5EwB4whtMUgRhvsJY44iFIkLbhFm
   Jdb/E/+Rwro/OrxNV5gaBqeYfNPm+qF4cLnIJBLkRrXOdqpleXHTbAhKn
   A4IFtbh1RBG2z3dglGVVSRW7WH5WKiVzqLLLv0N5oKWs2gbI3mMTjrK+j
   Q==;
X-CSE-ConnectionGUID: EcksSpYAQhmWsztEpaddhQ==
X-CSE-MsgGUID: NzmIqViMT+K1l0OtVh3jHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19451245"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19451245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 12:17:24 -0700
X-CSE-ConnectionGUID: YmopEGAUQXaWbvkVu7PbfA==
X-CSE-MsgGUID: vClF4lScR2idAxs/luO4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25646933"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2024 12:17:23 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruzvE-0008uv-1J;
	Thu, 11 Apr 2024 19:17:20 +0000
Date: Fri, 12 Apr 2024 03:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/7374] mm/page_cache_limit.c:35:5: sparse:
 sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be
 static?
Message-ID: <202404120351.SxZeSfTi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [1834/7374] mm: support periodical memory reclaim
config: x86_64-randconfig-123-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120351.SxZeSfTi-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120351.SxZeSfTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120351.SxZeSfTi-lkp@intel.com/

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
