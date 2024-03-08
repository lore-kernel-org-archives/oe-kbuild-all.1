Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D621224CC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 02:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709863237; cv=none; b=Ng0JpzkJYpdkn0YUG3+r0o810DSgXZPET4pw62zBpvkb3osSBEGi8HE6oxDgIR96qhKBAdqGwJmnx5ilCAhZ5OaOLoJoBoHWhs3UVlPZ2w/Usvy+vmDYTbysOIzGosEQICWOaVQW1y4i8LZ9TA+GHHh40eJmcCsioPJgRRFVvKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709863237; c=relaxed/simple;
	bh=Z/kQqP14W45+1dbzce2Rg7LEgxTDnDikscK2TFckIrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uI+w0epB3LGhS2kNchx8jSxn1wfhhQg7KSXyaraBt9NlC+FYEzcNSdqEvtL77xGPOcoAZlLyvmsx93Tfjpa7aqXJf0MOuCRpimj9M7jKAr4MjRndZU0rcAVkx579MpizRHfkDo0ZoZ4k2kPcBV1snbWgno67vB+CG//GIXJ32fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3wQ8xTN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3wQ8xTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709863235; x=1741399235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/kQqP14W45+1dbzce2Rg7LEgxTDnDikscK2TFckIrE=;
  b=g3wQ8xTNM6Cp8yA58YRtRTgQnqV7kFA+yapyt5DLGb2hPTERj8XQ3fJZ
   yN+ZNEWQ5/oGzdkAzIpra0jKTDlk098VJd5x9jXBS+5zcLMZ363pGfZ+R
   vGuRbIyzSVGK+re3fN2fZHGz1VXR/n2Dqv99B4rD1zYMv8G6/0/hhpiNj
   wgVdppkhSkXoEjMexB6hSKg4+B0qTb+DG20O654+vSCMslwZprVvtJM21
   MwbwVqJuZvIrc+MPn56Be/Hh93GxLJ+77sujOZQze35m6DnN1hIaQe72E
   v50wqI1QWg0rcJlErKgddb2tggwZ9wP9Zt35DGniC/7CoIirsFq7bgTam
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4416076"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4416076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 18:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41291982"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2024 18:00:29 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riPX8-0005un-2s;
	Fri, 08 Mar 2024 02:00:26 +0000
Date: Fri, 8 Mar 2024 09:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/rockchip-iommu.c:1130:26: error: initialization of
 'void (*)(struct iommu_domain *, long unsigned int,  size_t)' {aka 'void
 (*)(struct iommu_domain *, long unsigned int,  long unsigned int)'} from
 incompatible pointer type 'void (*)(struct d...
Message-ID: <202403080959.bFCMsblt-lkp@intel.com>
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
commit: 2ba540b3e8ba5881d28dcd96874423009318eada iommu: Add iova and size as parameters in iotlb_sync_map
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240308/202403080959.bFCMsblt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080959.bFCMsblt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080959.bFCMsblt-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD e116ff64db9be38b70fd5b050f5900435d428547 builds fine.
      It only hurts bisectability.

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

^590eaf1fec755 Kaixu Xia 2021-03-16  1121  
^590eaf1fec755 Kaixu Xia 2021-03-16  1122  static const struct iommu_ops rk_iommu_ops = {
^590eaf1fec755 Kaixu Xia 2021-03-16  1123  	.domain_alloc = rk_iommu_domain_alloc,
^590eaf1fec755 Kaixu Xia 2021-03-16  1124  	.domain_free = rk_iommu_domain_free,
^590eaf1fec755 Kaixu Xia 2021-03-16  1125  	.attach_dev = rk_iommu_attach_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  1126  	.detach_dev = rk_iommu_detach_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  1127  	.map = rk_iommu_map,
^590eaf1fec755 Kaixu Xia 2021-03-16  1128  	.unmap = rk_iommu_unmap,
^590eaf1fec755 Kaixu Xia 2021-03-16  1129  	.add_device = rk_iommu_add_device,
^590eaf1fec755 Kaixu Xia 2021-03-16 @1130  	.remove_device = rk_iommu_remove_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  1131  	.iova_to_phys = rk_iommu_iova_to_phys,
^590eaf1fec755 Kaixu Xia 2021-03-16  1132  	.device_group = rk_iommu_device_group,
^590eaf1fec755 Kaixu Xia 2021-03-16  1133  	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
^590eaf1fec755 Kaixu Xia 2021-03-16  1134  	.of_xlate = rk_iommu_of_xlate,
^590eaf1fec755 Kaixu Xia 2021-03-16  1135  };
^590eaf1fec755 Kaixu Xia 2021-03-16  1136  

:::::: The code at line 1130 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
