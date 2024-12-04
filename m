Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C020FA82
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328142; cv=none; b=CewTJJzGKlS15Fut1TvoNXCe1YOok2mN6PUHlKQODCuFF5Wr4oEPuVVkrc04QRyDKUcAZGIuu26R1ES8C/VQTiCSON5WZ433D+rmYJI2vnYZAB4flAntgPGjawh4EwUcHQ7LsVmU4E7NqQqpexx65aTMf+PpHw5I7695GoR2tJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328142; c=relaxed/simple;
	bh=M5aAQplFStc7QNBgtuUrsO7FDofGtyHwaWRYebw3YFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkHJzMhRY+27FvE/D2XInZRACgBi0LQCdbvV8m50AJ6l+WtNvsd9HJkcSDKRpTEGMYF/nOOkxaH/pNJ5lMOXIEAURCggWgOHovbl/tG49J1fHPKEaFhm0F24uVYDwhgkqGIXl5C6J6Ycpq2VJvCQBpk1/39YGtSfHEMnTRAGX2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggiCUDue; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggiCUDue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733328141; x=1764864141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M5aAQplFStc7QNBgtuUrsO7FDofGtyHwaWRYebw3YFk=;
  b=ggiCUDueaOERl0VrpX9MZctl4rgXN6Yyyl6y1O6tivMNu7jdlM94Gvai
   MFV0kgJb2iuClTZub01hlnuoYMAsK4vx3xT3DJqsY6MiRM72VZh3cGuVY
   RrqxgIKd2iNfGqbAVdWad/53viXm9tKwHr2JOzl6UWM3/UNfOuZVoTyC5
   jkuxlG/nz1Z10ilr4ARNTnVIvuOSP+Q1trlHGtlZ4WDFEyjivuE6/FLMQ
   ZzE+xiTAr5EBaMBjSL/E0glJxwzOLtHON9AF4fp6K5ef8B25du8xd4h/S
   pN2ENVVxfN8+4pGiMMRtqYhnwTu/uwfTRCx7EkcK10H0jo10HQxMhrap3
   w==;
X-CSE-ConnectionGUID: K9jx3PRQReeS/fzRm+Pd3w==
X-CSE-MsgGUID: LA2AK0gMQDaHUC2YiGVy4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44632341"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44632341"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 08:02:20 -0800
X-CSE-ConnectionGUID: PmzgamnhQxCaFU6DIrO0gw==
X-CSE-MsgGUID: eDbIUq7AT3ahnOLhwMqHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98785148"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 08:02:16 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIrpN-0003EP-2D;
	Wed, 04 Dec 2024 16:02:13 +0000
Date: Thu, 5 Dec 2024 00:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/arm-smmu.c:1590:10: error: 'struct iommu_ops' has no member
 named 'enable_nesting'
Message-ID: <202412042329.aR9XHA50-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 592f1f62aa94ed7e396270951648e7d6230fd0f5 [1/1] Revert "iommu: remove DOMAIN_ATTR_NESTING"
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412042329.aR9XHA50-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042329.aR9XHA50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042329.aR9XHA50-lkp@intel.com/

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_add_master':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1096:9: note: in expansion of macro 'for_each_cfg_sme'
    1096 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1096:9: note: in expansion of macro 'for_each_cfg_sme'
    1096 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_attach_dev':
   drivers/iommu/arm-smmu.c:1127:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1127 |         if (!fwspec->iommu_priv)
         |                    ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1130:16: note: in expansion of macro 'fwspec_smmu'
    1130 |         smmu = fwspec_smmu(fwspec);
         |                ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
   drivers/iommu/arm-smmu.c:1372:15: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1372 |         fwspec->iommu_priv = cfg;
         |               ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_remove_device':
   drivers/iommu/arm-smmu.c:1410:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1410 |         cfg  = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/arm-smmu.c:1423:21: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1423 |         kfree(fwspec->iommu_priv);
         |                     ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_device_group':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1430:40: note: in expansion of macro 'fwspec_smmu'
    1430 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
         |                                        ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1434:9: note: in expansion of macro 'for_each_cfg_sme'
    1434 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1434:9: note: in expansion of macro 'for_each_cfg_sme'
    1434 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_get_attr':
   drivers/iommu/arm-smmu.c:1476:22: error: 'DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE' undeclared (first use in this function)
    1476 |                 case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1476:22: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_set_attr':
   drivers/iommu/arm-smmu.c:1520:22: error: 'DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE' undeclared (first use in this function)
    1520 |                 case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1530:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
    1530 | out_unlock:
         | ^~~~~~~~~~
   drivers/iommu/arm-smmu.c: At top level:
   drivers/iommu/arm-smmu.c:1580:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1580 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1580:35: note: (near initialization for 'arm_smmu_ops.map')
   drivers/iommu/arm-smmu.c:1585:10: error: 'struct iommu_ops' has no member named 'add_device'
    1585 |         .add_device             = arm_smmu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/arm-smmu.c:1585:35: error: initialization of 'struct iommu_device * (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1585 |         .add_device             = arm_smmu_add_device,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1585:35: note: (near initialization for 'arm_smmu_ops.probe_device')
   drivers/iommu/arm-smmu.c:1586:10: error: 'struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1586 |         .remove_device          = arm_smmu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
>> drivers/iommu/arm-smmu.c:1590:10: error: 'struct iommu_ops' has no member named 'enable_nesting'
    1590 |         .enable_nesting         = arm_smmu_enable_nesting,
         |          ^~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:1590:35: error: initialization of 'void (*)(struct device *, struct list_head *)' from incompatible pointer type 'int (*)(struct iommu_domain *)' [-Werror=incompatible-pointer-types]
    1590 |         .enable_nesting         = arm_smmu_enable_nesting,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1590:35: note: (near initialization for 'arm_smmu_ops.get_resv_regions')
   drivers/iommu/arm-smmu.c:1592:35: warning: initialized field overwritten [-Woverride-init]
    1592 |         .get_resv_regions       = arm_smmu_get_resv_regions,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1592:35: note: (near initialization for 'arm_smmu_ops.get_resv_regions')
   cc1: some warnings being treated as errors


vim +1590 drivers/iommu/arm-smmu.c

f3ebee80b3131d4 Eric Auger        2017-01-19  1574  
518f7136244c167 Will Deacon       2014-11-14  1575  static struct iommu_ops arm_smmu_ops = {
1fd0c775a573646 Joerg Roedel      2014-09-05  1576  	.capable		= arm_smmu_capable,
1d672638fca24db Joerg Roedel      2015-03-26  1577  	.domain_alloc		= arm_smmu_domain_alloc,
1d672638fca24db Joerg Roedel      2015-03-26  1578  	.domain_free		= arm_smmu_domain_free,
45ae7cff3684ab4 Will Deacon       2013-06-24  1579  	.attach_dev		= arm_smmu_attach_dev,
45ae7cff3684ab4 Will Deacon       2013-06-24  1580  	.map			= arm_smmu_map,
45ae7cff3684ab4 Will Deacon       2013-06-24  1581  	.unmap			= arm_smmu_unmap,
44f6876a00e83df Robin Murphy      2018-09-20  1582  	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
32b124492bdf974 Robin Murphy      2017-09-28  1583  	.iotlb_sync		= arm_smmu_iotlb_sync,
45ae7cff3684ab4 Will Deacon       2013-06-24  1584  	.iova_to_phys		= arm_smmu_iova_to_phys,
45ae7cff3684ab4 Will Deacon       2013-06-24  1585  	.add_device		= arm_smmu_add_device,
45ae7cff3684ab4 Will Deacon       2013-06-24  1586  	.remove_device		= arm_smmu_remove_device,
af65993224c1cfd Joerg Roedel      2015-10-21  1587  	.device_group		= arm_smmu_device_group,
c752ce45b213de8 Will Deacon       2014-06-25  1588  	.domain_get_attr	= arm_smmu_domain_get_attr,
c752ce45b213de8 Will Deacon       2014-06-25  1589  	.domain_set_attr	= arm_smmu_domain_set_attr,
3e38de275a876dc Christoph Hellwig 2021-04-01 @1590  	.enable_nesting		= arm_smmu_enable_nesting,
021bb8420d44cf5 Robin Murphy      2016-09-14  1591  	.of_xlate		= arm_smmu_of_xlate,
f3ebee80b3131d4 Eric Auger        2017-01-19  1592  	.get_resv_regions	= arm_smmu_get_resv_regions,
f3ebee80b3131d4 Eric Auger        2017-01-19  1593  	.put_resv_regions	= arm_smmu_put_resv_regions,
518f7136244c167 Will Deacon       2014-11-14  1594  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
45ae7cff3684ab4 Will Deacon       2013-06-24  1595  };
45ae7cff3684ab4 Will Deacon       2013-06-24  1596  

:::::: The code at line 1590 was first introduced by commit
:::::: 3e38de275a876dcf09eb478610a9055366496bc9 iommu: remove DOMAIN_ATTR_NESTING

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
