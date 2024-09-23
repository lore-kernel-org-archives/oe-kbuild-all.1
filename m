Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC401474BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727103430; cv=none; b=G3efrReANj0iyUnhj0MRnwAbIVWLjBuYVQjv8ONX6Y4nQcTzXhK03502hPqJ02F4K89GE8sYBncxuXjwBVXtEo8d5JXwH79Lz7xot/q6KC2ZQv9jOirvCBWtRj2S2Qqwj0/rOtWMSzyIyKJOBCJVkTzWi2hDZFKNG70YfveUiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727103430; c=relaxed/simple;
	bh=z6lbWLJGOw4PzZpM+LT3H0A2MF1Xz+OQALfEK8AndwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRPE7LRtQgXaGALyyBbH4pprWwwTobMXd8lce64Y3K0m//yuBggSLmBI9nXE1HfDfMgDLY/7yZC5JANr1QBfYbeKhjkWjtkF7bcTFEkd8yBJvicxrAxiKHZ8f8YujCUs4fI0g+LPZsCv+2C79o8AA7Dqx2+tz5KmD0meze+051A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvWMjvN+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvWMjvN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727103428; x=1758639428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6lbWLJGOw4PzZpM+LT3H0A2MF1Xz+OQALfEK8AndwY=;
  b=LvWMjvN+KC4qusWFGcUjchH76NO6rcvboATyPNGAFYhostWbISSc0vru
   dmQOW+gYtdsLm+YvEyB+/hQN+jl3JEKetwL0U6n9B7x2B9m8uhk161U2P
   ahGhK2pAoycuH3Z5rPlbfCHbPXDasqu4vem0KEQHxOfbbjbXLUDyIS3PL
   UCZNgwVn0/qIIHsQX+6bpZQQnJPDPCJKHKAZKHRCap3lzskHHxI7wkJ3e
   EipnA4aCpUTKYn0Sh+iphREnhFboaZdIWTRYTNxlSn8+x0E+D59ZApqpB
   SkCBQH5rXAvrDpIfauSQ0Pohp40mdz2wEpKjLnLtrheY4BWGBmbkk9BoT
   w==;
X-CSE-ConnectionGUID: kvQVNunVRK22Q9WaZ9XeiA==
X-CSE-MsgGUID: hPf2vqzPToKWFlOZUi0lpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25879870"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="25879870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 07:56:32 -0700
X-CSE-ConnectionGUID: QTTaBRdKQKKVhzCaZuQnzA==
X-CSE-MsgGUID: MhTG18/IQOuWJ1PSRVPHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="71088761"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2024 07:56:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sskUE-000HIW-1Z;
	Mon, 23 Sep 2024 14:56:26 +0000
Date: Mon, 23 Sep 2024 22:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1008/2441]
 kernel/dma/pool.c:77:44: error: 'zone_dma_bits' undeclared
Message-ID: <202409232206.yK1PJJiw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: e82bab3a18d74d251a66047ba23778c818311870 [1008/2441] dma-pool: Only allocate from CMA when in same memory zone
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240923/202409232206.yK1PJJiw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409232206.yK1PJJiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232206.yK1PJJiw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/dma-direct.h:9,
                    from kernel/dma/pool.c:9:
   kernel/dma/pool.c: In function 'cma_in_zone':
>> kernel/dma/pool.c:77:44: error: 'zone_dma_bits' undeclared (first use in this function)
      77 |                 return end <= DMA_BIT_MASK(zone_dma_bits);
         |                                            ^~~~~~~~~~~~~
   include/linux/dma-mapping.h:148:28: note: in definition of macro 'DMA_BIT_MASK'
     148 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                            ^
   kernel/dma/pool.c:77:44: note: each undeclared identifier is reported only once for each function it appears in
      77 |                 return end <= DMA_BIT_MASK(zone_dma_bits);
         |                                            ^~~~~~~~~~~~~
   include/linux/dma-mapping.h:148:28: note: in definition of macro 'DMA_BIT_MASK'
     148 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                            ^


vim +/zone_dma_bits +77 kernel/dma/pool.c

    59	
    60	static bool cma_in_zone(gfp_t gfp)
    61	{
    62		unsigned long size;
    63		phys_addr_t end;
    64		struct cma *cma;
    65	
    66		cma = dev_get_cma_area(NULL);
    67		if (!cma)
    68			return false;
    69	
    70		size = cma_get_size(cma);
    71		if (!size)
    72			return false;
    73	
    74		/* CMA can't cross zone boundaries, see cma_activate_area() */
    75		end = cma_get_base(cma) + size - 1;
    76		if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
  > 77			return end <= DMA_BIT_MASK(zone_dma_bits);
    78		if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
    79			return end <= DMA_BIT_MASK(32);
    80		return true;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
