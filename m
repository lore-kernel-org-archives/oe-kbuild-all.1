Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D2318130
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166739; cv=none; b=uRtK7dMinXLquoR616+NDBU9T7Hr6yzg0S4H9WBJQsm01cFpjYg1JAdsgNtK6t+1CS1ECz5buflppk/EpsbriG2LKjdet1dZdInKtwsC5Ht+mSOVix3LaYX/lAuCLEeFUASCumP1mrEXGXhOvQh71ksg9im+R7NmJ7Cp0ZlPBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166739; c=relaxed/simple;
	bh=VyTlNZkKgWToVFeMn9FWj07qB5T77KPRbYpNN4mIpHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeWu7bSgYhaEJg8OaKRZJ1mNZsiEnc5UzHUBaA3JAVa0pIHZwQVJJmsbZGFu54Oho/AHLuvIGiPIiQYazEoJnsspxAUyZepuuYkfMiWGey7+r/tMleiDawymAsCpQLcuCJuM6LllKU6CMgQlM4Zlqlcy4s0WOvmyKKmMYiB0SdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miEFiBIr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miEFiBIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755166738; x=1786702738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyTlNZkKgWToVFeMn9FWj07qB5T77KPRbYpNN4mIpHI=;
  b=miEFiBIr/BvPghcI+Pw9WfbdvAgPJLRQGwjsIcfrDhhlZHDKHp8AD0f3
   iW8gaWZAQVUDTmR4Ppm4xQkRcjDDNcpxS8RCsb9RCu2arlxSvi/v3qlTv
   cteI+AaRL+YwZAJjEjMeuH6s0Ubuwl1V98qzbaVZVpIsbRaqQBvq4i0qw
   dmYVa8QisO3v7p97BsI4j7kDSdId1dyBz1RBD40+AK9bZ9082W/p162Nh
   bMhfVhP6sIrdw4+p+gpcNlczd/EOwmnXQIprQCvgJ41UaBVcPhHEDwYNM
   ROmKM+LRBUVuDKS4KX+AOhV7lm910IgOtzjvarpV9wDZo3mVDmj5IZwpP
   Q==;
X-CSE-ConnectionGUID: gyop0ioSTKGSsgCPsMe4bw==
X-CSE-MsgGUID: xHw8X3Z1SkeEGdPVWvKtOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74930111"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="74930111"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 03:18:57 -0700
X-CSE-ConnectionGUID: 52gQhU3bQl6/LXtCItma5w==
X-CSE-MsgGUID: j766apnhSOyWpIoJNSzHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165943558"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 03:18:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umV2r-000AqS-2r;
	Thu, 14 Aug 2025 10:18:53 +0000
Date: Thu, 14 Aug 2025 18:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] block/genhd.c:100:6: warning: no
 previous prototype for 'part_stat_read_all'
Message-ID: <202508142059.0te3dxlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 89fa7dcff5e533bd14396601f40c388cfb6c1e59 [2679/2679] bpf-rvi: block: Add diskstats iterator target
config: arm64-randconfig-004-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142059.0te3dxlW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142059.0te3dxlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142059.0te3dxlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:100:6: warning: no previous prototype for 'part_stat_read_all' [-Wmissing-prototypes]
     100 | void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
         |      ^~~~~~~~~~~~~~~~~~


vim +/part_stat_read_all +100 block/genhd.c

    99	
 > 100	void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
   101	{
   102		int cpu;
   103	
   104		memset(stat, 0, sizeof(struct disk_stats));
   105		for_each_possible_cpu(cpu) {
   106			struct disk_stats *ptr = per_cpu_ptr(part->bd_stats, cpu);
   107			int group;
   108	
   109			for (group = 0; group < NR_STAT_GROUPS; group++) {
   110				stat->nsecs[group] += ptr->nsecs[group];
   111				stat->sectors[group] += ptr->sectors[group];
   112				stat->ios[group] += ptr->ios[group];
   113				stat->merges[group] += ptr->merges[group];
   114			}
   115	
   116			stat->io_ticks += ptr->io_ticks;
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
