Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851A5482D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 21:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710366853; cv=none; b=AC5OcaRlMgQ5CVgbtom4sbsCWcnL79ZeeJ6cR1s4tEje71AO3PKCrX6UpJIO+hVKhaet3sivKLwnUo7eHYjujM5XLB/JKyj9Vnxb4d79EEsobla5DGfmbD8xk+QUPpaFX9jKk2n3GWZk7PgrT2erCDbvLB993OcVv7+EB7cCiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710366853; c=relaxed/simple;
	bh=KkFonBiuahVi3gYp7v2XkxwvIYAhcXQQR7dcWSKcmgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHlYXVfbNc7NWUWI0U3sKTe3rTSC/krio1eLdVTmtN3fs2oa/TR/5M93Cohi41QU2+X/mRtrnNHuYDrZyglarP0F0diqTgVCY3UHTbC53lzMQ46Lwc+KR/VE6YHhSeFIyld+dA9squFT6BCUSdLZmGOLR31NfmcdG1XKC7iD97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1Aj8oDE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1Aj8oDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710366850; x=1741902850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KkFonBiuahVi3gYp7v2XkxwvIYAhcXQQR7dcWSKcmgE=;
  b=f1Aj8oDEyoa93gQh652a0bThOIbeGppToy5T8qB0RVLAMHYsIalJXv3j
   8Bfi6gbptvm7yvzU5GDva9trjwEMWUTMqEYVdWFCPqLv8jwL/tc8ugSAh
   w7O0JuJB9ezEJGd9+v4kMOI/9O82l+l+uadiH3eYbOwuz9OLpiu9bme4k
   tZP8BTW/ULrldVRSM2CIsb9IBl1VFeMCq00sQmuMjy535VRzCRRWfXpcR
   RguqVPPaQMEj+bD+ophSaa2Q61FuGXJ5HxHtGoppuVszTRw82ELfjJMkc
   Gj0sgNn8jJa9OqdsV51hiNvRkPiUB4gjdKtwYQ4K8KM5HqqZFaD7lAji+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5029034"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5029034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 14:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16534982"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2024 14:54:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkWXy-000CnB-23;
	Wed, 13 Mar 2024 21:54:02 +0000
Date: Thu, 14 Mar 2024 05:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/arm-smmu.c:1590:10: error: 'struct iommu_ops' has no
 member named 'enable_nesting'
Message-ID: <202403140552.EFwgLDjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 0de61a7e3cd5561f365657e90c222f1c88e9976c Revert "iommu: remove DOMAIN_ATTR_NESTING"
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240314/202403140552.EFwgLDjL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140552.EFwgLDjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140552.EFwgLDjL-lkp@intel.com/

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
--
   In file included from include/linux/iommu.h:16,
                    from include/linux/dma-iommu.h:13,
                    from drivers/iommu/arm-smmu-v3.c:18:
   include/linux/ioasid.h:209:51: error: unknown type name 'ioasid_set_type'
     209 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_attach_dev':
   drivers/iommu/arm-smmu-v3.c:2452:24: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    2452 |         master = fwspec->iommu_priv;
         |                        ^~
   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:19,
                    from arch/arm64/include/asm/processor.h:31,
                    from include/linux/mutex.h:19,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/iommu/arm-smmu-v3.c:12:
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_add_device':
   drivers/iommu/arm-smmu-v3.c:2588:32: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    2588 |         if (WARN_ON_ONCE(fwspec->iommu_priv)) {
         |                                ^~
   include/asm-generic/bug.h:97:32: note: in definition of macro 'WARN_ON_ONCE'
      97 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2589:32: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    2589 |                 master = fwspec->iommu_priv;
         |                                ^~
   drivers/iommu/arm-smmu-v3.c:2603:23: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    2603 |                 fwspec->iommu_priv = master;
         |                       ^~
   drivers/iommu/arm-smmu-v3.c:2621:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
    2621 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
   drivers/iommu/arm-smmu-v3.c:2621:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2621 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_remove_device':
   drivers/iommu/arm-smmu-v3.c:2639:24: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    2639 |         master = fwspec->iommu_priv;
         |                        ^~
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_domain_get_attr':
   drivers/iommu/arm-smmu-v3.c:2673:22: error: 'DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE' undeclared (first use in this function)
    2673 |                 case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2673:22: note: each undeclared identifier is reported only once for each function it appears in
   drivers/iommu/arm-smmu-v3.c: In function 'arm_smmu_domain_set_attr':
   drivers/iommu/arm-smmu-v3.c:2696:22: error: 'DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE' undeclared (first use in this function)
    2696 |                 case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c: At top level:
   drivers/iommu/arm-smmu-v3.c:2794:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    2794 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2794:35: note: (near initialization for 'arm_smmu_ops.map')
   drivers/iommu/arm-smmu-v3.c:2799:10: error: 'struct iommu_ops' has no member named 'add_device'
    2799 |         .add_device             = arm_smmu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2799:35: error: initialization of 'struct iommu_device * (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    2799 |         .add_device             = arm_smmu_add_device,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2799:35: note: (near initialization for 'arm_smmu_ops.probe_device')
   drivers/iommu/arm-smmu-v3.c:2800:10: error: 'struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    2800 |         .remove_device          = arm_smmu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
>> drivers/iommu/arm-smmu-v3.c:2804:10: error: 'struct iommu_ops' has no member named 'enable_nesting'
    2804 |         .enable_nesting         = arm_smmu_enable_nesting,
         |          ^~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu-v3.c:2804:35: error: initialization of 'void (*)(struct device *, struct list_head *)' from incompatible pointer type 'int (*)(struct iommu_domain *)' [-Werror=incompatible-pointer-types]
    2804 |         .enable_nesting         = arm_smmu_enable_nesting,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2804:35: note: (near initialization for 'arm_smmu_ops.get_resv_regions')
   drivers/iommu/arm-smmu-v3.c:2806:35: warning: initialized field overwritten [-Woverride-init]
    2806 |         .get_resv_regions       = arm_smmu_get_resv_regions,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2806:35: note: (near initialization for 'arm_smmu_ops.get_resv_regions')
   cc1: some warnings being treated as errors


vim +1590 drivers/iommu/arm-smmu.c

^590eaf1fec755 Kaixu Xia         2021-03-16  1574  
^590eaf1fec755 Kaixu Xia         2021-03-16  1575  static struct iommu_ops arm_smmu_ops = {
^590eaf1fec755 Kaixu Xia         2021-03-16  1576  	.capable		= arm_smmu_capable,
^590eaf1fec755 Kaixu Xia         2021-03-16  1577  	.domain_alloc		= arm_smmu_domain_alloc,
^590eaf1fec755 Kaixu Xia         2021-03-16  1578  	.domain_free		= arm_smmu_domain_free,
^590eaf1fec755 Kaixu Xia         2021-03-16  1579  	.attach_dev		= arm_smmu_attach_dev,
^590eaf1fec755 Kaixu Xia         2021-03-16  1580  	.map			= arm_smmu_map,
^590eaf1fec755 Kaixu Xia         2021-03-16  1581  	.unmap			= arm_smmu_unmap,
^590eaf1fec755 Kaixu Xia         2021-03-16  1582  	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
^590eaf1fec755 Kaixu Xia         2021-03-16  1583  	.iotlb_sync		= arm_smmu_iotlb_sync,
^590eaf1fec755 Kaixu Xia         2021-03-16  1584  	.iova_to_phys		= arm_smmu_iova_to_phys,
^590eaf1fec755 Kaixu Xia         2021-03-16 @1585  	.add_device		= arm_smmu_add_device,
^590eaf1fec755 Kaixu Xia         2021-03-16  1586  	.remove_device		= arm_smmu_remove_device,
^590eaf1fec755 Kaixu Xia         2021-03-16  1587  	.device_group		= arm_smmu_device_group,
^590eaf1fec755 Kaixu Xia         2021-03-16  1588  	.domain_get_attr	= arm_smmu_domain_get_attr,
^590eaf1fec755 Kaixu Xia         2021-03-16  1589  	.domain_set_attr	= arm_smmu_domain_set_attr,
0095646afc7d37 Christoph Hellwig 2021-04-01 @1590  	.enable_nesting		= arm_smmu_enable_nesting,
^590eaf1fec755 Kaixu Xia         2021-03-16  1591  	.of_xlate		= arm_smmu_of_xlate,
^590eaf1fec755 Kaixu Xia         2021-03-16  1592  	.get_resv_regions	= arm_smmu_get_resv_regions,
^590eaf1fec755 Kaixu Xia         2021-03-16  1593  	.put_resv_regions	= arm_smmu_put_resv_regions,
^590eaf1fec755 Kaixu Xia         2021-03-16  1594  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
^590eaf1fec755 Kaixu Xia         2021-03-16  1595  };
^590eaf1fec755 Kaixu Xia         2021-03-16  1596  

:::::: The code at line 1590 was first introduced by commit
:::::: 0095646afc7d37f78774f3db569f07c47984f10c iommu: remove DOMAIN_ATTR_NESTING

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Song, Youquan <youquan.song@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
