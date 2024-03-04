Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32DF6026F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709573783; cv=none; b=d3vvbu8uaAS0BjCR8cm0J1Wh8c554KXncLvY0JbuMRCRhu/RCLL8GfQTjqFP+jwgz8D0jNhhj3xMKXZz8QeUsE9U09yjn1ss0MuhN0yw1jPBo77MKiirVLXu/sPBPtauGcdzsMNr9jn+0wIKsSh+ACW/XEwGE8PfSx4/VXikSmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709573783; c=relaxed/simple;
	bh=2o2GrS6yVofq6HKr1hAN13MjkfQgM6tzh00qM87XTwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIBg63KygC0uks1+32xczVhv5L/rMNyKBDBAbrQm7UOUf7iXJVXznVwFxs9KTB0+8VJ0XjDO/6fbKH24uZF3YhTstkdUp53xAbKirNJ847D5gwffl67ZqM0c4OTGy5+8LNkcBzd3bHfQV51GSYbcaS2DOZwsMJgbBfSVMfVIxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOvjw3Zu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOvjw3Zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709573782; x=1741109782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2o2GrS6yVofq6HKr1hAN13MjkfQgM6tzh00qM87XTwE=;
  b=FOvjw3ZuVKaxoTfZ77EcZYcr7KFrSZlu+zz4Nwb0fCSUVfdVqC7RzQRE
   WC89P/GT4wsJ/XIozfSEKnGiKilUpiIN6KMSxa5uGY60+kDWfCswpBQns
   54LYAX6P9qu7ONdTuX7mtGIIzYZiR2E7QQufgseYvERhR4AqJjzbIv61B
   lIm+u67ut18TIIo1M/E5v1lItvqbu+GpMdBoHx6EB1yyAWJEIwXnACvNz
   k/GvuqqGN4rnjAmJ8/JSmt6MQyQoYrM6htpNN7PUuYFUxoq2ySlmbphpw
   PdOGPBvuuyN6kqxyojBwMSytm+RlGuElKQiZA22U1HmUH2kjtk7n61zQ4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4005945"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4005945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 09:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="13768522"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 09:36:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhCEZ-0002fH-29;
	Mon, 04 Mar 2024 17:36:15 +0000
Date: Tue, 5 Mar 2024 01:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/dma/pool.c:77:44: error: 'zone_dma_bits' undeclared
Message-ID: <202403050139.xyNC62YT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 29ee28b1189ab1eb5768b90442888c734cb11033 dma-pool: Only allocate from CMA when in same memory zone
date:   9 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240305/202403050139.xyNC62YT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050139.xyNC62YT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050139.xyNC62YT-lkp@intel.com/

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
