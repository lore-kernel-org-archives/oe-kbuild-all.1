Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF31C1F22
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756948886; cv=none; b=CF1KxKVKXWxq5RKSPj78SRUJLTxR3X3Ea2K+owhDClbNIWeLsVIfA+3QOfCvN9CYqCRkwzNd6+zb43XHcA6hk1xSIpLk/1ABYj4QucMC6hQ9WXBnUFqZVyu6arYoTAZ6ZP0gtJ6JkgejFOyHBt6Kj5XBwA7lsfgTL39+zmJ9ZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756948886; c=relaxed/simple;
	bh=6KrGAD12I2GjICioKWRPUzMq54a9VL2yfThwM5sXt6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evch4rk6yH+f+hFxe0nnobU8KwpcfrXV8d1JSsHKd7So4bLV11R4ie4ZxF2VDynChXeEjUPlWUrJrKpe/cQHIrzBQ4vfluzSycRV7c46PVhvXJGgRhHe6dvpKsBbsjQPbDRqmw6DormAVSWKz1pVjjT0OxZENXa9/ip53vHr1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7aZFifJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7aZFifJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756948884; x=1788484884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KrGAD12I2GjICioKWRPUzMq54a9VL2yfThwM5sXt6c=;
  b=k7aZFifJV9pOszmKO6O+Z3xr4D29hO6wuS6ZrCUH7+h/euanaMOYs+fR
   rcabAvJMqJjei+ma+6r56O33h8gB0ViT/n+21T1pBrtW9VXt6B76H5LkY
   5Vr3a+uq+VgvDYAg9Y966ElNy3DdTta3cn05xNt4XSFzW37hBUof8hrSz
   LBb5HlzRjxGkM052FyJtk+5lPbwb3KTnUxhA41wcDVu85T/4rxKUMXVbU
   5dTxcWqJKFBP6/LzAn63KTy4ppos7iZbshOzyEU3S4DMeYASjipRY8l67
   JPADitD7pErmDrPPF4XX2CgyEWKVQnuOP9jM44zugxze+EIua0QkcIA1S
   w==;
X-CSE-ConnectionGUID: uHuLK8VoQDy8+nju/Dksow==
X-CSE-MsgGUID: 8S9ZtaAVT720lilKuBx44A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59345268"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59345268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:21:24 -0700
X-CSE-ConnectionGUID: 0VmJblOBSwmnVANC7rh4Yw==
X-CSE-MsgGUID: lPXtf5X+SGOggVPRWa4ztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171002726"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Sep 2025 18:21:22 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utyfA-0004Zf-0a;
	Thu, 04 Sep 2025 01:21:20 +0000
Date: Thu, 4 Sep 2025 09:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2846/2846] mm/page_cache_limit.c:35:5: sparse:
 sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be
 static?
Message-ID: <202509040941.AlP6u8hL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f78b7221366fb23b7dab14e9da7969a0a1b05ba1
commit: 621647ce254f1d347ae9bc3d328c09cbb2732487 [2846/2846] mm: support periodical memory reclaim
config: arm64-randconfig-r121-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040941.AlP6u8hL-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250904/202509040941.AlP6u8hL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040941.AlP6u8hL-lkp@intel.com/

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
