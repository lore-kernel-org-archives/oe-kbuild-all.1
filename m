Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46E1E4A4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 05:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709877284; cv=none; b=Z9yc5ortQaMPwkxG1CQPREJh00+Qg7QSEwTR7Qx3JqYDZVPaTkbI5dVFQTVoKRZJ2jCvmjNVmXzeLMMzExgyC1NcPBfZ+UuZ7iMjVEf/J4YlOjZVD6BzEWQh8dP6PKwgXM2+IeqbNUFxZR6CoGUcn3/r3CX/EeIqTMqFXVKDbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709877284; c=relaxed/simple;
	bh=V5w6mQthB3trnuR8vtPcr1xRfGeszS5bjLPOnAgjteE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MttLMPIdwpUeRBbw4sj6EGP2/+tjzF5k4o+rXpGAy0ya2zeOzgZ4jAmFAZCbT7gLMtZ9HtdtoQ9v2o7qGN5/2iNshOLxeWv+ezpCP+HXNt6MxmSvA19BrjGMe0yqvG4MXCiuudAN7o05z/l/5MK8TA25fY0glR/jOby+SRSjKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Orxy5ap9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Orxy5ap9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709877282; x=1741413282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V5w6mQthB3trnuR8vtPcr1xRfGeszS5bjLPOnAgjteE=;
  b=Orxy5ap9a0bK+4QDDzkSynS4XrB0Bu5ZxTNUwkt6W85N0SFoONS6Q0v4
   fm0h2veqRMb/ApjLOr7j1s2UsR00XD27zv9nJogCVFanPGyXqFpf025IJ
   oU7QDIVZf5wVXU2oM5ymaWAIWRCth5zOjKBcnZTNWwdrRrxfY5EQaSsDE
   izIKRhGdIzHTdPjQN2UH72Ma13y9Lx2PqmSv567PQvL47rz9YO5L74PMY
   Dl0yYPP0HvvKoAhgswAozowFvA3tbR80ynilDtl7O7WU0bsJHxuQUqcei
   7pztochCFDdjoqyJr8GOSjHywPl0fIcUe2UGpFzYgt/KZotgmiOE8IMKW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7531446"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="7531446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 21:54:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41274284"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2024 21:54:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riTBj-00064Z-0Y;
	Fri, 08 Mar 2024 05:54:35 +0000
Date: Fri, 8 Mar 2024 13:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/arm-smmu.c:1537:1: warning: label 'out_unlock' defined
 but not used
Message-ID: <202403081333.9R5fqw3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 0095646afc7d37f78774f3db569f07c47984f10c iommu: remove DOMAIN_ATTR_NESTING
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240308/202403081333.9R5fqw3X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081333.9R5fqw3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081333.9R5fqw3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1076:40: note: in expansion of macro 'fwspec_smmu'
    1076 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
         |                                        ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1077:49: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1077 |         struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
         |                                                 ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:114:46: note: in expansion of macro '__fwspec_cfg'
     114 |         (i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
         |                                              ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:27: note: in expansion of macro 'fwspec_smendx'
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                           ^~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1081:9: note: in expansion of macro 'for_each_cfg_sme'
    1081 |         for_each_cfg_sme(fwspec, i, idx) {
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
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1103:9: note: in expansion of macro 'for_each_cfg_sme'
    1103 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_attach_dev':
   drivers/iommu/arm-smmu.c:1134:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1134 |         if (!fwspec->iommu_priv)
         |                    ^~
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1137:16: note: in expansion of macro 'fwspec_smmu'
    1137 |         smmu = fwspec_smmu(fwspec);
         |                ^~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_add_device':
   drivers/iommu/arm-smmu.c:1379:15: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1379 |         fwspec->iommu_priv = cfg;
         |               ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_remove_device':
   drivers/iommu/arm-smmu.c:1417:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1417 |         cfg  = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/arm-smmu.c:1430:21: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
    1430 |         kfree(fwspec->iommu_priv);
         |                     ^~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_device_group':
   drivers/iommu/arm-smmu.c:111:59: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     111 | #define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
         |                                                           ^~
   drivers/iommu/arm-smmu.c:112:27: note: in expansion of macro '__fwspec_cfg'
     112 | #define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
         |                           ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1437:40: note: in expansion of macro 'fwspec_smmu'
    1437 |         struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
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
   drivers/iommu/arm-smmu.c:1441:9: note: in expansion of macro 'for_each_cfg_sme'
    1441 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:116:47: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     116 |         for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
         |                                               ^
   drivers/iommu/arm-smmu.c:1441:9: note: in expansion of macro 'for_each_cfg_sme'
    1441 |         for_each_cfg_sme(fwspec, i, idx) {
         |         ^~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c: In function 'arm_smmu_domain_set_attr':
>> drivers/iommu/arm-smmu.c:1537:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
    1537 | out_unlock:
         | ^~~~~~~~~~
   drivers/iommu/arm-smmu.c: At top level:
   drivers/iommu/arm-smmu.c:1587:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1587 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1587:35: note: (near initialization for 'arm_smmu_ops.map')
   drivers/iommu/arm-smmu.c:1592:10: error: 'struct iommu_ops' has no member named 'add_device'
    1592 |         .add_device             = arm_smmu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/arm-smmu.c:1592:35: error: initialization of 'struct iommu_device * (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1592 |         .add_device             = arm_smmu_add_device,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1592:35: note: (near initialization for 'arm_smmu_ops.probe_device')
   drivers/iommu/arm-smmu.c:1593:10: error: 'struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1593 |         .remove_device          = arm_smmu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   cc1: some warnings being treated as errors


vim +/out_unlock +1537 drivers/iommu/arm-smmu.c

0095646afc7d37 Christoph Hellwig 2021-04-01  1509  
^590eaf1fec755 Kaixu Xia         2021-03-16  1510  static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
^590eaf1fec755 Kaixu Xia         2021-03-16  1511  				    enum iommu_attr attr, void *data)
^590eaf1fec755 Kaixu Xia         2021-03-16  1512  {
^590eaf1fec755 Kaixu Xia         2021-03-16  1513  	int ret = 0;
^590eaf1fec755 Kaixu Xia         2021-03-16  1514  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
^590eaf1fec755 Kaixu Xia         2021-03-16  1515  
^590eaf1fec755 Kaixu Xia         2021-03-16  1516  	mutex_lock(&smmu_domain->init_mutex);
^590eaf1fec755 Kaixu Xia         2021-03-16  1517  
^590eaf1fec755 Kaixu Xia         2021-03-16  1518  	switch(domain->type) {
^590eaf1fec755 Kaixu Xia         2021-03-16  1519  	case IOMMU_DOMAIN_UNMANAGED:
^590eaf1fec755 Kaixu Xia         2021-03-16  1520  		switch (attr) {
^590eaf1fec755 Kaixu Xia         2021-03-16  1521  		default:
^590eaf1fec755 Kaixu Xia         2021-03-16  1522  			ret = -ENODEV;
^590eaf1fec755 Kaixu Xia         2021-03-16  1523  		}
^590eaf1fec755 Kaixu Xia         2021-03-16  1524  		break;
^590eaf1fec755 Kaixu Xia         2021-03-16  1525  	case IOMMU_DOMAIN_DMA:
^590eaf1fec755 Kaixu Xia         2021-03-16  1526  		switch (attr) {
^590eaf1fec755 Kaixu Xia         2021-03-16  1527  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
^590eaf1fec755 Kaixu Xia         2021-03-16  1528  			smmu_domain->non_strict = *(int *)data;
^590eaf1fec755 Kaixu Xia         2021-03-16  1529  			break;
^590eaf1fec755 Kaixu Xia         2021-03-16  1530  		default:
^590eaf1fec755 Kaixu Xia         2021-03-16  1531  			ret = -ENODEV;
^590eaf1fec755 Kaixu Xia         2021-03-16  1532  		}
^590eaf1fec755 Kaixu Xia         2021-03-16  1533  		break;
^590eaf1fec755 Kaixu Xia         2021-03-16  1534  	default:
^590eaf1fec755 Kaixu Xia         2021-03-16  1535  		ret = -EINVAL;
^590eaf1fec755 Kaixu Xia         2021-03-16  1536  	}
^590eaf1fec755 Kaixu Xia         2021-03-16 @1537  out_unlock:
^590eaf1fec755 Kaixu Xia         2021-03-16  1538  	mutex_unlock(&smmu_domain->init_mutex);
^590eaf1fec755 Kaixu Xia         2021-03-16  1539  	return ret;
^590eaf1fec755 Kaixu Xia         2021-03-16  1540  }
^590eaf1fec755 Kaixu Xia         2021-03-16  1541  

:::::: The code at line 1537 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
