Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CD5025A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773970; cv=none; b=GI5OkfzloYH9Bz81V++qpFZlb+PegCtL3DG98SoXyPsa1HyPCyEoq0UoMKdA6J2hpn7lZU3ekLTI70ahumiz+ig73ozk6t+YR74zOS8ihifOPTpLpVm46YgNYemFBDBvEYvmtUUcv/axn6sUA2mFXi6H/3UJy0F2M2N73aOLZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773970; c=relaxed/simple;
	bh=J2HCi2q3cjpj51zILWszcVP/pc9ie6LJFKsZoo7UZog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sYaA7DFvEw3AA6UBX0SWCWUGGy5jUjFeULh7x7g4mW/1PRUgYY955bfn9WkqaWgG2svnIvkG2JE4lIQzMM041rmszxrDCjilGE/GxeVhJTT3rpwsAkQz1ebFc4INT6Zt8NbrL4oxDWqEkZ+vLpdq0m8Xr5ubCQ70KYEh5opRq0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxO2gIw+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxO2gIw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713773969; x=1745309969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2HCi2q3cjpj51zILWszcVP/pc9ie6LJFKsZoo7UZog=;
  b=LxO2gIw++5b4NJM2+UIMuyMzoGaqAUnTCnWfCvVB2nkud7c7Oc5E8lCv
   +K50x7U3fQAdC3Ohv1LiR/T1Wv7flajSvOsZ1YUP/37D2eFg/+xyh5Ovc
   LOKY4o6rKuGuCVLBTx0CQosKIXp0jlL69Ya9KgljntTTFEvhTJ2h+8UHQ
   MEEwCegsYDn4+6wGh/3jexTJfiJeiNqIUGntkCT/TtJ2lBlu4eDjPTfBc
   zcBVkbl39kPhnuKNg5nXFArv4MWVWx7Ch7IYAzXr14v9+pmoC8dgtoofR
   4BYYNVhByGDEdlsYiBVnEmdyg/p+3WSNrUE5Z8g21NoxOWm8WgJxlF/9I
   w==;
X-CSE-ConnectionGUID: yK8Xo9PTRnSP0raRLewbvQ==
X-CSE-MsgGUID: A6HoFME7QKaG4Eux+WTNiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9177544"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9177544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:19:27 -0700
X-CSE-ConnectionGUID: tMQnlYETS3ORcek8qvoZRA==
X-CSE-MsgGUID: /8x0C9OoQZmU7YGdeX3E3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="47239254"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 01:19:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryotX-000CP2-0X;
	Mon, 22 Apr 2024 08:19:23 +0000
Date: Mon, 22 Apr 2024 16:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Shavit <mshavit@google.com>
Subject: [jgunthorpe:smmuv3_newapi 9/42] arm-smmu-v3-test.c:undefined
 reference to `arm_smmu_make_sva_cd'
Message-ID: <202404221610.xfUCOWjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_newapi
head:   d0dddfdfea6bcfe4c35323fdc7afe4bbb05c34fa
commit: cb149db3a320fa8dcf65b47f81954287ed5514ae [9/42] iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry
config: arm64-randconfig-r113-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221610.xfUCOWjE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240422/202404221610.xfUCOWjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221610.xfUCOWjE-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_test_make_sva_release_cd.constprop.0':
>> arm-smmu-v3-test.c:(.text+0x160): undefined reference to `arm_smmu_make_sva_cd'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_test_make_sva_cd.constprop.0':
   arm-smmu-v3-test.c:(.text+0x1f0): undefined reference to `arm_smmu_make_sva_cd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
