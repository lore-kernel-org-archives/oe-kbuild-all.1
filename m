Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E89101DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214410; cv=none; b=scM8+wjRMd73OFbzlu06gwGec941H38OMT5jSmc8/JDZERN+7iBS6PltkRilh7TXX/+yAQnX6xkUfUhaz0HNGzeq8mXA4F+hSitImYb/EXkQKdS3hqcU5jJWEpVI8+AQTjTGG/hDhGIeZCiwxZBfX+eJPg5TQqQmiXrGoJWqa9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214410; c=relaxed/simple;
	bh=7iYAnFozwSFe7quanQe2a1xe6fUyVnmrRMMxYygEris=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbfbeDBW29zyZbjDqM7X4yec3jM9NQpcQcvTkl+O6eha326PTltZdklqoGKRQvDy6PWVjggg+vmLBkk2622XFzMVcvEFEnUVmX1CUrMkdKom8bw553xLEkmc4Tj1m1uMn5YRChVHR/o1HZ0PCFeg69KaLEGGD8THj8XvA+2cR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbXu53pl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbXu53pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716214409; x=1747750409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iYAnFozwSFe7quanQe2a1xe6fUyVnmrRMMxYygEris=;
  b=LbXu53plXVAsCzyoLhfnXzmJNZj5ooa2rMYpqtZGYH9zr9fIqGogDnjH
   2bXjizjbwDoVasDn9p+sGLGwfogXxu6ih8hARwGQ9dbHe5BmnwoafG0Bb
   konYzHbAtr/O9tfaKE2cfCi38ODASAk4ecGC8mpeMM8A8Qfsxcur3qZQD
   nGA03x2zqzj2CHfr73svvtNJRMvE8YYtgro2AhLeR80FDiRCdrlROT9Ol
   nz9FQq77ZcGMu3l5P/2+aytXTgXAnHv/Jok3HaByL6fjBhGFOehOjGVzk
   zVCiGpu4ceo0ldtQUK95uZzb4dPdvawgOUHFczeorf+yBQrE2+eAV+6HW
   Q==;
X-CSE-ConnectionGUID: 62b+BWTPQxyfkKnuR2k4ww==
X-CSE-MsgGUID: SDQ2wa7CRCChmIIBkWH2Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12519655"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12519655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 07:13:29 -0700
X-CSE-ConnectionGUID: kBYmsQnHTRaBvXnvAlBCaA==
X-CSE-MsgGUID: 3tJu8uWeQiW97wacOL3/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32415930"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 07:13:27 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s93lU-0004t8-2G;
	Mon, 20 May 2024 14:13:24 +0000
Date: Mon, 20 May 2024 22:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9620/9669]
 arch/x86/kernel/zhaoxin_kh40000.c:348:11: error: no member named 'dma_ops'
 in 'struct device'
Message-ID: <202405202228.Trf7bvHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: ef20808db09987137fba30519fb94a6b12b63ee7 [9620/9669] Add kh40000_iommu_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-001-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202228.Trf7bvHA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405202228.Trf7bvHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202228.Trf7bvHA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c:47:30: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
      47 |         if (ZHAOXIN_P2CW_NODE_CHECK | zhaoxin_patch_code)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/zhaoxin_kh40000.c:87:33: error: call to undeclared function 'iommu_get_dma_domain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                               ^
   arch/x86/kernel/zhaoxin_kh40000.c:87:33: note: did you mean 'iommu_is_dma_domain'?
   include/linux/iommu.h:273:20: note: 'iommu_is_dma_domain' declared here
     273 | static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
         |                    ^
   arch/x86/kernel/zhaoxin_kh40000.c:87:24: error: incompatible integer to pointer conversion initializing 'struct iommu_domain *' with an expression of type 'int' [-Wint-conversion]
      87 |                 struct iommu_domain *domain = iommu_get_dma_domain(dev);
         |                                      ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/zhaoxin_kh40000.c:348:11: error: no member named 'dma_ops' in 'struct device'
     348 |         if (dev->dma_ops) {
         |             ~~~  ^
   arch/x86/kernel/zhaoxin_kh40000.c:349:24: error: no member named 'dma_ops' in 'struct device'
     349 |                 iommu_dma_ops = dev->dma_ops;
         |                                 ~~~  ^
   1 warning and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CRC32C_INTEL
   Depends on [n]: CRYPTO [=y] && !KMSAN [=y] && X86 [=y]
   Selected by [y]:
   - ISCSI_TARGET [=y] && TARGET_CORE [=y] && INET [=y] && X86 [=y]


vim +348 arch/x86/kernel/zhaoxin_kh40000.c

   345	
   346	void kh40000_set_iommu_dma_ops(struct device *dev)
   347	{
 > 348		if (dev->dma_ops) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
