Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF521552ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727169496; cv=none; b=uJcFJl+gRLue31vUkScxcDXgY+rwymSTzJdYpWnG0Y7k59qgrTyOE/90+9KOS/avxFz5j2vDAWq87PZOby8wW0aW5fhnBL6BG1VxUdBzBk/3h96Av17CGgI86ES70IAuvfPwDwF3ohPIWMXIpthr0GlYlQ+p/GjHU/OjKo/L0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727169496; c=relaxed/simple;
	bh=DZ2Vs2C7kZM0sNVrWAZC1sp+pKvlCH8WDwcHWxJuGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hJKzRHNH5ipldV6DRUGW5BNHtOhXCcX1HgLfkdEhIT3SJKGCp2ujlzS1hHEOuxT9rFJea3dqh25Crx2JK4krf5LSInFnSudC18SdMQECrnTJS0yr/t2/0xhTRMlWVxdeikQdkmMsd/JoJ1ydLDtW1Xf+VUfW4IMm32CUNkvuiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI7Y1pHe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI7Y1pHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727169494; x=1758705494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZ2Vs2C7kZM0sNVrWAZC1sp+pKvlCH8WDwcHWxJuGCA=;
  b=nI7Y1pHeH5tpLNQSp7TZ9QCbO+L3URcsEsnOceQ+qMBhmIoC2xA87rPU
   uan/q3TasKwX+tI7W1uAEF8CvrHdyix8JNp7TM2L57xSV7ebHrvMns4v/
   3LhwOtUrWxhSYeplE8l3IFV8ZRgCJ3zTRbQumsBEX/kbhRyQMNRuuN+CG
   w5FkeJ8bPnC/mBjEzXsxqqTBV05PBv1dDRn8ekVxdCJWr1o02w+3u8ETu
   NG3lHfl/qviDNl6IBDDCF0wZtbwRBrGjLa6GGq7e2cuI5TPm3JeLGf9Cc
   Kds00tf44enuVg7axqZonmEl3U4AAav4EQz05bCo99MqAf+iBITBZBP5M
   w==;
X-CSE-ConnectionGUID: 2jAILZxpTraIPsQwMsRqlQ==
X-CSE-MsgGUID: XLbxam1ITI66hkuQBVk1tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29864680"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="29864680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 02:18:13 -0700
X-CSE-ConnectionGUID: iCJhZahuRr2F/7e2X6MhLA==
X-CSE-MsgGUID: Swnc13amQKW63Ic5kvoR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="75751195"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2024 02:18:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1gO-000IAT-0D;
	Tue, 24 Sep 2024 09:18:08 +0000
Date: Tue, 24 Sep 2024 17:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 418/2441]
 drivers/iommu/rockchip-iommu.c:1130:26: error: initialization of 'void
 (*)(struct iommu_domain *, long unsigned int,  size_t)' {aka 'void
 (*)(struct iommu_domain *, long unsigned int,  long unsigned int)'} from
 incompatible pointer type 'void (*)(struct d...
Message-ID: <202409241712.xRCQbtX7-lkp@intel.com>
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
commit: e77773d980f8653df98a7ae0afaca1a0bf893ffc [418/2441] iommu: Add iova and size as parameters in iotlb_sync_map
config: arm64-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20240924/202409241712.xRCQbtX7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241712.xRCQbtX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241712.xRCQbtX7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/rockchip-iommu.c: In function 'rk_iommu_add_device':
   drivers/iommu/rockchip-iommu.c:1069:17: error: implicit declaration of function 'iommu_group_get_for_dev'; did you mean 'iommu_group_get_by_id'? [-Werror=implicit-function-declaration]
    1069 |         group = iommu_group_get_for_dev(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 iommu_group_get_by_id
   drivers/iommu/rockchip-iommu.c:1069:15: warning: assignment to 'struct iommu_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1069 |         group = iommu_group_get_for_dev(dev);
         |               ^
   drivers/iommu/rockchip-iommu.c: At top level:
   drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1127 |         .map = rk_iommu_map,
         |                ^~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1127:16: note: (near initialization for 'rk_iommu_ops.map')
   drivers/iommu/rockchip-iommu.c:1129:10: error: 'const struct iommu_ops' has no member named 'add_device'
    1129 |         .add_device = rk_iommu_add_device,
         |          ^~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1129:23: error: initialization of 'void (*)(struct iommu_domain *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1129 |         .add_device = rk_iommu_add_device,
         |                       ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1129:23: note: (near initialization for 'rk_iommu_ops.flush_iotlb_all')
   drivers/iommu/rockchip-iommu.c:1130:10: error: 'const struct iommu_ops' has no member named 'remove_device'; did you mean 'probe_device'?
    1130 |         .remove_device = rk_iommu_remove_device,
         |          ^~~~~~~~~~~~~
         |          probe_device
>> drivers/iommu/rockchip-iommu.c:1130:26: error: initialization of 'void (*)(struct iommu_domain *, long unsigned int,  size_t)' {aka 'void (*)(struct iommu_domain *, long unsigned int,  long unsigned int)'} from incompatible pointer type 'void (*)(struct device *)' [-Werror=incompatible-pointer-types]
    1130 |         .remove_device = rk_iommu_remove_device,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1130:26: note: (near initialization for 'rk_iommu_ops.iotlb_sync_map')
   cc1: some warnings being treated as errors


vim +1130 drivers/iommu/rockchip-iommu.c

5fd577c3eac3bd Jeffy Chen   2018-03-23  1121  
c68a292152d322 Daniel Kurtz 2014-11-03  1122  static const struct iommu_ops rk_iommu_ops = {
bcd516a32416aa Joerg Roedel 2015-03-26  1123  	.domain_alloc = rk_iommu_domain_alloc,
bcd516a32416aa Joerg Roedel 2015-03-26  1124  	.domain_free = rk_iommu_domain_free,
c68a292152d322 Daniel Kurtz 2014-11-03  1125  	.attach_dev = rk_iommu_attach_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1126  	.detach_dev = rk_iommu_detach_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1127  	.map = rk_iommu_map,
c68a292152d322 Daniel Kurtz 2014-11-03  1128  	.unmap = rk_iommu_unmap,
c68a292152d322 Daniel Kurtz 2014-11-03  1129  	.add_device = rk_iommu_add_device,
c68a292152d322 Daniel Kurtz 2014-11-03 @1130  	.remove_device = rk_iommu_remove_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1131  	.iova_to_phys = rk_iommu_iova_to_phys,
57c26957bd87a9 Jeffy Chen   2018-03-23  1132  	.device_group = rk_iommu_device_group,
c68a292152d322 Daniel Kurtz 2014-11-03  1133  	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
5fd577c3eac3bd Jeffy Chen   2018-03-23  1134  	.of_xlate = rk_iommu_of_xlate,
c68a292152d322 Daniel Kurtz 2014-11-03  1135  };
c68a292152d322 Daniel Kurtz 2014-11-03  1136  

:::::: The code at line 1130 was first introduced by commit
:::::: c68a292152d322b2d03f88d7f1d91d6bfa9d22bc iommu/rockchip: rk3288 iommu driver

:::::: TO: Daniel Kurtz <djkurtz@chromium.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
