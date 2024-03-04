Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0E7BAEE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709591313; cv=none; b=WN21fQTDSeWoR4gGGlcYfsX991I5ual5f1ShYCVIHKKJpXHsE647QTiNTYdDVu2+l6AmMuhiBxJJyLfu64m1/VvsSQLhf66mtY4lTuNP5asBmeOeho4Y/pPikNHHsjdMY8QgVIzeXDGmKCxuVkQzXe0R2fIxkjQyIED7LpsMsxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709591313; c=relaxed/simple;
	bh=UpBU+3PO2lbZs9yV/DCEZwMC6o13ykkfQGnNnqLSScM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XblNNb107tlzb2C6iTmrsDjy6kOD2gYqXn+/IEFkqdPQQ8BcA2DTbQIsaMXhABLt18TIlNcYmSz1VCDPbH6QEpIdQFESIrF77MIs1RXhQtCCSTMCP9zT2/CWClZHzovVSfiS4CX2VWWz1AnEFDT6XYOIv7FUMaEHhZC8KHh+sJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBRC5f0f; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBRC5f0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709591311; x=1741127311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UpBU+3PO2lbZs9yV/DCEZwMC6o13ykkfQGnNnqLSScM=;
  b=XBRC5f0fDUlEORZCLHYGIKpSCLh1eloIr7b8okD9Uaowi0xENiOhbCgr
   Op9UU3WtOm1jQKsB/sQKHr50L+fQt0OZdGNeTOidQVpGaALmaGl78lzoz
   0Yal6K4LY+jeF5v0gMc3h910FEXX52C6IvRaW+p5nSEk4P+d626q7d6Wi
   E5lBLOcQn8agXibLqNehhOqi/IMN9Avw7NaYb2P/9zXNjYLKggxWnvFU8
   xWJI6MBGoRai3JVHhcIjuMk6D10ygvvGAeoK3DIumfrjA0njlhC2Oc7mf
   ViNO40dIYBMVj+48L8NfUIuySTnBDNxeUz9ugxTYxOInwhScxvv7fVGsf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15541993"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15541993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 14:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9091595"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 14:28:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhGnF-0002o5-2h;
	Mon, 04 Mar 2024 22:28:21 +0000
Date: Tue, 5 Mar 2024 06:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int
 (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,
  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long
 unsigned int,  long unsigned int,  int, ...
Message-ID: <202403050636.mKjE73eX-lkp@intel.com>
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
commit: 3782131146b279b467c5ac17a277182be2ef295e iommu: Add gfp parameter to iommu_ops::map
date:   9 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050636.mKjE73eX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050636.mKjE73eX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050636.mKjE73eX-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD e116ff64db9be38b70fd5b050f5900435d428547 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/iommu/arm-smmu.c:1586:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1586 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1586:35: note: (near initialization for 'arm_smmu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/arm-smmu-v3.c:2819:35: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    2819 |         .map                    = arm_smmu_map,
         |                                   ^~~~~~~~~~~~
   drivers/iommu/arm-smmu-v3.c:2819:35: note: (near initialization for 'arm_smmu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1127 |         .map = rk_iommu_map,
         |                ^~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1127:16: note: (near initialization for 'rk_iommu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/tegra-smmu.c:896:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     896 |         .map = tegra_smmu_map,
         |                ^~~~~~~~~~~~~~
   drivers/iommu/tegra-smmu.c:896:16: note: (near initialization for 'tegra_smmu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/qcom_iommu.c:607:27: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     607 |         .map            = qcom_iommu_map,
         |                           ^~~~~~~~~~~~~~
   drivers/iommu/qcom_iommu.c:607:27: note: (near initialization for 'qcom_iommu_ops.map')
   cc1: some warnings being treated as errors


vim +1586 drivers/iommu/arm-smmu.c

^590eaf1fec755 Kaixu Xia 2021-03-16  1580  
^590eaf1fec755 Kaixu Xia 2021-03-16  1581  static struct iommu_ops arm_smmu_ops = {
^590eaf1fec755 Kaixu Xia 2021-03-16  1582  	.capable		= arm_smmu_capable,
^590eaf1fec755 Kaixu Xia 2021-03-16  1583  	.domain_alloc		= arm_smmu_domain_alloc,
^590eaf1fec755 Kaixu Xia 2021-03-16  1584  	.domain_free		= arm_smmu_domain_free,
^590eaf1fec755 Kaixu Xia 2021-03-16  1585  	.attach_dev		= arm_smmu_attach_dev,
^590eaf1fec755 Kaixu Xia 2021-03-16 @1586  	.map			= arm_smmu_map,
^590eaf1fec755 Kaixu Xia 2021-03-16  1587  	.unmap			= arm_smmu_unmap,
^590eaf1fec755 Kaixu Xia 2021-03-16  1588  	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
^590eaf1fec755 Kaixu Xia 2021-03-16  1589  	.iotlb_sync		= arm_smmu_iotlb_sync,
^590eaf1fec755 Kaixu Xia 2021-03-16  1590  	.iova_to_phys		= arm_smmu_iova_to_phys,
^590eaf1fec755 Kaixu Xia 2021-03-16  1591  	.add_device		= arm_smmu_add_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  1592  	.remove_device		= arm_smmu_remove_device,
^590eaf1fec755 Kaixu Xia 2021-03-16  1593  	.device_group		= arm_smmu_device_group,
^590eaf1fec755 Kaixu Xia 2021-03-16  1594  	.domain_get_attr	= arm_smmu_domain_get_attr,
^590eaf1fec755 Kaixu Xia 2021-03-16  1595  	.domain_set_attr	= arm_smmu_domain_set_attr,
^590eaf1fec755 Kaixu Xia 2021-03-16  1596  	.of_xlate		= arm_smmu_of_xlate,
^590eaf1fec755 Kaixu Xia 2021-03-16  1597  	.get_resv_regions	= arm_smmu_get_resv_regions,
^590eaf1fec755 Kaixu Xia 2021-03-16  1598  	.put_resv_regions	= arm_smmu_put_resv_regions,
^590eaf1fec755 Kaixu Xia 2021-03-16  1599  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
^590eaf1fec755 Kaixu Xia 2021-03-16  1600  };
^590eaf1fec755 Kaixu Xia 2021-03-16  1601  

:::::: The code at line 1586 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
