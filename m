Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3C3594A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759215614; cv=none; b=n65T1wXvZvMqZxoqtLrF0ujj1KOEKdXiyfXWSpAH20IBJiZhSq8Xwq6eaV+WIIuE0TP2Vk2gA3p5FONm0gbxog8VL8/qgtl2Mo3hQHl84jCuLgAUFkiKFof2WP2iriAFdMblhSlQazVgWXBE9Pekm2njlCigNyOSJ7/W16R15gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759215614; c=relaxed/simple;
	bh=Y2M4xAcFK656sfJxBHG5t1Mk0/sv0pxMy7SVdUzvuCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lRwZqF7zys757MDWDL/tznz9u/0z/MDVYhw10Yp08H03nSL0qWGaQGyyPMqtc67IkamCI72DBAvhpJ2AP35/BmUV2WqW2Bp49qeRnzOiVfv7PU3xSpwFQzS2gU2swl31RvNLmvfCrAG+uw9KiminT5HNLqeFanvKHwPszkjF9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcj+Wq8q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcj+Wq8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759215612; x=1790751612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y2M4xAcFK656sfJxBHG5t1Mk0/sv0pxMy7SVdUzvuCU=;
  b=mcj+Wq8qHguDD0Cbr2WvJOY8BC049NrH5LkbM5eb4toX7KBAs8H5P1Tk
   ErQX7J3EpFWHBByox1NMxgq7V64RmHCzfcvWcHZY+4ZhY1jPAUeesZ9NR
   +ENP3/0VaVpxEK336wongOHv7pJqMrSOFkBkmOc0SrViUITW5aZI9ETTa
   vZW62Viozrt04J0H0VH4EF6h2VJ0u0fLsQCdc0Ls/0lHcFD4qQWfI/iDx
   jCtbtAEncodemvgmGsgsa2epvIsssHmWQqEsZ/g4EL46uIcajt53vM1cM
   xx6kfZsekPPqxg2jA0Wnzsbkr0kPnjIVnhDzCbqk8v4vufIx+3TMJ/gcG
   Q==;
X-CSE-ConnectionGUID: oawwRfQXQpSZwPAO5LpYiw==
X-CSE-MsgGUID: 4cQSLPuFT8+DS+H/ABwfjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="78887365"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="78887365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 00:00:12 -0700
X-CSE-ConnectionGUID: yZcETGJVTJ2Gy5bb+NF+oA==
X-CSE-MsgGUID: XZmvU3U2R+yhNLpuIJgYDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178239834"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2025 00:00:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3ULH-0000zD-2m;
	Tue, 30 Sep 2025 07:00:07 +0000
Date: Tue, 30 Sep 2025 14:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 18/28] drivers/iommu/ipmmu-vmsa.c:599:22:
 warning: unused variable 'i'
Message-ID: <202509301444.YSicwMA6-lkp@intel.com>
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
commit: 6592e9df15aadae830e2a3bfd156879310d16666 [18/28] iommu/ipmmu-vmsa: Implement ipmmu_domain_test_device
config: x86_64-buildonly-randconfig-002-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301444.YSicwMA6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301444.YSicwMA6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301444.YSicwMA6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ipmmu-vmsa.c: In function 'ipmmu_domain_test_device':
>> drivers/iommu/ipmmu-vmsa.c:599:22: warning: unused variable 'i' [-Wunused-variable]
     599 |         unsigned int i;
         |                      ^
>> drivers/iommu/ipmmu-vmsa.c:596:30: warning: unused variable 'fwspec' [-Wunused-variable]
     596 |         struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
         |                              ^~~~~~


vim +/i +599 drivers/iommu/ipmmu-vmsa.c

d25a2a16f0889de Laurent Pinchart 2014-04-02  591  
6592e9df15aadae Nicolin Chen     2025-09-25  592  static int ipmmu_domain_test_device(struct iommu_domain *io_domain,
6592e9df15aadae Nicolin Chen     2025-09-25  593  				    struct device *dev, ioasid_t pasid,
6592e9df15aadae Nicolin Chen     2025-09-25  594  				    struct iommu_domain *old)
d25a2a16f0889de Laurent Pinchart 2014-04-02  595  {
df90365580623b5 Joerg Roedel     2018-11-29 @596  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
e4efe4a9a2ace65 Robin Murphy     2017-10-13  597  	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
5914c5fdde92660 Joerg Roedel     2015-03-26  598  	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
a166d31ee56e8fc Laurent Pinchart 2014-07-24 @599  	unsigned int i;
d25a2a16f0889de Laurent Pinchart 2014-04-02  600  
e4efe4a9a2ace65 Robin Murphy     2017-10-13  601  	if (!mmu) {
6592e9df15aadae Nicolin Chen     2025-09-25  602  		dev_dbg(dev, "Cannot attach to IPMMU\n");
d25a2a16f0889de Laurent Pinchart 2014-04-02  603  		return -ENXIO;
d25a2a16f0889de Laurent Pinchart 2014-04-02  604  	}
d25a2a16f0889de Laurent Pinchart 2014-04-02  605  
6592e9df15aadae Nicolin Chen     2025-09-25  606  	scoped_guard(mutex, &domain->mutex) {
6592e9df15aadae Nicolin Chen     2025-09-25  607  		/*
6592e9df15aadae Nicolin Chen     2025-09-25  608  		 * Something is wrong, we can't attach two devices using different
6592e9df15aadae Nicolin Chen     2025-09-25  609  		 * IOMMUs to the same domain.
6592e9df15aadae Nicolin Chen     2025-09-25  610  		 */
6592e9df15aadae Nicolin Chen     2025-09-25  611  		if (domain->mmu && domain->mmu != mmu)
6592e9df15aadae Nicolin Chen     2025-09-25  612  			return -EINVAL;
6592e9df15aadae Nicolin Chen     2025-09-25  613  	}
6592e9df15aadae Nicolin Chen     2025-09-25  614  
6592e9df15aadae Nicolin Chen     2025-09-25  615  	return 0;
6592e9df15aadae Nicolin Chen     2025-09-25  616  }
6592e9df15aadae Nicolin Chen     2025-09-25  617  

:::::: The code at line 599 was first introduced by commit
:::::: a166d31ee56e8fc56ce2497d8de9da5359f4ee41 iommu/ipmmu-vmsa: Support multiple micro TLBs per device

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
