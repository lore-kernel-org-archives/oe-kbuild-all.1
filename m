Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933813DBB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713974063; cv=none; b=WkOpPQGjeogrRQymfEvwU9Htk2w0Eh2YVxEo+HP52+gnoTRu0VPoYee7q9BHr0jfcWMCfzTe7TGyzrpVesh52QuqdV1mX92fgZfcbysWCMe6SUeS0I5FTVYMyUEBI/49lfyBqfv6s27FfoKyLhL+WE8mKFaYUZnKGti2DhZ3dyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713974063; c=relaxed/simple;
	bh=n1wb97nLoYA7rqD7k0TFhR+Y8+SWRi7DBnBht0NYUmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMlZa3UyGT1SN1zmc9i542pN18826ff4CVO4EjzVf/G6xIk5OtIP/+lAHCeK0gnmX8cwB/LMAQx49oKGD0xMUhnOOELqWG1cJK4rMroPx/C07qieAapbsHiQvXelvh9yFLlODLMfDUMAlzLcxsIzmZXCE/kapU2WbubXgYpZlnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y87IIPvj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y87IIPvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713974061; x=1745510061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n1wb97nLoYA7rqD7k0TFhR+Y8+SWRi7DBnBht0NYUmc=;
  b=Y87IIPvjZF3Fk0VUP1IXdim6WCo9Ljvzd+UJjoBEtTQkImTG0cwCbeEC
   BNw4MXvZ0T+Je2SXLlP0kKZ6DsSZxEyccfkeg4loEvy06y0zX3D/xbLJa
   IWx70QIvNgVtwDv5GhFYHl3MvyWubJ138KOJvPyT74yw1Oh5ZQh4iRkdC
   fuPv/xrc4lLvwAbnvPfk4yoUThU1JgHAT6PY62DqB/HhCxDRgrY6JF+x9
   Fqc2wm4xtfir3DuZP5yp5rdfjy5G7ltn27ATcqaG7mEIUjIyTJoz9mrlR
   bAt3xaO18O2ogOCq8dgiWpnBmz4tJqV3W9gj06NORlAM94wWg6Dsexlv+
   g==;
X-CSE-ConnectionGUID: n4MNK8gdQuiy7hZjPEOEfQ==
X-CSE-MsgGUID: gSLSHoWqS8+RgHC3G3nMiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13405000"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="13405000"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 08:54:20 -0700
X-CSE-ConnectionGUID: 6MdCXjJ5Qa+y/NqtZ3sOow==
X-CSE-MsgGUID: dqqz6IWFTrqdJW7DiW0k5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="25267928"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Apr 2024 08:54:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzewr-0001OW-13;
	Wed, 24 Apr 2024 15:54:17 +0000
Date: Wed, 24 Apr 2024 23:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:vtd-update-for-v6.10 19/19]
 drivers/iommu/intel/iommu.c:4378:1: warning: label 'out_tear_down' defined
 but not used
Message-ID: <202404242338.pzb2FOxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git vtd-update-for-v6.10
head:   5157215b83e7ab5a8457a87584a85f1126c4c4ce
commit: 5157215b83e7ab5a8457a87584a85f1126c4c4ce [19/19] Merge remote-tracking branch 'joro-iommu-next/next' into iommu-vtd-next-for-v6.10
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240424/202404242338.pzb2FOxY-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404242338.pzb2FOxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404242338.pzb2FOxY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/intel/iommu.c: In function 'intel_iommu_remove_dev_pasid':
>> drivers/iommu/intel/iommu.c:4378:1: warning: label 'out_tear_down' defined but not used [-Wunused-label]
    4378 | out_tear_down:
         | ^~~~~~~~~~~~~


vim +/out_tear_down +4378 drivers/iommu/intel/iommu.c

933fcd01e97e2b Lu Baolu   2021-02-04  4353  
d2f85a263883b6 Yi Liu     2024-03-28  4354  static void intel_iommu_remove_dev_pasid(struct device *dev, ioasid_t pasid,
d2f85a263883b6 Yi Liu     2024-03-28  4355  					 struct iommu_domain *domain)
eaca8889a1ef50 Lu Baolu   2022-10-31  4356  {
1903ef8f0d7768 Lu Baolu   2023-12-18  4357  	struct device_domain_info *info = dev_iommu_priv_get(dev);
d2f85a263883b6 Yi Liu     2024-03-28  4358  	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
7d0c9da6c15096 Lu Baolu   2023-08-09  4359  	struct dev_pasid_info *curr, *dev_pasid = NULL;
1903ef8f0d7768 Lu Baolu   2023-12-18  4360  	struct intel_iommu *iommu = info->iommu;
7d0c9da6c15096 Lu Baolu   2023-08-09  4361  	unsigned long flags;
eaca8889a1ef50 Lu Baolu   2022-10-31  4362  
7d0c9da6c15096 Lu Baolu   2023-08-09  4363  	spin_lock_irqsave(&dmar_domain->lock, flags);
7d0c9da6c15096 Lu Baolu   2023-08-09  4364  	list_for_each_entry(curr, &dmar_domain->dev_pasids, link_domain) {
7d0c9da6c15096 Lu Baolu   2023-08-09  4365  		if (curr->dev == dev && curr->pasid == pasid) {
7d0c9da6c15096 Lu Baolu   2023-08-09  4366  			list_del(&curr->link_domain);
7d0c9da6c15096 Lu Baolu   2023-08-09  4367  			dev_pasid = curr;
eaca8889a1ef50 Lu Baolu   2022-10-31  4368  			break;
eaca8889a1ef50 Lu Baolu   2022-10-31  4369  		}
eaca8889a1ef50 Lu Baolu   2022-10-31  4370  	}
7d0c9da6c15096 Lu Baolu   2023-08-09  4371  	WARN_ON_ONCE(!dev_pasid);
7d0c9da6c15096 Lu Baolu   2023-08-09  4372  	spin_unlock_irqrestore(&dmar_domain->lock, flags);
eaca8889a1ef50 Lu Baolu   2022-10-31  4373  
da2c55dde1da86 Lu Baolu   2024-04-16  4374  	cache_tag_unassign_domain(dmar_domain, dev, pasid);
7d0c9da6c15096 Lu Baolu   2023-08-09  4375  	domain_detach_iommu(dmar_domain, iommu);
d87731f609318a Jingqi Liu 2023-10-16  4376  	intel_iommu_debugfs_remove_dev_pasid(dev_pasid);
7d0c9da6c15096 Lu Baolu   2023-08-09  4377  	kfree(dev_pasid);
154786235d0156 Lu Baolu   2023-08-09 @4378  out_tear_down:
eaca8889a1ef50 Lu Baolu   2022-10-31  4379  	intel_pasid_tear_down_entry(iommu, dev, pasid, false);
154786235d0156 Lu Baolu   2023-08-09  4380  	intel_drain_pasid_prq(dev, pasid);
eaca8889a1ef50 Lu Baolu   2022-10-31  4381  }
eaca8889a1ef50 Lu Baolu   2022-10-31  4382  

:::::: The code at line 4378 was first introduced by commit
:::::: 154786235d0156ddce9575f13e23f3169e688435 iommu/vt-d: Make prq draining code generic

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
