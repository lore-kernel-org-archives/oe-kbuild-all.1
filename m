Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC2B18870B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727386428; cv=none; b=qeKMPR/LdxTmlxuoxJIUowMr4k1m3PKRJPjTZIM8kURE25qIp6RXQr2L9dUtO3ZoX2Zs1nPyIfJaX2m76IoRUrApjzrODrj8oSoO9aN/X741PBxPPLjDGuiyZ6cfJmM74qQFA0/uEwPEcFKpW7crmA17pBV4ASuSoEk8+59Pnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727386428; c=relaxed/simple;
	bh=EZajsvn+YlvNNVkWauCWKTZYxLpRZoSbzX0f3/jaINg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXjA8HQUNhz1428WPKf3E7QmRfqJQvJU5eu70RX9z+nrtTHYIvNpx571Wh4MtD6V9tVzdypTL6gs/ercFZZ+NkoixgEqeTy6E7jhucxHAuTg+B8bCgtLN6/LuIPmwHnr1934v0i7M9unRgCzpeBIUQzxmbyO0RUTKuIkNDWKJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0MLBZDN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0MLBZDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727386427; x=1758922427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZajsvn+YlvNNVkWauCWKTZYxLpRZoSbzX0f3/jaINg=;
  b=n0MLBZDNzCg104+eUKAx9RzN+yeiwIlGoJDcmdqsoN87ApT9rg8U1vWj
   t1b8BtYNgdQOJz8fd25vL56aAF9LHJG4CLa+wogRInkRaEgCtTrdburxy
   gVGIvTW03kZk4nOwphnVqePIlggtJgutgXf2HoxfU0ePQyeFRbp6ol6Ha
   uh9lZQ62iONBlCoUV2QEWB5yTTOHxtypkGaoE0Xhsgn2wGibR38vPtkCS
   DfSUibB3sQV0baDDGCY46/W5H0bT4xyXOfv4jHUJ4X1NDCvSYIldcebLI
   29vYm2JlVqtHxZm5YQebSywoZNn2L2xXLdGFN0pshdbssYXS6ULDEMpsm
   Q==;
X-CSE-ConnectionGUID: UkwliHHDTA2Zz0KwMYvCag==
X-CSE-MsgGUID: /1GF6LqVR9yYGLXZdEghPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26386666"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26386666"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 14:33:45 -0700
X-CSE-ConnectionGUID: 0splWfoJQkWsWrhLlMAWNg==
X-CSE-MsgGUID: JgZRdA+2STCo+K+kP4pE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="95648163"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 14:33:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stw7J-000LDV-0N;
	Thu, 26 Sep 2024 21:33:41 +0000
Date: Fri, 27 Sep 2024 05:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5206/30000]
 drivers/gpu/drm/radeon/radeon_vce.c:247:25: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202409270508.u8KdTEFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6be8d57e8dd89fb93f6a1801c246e70ae85fbfaf
commit: ec4ae62c07d56281aacec51770e0453414a76ded [5206/30000] sw64: gpu/drm: solve driver load cause kernel crash
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240927/202409270508.u8KdTEFv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409270508.u8KdTEFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270508.u8KdTEFv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/radeon/radeon_vce.c:247:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[addressable] cpu_addr @@
   drivers/gpu/drm/radeon/radeon_vce.c:247:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/radeon/radeon_vce.c:247:25: sparse:     got void *[addressable] cpu_addr
   drivers/gpu/drm/radeon/radeon_vce.c:368:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:368:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:368:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:369:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:369:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:369:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:370:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:370:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:370:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:372:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:372:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:372:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:373:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:373:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:373:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:374:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:374:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:374:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:375:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:375:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:375:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:376:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:376:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:376:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:377:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:377:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:377:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:378:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:378:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:378:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:379:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:379:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:379:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:380:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:380:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:380:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:381:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:381:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:381:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:382:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:382:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:382:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:383:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:383:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:383:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:385:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:385:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:385:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:386:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:386:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:386:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:387:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:387:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:387:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:388:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:388:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:388:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:389:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:389:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:389:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:392:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:392:27: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:392:27: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:435:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:435:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:435:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:436:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:436:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:436:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:437:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:437:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:437:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:439:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:439:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:439:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:440:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:440:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:440:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:441:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:441:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:441:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:442:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:442:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:442:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:443:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:443:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:443:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:445:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:445:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:445:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:446:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:446:32: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:446:32: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:449:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:449:27: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:449:27: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/radeon/radeon_vce.c:706:33: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] v @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/radeon/radeon_vce.c:706:33: sparse:     expected unsigned int [usertype] v

vim +247 drivers/gpu/drm/radeon/radeon_vce.c

   214	
   215	/**
   216	 * radeon_vce_resume - pin VCE fw memory
   217	 *
   218	 * @rdev: radeon_device pointer
   219	 *
   220	 */
   221	int radeon_vce_resume(struct radeon_device *rdev)
   222	{
   223		void *cpu_addr;
   224		int r;
   225	
   226		if (rdev->vce.vcpu_bo == NULL)
   227			return -EINVAL;
   228	
   229		r = radeon_bo_reserve(rdev->vce.vcpu_bo, false);
   230		if (r) {
   231			dev_err(rdev->dev, "(%d) failed to reserve VCE bo\n", r);
   232			return r;
   233		}
   234	
   235		r = radeon_bo_kmap(rdev->vce.vcpu_bo, &cpu_addr);
   236		if (r) {
   237			radeon_bo_unreserve(rdev->vce.vcpu_bo);
   238			dev_err(rdev->dev, "(%d) VCE map failed\n", r);
   239			return r;
   240		}
   241	
   242		memset(cpu_addr, 0, radeon_bo_size(rdev->vce.vcpu_bo));
   243		if (rdev->family < CHIP_BONAIRE)
   244			r = vce_v1_0_load_fw(rdev, cpu_addr);
   245		else {
   246			if (IS_ENABLED(CONFIG_SW64))
 > 247				memcpy_toio(cpu_addr, rdev->vce_fw->data, rdev->vce_fw->size);
   248			else
   249				memcpy(cpu_addr, rdev->vce_fw->data, rdev->vce_fw->size);
   250		}
   251	
   252		radeon_bo_kunmap(rdev->vce.vcpu_bo);
   253	
   254		radeon_bo_unreserve(rdev->vce.vcpu_bo);
   255	
   256		return r;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
