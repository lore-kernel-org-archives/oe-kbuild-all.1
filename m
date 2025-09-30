Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E43417AE11
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759210023; cv=none; b=Yc/wRBNuscUFec/Ak6S74jm1lk7opkuckSpl3kq/fxn+g+lAFMLotvYRYWzeAidyeqePnSDXSK0xZg4Zh6V1fkXToAGTJEEbGGXLYfLQMj/HH5Mcv2MwAfLmTcdqX4lOcLqhzx+Aq85lR9ret3xNdHwsj4TVGALD3oO4q3PMyg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759210023; c=relaxed/simple;
	bh=kDSko0rLXUPkIyz4ZAc7oZTYe5dFf29qOIV/6k5BycQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLOF5skIekazcZx3fL4kxCOHtQ4+uNCQzXzYVCc5rjfwiq3KMQYx35sqqY/Xd4TLz230ve5E4dizUhxHUGs1OuJMbktVn0bj2OkMP8F8qmvUZ3C7ULYueXV4leXpKW2nFVevQzjNNRD6Gwk16maknYgxQkuPRAUGuJdJodWoveM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyRkKx/6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyRkKx/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759210021; x=1790746021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDSko0rLXUPkIyz4ZAc7oZTYe5dFf29qOIV/6k5BycQ=;
  b=XyRkKx/6pGpqMB7GlbhEi6tS5qXKLPoihB9hHrNWdKYdcC8pf/9pIneb
   vEq7GwtH9UpWr+bccNaxDkpus3lGbrw8rdrsJibKNIaQCqy9dxPGWLrS+
   n2/k3+mzC2FGmo80er2kOPAu/jfafl6hJldwa7tydThBkDJdgsscPcgC6
   o4N2OEVig7fbzKC5QtccxHZGkk4wFZU3+wNAi7VtUKEWlaoVRTEVsKV6S
   0lvmN+g+MYHuwwUU7ujPm1RFlflET6g8VcICVA331zfcJUtSp0iZNR/d/
   AXVB6s8yGKbt5MUdLDvFq4YCL4qrPzCpiab2KrGwweQAzNqBW3VsFsnRH
   w==;
X-CSE-ConnectionGUID: 9SroMCsFT6qcpPZG+MEPNA==
X-CSE-MsgGUID: ZTOwWlahQDC1cL6o1ZpHqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="64080230"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="64080230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 22:27:01 -0700
X-CSE-ConnectionGUID: VsJs1NcYTByrPYYLQ5ZjmQ==
X-CSE-MsgGUID: fN4f5UjhQ8aSwNRGzmaN5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="183608922"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Sep 2025 22:26:59 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3St7-0000vf-1P;
	Tue, 30 Sep 2025 05:26:57 +0000
Date: Tue, 30 Sep 2025 13:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 16/28] drivers/iommu/mtk_iommu.c:713:2:
 error: 'region_id' undeclared
Message-ID: <202509301358.PafvAANR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   88dcad1e4861f296ede23d6aa870ccedb3033a8b
commit: d85e78118452ae73ae5af37d216f68d9e8d310d2 [16/28] iommu/mkt_iommu: Implement mtk_iommu_test_device
config: riscv-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301358.PafvAANR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301358.PafvAANR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301358.PafvAANR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_test_device':
>> drivers/iommu/mtk_iommu.c:713:2: error: 'region_id' undeclared (first use in this function)
     713 |  region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
         |  ^~~~~~~~~
   drivers/iommu/mtk_iommu.c:713:2: note: each undeclared identifier is reported only once for each function it appears in


vim +/region_id +713 drivers/iommu/mtk_iommu.c

   706	
   707	static int mtk_iommu_test_device(struct iommu_domain *domain,
   708					 struct device *dev, ioasid_t pasid,
   709					 struct iommu_domain *old)
   710	{
   711		struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
   712	
 > 713		region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
   714		if (region_id < 0)
   715			return region_id;
   716	
   717		return 0;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
