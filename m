Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02FD50B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692966412; x=1724502412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MejHO5eHjQySdRsNfq784t/Rj2HLqk+eULDIu6rK/ug=;
  b=O02P2OGWD3KcJtREcL9dA7Y9JZsY04DQ5hFKvO6zhR0l3bYF0jzZIqkN
   Yb0qQXAkVQqolvjTJlEDZSIiM1oQqDbQor+RNaVV99QwagQpRz+DAWbo7
   HBRMkm40Y8wDpLs6MoeBEGMD3rcEkMSExAbpj4JG3gh0G9RFBfq0hhdD4
   t32k36Z6oPhifLrvxR1wOUiYKXllEeNFxqqP2q8NL2VNGqlB2O/Dq5oMF
   jWLKFdrcD3Nv+e1tPMkJDOroze7AIH60zDZz+vnTiSRk5NZs5qZO5/hAK
   qY7JuMf+kHrFoxr3Y8w7Qh0/6CMo1FQAkUHaijZRcqzZCSwDfz/iZGPoy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355030429"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="355030429"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 05:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068223858"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068223858"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2023 05:26:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZVtn-0003Z1-0Y;
	Fri, 25 Aug 2023 12:26:47 +0000
Date: Fri, 25 Aug 2023 20:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 89/95]
 drivers/iommu/iommufd/device.c:303:7: error: implicit declaration of
 function 'msi_device_has_isolated_msi' is invalid in C99
Message-ID: <202308252002.DclKmsh1-lkp@intel.com>
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
config: hexagon-randconfig-r005-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252002.DclKmsh1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252002.DclKmsh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252002.DclKmsh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/device.c:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/iommu/iommufd/device.c:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/iommu/iommufd/device.c:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/iommu/iommufd/device.c:303:7: error: implicit declaration of function 'msi_device_has_isolated_msi' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
               !msi_device_has_isolated_msi(dev)) {
                ^
   6 warnings and 1 error generated.


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
