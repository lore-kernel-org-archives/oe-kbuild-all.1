Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2A38DC3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oATfWdtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699572172; x=1731108172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/z8DLZ4THYqNLsDzY2svkXfTrch4DGCZmT3regrvxgw=;
  b=oATfWdtRcVtJR1EdvMXorTtbm9oeRsF6uAlFYz9NEAxUBjh9DlBXQVtV
   PtaASL9q41UO6E/5pJhrT85aZ6djYrctO5fqYQdf+FpiL/9wPxFJLS79J
   6OOW9At1tCnytYi480MK+28zUn6CQZRUAuiICIV9JBLI/dnEl1CHq06Pe
   AUVZgY8+cQnGYitcfrd+6092etXs/Acc/MzHsSKYS+ygMvihbCSlfR2o0
   UK2O1PciFpXBIZpWN1xD48MLv13oiV/4C7Bup3IctUowao0vnpoG8dmQ2
   CspOIk9qcgJyiaVkleX/eJZLnMqu5xLLwoFxP/anoENUz8FOJoNZQu4Cx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454396645"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="454396645"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 15:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="798454498"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="798454498"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Nov 2023 15:22:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1EMK-0009Fe-1k;
	Thu, 09 Nov 2023 23:22:48 +0000
Date: Fri, 10 Nov 2023 07:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 25/104]
 drivers/iommu/iommufd/device.c:58: warning: Function parameter or member
 'dev' not described in 'iommufd_bind_device'
Message-ID: <202311100722.1jgTOjmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 6f915f4df4ae494e0d6d26991ddc8ebb672f9101 [25/104] iommufd: Add kAPI toward external drivers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311100722.1jgTOjmO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100722.1jgTOjmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100722.1jgTOjmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:58: warning: Function parameter or member 'dev' not described in 'iommufd_bind_device'
>> drivers/iommu/iommufd/device.c:58: warning: Excess function parameter 'pdev' description in 'iommufd_bind_device'


vim +58 drivers/iommu/iommufd/device.c

    40	
    41	/**
    42	 * iommufd_bind_device - Bind a physical device to an iommu fd
    43	 * @fd: iommufd file descriptor.
    44	 * @pdev: Pointer to a physical PCI device struct
    45	 * @id: Output ID number to return to userspace for this device
    46	 *
    47	 * A successful bind establishes an ownership over the device and returns
    48	 * struct iommufd_device pointer, otherwise returns error pointer.
    49	 *
    50	 * A driver using this API must set driver_managed_dma and must not touch
    51	 * the device until this routine succeeds and establishes ownership.
    52	 *
    53	 * Binding a PCI device places the entire RID under iommufd control.
    54	 *
    55	 * The caller must undo this with iommufd_unbind_device()
    56	 */
    57	struct iommufd_device *iommufd_bind_device(int fd, struct device *dev, u32 *id)
  > 58	{
    59		struct iommufd_device *idev;
    60		struct iommufd_ctx *ictx;
    61		struct iommu_group *group;
    62		int rc;
    63	
    64	       /*
    65	        * iommufd always sets IOMMU_CACHE because we offer no way for userspace
    66	        * to restore cache coherency.
    67	        */
    68	       if (!iommu_capable(dev->bus, IOMMU_CAP_CACHE_COHERENCY))
    69			return ERR_PTR(-EINVAL);
    70	
    71		ictx = iommufd_fget(fd);
    72		if (!ictx)
    73			return ERR_PTR(-EINVAL);
    74	
    75		group = iommu_group_get(dev);
    76		if (!group) {
    77			rc = -ENODEV;
    78			goto out_file_put;
    79		}
    80	
    81		/*
    82		 * FIXME: Use a device-centric iommu api and this won't work with
    83		 * multi-device groups
    84		 */
    85		rc = iommu_group_claim_dma_owner(group, ictx->filp);
    86		if (rc)
    87			goto out_group_put;
    88	
    89		idev = iommufd_object_alloc(ictx, idev, IOMMUFD_OBJ_DEVICE);
    90		if (IS_ERR(idev)) {
    91			rc = PTR_ERR(idev);
    92			goto out_release_owner;
    93		}
    94		idev->ictx = ictx;
    95		idev->dev = dev;
    96		/* The calling driver is a user until iommufd_unbind_device() */
    97		refcount_inc(&idev->obj.users);
    98		/* group refcount moves into iommufd_device */
    99		idev->group = group;
   100	
   101		/*
   102		 * If the caller fails after this success it must call
   103		 * iommufd_unbind_device() which is safe since we hold this refcount.
   104		 * This also means the device is a leaf in the graph and no other object
   105		 * can take a reference on it.
   106		 */
   107		iommufd_object_finalize(ictx, &idev->obj);
   108		*id = idev->obj.id;
   109		return idev;
   110	
   111	out_release_owner:
   112		iommu_group_release_dma_owner(group);
   113	out_group_put:
   114		iommu_group_put(group);
   115	out_file_put:
   116		fput(ictx->filp);
   117		return ERR_PTR(rc);
   118	}
   119	EXPORT_SYMBOL_GPL(iommufd_bind_device);
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
