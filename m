Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558517994
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZVJPm7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700216222; x=1731752222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDP9NjTgFCyEGVaOp4Ztku1nMOb9irGv/g0YdAN/lf0=;
  b=TZVJPm7mOtv8vXA5PvpUa81YLjk+Sv4aAhHodwBxBH7oOwYQQC+b+SHj
   mswKeUHYMKxzONU/4U8BZ2H+FjpCRgImO7NoDED55Omxr3og8JP34IAf+
   Xmoep+imzWMmbDqTT4/VAIJxty51ORl5nE4jbODRNJv1sed5JtQGHG9+5
   2vBZX28uaMUW2wvzgh+TeVKI14mn7bglgPOD+XmJBwxrLX+qkXH5LgdGg
   b4EUCedYe9CD2BvIXzJ3fLj/6msf7JSitT2vkLDR6Nx6EHNNLA5zn6jbh
   nXiTkzvrjyuJFx5moX9SezjO9qtItj+lxRq9mFp6Ats2Q8J+ruu0Hzim5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394125852"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="394125852"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831574883"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831574883"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2023 02:16:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3vto-0002bU-36;
	Fri, 17 Nov 2023 10:16:34 +0000
Date: Fri, 17 Nov 2023 18:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 1/20]
 drivers/iommu/iommu.c:3467:15: warning: unused variable 'curr'
Message-ID: <202311171832.8Qp9JxDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11142023-yi
head:   92f313909ee3753f73c9b3341a34aa28116edb62
commit: 7f8ef55dc82d120b5e52afd5518c71bb0ca018b9 [1/20] iommu: Introduce a replace API for device pasid
config: arc-randconfig-001-20231117 (https://download.01.org/0day-ci/archive/20231117/202311171832.8Qp9JxDX-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311171832.8Qp9JxDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311171832.8Qp9JxDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommu.c: In function 'iommu_attach_device_pasid':
>> drivers/iommu/iommu.c:3467:15: warning: unused variable 'curr' [-Wunused-variable]
    3467 |         void *curr;
         |               ^~~~


vim +/curr +3467 drivers/iommu/iommu.c

7f8ef55dc82d12 Lu Baolu        2023-07-28  3453  
16603704559c7a Lu Baolu        2022-10-31  3454  /*
16603704559c7a Lu Baolu        2022-10-31  3455   * iommu_attach_device_pasid() - Attach a domain to pasid of device
16603704559c7a Lu Baolu        2022-10-31  3456   * @domain: the iommu domain.
16603704559c7a Lu Baolu        2022-10-31  3457   * @dev: the attached device.
16603704559c7a Lu Baolu        2022-10-31  3458   * @pasid: the pasid of the device.
16603704559c7a Lu Baolu        2022-10-31  3459   *
16603704559c7a Lu Baolu        2022-10-31  3460   * Return: 0 on success, or an error.
16603704559c7a Lu Baolu        2022-10-31  3461   */
16603704559c7a Lu Baolu        2022-10-31  3462  int iommu_attach_device_pasid(struct iommu_domain *domain,
16603704559c7a Lu Baolu        2022-10-31  3463  			      struct device *dev, ioasid_t pasid)
16603704559c7a Lu Baolu        2022-10-31  3464  {
e946f8e3e62bf0 Jason Gunthorpe 2023-08-22  3465  	/* Caller must be a probed driver on dev */
e946f8e3e62bf0 Jason Gunthorpe 2023-08-22  3466  	struct iommu_group *group = dev->iommu_group;
16603704559c7a Lu Baolu        2022-10-31 @3467  	void *curr;
16603704559c7a Lu Baolu        2022-10-31  3468  	int ret;
16603704559c7a Lu Baolu        2022-10-31  3469  
16603704559c7a Lu Baolu        2022-10-31  3470  	if (!domain->ops->set_dev_pasid)
16603704559c7a Lu Baolu        2022-10-31  3471  		return -EOPNOTSUPP;
16603704559c7a Lu Baolu        2022-10-31  3472  
16603704559c7a Lu Baolu        2022-10-31  3473  	if (!group)
16603704559c7a Lu Baolu        2022-10-31  3474  		return -ENODEV;
16603704559c7a Lu Baolu        2022-10-31  3475  
16603704559c7a Lu Baolu        2022-10-31  3476  	mutex_lock(&group->mutex);
7f8ef55dc82d12 Lu Baolu        2023-07-28  3477  	ret = __iommu_group_attach_pasid(domain, group, pasid);
16603704559c7a Lu Baolu        2022-10-31  3478  	mutex_unlock(&group->mutex);
7f8ef55dc82d12 Lu Baolu        2023-07-28  3479  
16603704559c7a Lu Baolu        2022-10-31  3480  	return ret;
16603704559c7a Lu Baolu        2022-10-31  3481  }
16603704559c7a Lu Baolu        2022-10-31  3482  EXPORT_SYMBOL_GPL(iommu_attach_device_pasid);
16603704559c7a Lu Baolu        2022-10-31  3483  

:::::: The code at line 3467 was first introduced by commit
:::::: 16603704559c7a68718059c4f75287886c01b20f iommu: Add attach/detach_dev_pasid iommu interfaces

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
