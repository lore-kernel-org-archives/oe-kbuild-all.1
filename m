Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE82890D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 14:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692885605; x=1724421605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zoO4DBUt06a5gVu3j6H6+fIQnUDU/yVzC0UhmDTmo6w=;
  b=hFo3zd3ELADQl0L3zmZOyZsCQr5lQQsisvWq4m5MxPq79xV6rXMCwYoo
   uFcnXf4RCx3dmssyJB3yeJRo2RjyQCVSnw2DdDDgy/b9PK1NSDseXXxrL
   XAZqrKStcEivAQYYNMCdxg7wikTQmDPJlG+T+DgTH51TKi1bVKf5L5neR
   IvGIRqLMjp+y0bqYF3BTQPmezWYOSDnsVUoy7+96mU+uBlbDT49tQuVxr
   9N+2YhK2KayAnGL3uQTNcbWhe1Mj52ecnBPBkyvcw2/gQtv1vDjkQ+h6Q
   9S4B4QcbvaP1pMd/eGCIu8V8aHxQbPC1NEUUouvyQV/GuMf4VQPf3w47S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405450108"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405450108"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 07:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802553333"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802553333"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 07:00:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZAsU-0002kA-0g;
	Thu, 24 Aug 2023 14:00:02 +0000
Date: Thu, 24 Aug 2023 21:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0823 89/95]
 drivers/iommu/iommufd/device.c:303:14: error: implicit declaration of
 function 'msi_device_has_isolated_msi'
Message-ID: <202308242104.f534pPlY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0823
head:   67dfdbe108fe147464b91e9e510e8ceedd87deda
commit: 294d410b98d4dd1f218297860f0507b271384939 [89/95] iommufd: Add iommufd_device_bind_pasid()
config: arc-randconfig-r004-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242104.f534pPlY-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242104.f534pPlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242104.f534pPlY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/device.c: In function 'iommufd_device_bind_pasid':
>> drivers/iommu/iommufd/device.c:303:14: error: implicit declaration of function 'msi_device_has_isolated_msi' [-Werror=implicit-function-declaration]
     303 |             !msi_device_has_isolated_msi(dev)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/msi_device_has_isolated_msi +303 drivers/iommu/iommufd/device.c

   260	
   261	/**
   262	 * iommufd_device_bind_pasid - Bind a virtual device to an iommu fd
   263	 * @ictx: iommufd file descriptor
   264	 * @dev: Pointer to the parent physical device struct
   265	 * @pasid: the pasid value representing vRID of this virtual device
   266	 * @id: Output ID number to return to userspace for this device
   267	 *
   268	 * The virtual device always tags its DMA with the provided pasid.
   269	 * A successful bind allows the pasid to be used in other iommufd
   270	 * operations e.g. attach/detach and returns struct iommufd_device
   271	 * pointer, otherwise returns error pointer.
   272	 *
   273	 * There is no ownership check per pasid. A driver using this API
   274	 * must already claim the DMA ownership over the parent device and
   275	 * the pasid is allocated by the driver itself.
   276	 *
   277	 * PASID is a device capability so unlike iommufd_device_bind() it
   278	 * has no iommu group associated.
   279	 *
   280	 * The caller must undo this with iommufd_device_unbind()
   281	 */
   282	struct iommufd_device *iommufd_device_bind_pasid(struct iommufd_ctx *ictx,
   283							 struct device *dev,
   284							 u32 pasid, u32 *id)
   285	{
   286		struct iommufd_device *idev;
   287		int rc;
   288	
   289		/*
   290		 * iommufd always sets IOMMU_CACHE because we offer no way for userspace
   291		 * to restore cache coherency.
   292		 */
   293		if (!device_iommu_capable(dev, IOMMU_CAP_CACHE_COHERENCY))
   294			return ERR_PTR(-EINVAL);
   295	
   296		/*
   297		 * No iommu supports pasid-granular msi message today. Here we
   298		 * just check whether the parent device can do safe interrupts.
   299		 * Isolation between virtual devices within the parent device
   300		 * relies on the parent driver to enforce.
   301		 */
   302		if (!iommufd_selftest_is_mock_dev(dev) &&
 > 303		    !msi_device_has_isolated_msi(dev)) {
   304			rc = iommufd_allow_unsafe_interrupts(dev);
   305			if (rc)
   306				return ERR_PTR(rc);
   307		}
   308	
   309		idev = iommufd_alloc_device(ictx, dev);
   310		if (IS_ERR(idev))
   311			return idev;
   312		idev->default_pasid = pasid;
   313	
   314		/*
   315		 * If the caller fails after this success it must call
   316		 * iommufd_unbind_device() which is safe since we hold this refcount.
   317		 * This also means the device is a leaf in the graph and no other object
   318		 * can take a reference on it.
   319		 */
   320		iommufd_object_finalize(ictx, &idev->obj);
   321		*id = idev->obj.id;
   322		return idev;
   323	}
   324	EXPORT_SYMBOL_NS_GPL(iommufd_device_bind_pasid, IOMMUFD);
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
