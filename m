Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C948374CB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 02:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733278712; cv=none; b=p8DcobtiY+KVfbH3TCyByjQERy446a34bI8jNMn7TgQYyJNKgskX9l+mjY9e//HWXiC+bAWXioRTuf6B6G7T3pprtnSM/R82MuRpvs45Nylo38E/a3dXM2qAlhE0iducRJ/cKdOulw5k6onyZbD0EDlvDL0BdD9IfA7sE2Le90c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733278712; c=relaxed/simple;
	bh=UTtlv7ZvEjhuXgdex2T1adcfU6i/YWbwUmM4IuWxPi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tvr67aqvXyqyGfo450Pqgaq6mZMDW7WTOcIWdfyLu1mMWpCc6pV0HPJMEI0kDa3XMTQZgbvaBit1XAnH+yfwkN9S40BLhL9QD7i9L1Ta/ZNJd4lF0rpLXCxoBx8CU/NRlHkyB0xP8z3+U/tbFRr5EV5KnwH3X+059/bO8n6Z6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADKgeYF7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADKgeYF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733278711; x=1764814711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTtlv7ZvEjhuXgdex2T1adcfU6i/YWbwUmM4IuWxPi8=;
  b=ADKgeYF7F2x4j+b2FDkvKQ0x/bEYfDy5ugUQ3hWu2i0kZwuOEWA1xWkT
   S1VrpTIxg3cbVt25ED43bhn4gYrnvb99O7EkEozmRkoL/e5PFHlWPRMpu
   MGoe0SBdioS7CXQMimuvGYDA6WrbEsbnboewii/RUVRupclC2NRDZB2Au
   ymCcyD+dkGYcNO/OY03LXLoMjOZSEQJmjFuLx+gwMclYRfUupo+jnBbqE
   xdakH4xU/qNj0KRu+XwBsWaWvPwKsPzFC8R9bRSfMuSA2+u6CToNRD93Y
   zN2HBoAL/IASlMrgHzVGwPSj4oSXOamgPlz2CgcKs6GDNBZxWABhEvAyv
   w==;
X-CSE-ConnectionGUID: ljZaoY8CQOGP+2AyejdoFA==
X-CSE-MsgGUID: bfuxz1RiQw2eIZtmhBTahw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33271953"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33271953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:18:31 -0800
X-CSE-ConnectionGUID: vkEI6+HzQNCD9wdZxQaJ+w==
X-CSE-MsgGUID: Sul2gdFoRvCnXTmJ93soTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98633970"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Dec 2024 18:18:26 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIey4-0000Su-2K;
	Wed, 04 Dec 2024 02:18:21 +0000
Date: Wed, 4 Dec 2024 10:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int (*)(struct
 iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)'
 {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned
 int,  long unsigned int,  int, ...
Message-ID: <202412041039.Pah9Xqi4-lkp@intel.com>
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
commit: 4f80a833819c98921d4b01c6a4ad2e8d98d2f8c3 [1/1] iommu: Add gfp parameter to iommu_ops::map
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041039.Pah9Xqi4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041039.Pah9Xqi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041039.Pah9Xqi4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1586 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1586:35: note: (near initialization for 'arm_smmu_ops.map')
   cc1: some warnings being treated as errors


vim +1586 drivers/iommu/arm-smmu.c

f3ebee80b3131d4 Eric Auger   2017-01-19  1580  
518f7136244c167 Will Deacon  2014-11-14  1581  static struct iommu_ops arm_smmu_ops = {
1fd0c775a573646 Joerg Roedel 2014-09-05  1582  	.capable		= arm_smmu_capable,
1d672638fca24db Joerg Roedel 2015-03-26  1583  	.domain_alloc		= arm_smmu_domain_alloc,
1d672638fca24db Joerg Roedel 2015-03-26  1584  	.domain_free		= arm_smmu_domain_free,
45ae7cff3684ab4 Will Deacon  2013-06-24  1585  	.attach_dev		= arm_smmu_attach_dev,
45ae7cff3684ab4 Will Deacon  2013-06-24 @1586  	.map			= arm_smmu_map,
45ae7cff3684ab4 Will Deacon  2013-06-24  1587  	.unmap			= arm_smmu_unmap,
44f6876a00e83df Robin Murphy 2018-09-20  1588  	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
32b124492bdf974 Robin Murphy 2017-09-28  1589  	.iotlb_sync		= arm_smmu_iotlb_sync,
45ae7cff3684ab4 Will Deacon  2013-06-24  1590  	.iova_to_phys		= arm_smmu_iova_to_phys,
45ae7cff3684ab4 Will Deacon  2013-06-24  1591  	.add_device		= arm_smmu_add_device,
45ae7cff3684ab4 Will Deacon  2013-06-24  1592  	.remove_device		= arm_smmu_remove_device,
af65993224c1cfd Joerg Roedel 2015-10-21  1593  	.device_group		= arm_smmu_device_group,
c752ce45b213de8 Will Deacon  2014-06-25  1594  	.domain_get_attr	= arm_smmu_domain_get_attr,
c752ce45b213de8 Will Deacon  2014-06-25  1595  	.domain_set_attr	= arm_smmu_domain_set_attr,
021bb8420d44cf5 Robin Murphy 2016-09-14  1596  	.of_xlate		= arm_smmu_of_xlate,
f3ebee80b3131d4 Eric Auger   2017-01-19  1597  	.get_resv_regions	= arm_smmu_get_resv_regions,
f3ebee80b3131d4 Eric Auger   2017-01-19  1598  	.put_resv_regions	= arm_smmu_put_resv_regions,
518f7136244c167 Will Deacon  2014-11-14  1599  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
45ae7cff3684ab4 Will Deacon  2013-06-24  1600  };
45ae7cff3684ab4 Will Deacon  2013-06-24  1601  

:::::: The code at line 1586 was first introduced by commit
:::::: 45ae7cff3684ab45f57fc13fc242c8546536a84e iommu/arm: Add support for ARM Ltd. System MMU architecture

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Joerg Roedel <joro@8bytes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
