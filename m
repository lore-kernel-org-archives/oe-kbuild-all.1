Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53E38E8B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 20:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875935; cv=none; b=IdQxTZ/t+fEFyTto8AzkBiMry+VeghxBL5E+FNRWXs2GGnevAf3Gz3vvhsB8cL8uIik7DY0LrK/XL7tfYDxew1Wk+DZkKMYP4tpALB6C7NQoLMifdtr8NEelAW7ZiJG3LwgPhRjw8zHRew0SWDetsU6e2KzJPiLuBxAPFKPcH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875935; c=relaxed/simple;
	bh=TEHRWbkpVWssbQozL57oCn5JXRlC0/800wEWmfWV4co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=opD5PVTBtTvkCxwfrUI1Z9vMiSCv2y9xZKSQ2QqP79OP9ksVsdvfSMdumBRhxN9Q7dsDb/xZYvJkT0Pu7mTEnOEpQWAfhwe0XFSfArTLdF9X0O1Vxu6uqRsXV56u+1Jwr2FNbdkcLnK0iXDDGhnd8uNR1gQpD+3kCEbXGzePxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGn44AT9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGn44AT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778875933; x=1810411933;
  h=date:from:to:cc:subject:message-id;
  bh=TEHRWbkpVWssbQozL57oCn5JXRlC0/800wEWmfWV4co=;
  b=mGn44AT9KFd+URho8WIpArURPS9cS2C34hbgvePfFoX6dYs1tj84gSXl
   g/7Zaao/V81U8qQtIIUIgW6ZGrCM5AfWOrx8XcTZGndQrelUsax4fmk6w
   4Ts1fMWacGkFp/ldv8ch+xt0nl0f8H8DhjyHk+euZjpeMGyNOWpH3H4bT
   nr6/dVhgFip1QLuhkl3z0NP1rGzpzP20WHru+Qy4+MBGMjWj7PrXkDpNb
   zioUggRSkC9NEcjaJV9P4cT1chABlthE0Fcq/g68YV0zoR+p9oXdyNK1a
   Eg/5BMWdK+jZiP9qgSwi4pVz5yywaktjafxu3scjeo3xplgCW1nO0qumZ
   w==;
X-CSE-ConnectionGUID: ugTbzrObR72XN8vmQPHw0A==
X-CSE-MsgGUID: lOCQPeOvQ/KolJY7Ttpjsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="80007578"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="80007578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 13:12:13 -0700
X-CSE-ConnectionGUID: vg9hgClaRlSdUk/lx4Px9A==
X-CSE-MsgGUID: GSfIvaScS7m/t5ckLlel5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243120128"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2026 13:12:12 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNysv-000000002fh-0VJV;
	Fri, 15 May 2026 20:11:53 +0000
Date: Sat, 16 May 2026 04:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: sparse: sparse: symbol
 '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
Message-ID: <202605160421.omP6Ob6t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b5816a1652ad494d4af974f0000657b686bd683c
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [2/2] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260516/202605160421.omP6Ob6t-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160421.omP6Ob6t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160421.omP6Ob6t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:44:6: sparse: sparse: symbol '__kvm_iommu_donate_pages' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: sparse: sparse: symbol '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:106:5: sparse: sparse: symbol 'kvm_iommu_refill' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:116:6: sparse: sparse: symbol 'kvm_iommu_reclaim' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:125:5: sparse: sparse: symbol 'kvm_iommu_reclaimable' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:163:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__kvm_iommu_reclaim_pages +62 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    61	
  > 62	void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
    63	{
    64		/*
    65		 * Order MUST be same allocated page, however the buddy allocator
    66		 * is allowed to give higher order pages.
    67		 */
    68		BUG_ON(order > hyp_virt_to_page(p)->order);
    69	
    70		hyp_put_page(pool, p);
    71	}
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
