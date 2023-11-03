Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC97241EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRCphVs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699048858; x=1730584858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ov38wCD5Xx25TLZjE7vnd2DqP+j5ES2nvxqORc5TJkw=;
  b=lRCphVs/Kd4Sjfp5JMlytyM92IWGLF5D9iuSAurkZESbggDVDGoF04QN
   WhecGjmJz8QCETY9t3mflz0UNANtucGydwgDIaXh3OyTQuu7JNv0tMRAl
   k1ccJFBquhywXHxUcaeTARWl5TXQyJowi4x/tl/Q2n1W7L8a3m/cTtFnU
   ZCdVl4aH+k7v4MOKmEU8VVZuR3YNgLQJr8xojfnaGRPGfJHZdMmT4W/33
   Bj9DYJreBoJAfG4PtJZrQ5lb0LJC2C3MkWc//Xj5rU+oLB6z56B8OxL2+
   sr2Dzs4d3xLJ5Z99QDRkbjVuHkSkflNyDRxZF0JHiSzXDqbzwon9spTHd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387918178"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="387918178"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765385305"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765385305"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 15:00:56 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2Dm-0002yu-0E;
	Fri, 03 Nov 2023 22:00:54 +0000
Date: Sat, 4 Nov 2023 06:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 13/19] include/linux/iommu.h:1046:1: error:
 duplicate 'static'
Message-ID: <202311040506.Xvnmwsk5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   a387bf414bfa3cc4e39cc07d1cfb257a13081c8e
commit: b3ab4f98bfca2e0081adf28d3d4fafadee518ce8 [13/19] iommu: Make iommu_ops_from_fwnode() static
config: arc-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040506.Xvnmwsk5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040506.Xvnmwsk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040506.Xvnmwsk5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sfc/siena/rx.c:17:
>> include/linux/iommu.h:1046:1: error: duplicate 'static'
    1046 | static inline int
         | ^~~~~~


vim +/static +1046 include/linux/iommu.h

57f98d2f61e191 Robin Murphy      2016-09-13  1044  
e4f10ffe4c9b50 Lorenzo Pieralisi 2016-11-21  1045  static inline
a3a195929d40b3 Lu Baolu          2019-03-25 @1046  static inline int
a3a195929d40b3 Lu Baolu          2019-03-25  1047  iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
a3a195929d40b3 Lu Baolu          2019-03-25  1048  {
a3a195929d40b3 Lu Baolu          2019-03-25  1049  	return -ENODEV;
a3a195929d40b3 Lu Baolu          2019-03-25  1050  }
a3a195929d40b3 Lu Baolu          2019-03-25  1051  

:::::: The code at line 1046 was first introduced by commit
:::::: a3a195929d40b38833ffd0f82b2db2cc898641eb iommu: Add APIs for multiple domains per device

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
