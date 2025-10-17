Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05745306B2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760723350; cv=none; b=lYUxO//DTKtaEpF/lDkqB54b8F9ObU5Eh9TMJMAPMLEQlOy98LIe3OokbMs2cibArVm+mhP+F2F3Ln5VcPqLqCkUmWuhqRxkV1TgaTG4Jfr1Ui69JP90SgwGEX9uO3ZHoLnHPerksngI40eYtu+IWvIOU6u+XZ11ygheIFPx7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760723350; c=relaxed/simple;
	bh=HmST2Yy966eXpVK7COi5LbV6bELA0SP+8ql4LqLqFzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qQ1h/JFXuaVS016Fx0GvJpi8LrvrFG5oqfetqMla0Uk/VYzZ+Q27hS9APPnlPjzPOF2OexjO2IS/ou5nlAnBeoNwmWMKSnnLQfA9EnAEihD0N06RZ6g88x3GKN/rLRvqKYrdFPfv2L11xUlJoLlk13/pytv8ig2ioRutzFm08Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApokiWgg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApokiWgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760723349; x=1792259349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HmST2Yy966eXpVK7COi5LbV6bELA0SP+8ql4LqLqFzM=;
  b=ApokiWggO4YVqyXMs+WtvuFvGglMQEJYXj7IdiRJ7vTsRLyZ2P1TQvDt
   i1VaYRRHzTe7QEmA/WLasrM+wT18XgjpxtpD//m7vGHLsVIzQ7kUe7gLG
   9/mDFGs8ozYYX63+dbUbG2e2c5aCefozZF4Bl3PQQezDj3bzTs13ofFpy
   EoyS2wEAEqbTcq4wfSa2tAmBCHVi9PgsT/N/YyI+MGh0Q+SFgfMLtWZy8
   Pbv1iZT3awbfk8VLpHRnG/Nc/4TXw7RymgKj9myNtL45ui3sD7254poD5
   lpfw7tE2jVUKfhXooYZTLw5nHaFkR9o4KyLDtQFP6PL+UJkxETrQjstIN
   A==;
X-CSE-ConnectionGUID: XnMW9y93Q7qxpsl5UUVGQw==
X-CSE-MsgGUID: b8XhVfSwRZWyeg40wYuQog==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74056173"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="74056173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 10:49:08 -0700
X-CSE-ConnectionGUID: t9FN+qI1RHSKI2etnRksNg==
X-CSE-MsgGUID: nOA1jg2PSOuAaG1bck2zOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="213764587"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 10:49:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9oZQ-0007cX-0D;
	Fri, 17 Oct 2025 17:48:55 +0000
Date: Sat, 18 Oct 2025 01:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 20/24]
 drivers/iommu/iommufd/iommufd_private.h:740:5: warning: no previous
 prototype for 'iommufd_test_dma_buf_iommufd_map'
Message-ID: <202510180154.x3k1LkhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   e1e0600b1a5699114df3ae378cd69a7f953e5b3d
commit: 5849b503c1771ec07a34aca7fa51ef3788514f29 [20/24] iommufd/selftest: Add some tests for the dmabuf flow
config: microblaze-randconfig-r073-20251017 (https://download.01.org/0day-ci/archive/20251018/202510180154.x3k1LkhX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180154.x3k1LkhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180154.x3k1LkhX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/io_pagetable.h:13,
                    from drivers/iommu/iommufd/device.c:11:
>> drivers/iommu/iommufd/iommufd_private.h:740:5: warning: no previous prototype for 'iommufd_test_dma_buf_iommufd_map' [-Wmissing-prototypes]
     740 | int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/iommu/iommufd/io_pagetable.h:13,
                    from drivers/iommu/iommufd/pages.c:61:
>> drivers/iommu/iommufd/iommufd_private.h:740:5: warning: no previous prototype for 'iommufd_test_dma_buf_iommufd_map' [-Wmissing-prototypes]
     740 | int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/iommufd/pages.c:58:
   drivers/iommu/iommufd/pages.c: In function 'sym_vfio_pci_dma_buf_iommufd_map':
   include/linux/vfio_pci_core.h:172:1: error: weak declaration of 'vfio_pci_dma_buf_iommufd_map' being applied to a already existing, static definition
     172 | vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_test_dma_buf_iommufd_map +740 drivers/iommu/iommufd/iommufd_private.h

   706	
   707	#ifdef CONFIG_IOMMUFD_TEST
   708	int iommufd_test(struct iommufd_ucmd *ucmd);
   709	void iommufd_selftest_destroy(struct iommufd_object *obj);
   710	extern size_t iommufd_test_memory_limit;
   711	void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
   712					   unsigned int ioas_id, u64 *iova, u32 *flags);
   713	bool iommufd_should_fail(void);
   714	int __init iommufd_test_init(void);
   715	void iommufd_test_exit(void);
   716	bool iommufd_selftest_is_mock_dev(struct device *dev);
   717	int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
   718					     struct phys_vec *phys);
   719	#else
   720	static inline void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
   721							 unsigned int ioas_id,
   722							 u64 *iova, u32 *flags)
   723	{
   724	}
   725	static inline bool iommufd_should_fail(void)
   726	{
   727		return false;
   728	}
   729	static inline int __init iommufd_test_init(void)
   730	{
   731		return 0;
   732	}
   733	static inline void iommufd_test_exit(void)
   734	{
   735	}
   736	static inline bool iommufd_selftest_is_mock_dev(struct device *dev)
   737	{
   738		return false;
   739	}
 > 740	int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
