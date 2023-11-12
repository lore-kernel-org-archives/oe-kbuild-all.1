Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FA156E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdAQP0/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699813426; x=1731349426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0kWOhGKz/IxN9h3PEGBv8X2DfeA496vwE/SrihZRps=;
  b=MdAQP0/JdbvuyMbC2khMfjddr9sipzs3vhA87P0Ej0JN8Gmg2VN8Rxw3
   KlRYPknJ4QMr4cS7Zl5WYN5gq20t8/isNCFoDgqDehvGbF7nwqb/e/jX1
   Wjz+FJkcuvF/R/ReMKnzwicFA8ISvyLC70aZ8uytxCZgwtZxsKYa6pyRy
   7q/n02S7iSsrNiIgAc85oR9GU2oLftyAscOJpvlPTCa6iTjbwgFxNyYXR
   Uz4+MMgwCDw9MLmXeLHKQkwHrB5ejU9OQUmCvf/DN+c5EDH7KpIFNVAvV
   lb7/TFF+O1/YGTtj1lZWlpJ5QlsMkkm5Vr+YIlQ3tn2xIsmz/Acr9aYZ6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370546512"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="370546512"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 10:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="799014120"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="799014120"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Nov 2023 10:23:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2F7V-000BQA-2X;
	Sun, 12 Nov 2023 18:23:41 +0000
Date: Mon, 13 Nov 2023 02:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:iommufd-v5.19-rc5 84/104]
 drivers/iommu/iommufd/device.c:72: warning: Function parameter or member
 'flags' not described in 'iommufd_bind_device'
Message-ID: <202311130251.Ms1SvRC0-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231113/202311130251.Ms1SvRC0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130251.Ms1SvRC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130251.Ms1SvRC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/device.c:72: warning: Function parameter or member 'dev' not described in 'iommufd_bind_device'
>> drivers/iommu/iommufd/device.c:72: warning: Function parameter or member 'flags' not described in 'iommufd_bind_device'
   drivers/iommu/iommufd/device.c:72: warning: Excess function parameter 'pdev' description in 'iommufd_bind_device'


vim +72 drivers/iommu/iommufd/device.c

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   53  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   54  /**
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   55   * iommufd_bind_device - Bind a physical device to an iommu fd
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   56   * @fd: iommufd file descriptor.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   57   * @pdev: Pointer to a physical PCI device struct
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   58   * @id: Output ID number to return to userspace for this device
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   59   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   60   * A successful bind establishes an ownership over the device and returns
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   61   * struct iommufd_device pointer, otherwise returns error pointer.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   62   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   63   * A driver using this API must set driver_managed_dma and must not touch
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   64   * the device until this routine succeeds and establishes ownership.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   65   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   66   * Binding a PCI device places the entire RID under iommufd control.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   67   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   68   * The caller must undo this with iommufd_unbind_device()
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   69   */
4e9347bc44832e Yi Liu          2022-06-22   70  struct iommufd_device *iommufd_bind_device(int fd, struct device *dev,
4e9347bc44832e Yi Liu          2022-06-22   71  					   unsigned int flags, u32 *id)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  @72  {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   73  	struct iommufd_device *idev;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   74  	struct iommufd_ctx *ictx;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   75  	struct iommu_group *group;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   76  	int rc;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   77  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   78         /*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   79          * iommufd always sets IOMMU_CACHE because we offer no way for userspace
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   80          * to restore cache coherency.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   81          */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   82         if (!iommu_capable(dev->bus, IOMMU_CAP_CACHE_COHERENCY))
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   83  		return ERR_PTR(-EINVAL);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   84  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   85  	ictx = iommufd_fget(fd);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   86  	if (!ictx)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   87  		return ERR_PTR(-EINVAL);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   88  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   89  	group = iommu_group_get(dev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   90  	if (!group) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   91  		rc = -ENODEV;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   92  		goto out_file_put;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   93  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   94  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   95  	/*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   96  	 * FIXME: Use a device-centric iommu api and this won't work with
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   97  	 * multi-device groups
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   98  	 */
4e9347bc44832e Yi Liu          2022-06-22   99  	if (!(flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP)) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  100  		rc = iommu_group_claim_dma_owner(group, ictx->filp);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  101  		if (rc)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  102  			goto out_group_put;
4e9347bc44832e Yi Liu          2022-06-22  103  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  104  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  105  	idev = iommufd_object_alloc(ictx, idev, IOMMUFD_OBJ_DEVICE);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  106  	if (IS_ERR(idev)) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  107  		rc = PTR_ERR(idev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  108  		goto out_release_owner;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  109  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  110  	idev->ictx = ictx;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  111  	idev->dev = dev;
4e9347bc44832e Yi Liu          2022-06-22  112  	idev->dma_owner_claimed =
4e9347bc44832e Yi Liu          2022-06-22  113  		!(flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP);
4e9347bc44832e Yi Liu          2022-06-22  114  	xa_init_flags(&idev->pasid_xa, XA_FLAGS_ALLOC | XA_FLAGS_ACCOUNT);
4e9347bc44832e Yi Liu          2022-06-22  115  	mutex_init(&idev->pasid_lock);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  116  	/* The calling driver is a user until iommufd_unbind_device() */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  117  	refcount_inc(&idev->obj.users);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  118  	/* group refcount moves into iommufd_device */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  119  	idev->group = group;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  120  
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  121  	/*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  122  	 * If the caller fails after this success it must call
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  123  	 * iommufd_unbind_device() which is safe since we hold this refcount.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  124  	 * This also means the device is a leaf in the graph and no other object
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  125  	 * can take a reference on it.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  126  	 */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  127  	iommufd_object_finalize(ictx, &idev->obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  128  	*id = idev->obj.id;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  129  	return idev;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  130  out_release_owner:
4e9347bc44832e Yi Liu          2022-06-22  131  	if ((!flags & IOMMUFD_BIND_FLAGS_BYPASS_DMA_OWNERSHIP))
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  132  		iommu_group_release_dma_owner(group);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  133  out_group_put:
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  134  	iommu_group_put(group);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  135  out_file_put:
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  136  	fput(ictx->filp);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  137  	return ERR_PTR(rc);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  138  }
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  139  EXPORT_SYMBOL_GPL(iommufd_bind_device);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  140  

:::::: The code at line 72 was first introduced by commit
:::::: 6f915f4df4ae494e0d6d26991ddc8ebb672f9101 iommufd: Add kAPI toward external drivers

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
