Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551215E86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727119445; cv=none; b=MjEmjIMz53xkBHgFKn58m7XpB2+a5JVDGSyxhzvFauUlUDTFkYwfZJenEU0jEpwSNRDBCfaIniKGxQ8gHmxWR/096MEdnjNtGyhKRF2c+WHc0yvtG9wuYosq1DByLg5ZAIl5iVX/sJhba0PV10ZyRahrmD1jTTSDW4tRVoi+zT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727119445; c=relaxed/simple;
	bh=G4NDEUZGLonhNaN8aPQlXa7Hk08D1Q8LqYWiV4OKwmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ey58F850Z4Fanv83/edUrA7D7Vo5CWvMwOvp7j9/NOrzmfwmNNQOWgo8JxzUTyEaqHMkx819ReZWptcer/lyyZ8pxDC9I4e4RKbDOWYTUKRk1FgEWyvx+zkPyHBTNo3lrW1LRpzlqKwCEMVjrOOEuaVjMGcCnTE+OJw6rn6cuLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjSuJOVo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjSuJOVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727119443; x=1758655443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4NDEUZGLonhNaN8aPQlXa7Hk08D1Q8LqYWiV4OKwmE=;
  b=HjSuJOVoDinFccL93MliwndP7+/UzkFFg1fUwNhe91clKjR7z4lrdvRp
   sPi6QJSMJRddObU/iFsvAf5w7tGBiJForoDqhsL6n77RFTIunMl0IyIyu
   n58tYCFqRohJln/qE8f2Y98iTQyZvldJeKCLIKXn3YiCICYrComM/L98v
   jRFFx6yQXa43/5R58xM4W8Fp7BkQe1ML/6BsGqDfrzDPuB+HgLifhZj4u
   2mNdqKjvBKYhdKh5cvuC6tSPmn8Wpn35jJu7coR3ReiglTZ8sWWthdgbg
   UeIBYf8npJjsJi3LsmQVeF92r5Qbc9qS90fkF5HKFNgRRBQbZiZArKUrp
   Q==;
X-CSE-ConnectionGUID: zIONa2qASS6w6Z6by8qumQ==
X-CSE-MsgGUID: 1jQSxPKgRdyBs5OC4++fzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48614081"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="48614081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:23:46 -0700
X-CSE-ConnectionGUID: sNW67daiTfatQiVQE24VOg==
X-CSE-MsgGUID: xK6rvisiT0Wnao4FzDwzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="76095389"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 12:23:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssoep-000HX8-1H;
	Mon, 23 Sep 2024 19:23:39 +0000
Date: Tue, 24 Sep 2024 03:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 253/2441]
 drivers/iommu/rockchip-iommu.c:1129:10: error: 'const struct iommu_ops' has
 no member named 'add_device'
Message-ID: <202409240343.fsDOVU8g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 9c3888559fa80ba17dadeee3aa6c603fab6db09b [253/2441] iommu: Remove add_device()/remove_device() code-paths
config: arm64-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240343.fsDOVU8g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240343.fsDOVU8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240343.fsDOVU8g-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1127 |         .map = rk_iommu_map,
         |                ^~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1127:16: note: (near initialization for 'rk_iommu_ops.map')
>> drivers/iommu/rockchip-iommu.c:1129:10: error: 'const struct iommu_ops' has no member named 'add_device'
    1129 |         .add_device = rk_iommu_add_device,
         |          ^~~~~~~~~~
>> drivers/iommu/rockchip-iommu.c:1129:23: error: initialization of 'void (*)(struct iommu_domain *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1129 |         .add_device = rk_iommu_add_device,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1129:23: note: (near initialization for 'rk_iommu_ops.flush_iotlb_all')
>> drivers/iommu/rockchip-iommu.c:1130:10: error: 'const struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1130 |         .remove_device = rk_iommu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
   drivers/iommu/rockchip-iommu.c:1130:26: error: initialization of 'void (*)(struct iommu_domain *)' from incompatible pointer type 'void (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1130 |         .remove_device = rk_iommu_remove_device,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1130:26: note: (near initialization for 'rk_iommu_ops.iotlb_sync_map')
   cc1: some warnings being treated as errors


vim +1129 drivers/iommu/rockchip-iommu.c

5fd577c3eac3bdb Jeffy Chen   2018-03-23  1121  
c68a292152d322b Daniel Kurtz 2014-11-03  1122  static const struct iommu_ops rk_iommu_ops = {
bcd516a32416aad Joerg Roedel 2015-03-26  1123  	.domain_alloc = rk_iommu_domain_alloc,
bcd516a32416aad Joerg Roedel 2015-03-26  1124  	.domain_free = rk_iommu_domain_free,
c68a292152d322b Daniel Kurtz 2014-11-03  1125  	.attach_dev = rk_iommu_attach_device,
c68a292152d322b Daniel Kurtz 2014-11-03  1126  	.detach_dev = rk_iommu_detach_device,
c68a292152d322b Daniel Kurtz 2014-11-03  1127  	.map = rk_iommu_map,
c68a292152d322b Daniel Kurtz 2014-11-03  1128  	.unmap = rk_iommu_unmap,
c68a292152d322b Daniel Kurtz 2014-11-03 @1129  	.add_device = rk_iommu_add_device,
c68a292152d322b Daniel Kurtz 2014-11-03 @1130  	.remove_device = rk_iommu_remove_device,
c68a292152d322b Daniel Kurtz 2014-11-03  1131  	.iova_to_phys = rk_iommu_iova_to_phys,
57c26957bd87a9f Jeffy Chen   2018-03-23  1132  	.device_group = rk_iommu_device_group,
c68a292152d322b Daniel Kurtz 2014-11-03  1133  	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
5fd577c3eac3bdb Jeffy Chen   2018-03-23  1134  	.of_xlate = rk_iommu_of_xlate,
c68a292152d322b Daniel Kurtz 2014-11-03  1135  };
c68a292152d322b Daniel Kurtz 2014-11-03  1136  

:::::: The code at line 1129 was first introduced by commit
:::::: c68a292152d322b2d03f88d7f1d91d6bfa9d22bc iommu/rockchip: rk3288 iommu driver

:::::: TO: Daniel Kurtz <djkurtz@chromium.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
