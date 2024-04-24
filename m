Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863EC161322
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713975986; cv=none; b=E5hf6zFksHkn3KHpncNi5Lz+3vXAk7Ff7bYNjUtvB7LFF9r1wXCVp4tdZrPh+SO25mwxmJpINOW0uGSmf7pGcbAW9oQvt9WtCR234yeTiyqiq7Ky43xAWmAgDpJcmXVJZrNRUU4xZn+lxTq+9kG0dNbNfEIkqBSAgKpP0Ywe6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713975986; c=relaxed/simple;
	bh=4NCGI1i0+SnDgJoGkpqR9TvekhRdnE+73tSz+fa2tcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFNVAL59wy0nPOGExWYtfk5phzAa94Jj0sLZ25/yNCezUZcTKyOXoRsIn4hBHhlFADL42oPOXGgJsDjrYYqzDtoAtrDqOaZ1Lr3LwBw+QhTaSHWpPm4BDAonU5oriTC/2WGCJ3uhRXfEMQqDu+VRbMm4JLO27Yp7FKw5uDX9jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8qjj+dV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8qjj+dV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713975984; x=1745511984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4NCGI1i0+SnDgJoGkpqR9TvekhRdnE+73tSz+fa2tcY=;
  b=N8qjj+dV/uXcnxGAwHu5YEozlutTd5KI4Mohh/StvFg4txYbXNM6z6kg
   jcfLkxlabx3OlEdEOTjRoaKBLp/FL+bCCeN5VQC4uDmJASOD+U7smAjTB
   FL72lOx2kDsFTY5G7xHQzWQH9Qm9ma0LiHy8rIGOH8KpOmUeBDKpYok80
   aZt3bL//VWeOJj+Dnrb/WIuDgX4ARRNNlgnO7SRbVcvAeSW7L5v7gYiZZ
   a7nh+GKCBv94M+w7rDh7LzJY42fxCRzB9X5SJ3I0fdbp+r1UVmKpo/4yz
   i1ldeJV9JjMDZxcYG6SJQS0g5eVOr46+VMc4YKHhC/otwRfGAKN5vmrH/
   A==;
X-CSE-ConnectionGUID: OHs3a/ZvQ6GPr6W760SqwA==
X-CSE-MsgGUID: Y1f+gpZUT+2ABnfMefoYng==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13456305"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="13456305"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 09:26:23 -0700
X-CSE-ConnectionGUID: sUXV04KgTbGRHzpAesn3Sw==
X-CSE-MsgGUID: DRxhQWGfSROwoYeRLObMbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="24779899"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2024 09:26:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzfRr-0001RX-1c;
	Wed, 24 Apr 2024 16:26:19 +0000
Date: Thu, 25 Apr 2024 00:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:vtd-update-for-v6.10 19/19]
 drivers/iommu/intel/iommu.c:4378:1: warning: unused label 'out_tear_down'
Message-ID: <202404250026.Bj2HmnDu-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240425/202404250026.Bj2HmnDu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250026.Bj2HmnDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250026.Bj2HmnDu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:4378:1: warning: unused label 'out_tear_down' [-Wunused-label]
    4378 | out_tear_down:
         | ^~~~~~~~~~~~~~
   1 warning generated.


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
