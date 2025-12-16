Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CF2773F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896899; cv=none; b=U0h1nSrzI6dZU72PUvFC/UPeEcYu0PFOTnCenCjGNJaeSwb4ar7gdEb3Z6YW/QTHntJdW7W7PUL4wxGL5NxtAQVoT1Y88VAYAZFbbnD576eynjntES0B2GTvZSB1uORqobwv39fp4sC5ZOdxB5MktcNLFJXDPGz4RY/maZuhCdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896899; c=relaxed/simple;
	bh=IUKNyLgfrBE2uULJel/2TUGOCqrU4CtdzIB4rOFFQGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9QF6uuyWJwDkR6FfSp+EUWpqwni4/9RsBH5sloA6Gx744q9Vs4YikBMN6S6nwanr1+TFntt1+f/iSDnsAYq1Z7rvR74UyMocssbA94nLZD7gfMaiyVaDKc4V4o/OD2pLhHPhTEgVs4EL25DYWhl9ooOUXmCLIxDyUISVPMistI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQaRjJfD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQaRjJfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765896897; x=1797432897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUKNyLgfrBE2uULJel/2TUGOCqrU4CtdzIB4rOFFQGE=;
  b=FQaRjJfDV9qhxjlDQKaWCCUdAd+NaBFy29S+BviRShVofijdW9N//j7h
   Lcw92Wx5dPUW7AOsHZA6dpJjLAdbjCYd0I83mOFQc1GKdyxrffkwDKO23
   zKxB6M8cV5mVaIFjj+B4RJIt/8i71SMXVAwHPqYeKIfQjWs7VAVbsiQix
   K2LjEqwYZcC7x/8AH7j63nJblsZ3hMwyksRs7n6z/OtEFvwURHGkU9uT0
   eUMAKFMmvwoOFzqGMP9E5/BnBBmNKG121me91my4pcwSkbYFB8Oyn2PWq
   y1nDGYE/79Z9u/oWzQlDFC259VPyEHOIHlTs3KCtB/FG2kG/y9/jVmzYm
   Q==;
X-CSE-ConnectionGUID: eHMsnBw9Sbq3d7x9WiwqsA==
X-CSE-MsgGUID: AhzOMudOSS+Ut8Mks+gsTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="90472976"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="90472976"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:54:56 -0800
X-CSE-ConnectionGUID: Xi9VuhMjR3aZgCR5cdW4ng==
X-CSE-MsgGUID: wApGOSrXTuOAE6UKge2oLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202449803"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 06:54:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWRx-000000003PS-06eX;
	Tue, 16 Dec 2025 14:54:53 +0000
Date: Tue, 16 Dec 2025 22:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: warning: no previous prototype
 for '__kvm_iommu_reclaim_pages'
Message-ID: <202512162225.6oXqSYyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [0/2] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251216/202512162225.6oXqSYyi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162225.6oXqSYyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162225.6oXqSYyi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:44:7: warning: no previous prototype for '__kvm_iommu_donate_pages' [-Wmissing-prototypes]
      44 | void *__kvm_iommu_donate_pages(struct hyp_pool *pool, u8 order, bool request)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: warning: no previous prototype for '__kvm_iommu_reclaim_pages' [-Wmissing-prototypes]
      62 | void __kvm_iommu_reclaim_pages(struct hyp_pool *pool, void *p, u8 order)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:106:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
     106 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:116:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
     116 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:125:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
     125 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


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
