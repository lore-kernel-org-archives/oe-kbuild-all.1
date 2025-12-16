Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCD33A9D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889842; cv=none; b=us7sNU+zzMx1h666cQnFUICIrOxEUoRJnDREq6809mvLtl5T8utammxLj0TDVWqQevjakmiq1rtGGOfVMgTqBNoOaecX94i1q1j75zoD1ZozGmhk+SELYyz7VbdWAtI9M6UQswA2JYbWewlqVuOxf9Rgy9ioCD6cvOOXuMc9AYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889842; c=relaxed/simple;
	bh=7z2ndZRMw98tXd/EZ95CSXu4GwuSXORJuc2jh6J7+3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbamdDTZ9VrSTNv6BuOMl7YqiLHiyyD2PoUr5ytKQvrkevsR0aut10qK2GZK3KNGLoRyVJY2PoxcRYVNtHiP3sKbpVSiKMHRbLvMoKCay19q7UztmnxZqoMxAoZMe+C9A35kV3zeBDf3ZUVt0i3hlO/lG0ZDpQ1po2u4Xdu/eBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWUK43QU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWUK43QU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765889841; x=1797425841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7z2ndZRMw98tXd/EZ95CSXu4GwuSXORJuc2jh6J7+3U=;
  b=KWUK43QUmJLRtgPzfJhrJa65j0A2dqIiEVrQ6XfgZFA7dDDyS+U2sXVZ
   k20mwDCRGFRwSlAMQ1ghjrEpI8QskpSy+vWe+F69Sdb9laJ3hlM8VPBGz
   fXwZcRLKSm8e+TxgvS4kNa/OLbadDEwhFU38W1oqWUCnot7YTSHCxE9MZ
   eqigHdlgMKy/QPqxsvdC5Ib0KshKbjglChxo+KQ498/WnpLHoNUiXkXUl
   h/dA9s2xi+oxN1IZ2EZAbZ3ofcBaXwA8M3zAE+eu63/YjAY6hB1WRGYXp
   7UE+eQU4SsgncFH5xEvjit9jc3DHWTLyyqF72eim0pOEWGIHu0h3cHXQT
   w==;
X-CSE-ConnectionGUID: 8fUzv4R5RtqMrhnqVyhHvA==
X-CSE-MsgGUID: tVY1GF/YS+C5dWInCe+evA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67841852"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67841852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:57:18 -0800
X-CSE-ConnectionGUID: akxGnxFyRTSD1dCbdHqHog==
X-CSE-MsgGUID: ReNVLikyRLm9AaAWdcETgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197991659"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 04:57:17 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUc6-0000000036G-2zOO;
	Tue, 16 Dec 2025 12:57:14 +0000
Date: Tue, 16 Dec 2025 20:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] arch/arm64/kvm/iommu.c:63:15:
 warning: no previous prototype for 'kvm_get_iommu_id'
Message-ID: <202512162029.AJ1MMSKP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 9d5e57d93b40eb389a4d67fc606dc62089e1cae6 [0/2] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251216/202512162029.AJ1MMSKP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162029.AJ1MMSKP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162029.AJ1MMSKP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for 'kvm_get_iommu_id' [-Wmissing-prototypes]
      63 | pkvm_handle_t kvm_get_iommu_id(struct device *dev)
         |               ^~~~~~~~~~~~~~~~


vim +/kvm_get_iommu_id +63 arch/arm64/kvm/iommu.c

    62	
  > 63	pkvm_handle_t kvm_get_iommu_id(struct device *dev)
    64	{
    65		return iommu_driver->get_iommu_id(dev);
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
