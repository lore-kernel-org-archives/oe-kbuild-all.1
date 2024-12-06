Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68B148832
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733497052; cv=none; b=EhnvajeWxnot6f5KPzEah4mmk117jEP9ez5VCvP8yCGOvwHFLb8WJRZRHky9FTNJdsr25G+3PrgFjgDJ0ID+lc7ZN51eaiWKTTBWHOZKghz0UIKIACr6iRPUFmVeTn8/qFC+rDwHNpYwRPjGRw8oNYGGE+gVBDbJbG8H7oDDAuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733497052; c=relaxed/simple;
	bh=xOXEC9kKXUAg9lrI92TTmMd61ftleNLPQD/5yoH+hLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8H6G5ov4kQN94bvTumAPymSo3VXl8HX+YvnLEqeutxprQkq3XQoVxZ0vNl88GV3c3M6VFx9j8DEti+itTizzL9bnSKg53q1fWzHRYF0d7U7LVuZy8dpuQPD/29imkDwRW9BQJRafp0B9CrHAv0FvxWZv7i4EzRnZj6rxrVylL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrnUG6ou; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrnUG6ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733497049; x=1765033049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOXEC9kKXUAg9lrI92TTmMd61ftleNLPQD/5yoH+hLA=;
  b=nrnUG6ouXCsJ69ewu1s7owWCKbn59IpJh0RpOOzNY7rktVmxW1sCEnQp
   C7xEzsgSZRODPe7D/8ukfRF4FKWlp0qfwDh2nFwRybjPSBD+xVY8f6DUw
   8J75ip5TVJBkZoz9XoQjDWjNzAZ3Q1qC3U1vK70jWW/HCc8/gO8k6f++O
   1hFDqEGNCmpzoAsqgWV/px5BmoY2SCz8oaooQpCWV1bbHl+tdUQoOscgZ
   oJ0mSFLQdfwFyO3ZUeV/AJPEF4/q2567+Srah6qoFehYKwSjqpfMksZ6h
   Em7lzlVwcu9X31iWUvALq/r3/OG/ZSd45bHZmKUab+Hw6O4Xtn74Gtay1
   Q==;
X-CSE-ConnectionGUID: D1h/5XcRTM+pVwscMEkmiw==
X-CSE-MsgGUID: vIGPrVZCTIOgKdbyX2rcXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="37636526"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37636526"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 06:57:29 -0800
X-CSE-ConnectionGUID: A+JE3yggRlqORclnA7e+Kg==
X-CSE-MsgGUID: wXFxuZwGSr+nhw3BP184ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="98490829"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Dec 2024 06:57:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJZli-0001Tq-1M;
	Fri, 06 Dec 2024 14:57:22 +0000
Date: Fri, 6 Dec 2024 22:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/iommu/qcom_iommu.c:607:27: error: initialization of 'int (*)(struct
 iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)'
 {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned
 int,  long unsigned int,  int,...
Message-ID: <202412062207.5We5PNVr-lkp@intel.com>
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
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241206/202412062207.5We5PNVr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062207.5We5PNVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062207.5We5PNVr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/qcom_iommu.c:607:27: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     607 |         .map            = qcom_iommu_map,
         |                           ^~~~~~~~~~~~~~
   drivers/iommu/qcom_iommu.c:607:27: note: (near initialization for 'qcom_iommu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/mtk_iommu.c:578:27: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     578 |         .map            = mtk_iommu_map,
         |                           ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu.c:578:27: note: (near initialization for 'mtk_iommu_ops.map')
   cc1: some warnings being treated as errors
--
>> drivers/iommu/exynos-iommu.c:1334:16: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
    1334 |         .map = exynos_iommu_map,
         |                ^~~~~~~~~~~~~~~~
   drivers/iommu/exynos-iommu.c:1334:16: note: (near initialization for 'exynos_iommu_ops.map')
   cc1: some warnings being treated as errors


vim +607 drivers/iommu/qcom_iommu.c

0ae349a0f33fb04 Rob Clark    2017-08-09  600  
0ae349a0f33fb04 Rob Clark    2017-08-09  601  static const struct iommu_ops qcom_iommu_ops = {
0ae349a0f33fb04 Rob Clark    2017-08-09  602  	.capable	= qcom_iommu_capable,
0ae349a0f33fb04 Rob Clark    2017-08-09  603  	.domain_alloc	= qcom_iommu_domain_alloc,
0ae349a0f33fb04 Rob Clark    2017-08-09  604  	.domain_free	= qcom_iommu_domain_free,
0ae349a0f33fb04 Rob Clark    2017-08-09  605  	.attach_dev	= qcom_iommu_attach_dev,
0ae349a0f33fb04 Rob Clark    2017-08-09  606  	.detach_dev	= qcom_iommu_detach_dev,
0ae349a0f33fb04 Rob Clark    2017-08-09 @607  	.map		= qcom_iommu_map,
0ae349a0f33fb04 Rob Clark    2017-08-09  608  	.unmap		= qcom_iommu_unmap,
56f8af5e9d38f12 Will Deacon  2019-07-02  609  	.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
4d689b619445894 Robin Murphy 2017-09-28  610  	.iotlb_sync	= qcom_iommu_iotlb_sync,
0ae349a0f33fb04 Rob Clark    2017-08-09  611  	.iova_to_phys	= qcom_iommu_iova_to_phys,
0ae349a0f33fb04 Rob Clark    2017-08-09  612  	.add_device	= qcom_iommu_add_device,
0ae349a0f33fb04 Rob Clark    2017-08-09  613  	.remove_device	= qcom_iommu_remove_device,
0ae349a0f33fb04 Rob Clark    2017-08-09  614  	.device_group	= generic_device_group,
0ae349a0f33fb04 Rob Clark    2017-08-09  615  	.of_xlate	= qcom_iommu_of_xlate,
0ae349a0f33fb04 Rob Clark    2017-08-09  616  	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
0ae349a0f33fb04 Rob Clark    2017-08-09  617  };
0ae349a0f33fb04 Rob Clark    2017-08-09  618  

:::::: The code at line 607 was first introduced by commit
:::::: 0ae349a0f33fb040a2bc228fdc6d60111455feab iommu/qcom: Add qcom_iommu

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
