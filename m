Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28E31E3DCF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321767; cv=none; b=m3U/n/HoOJkttNVUldj54av3RsoWqzQoPUNmbg/Txe0r2pqhwRgPoB/7/kdAM8MTvrSkQBpzPYzjPsVAMMHtFTedcI6xfR14Co1bMlK1erq/Aax7jCMzvzYCOzrFHYiKPI1tvlwmOV+Mt1mq0AFgtARuyosklu8NIgQPqes8R+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321767; c=relaxed/simple;
	bh=JHG7KcEIqvFjRcqFLcIvdL7/DNGiSmqWdKpWAIQGo6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcMSvcF1Jv+6Lm77XVwOklAEtnjxckma8leuOheyKymusv1bSdm+g13fhLy7VX73/O8FGTpzSSUqATZpRqSKJH6T8RnchtaYZH7xzoXB1/L/Kf/QRavhj19q6IR/YuWL6641SMtw2MdX/KmVNZ8Vgo3M7JySFUgmSq/aLBRH0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/OYmADo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/OYmADo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733321766; x=1764857766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHG7KcEIqvFjRcqFLcIvdL7/DNGiSmqWdKpWAIQGo6k=;
  b=B/OYmADoXBnH65sq//HeCHSiAOSD54B36O8m87Zd7QLnnGCUyf7BEgw2
   qrSEH5qWO1LiesDuTS3auEUVM8kusYZoJQwXqsFfmOJDZx8lx03fLicM0
   uykyO6YaBYUfdtjevZtyOJBb20b/lkaQ8nDovXHPMdExxC3ylW1lmeEJl
   SjnHdjuVbJpWoGvibsm70QBkNARimsGbGC9kO5jORqsK5fKPfDoa6ehRV
   Qbuf2Gxh5R5Su1M1MgT+yMg13N3uRKB1DLwVPEavFphb6GCLQHVOB0lbP
   ROr8Svctnuc5IQEKf5fdjNIHwM+0JRXlX6nemutnIJvzajZmjWHuXrk9l
   A==;
X-CSE-ConnectionGUID: ZTv+DkNkRtGVliLS1wIFFg==
X-CSE-MsgGUID: AI4ec6tBSKuYScjea8s5SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37250718"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="37250718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:16:05 -0800
X-CSE-ConnectionGUID: Nd/4m4BLTpukzM4e7s46eQ==
X-CSE-MsgGUID: A7pUW/GiTU24NgxS6JuE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94123197"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2024 06:16:04 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIqAZ-00035x-0h;
	Wed, 04 Dec 2024 14:16:00 +0000
Date: Wed, 4 Dec 2024 22:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 2/3] drivers/iommu/iommu.c:3602:5: error:
 redefinition of 'iommu_dma_prepare_msi'
Message-ID: <202412042213.UJFKBSz7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   b17a3f31fb80cd096e5842d588a2adbc554c24ba
commit: e4dafc45f0215bd522cf81419b29bb31fc894c90 [2/3] iommu: Make iommu_dma_prepare/compose_msi() into a generic operation
config: arc-randconfig-001-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042213.UJFKBSz7-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042213.UJFKBSz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042213.UJFKBSz7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommu.c:3602:5: error: redefinition of 'iommu_dma_prepare_msi'
    3602 | int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommu.c:20:
   include/linux/iommu.h:1536:19: note: previous definition of 'iommu_dma_prepare_msi' with type 'int(struct msi_desc *, phys_addr_t)' {aka 'int(struct msi_desc *, unsigned int)'}
    1536 | static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommu.c:3625:6: error: redefinition of 'iommu_dma_compose_msi_msg'
    3625 | void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iommu.h:1541:20: note: previous definition of 'iommu_dma_compose_msi_msg' with type 'void(struct msi_desc *, struct msi_msg *)'
    1541 | static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_dma_prepare_msi +3602 drivers/iommu/iommu.c

  3590	
  3591	/**
  3592	 * iommu_dma_prepare_msi() - Map the MSI page in the IOMMU domain
  3593	 * @desc: MSI descriptor, will store the MSI page
  3594	 * @msi_addr: MSI target address to be mapped
  3595	 *
  3596	 * The implementation of sw_msi() should take msi_addr and map it to
  3597	 * an IOVA in the domain. msi_desc_get_iommu_cookie() can be used to convay
  3598	 * information to iommu_dma_compose_msi_msg()
  3599	 *
  3600	 * Return: 0 on success or negative error code if the mapping failed.
  3601	 */
> 3602	int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
  3603	{
  3604		struct device *dev = msi_desc_to_dev(desc);
  3605		struct iommu_group *group = dev->iommu_group;
  3606		int ret = 0;
  3607	
  3608		if (!group)
  3609			return 0;
  3610	
  3611		mutex_lock(&group->mutex);
  3612		if (group->domain && group->domain->sw_msi)
  3613			ret = group->domain->sw_msi(group->domain, desc, msi_addr,
  3614						    NULL);
  3615		mutex_unlock(&group->mutex);
  3616		return ret;
  3617	}
  3618	
  3619	/**
  3620	 * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
  3621	 * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
  3622	 * @msg: MSI message containing target physical address
  3623	 *
  3624	 */
> 3625	void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
