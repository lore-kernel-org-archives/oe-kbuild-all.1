Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CB18BC19
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733316631; cv=none; b=UfkD6VJYwo9oynquDBR3zMDCkDCliIiUcXzDoGlKMdQ9Z2w4uHGPE/81R0EhMx/7WbM6fyHM23xvQg6KHHTEqVeWiE54q1CLW6SyPNlyDASHFZxdFHwNKkjzlNt7AVHWZatEtr8GSyTuOQDqfaO80AXFRbaMlPnLH74Jqx4VLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733316631; c=relaxed/simple;
	bh=ytG/XoRYYgx3JnmET/kn9VI2lJI/PfYpPxXN+uGIpKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8XO+uNZLfKeqLW/llHTeQ7ukhBctx1vDDL8X22Sfk/a4o43qoNatFUsP9Wn4Q5BN2V0ogipd+yEaqDHxjZDvo/7xvyaySJryWgBNPosFmR3mN/X6bcKm/PR5Iew4oAJXLMIJumMIePIxvFPpdUgZlwNZW/7Pxnn2YaOFvuiicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxw2EmOP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxw2EmOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733316629; x=1764852629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytG/XoRYYgx3JnmET/kn9VI2lJI/PfYpPxXN+uGIpKM=;
  b=lxw2EmOP5gUIiNaRY3OVxra2po8fNSaBATBSb9nq6K0lO7QHMT3T8mzo
   GKAdMfMiVBwBEBcWnynwAFYUqj2f0GiWno//Vq/CNlUL+Xej8jTJwuD1u
   vdiBXVH4LDMcpSWxQlBIdGhvlpfCzy19N98XtbGQBNglLgM3EJ4AUmPX+
   IvnIs5Zun+zyyF/vyAMhbwrkXeQhtofFRybmqJKDbWmYnnIacXB+DPfsz
   JHOHmaS/yTiyvFWSxjL9TnzCXfRrZqpMjP9+L5Fx1v7ltk1X8CwN5YpIu
   adGbwFwFnsKeUscJg8SuFvAkxR7tW1T1ejPLBp7oOUe69BaIqQbP7eAmD
   g==;
X-CSE-ConnectionGUID: YDoUeYFwQ9y71+8kKEd3tQ==
X-CSE-MsgGUID: ckxYJB6GTfS5ZmmwSS4NKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44244815"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44244815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 04:50:28 -0800
X-CSE-ConnectionGUID: rAiBR9ECRvqwBpP6MfDnLw==
X-CSE-MsgGUID: 4YQUGBuxQfCX8J9QU9F4Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94214086"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2024 04:50:25 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIopj-000327-0s;
	Wed, 04 Dec 2024 12:50:23 +0000
Date: Wed, 4 Dec 2024 20:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/arm-smmu.c:1537:1: warning: label 'out_unlock' defined but not
 used
Message-ID: <202412042012.pvbwUPM5-lkp@intel.com>
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
commit: 3e38de275a876dcf09eb478610a9055366496bc9 [1/1] iommu: remove DOMAIN_ATTR_NESTING
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412042012.pvbwUPM5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042012.pvbwUPM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042012.pvbwUPM5-lkp@intel.com/

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

3e38de275a876dc Christoph Hellwig 2021-04-01  1509  
c752ce45b213de8 Will Deacon       2014-06-25  1510  static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
c752ce45b213de8 Will Deacon       2014-06-25  1511  				    enum iommu_attr attr, void *data)
c752ce45b213de8 Will Deacon       2014-06-25  1512  {
518f7136244c167 Will Deacon       2014-11-14  1513  	int ret = 0;
1d672638fca24db Joerg Roedel      2015-03-26  1514  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
c752ce45b213de8 Will Deacon       2014-06-25  1515  
518f7136244c167 Will Deacon       2014-11-14  1516  	mutex_lock(&smmu_domain->init_mutex);
518f7136244c167 Will Deacon       2014-11-14  1517  
44f6876a00e83df Robin Murphy      2018-09-20  1518  	switch(domain->type) {
44f6876a00e83df Robin Murphy      2018-09-20  1519  	case IOMMU_DOMAIN_UNMANAGED:
c752ce45b213de8 Will Deacon       2014-06-25  1520  		switch (attr) {
c752ce45b213de8 Will Deacon       2014-06-25  1521  		default:
518f7136244c167 Will Deacon       2014-11-14  1522  			ret = -ENODEV;
c752ce45b213de8 Will Deacon       2014-06-25  1523  		}
44f6876a00e83df Robin Murphy      2018-09-20  1524  		break;
44f6876a00e83df Robin Murphy      2018-09-20  1525  	case IOMMU_DOMAIN_DMA:
44f6876a00e83df Robin Murphy      2018-09-20  1526  		switch (attr) {
44f6876a00e83df Robin Murphy      2018-09-20  1527  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
44f6876a00e83df Robin Murphy      2018-09-20  1528  			smmu_domain->non_strict = *(int *)data;
44f6876a00e83df Robin Murphy      2018-09-20  1529  			break;
44f6876a00e83df Robin Murphy      2018-09-20  1530  		default:
44f6876a00e83df Robin Murphy      2018-09-20  1531  			ret = -ENODEV;
44f6876a00e83df Robin Murphy      2018-09-20  1532  		}
44f6876a00e83df Robin Murphy      2018-09-20  1533  		break;
44f6876a00e83df Robin Murphy      2018-09-20  1534  	default:
44f6876a00e83df Robin Murphy      2018-09-20  1535  		ret = -EINVAL;
44f6876a00e83df Robin Murphy      2018-09-20  1536  	}
518f7136244c167 Will Deacon       2014-11-14 @1537  out_unlock:
518f7136244c167 Will Deacon       2014-11-14  1538  	mutex_unlock(&smmu_domain->init_mutex);
518f7136244c167 Will Deacon       2014-11-14  1539  	return ret;
c752ce45b213de8 Will Deacon       2014-06-25  1540  }
c752ce45b213de8 Will Deacon       2014-06-25  1541  

:::::: The code at line 1537 was first introduced by commit
:::::: 518f7136244c167538f732691be589959310b295 iommu/arm-smmu: make use of generic LPAE allocator

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
