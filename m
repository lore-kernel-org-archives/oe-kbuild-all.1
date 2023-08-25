Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EA220E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692970809; x=1724506809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLF1OJO3hnq+BPBAOvdPRAbdwbxKYzx+afQXqiRcR9o=;
  b=TvokJWzTsSMPAmNm+QV1rnWSwebwLosT+FwDqvbvHN5vvVkeiRcr/16C
   ijcAk8Jm4y2hC67/vUghNuV57fTCnNYKlcVpL7b+qR8dhXAFSjOgI8vtJ
   5wRQb7B2nFypEHGo1tikxiEYDM12hxwJDvroXOm7T0IamvU2jrMgAhk1k
   hu40Mceg0YB1/N/fV6CIBjS4mri+iAWvpe6v7meNmkGIPM2TnzkVwDvQW
   y5CJN0+EeKB+0ekbq+656Zk7CPCS6lI7yxvadGwtWMYIHnuioMyWbgcvG
   8fcI86AqyNyg3vOQNQsCv573IJTtglVWPRPINvMoY2qRLRI/B+KVEGTB6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359713192"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359713192"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714349212"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714349212"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 06:39:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZX2Y-0003d9-2h;
	Fri, 25 Aug 2023 13:39:54 +0000
Date: Fri, 25 Aug 2023 21:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 89/95]
 drivers/iommu/iommufd/device.c:303:7: error: call to undeclared function
 'msi_device_has_isolated_msi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202308252106.QPnfMVmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0825
head:   98c119bc01ddf99ad4ac7c3e93980e3d835c0901
commit: 867d3f502f6850f76ce3a3b29099e27e6a22e154 [89/95] iommufd: Add iommufd_device_bind_pasid()
config: powerpc64-randconfig-r002-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252106.QPnfMVmO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252106.QPnfMVmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252106.QPnfMVmO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:303:7: error: call to undeclared function 'msi_device_has_isolated_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |             !msi_device_has_isolated_msi(dev)) {
         |              ^
   1 error generated.


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
