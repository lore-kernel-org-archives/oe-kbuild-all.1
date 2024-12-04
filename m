Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26D184
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733297179; cv=none; b=XE+Rbgiu5FDefRy+GJmf9sGitHwsHPY7RKPmaPHIP0MgZCJWrO9G1xU0Rvpm6G9WmOxvs8ZpeAMjHsbvXj/O+O4fUWLIlqADOnfcV2X7zKzCx7tTAKb8uOP7zivJPwz7i2saf/4GmISsPNw8V8WljQEcfGtocxE60rNDhi648eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733297179; c=relaxed/simple;
	bh=fhrAGcsR5Nx5U8Tl2tusVySRCy5LScFpshR1w1ws0rI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZNztqZvdqEer8Fyf4QAolnRScOs/nHuNBqaNWGBRQ1UtvCz2qH+xIQGB8KCpagpaXOTQseF85KhRfs4sRh3HfTAsXQ3X9i3wp9r78by5C1xJCvWSwjuvTnJqokSql+3NR9PigNtdG8f4qLNC9J+knKr2IvzrC65dYOe/BP0LahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6SR0Uw3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6SR0Uw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733297178; x=1764833178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhrAGcsR5Nx5U8Tl2tusVySRCy5LScFpshR1w1ws0rI=;
  b=l6SR0Uw3se/mzw8odgEDkcvTFB99Su19sWdWjWp/o/0xP4vJKXL8EfCd
   itHsYuCgBpDkhVGUZqZzxI75Q1FCUaAfZr/++vb2P6dcwKGedf2jwVXhR
   s9rvcg7sIRpHKp8Zm4xbproqjWan1FFDWripFmSr8G//cVfR3fp2dsTFE
   67tSIA0IdPDvD9VaPpVnPIaWyU38aM1vsZlgGdVWUrmSF2wsH0dtwRCE/
   fOo6rCWUur5BJ/S5TQVOJllyxvmHt8wTOBzmBqllQ5/6zDKrnT40N5j3O
   zCcPkFbAnUKKvGWHR3Kwk00eIgmxADqjV7cA/znaGEmOAjw3726/yN7A0
   w==;
X-CSE-ConnectionGUID: NKkVbsQQQTCQ/qqrWfIAHw==
X-CSE-MsgGUID: EvOAr8epRtiOvvcZSrR5kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44026401"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44026401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:26:17 -0800
X-CSE-ConnectionGUID: YRd0A2EBTRmYSVngj28bmQ==
X-CSE-MsgGUID: aSTR/pW/Sj+WwywGtTTLRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98486773"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2024 23:26:13 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIjlz-0002hj-1j;
	Wed, 04 Dec 2024 07:26:11 +0000
Date: Wed, 4 Dec 2024 15:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/arm-smmu.c:1591:10: error: 'struct iommu_ops' has no member
 named 'add_device'
Message-ID: <202412041509.bn4a2VwD-lkp@intel.com>
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
commit: 9c3888559fa80ba17dadeee3aa6c603fab6db09b [1/1] iommu: Remove add_device()/remove_device() code-paths
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041509.bn4a2VwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041509.bn4a2VwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041509.bn4a2VwD-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/iommu/arm-smmu.c: At top level:
   drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1586 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1586:35: note: (near initialization for 'arm_smmu_ops.map')
>> drivers/iommu/arm-smmu.c:1591:10: error: 'struct iommu_ops' has no member named 'add_device'
    1591 |         .add_device             = arm_smmu_add_device,
         |          ^~~~~~~~~~
>> drivers/iommu/arm-smmu.c:1591:35: error: initialization of 'struct iommu_device * (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1591 |         .add_device             = arm_smmu_add_device,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1591:35: note: (near initialization for 'arm_smmu_ops.probe_device')
>> drivers/iommu/arm-smmu.c:1592:10: error: 'struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1592 |         .remove_device          = arm_smmu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   cc1: some warnings being treated as errors


vim +1591 drivers/iommu/arm-smmu.c

f3ebee80b3131d4 Eric Auger   2017-01-19  1580  
518f7136244c167 Will Deacon  2014-11-14  1581  static struct iommu_ops arm_smmu_ops = {
1fd0c775a573646 Joerg Roedel 2014-09-05  1582  	.capable		= arm_smmu_capable,
1d672638fca24db Joerg Roedel 2015-03-26  1583  	.domain_alloc		= arm_smmu_domain_alloc,
1d672638fca24db Joerg Roedel 2015-03-26  1584  	.domain_free		= arm_smmu_domain_free,
45ae7cff3684ab4 Will Deacon  2013-06-24  1585  	.attach_dev		= arm_smmu_attach_dev,
45ae7cff3684ab4 Will Deacon  2013-06-24  1586  	.map			= arm_smmu_map,
45ae7cff3684ab4 Will Deacon  2013-06-24  1587  	.unmap			= arm_smmu_unmap,
44f6876a00e83df Robin Murphy 2018-09-20  1588  	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
32b124492bdf974 Robin Murphy 2017-09-28  1589  	.iotlb_sync		= arm_smmu_iotlb_sync,
45ae7cff3684ab4 Will Deacon  2013-06-24  1590  	.iova_to_phys		= arm_smmu_iova_to_phys,
45ae7cff3684ab4 Will Deacon  2013-06-24 @1591  	.add_device		= arm_smmu_add_device,
45ae7cff3684ab4 Will Deacon  2013-06-24 @1592  	.remove_device		= arm_smmu_remove_device,
af65993224c1cfd Joerg Roedel 2015-10-21  1593  	.device_group		= arm_smmu_device_group,
c752ce45b213de8 Will Deacon  2014-06-25  1594  	.domain_get_attr	= arm_smmu_domain_get_attr,
c752ce45b213de8 Will Deacon  2014-06-25  1595  	.domain_set_attr	= arm_smmu_domain_set_attr,
021bb8420d44cf5 Robin Murphy 2016-09-14  1596  	.of_xlate		= arm_smmu_of_xlate,
f3ebee80b3131d4 Eric Auger   2017-01-19  1597  	.get_resv_regions	= arm_smmu_get_resv_regions,
f3ebee80b3131d4 Eric Auger   2017-01-19  1598  	.put_resv_regions	= arm_smmu_put_resv_regions,
518f7136244c167 Will Deacon  2014-11-14  1599  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
45ae7cff3684ab4 Will Deacon  2013-06-24  1600  };
45ae7cff3684ab4 Will Deacon  2013-06-24  1601  

:::::: The code at line 1591 was first introduced by commit
:::::: 45ae7cff3684ab45f57fc13fc242c8546536a84e iommu/arm: Add support for ARM Ltd. System MMU architecture

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Joerg Roedel <joro@8bytes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
