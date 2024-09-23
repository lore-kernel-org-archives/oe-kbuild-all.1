Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5F719E810
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727107116; cv=none; b=atIvb+WHUQeIg+QSjrp0detq0ytOygcLyMFT9flKGG9l8/owGDKknysZPEo1HKnpecck6/RQkLY437ra41Euo8nMgumCf+YF8st89d35fWQYNSgmGCyZDS55U5fsIB53yJVDmH4Uh8mc4k8qF49QA9YiUDyLXb/sbwg/h/RwC2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727107116; c=relaxed/simple;
	bh=umvRGmcpyBFuLQ8mOwRxOsXhBi130bvgUTOl2wGsnNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GnZD5KPBovTGrxOFnrdPyjSaoIlCr0MlS3ipCAg7gG7oMWrDplGBgVPX5PpGeL6OrGt1rTEGWpZ/O4OLYBc0arM2FlxXtGvWEATIVhjkTbLp652NtdRUxUPSL3+Fk4Z2A0qEyAey0WyhBFl4tkc1bQEwQuIqO+k7eAxxo9Z0VLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrvO2DXV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrvO2DXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727107115; x=1758643115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=umvRGmcpyBFuLQ8mOwRxOsXhBi130bvgUTOl2wGsnNA=;
  b=BrvO2DXVvZxJIk7CY9lCz2N3NcZV8e3cOvA9t0qR9oQSgxH/2SsYq6gR
   PCiXl/5iC/kADg/vL38SoTORXtvmyupJoZUJlnyFcoiXn4qJkHXrQfVPV
   RjuKqwVQ3FwW5czErxQU9V3r9lg5KmwvKvqomGK5E41/XrC7iDx/hFiIq
   kuWHhs7t/vbFP6Dxgz/0f1pFremsoJ5MDzKEJQPfpTH1XHgRHYxphnNXf
   kwcjkFbIPX33tQA+hsK3MQ4DOFSAbSLwNFi75fq3M61QJDZ6FSxpQmytZ
   P5EeWH1lwJByt/s5OtxPB4pAnUaUZXqbENOAWVMRFQgp0P45sxLDMGCoe
   g==;
X-CSE-ConnectionGUID: d/7JB1RUR+mHtdylOUNBDQ==
X-CSE-MsgGUID: 98/MhgRARMO581GbEyL5AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25930827"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="25930827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 08:58:34 -0700
X-CSE-ConnectionGUID: PA4f+zFYS7uS1K9207QQcg==
X-CSE-MsgGUID: EXS2DmSMTqSd/8jcccvEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="76040926"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 08:58:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sslSG-000HLM-12;
	Mon, 23 Sep 2024 15:58:28 +0000
Date: Mon, 23 Sep 2024 23:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 176/2441]
 drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int
 (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,
  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long
 unsigned int,  long unsigned int, ...
Message-ID: <202409232300.SzKgh6Mr-lkp@intel.com>
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
commit: 4f80a833819c98921d4b01c6a4ad2e8d98d2f8c3 [176/2441] iommu: Add gfp parameter to iommu_ops::map
config: arm64-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20240923/202409232300.SzKgh6Mr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409232300.SzKgh6Mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409232300.SzKgh6Mr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/rockchip-iommu.c:1127:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1127 |         .map = rk_iommu_map,
         |                ^~~~~~~~~~~~
   drivers/iommu/rockchip-iommu.c:1127:16: note: (near initialization for 'rk_iommu_ops.map')
   cc1: some warnings being treated as errors


vim +1127 drivers/iommu/rockchip-iommu.c

5fd577c3eac3bd Jeffy Chen   2018-03-23  1121  
c68a292152d322 Daniel Kurtz 2014-11-03  1122  static const struct iommu_ops rk_iommu_ops = {
bcd516a32416aa Joerg Roedel 2015-03-26  1123  	.domain_alloc = rk_iommu_domain_alloc,
bcd516a32416aa Joerg Roedel 2015-03-26  1124  	.domain_free = rk_iommu_domain_free,
c68a292152d322 Daniel Kurtz 2014-11-03  1125  	.attach_dev = rk_iommu_attach_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1126  	.detach_dev = rk_iommu_detach_device,
c68a292152d322 Daniel Kurtz 2014-11-03 @1127  	.map = rk_iommu_map,
c68a292152d322 Daniel Kurtz 2014-11-03  1128  	.unmap = rk_iommu_unmap,
c68a292152d322 Daniel Kurtz 2014-11-03  1129  	.add_device = rk_iommu_add_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1130  	.remove_device = rk_iommu_remove_device,
c68a292152d322 Daniel Kurtz 2014-11-03  1131  	.iova_to_phys = rk_iommu_iova_to_phys,
57c26957bd87a9 Jeffy Chen   2018-03-23  1132  	.device_group = rk_iommu_device_group,
c68a292152d322 Daniel Kurtz 2014-11-03  1133  	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
5fd577c3eac3bd Jeffy Chen   2018-03-23  1134  	.of_xlate = rk_iommu_of_xlate,
c68a292152d322 Daniel Kurtz 2014-11-03  1135  };
c68a292152d322 Daniel Kurtz 2014-11-03  1136  

:::::: The code at line 1127 was first introduced by commit
:::::: c68a292152d322b2d03f88d7f1d91d6bfa9d22bc iommu/rockchip: rk3288 iommu driver

:::::: TO: Daniel Kurtz <djkurtz@chromium.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
