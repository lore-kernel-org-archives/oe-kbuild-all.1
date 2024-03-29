Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1583EA62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711700445; cv=none; b=OsOh5rLIltgVyvxHd3Aj4PBX9fwjLtZOni8uxRfZ8P+mMVGiWJGZGRsk0E/uT0mIARs5LvdzVYA0SpaCgwqVKM2d0U4iI0nzRaDV2+fHhAR9aJD3M0uH2ZIX6s8QqZ7eR5G4RO+P0GHtyXfG2cdl3qMi4P75jPM8f+KuWA8Djpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711700445; c=relaxed/simple;
	bh=Vb2OmlVbcMt+DDTAxQ8y5Dya5oMZx3U1uTNuJ2c9EoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfDarCyFDsPQTq1MCGYioD2hptFae9/frlti7ivaSb1qgxCIR4fWlWigDmPZLlLLAYc20HKyXiect1RaADpTLqPh/5Rh8jki1NVWtnBAHS4WbilVDcnV4VKgGzxIMDixKblpaoLOVF6lqX8FeshPuKARv0Z2iVVPUNZYwyHLnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnYECtMd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnYECtMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711700443; x=1743236443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vb2OmlVbcMt+DDTAxQ8y5Dya5oMZx3U1uTNuJ2c9EoU=;
  b=KnYECtMdys2yNY/gIpRmGfw6h++DILM8m9GY/4rR1+WktSosFTjCT8y5
   G77jY/whxQ8XxmU96gZONBT9NcF98IxCQ9SSV76yP7y8f8VIjNw5uZMsy
   1Ym59RVWctkjqLiM73z58joBp6YeaHW1L0wnblbjUIAOSnoeSVJQ6IAfi
   CZjtRSV88sv8bjAPNaHq7Uwtxt8JedZ1Rk7i4MQ4dK3Pxa9C8Q7D2eTPN
   XmXnC72aFnAUTYFjD7VCGp43y7tYKOmNYg1lGB0E+ZRLgPuRegBFP4lJL
   MDWEpksd0dIBf6/cus+6x4g/txVo/fyNz3+YPxq5hLKlM/Br99t6vs2r0
   g==;
X-CSE-ConnectionGUID: 6xLRrOVeQDmCo3Gee1Fxqw==
X-CSE-MsgGUID: NOXWN1hcSQCRe6duKzkTxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10698880"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="10698880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 01:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="17369023"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2024 01:20:41 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq7Tb-0002zg-0K;
	Fri, 29 Mar 2024 08:20:39 +0000
Date: Fri, 29 Mar 2024 16:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 22/192]
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34 nbio_v7_11_get_rev_id() warn:
 inconsistent indenting
Message-ID: <202403291613.hqOle3a7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   afe97fa20ff84cf03da82771bd492f0be8565f9c
commit: 4d5445d1ac8dc300049cac5d82b39ebb867033a8 [22/192] UPSTREAM: drm/amdgpu: add nbio 7.11 support
config: i386-randconfig-141-20240326 (https://download.01.org/0day-ci/archive/20240329/202403291613.hqOle3a7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291613.hqOle3a7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34 nbio_v7_11_get_rev_id() warn: inconsistent indenting

vim +34 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c

    30	
    31	static u32 nbio_v7_11_get_rev_id(struct amdgpu_device *adev)
    32	{
    33		u32 tmp;
  > 34	         printk("%s, getid\n",__func__);
    35	
    36			tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP1_RCC_DEV0_EPF0_STRAP0);
    37	
    38		tmp &= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
    39		tmp >>= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
    40	
    41		return tmp;
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
