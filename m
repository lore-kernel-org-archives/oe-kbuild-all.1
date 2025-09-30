Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0B248878
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 04:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759205634; cv=none; b=M7X+d38vW7IbrbzJ3FSUWspLGumMdW2G9WR31UjvN9vUfCEYrmNT8+0PnW32/My1rtoKCf6l414o49aSaO2KWnjTJip+Eqd6JvTYlyfAZu/HZeLCwECpYPDgG8SteqGAPZdjSDH7nhkZBh/vgkXR745R43fG45FpIMS3La7HNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759205634; c=relaxed/simple;
	bh=QwTp0aEZxgexYKRhbCmnL3XYaLgxJ+mUSwf7AIgqZps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qg4ZkON+kqQj8pbwDLFlrz3CcZ58tDsWaiL5an/tYXCqpYPaD62TSk8ZeYMth8KeoslGyYXcc7I1QlLihQiGG/N9XEp/GpYnAjL09tdHTE3zd/9WfEdZi96mR34SGNMRLY6uXlGY2edztRVpr2xWNKSJkbisytOjo1pSn3KDgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gq8UTmKs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gq8UTmKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759205633; x=1790741633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwTp0aEZxgexYKRhbCmnL3XYaLgxJ+mUSwf7AIgqZps=;
  b=gq8UTmKsArMfXhUP122oA/qhehsGY/oXiOkIy9IZ5ttuJI/jC4HLiq8g
   AiagvkwqljaASxLvRxcrRINEqv8H6C7gdNjJZOvMm3R6NHFZvKJ/cYuOw
   f7YrkDDHYQkA5thLz8FCCCTZVscDIgUr5Hmct4RjIme6H9pvA2xJS7OaF
   AyqEHv7mDF8AV/ofQohBbr2ZsRc4I6zCwT067oh5mSmxdLLVtkjejCzsT
   xy9vzShNEcDEQFErntVy8iOtBci9aKjD2YQjaSYNxd/Y3Ro9sa5/yEHRt
   PjbSA9581RntPGhwaLVgut9Hhv9ihi6gUM/tEkVg9+Pup1rnDferBz2hM
   Q==;
X-CSE-ConnectionGUID: xnb4dUNiSYCwjS2tyhjoHw==
X-CSE-MsgGUID: ew5HdKjbSD66Lwh7cCA6JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71701548"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="71701548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 21:13:52 -0700
X-CSE-ConnectionGUID: Zm6JPWfsQBW5mCNQLr63VA==
X-CSE-MsgGUID: xBCJRzw3S1+79hxt8xZUPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="182823705"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2025 21:13:51 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3RkL-0000tT-06;
	Tue, 30 Sep 2025 04:13:49 +0000
Date: Tue, 30 Sep 2025 12:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 9/28] drivers/iommu/iommu.c:3523:33:
 warning: variable 'ops' set but not used
Message-ID: <202509301224.PemRWcEM-lkp@intel.com>
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
commit: c4512f934cf0e912daa5e048c1bcd5d067f4c10a [9/28] iommu: Introduce a test_dev domain op and an internal helper
config: s390-randconfig-001-20250930 (https://download.01.org/0day-ci/archive/20250930/202509301224.PemRWcEM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509301224.PemRWcEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509301224.PemRWcEM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommu.c: In function 'iommu_attach_device_pasid':
>> drivers/iommu/iommu.c:3523:33: warning: variable 'ops' set but not used [-Wunused-but-set-variable]
    3523 |         const struct iommu_ops *ops;
         |                                 ^~~


vim +/ops +3523 drivers/iommu/iommu.c

16603704559c7a6 Lu Baolu        2022-10-31  3504  
16603704559c7a6 Lu Baolu        2022-10-31  3505  /*
16603704559c7a6 Lu Baolu        2022-10-31  3506   * iommu_attach_device_pasid() - Attach a domain to pasid of device
16603704559c7a6 Lu Baolu        2022-10-31  3507   * @domain: the iommu domain.
16603704559c7a6 Lu Baolu        2022-10-31  3508   * @dev: the attached device.
16603704559c7a6 Lu Baolu        2022-10-31  3509   * @pasid: the pasid of the device.
14678219cf4093e Lu Baolu        2024-07-02  3510   * @handle: the attach handle.
16603704559c7a6 Lu Baolu        2022-10-31  3511   *
ada14b9f1aab5b6 Yi Liu          2025-03-21  3512   * Caller should always provide a new handle to avoid race with the paths
ada14b9f1aab5b6 Yi Liu          2025-03-21  3513   * that have lockless reference to handle if it intends to pass a valid handle.
ada14b9f1aab5b6 Yi Liu          2025-03-21  3514   *
16603704559c7a6 Lu Baolu        2022-10-31  3515   * Return: 0 on success, or an error.
16603704559c7a6 Lu Baolu        2022-10-31  3516   */
16603704559c7a6 Lu Baolu        2022-10-31  3517  int iommu_attach_device_pasid(struct iommu_domain *domain,
14678219cf4093e Lu Baolu        2024-07-02  3518  			      struct device *dev, ioasid_t pasid,
14678219cf4093e Lu Baolu        2024-07-02  3519  			      struct iommu_attach_handle *handle)
16603704559c7a6 Lu Baolu        2022-10-31  3520  {
e946f8e3e62bf05 Jason Gunthorpe 2023-08-22  3521  	/* Caller must be a probed driver on dev */
e946f8e3e62bf05 Jason Gunthorpe 2023-08-22  3522  	struct iommu_group *group = dev->iommu_group;
fb3de9f9b085d00 Yi Liu          2024-12-04 @3523  	const struct iommu_ops *ops;
e1ea9d30d84c65e Yi Liu          2025-02-25  3524  	void *entry;
16603704559c7a6 Lu Baolu        2022-10-31  3525  	int ret;
16603704559c7a6 Lu Baolu        2022-10-31  3526  
16603704559c7a6 Lu Baolu        2022-10-31  3527  	if (!group)
16603704559c7a6 Lu Baolu        2022-10-31  3528  		return -ENODEV;
c4512f934cf0e91 Nicolin Chen    2022-05-13  3529  	if (pasid == IOMMU_NO_PASID)
c4512f934cf0e91 Nicolin Chen    2022-05-13  3530  		return -EINVAL;
16603704559c7a6 Lu Baolu        2022-10-31  3531  
fb3de9f9b085d00 Yi Liu          2024-12-04  3532  	ops = dev_iommu_ops(dev);
fb3de9f9b085d00 Yi Liu          2024-12-04  3533  
16603704559c7a6 Lu Baolu        2022-10-31  3534  	mutex_lock(&group->mutex);
c4512f934cf0e91 Nicolin Chen    2022-05-13  3535  
c4512f934cf0e91 Nicolin Chen    2022-05-13  3536  	ret = __iommu_domain_test_device(domain, dev, pasid, NULL);
c4512f934cf0e91 Nicolin Chen    2022-05-13  3537  	if (ret)
c404f55c26fc23c Jason Gunthorpe 2024-03-27  3538  		goto out_unlock;
c404f55c26fc23c Jason Gunthorpe 2024-03-27  3539  
e1ea9d30d84c65e Yi Liu          2025-02-25  3540  	entry = iommu_make_pasid_array_entry(domain, handle);
14678219cf4093e Lu Baolu        2024-07-02  3541  
5e9f822c9c683ae Yi Liu          2025-02-25  3542  	/*
5e9f822c9c683ae Yi Liu          2025-02-25  3543  	 * Entry present is a failure case. Use xa_insert() instead of
5e9f822c9c683ae Yi Liu          2025-02-25  3544  	 * xa_reserve().
5e9f822c9c683ae Yi Liu          2025-02-25  3545  	 */
5e9f822c9c683ae Yi Liu          2025-02-25  3546  	ret = xa_insert(&group->pasid_array, pasid, XA_ZERO_ENTRY, GFP_KERNEL);
14678219cf4093e Lu Baolu        2024-07-02  3547  	if (ret)
16603704559c7a6 Lu Baolu        2022-10-31  3548  		goto out_unlock;
16603704559c7a6 Lu Baolu        2022-10-31  3549  
8a9e1e773f60080 Yi Liu          2025-03-21  3550  	ret = __iommu_set_group_pasid(domain, group, pasid, NULL);
5e9f822c9c683ae Yi Liu          2025-02-25  3551  	if (ret) {
5e9f822c9c683ae Yi Liu          2025-02-25  3552  		xa_release(&group->pasid_array, pasid);
5e9f822c9c683ae Yi Liu          2025-02-25  3553  		goto out_unlock;
5e9f822c9c683ae Yi Liu          2025-02-25  3554  	}
5e9f822c9c683ae Yi Liu          2025-02-25  3555  
5e9f822c9c683ae Yi Liu          2025-02-25  3556  	/*
5e9f822c9c683ae Yi Liu          2025-02-25  3557  	 * The xa_insert() above reserved the memory, and the group->mutex is
5e9f822c9c683ae Yi Liu          2025-02-25  3558  	 * held, this cannot fail. The new domain cannot be visible until the
5e9f822c9c683ae Yi Liu          2025-02-25  3559  	 * operation succeeds as we cannot tolerate PRIs becoming concurrently
5e9f822c9c683ae Yi Liu          2025-02-25  3560  	 * queued and then failing attach.
5e9f822c9c683ae Yi Liu          2025-02-25  3561  	 */
5e9f822c9c683ae Yi Liu          2025-02-25  3562  	WARN_ON(xa_is_err(xa_store(&group->pasid_array,
5e9f822c9c683ae Yi Liu          2025-02-25  3563  				   pasid, entry, GFP_KERNEL)));
5e9f822c9c683ae Yi Liu          2025-02-25  3564  
16603704559c7a6 Lu Baolu        2022-10-31  3565  out_unlock:
16603704559c7a6 Lu Baolu        2022-10-31  3566  	mutex_unlock(&group->mutex);
16603704559c7a6 Lu Baolu        2022-10-31  3567  	return ret;
16603704559c7a6 Lu Baolu        2022-10-31  3568  }
16603704559c7a6 Lu Baolu        2022-10-31  3569  EXPORT_SYMBOL_GPL(iommu_attach_device_pasid);
16603704559c7a6 Lu Baolu        2022-10-31  3570  

:::::: The code at line 3523 was first introduced by commit
:::::: fb3de9f9b085d003a8a869ca6a4789d1bfbb3f22 iommu: Prevent pasid attach if no ops->remove_dev_pasid

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
