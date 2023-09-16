Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47C136B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694840060; x=1726376060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVKkJGrOz7YX6A7PnjY7bi9Hj0f0mwsCQkchHyrzvEA=;
  b=awZAStJamte/xMPW//6f+9u/G98LkT6FN+QkB8+/5h+Ohz1+T3Zi1X8Q
   s6SKSm1R0xKf8rWsigA921vOwBxHMtCVrFFBmUD23mRbzFcPHqnxnopgw
   z6w2tWKgL0kdZJcXJo/2Ez/zH7vKwG6hs9MRjGXhPnGUsarwskb1hAthP
   gxuoMbgsL1HDlJSOip8tXXEKz0pznS04vPWcpGVuAELkbxLennrQXBmfq
   wvGYwwt6JwrDNjT/9ZHXEVfelQbftMaGy3nPxJCwJVhvPewmSad9xGoR2
   LuvpKRBVUIGDqvUyYiK5QPtILCpaIEHXFRFVNoUcvPtR7oHar5GbCjpB9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376716642"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="376716642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 21:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745221411"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="745221411"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 21:54:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhNJv-0003sm-0T;
	Sat, 16 Sep 2023 04:54:15 +0000
Date: Sat, 16 Sep 2023 12:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 84/104]
 drivers/iommu/iommufd/device.c:131:7: warning: logical not is only applied
 to the left hand side of this bitwise operator
Message-ID: <202309161232.XBcnxGBS-lkp@intel.com>
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
commit: 4e9347bc44832ec0e1557796ed0b42674a960a4e [84/104] iommufd: Add driver facing API for PASID support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230916/202309161232.XBcnxGBS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161232.XBcnxGBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161232.XBcnxGBS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:131:7: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
           if ((!flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP))
                ^      ~
   drivers/iommu/iommufd/device.c:131:7: note: add parentheses after the '!' to evaluate the bitwise operator first
           if ((!flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP))
                ^
                 (                                              )
   drivers/iommu/iommufd/device.c:131:7: note: add parentheses around left hand side expression to silence this warning
           if ((!flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP))
                ^
                (     )
   1 warning generated.


vim +131 drivers/iommu/iommufd/device.c

    53	
    54	/**
    55	 * iommufd_bind_device - Bind a physical device to an iommu fd
    56	 * @fd: iommufd file descriptor.
    57	 * @pdev: Pointer to a physical PCI device struct
    58	 * @id: Output ID number to return to userspace for this device
    59	 *
    60	 * A successful bind establishes an ownership over the device and returns
    61	 * struct iommufd_device pointer, otherwise returns error pointer.
    62	 *
    63	 * A driver using this API must set driver_managed_dma and must not touch
    64	 * the device until this routine succeeds and establishes ownership.
    65	 *
    66	 * Binding a PCI device places the entire RID under iommufd control.
    67	 *
    68	 * The caller must undo this with iommufd_unbind_device()
    69	 */
    70	struct iommufd_device *iommufd_bind_device(int fd, struct device *dev,
    71						   unsigned int flags, u32 *id)
    72	{
    73		struct iommufd_device *idev;
    74		struct iommufd_ctx *ictx;
    75		struct iommu_group *group;
    76		int rc;
    77	
    78	       /*
    79	        * iommufd always sets IOMMU_CACHE because we offer no way for userspace
    80	        * to restore cache coherency.
    81	        */
    82	       if (!iommu_capable(dev->bus, IOMMU_CAP_CACHE_COHERENCY))
    83			return ERR_PTR(-EINVAL);
    84	
    85		ictx = iommufd_fget(fd);
    86		if (!ictx)
    87			return ERR_PTR(-EINVAL);
    88	
    89		group = iommu_group_get(dev);
    90		if (!group) {
    91			rc = -ENODEV;
    92			goto out_file_put;
    93		}
    94	
    95		/*
    96		 * FIXME: Use a device-centric iommu api and this won't work with
    97		 * multi-device groups
    98		 */
    99		if (!(flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP)) {
   100			rc = iommu_group_claim_dma_owner(group, ictx->filp);
   101			if (rc)
   102				goto out_group_put;
   103		}
   104	
   105		idev = iommufd_object_alloc(ictx, idev, IOMMUFD_OBJ_DEVICE);
   106		if (IS_ERR(idev)) {
   107			rc = PTR_ERR(idev);
   108			goto out_release_owner;
   109		}
   110		idev->ictx = ictx;
   111		idev->dev = dev;
   112		idev->dma_owner_claimed =
   113			!(flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP);
   114		xa_init_flags(&idev->pasid_xa, XA_FLAGS_ALLOC | XA_FLAGS_ACCOUNT);
   115		mutex_init(&idev->pasid_lock);
   116		/* The calling driver is a user until iommufd_unbind_device() */
   117		refcount_inc(&idev->obj.users);
   118		/* group refcount moves into iommufd_device */
   119		idev->group = group;
   120	
   121		/*
   122		 * If the caller fails after this success it must call
   123		 * iommufd_unbind_device() which is safe since we hold this refcount.
   124		 * This also means the device is a leaf in the graph and no other object
   125		 * can take a reference on it.
   126		 */
   127		iommufd_object_finalize(ictx, &idev->obj);
   128		*id = idev->obj.id;
   129		return idev;
   130	out_release_owner:
 > 131		if ((!flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP))
   132			iommu_group_release_dma_owner(group);
   133	out_group_put:
   134		iommu_group_put(group);
   135	out_file_put:
   136		fput(ictx->filp);
   137		return ERR_PTR(rc);
   138	}
   139	EXPORT_SYMBOL_GPL(iommufd_bind_device);
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
