Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0B346A05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769652322; cv=none; b=DRSwCsMpVq9puu5tH4StHGiPQVgpvmTr0cIM/mSITb20K660lP/vTTHTFLc4ntzCWNfIuPSPDA54IFaX3kSWFfgENK0dPdI9iJbmGK/oXWyrfcSR6zTc7NPPFhpGevDjrMoWQ9fDake/AU5UtVIZHWLOcNE85P8Dnz+IswPjwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769652322; c=relaxed/simple;
	bh=6UZLNBjvYzKbU73Lp88BVEyinDj7GYuX0YVjEj+OgAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U4g0X2gYROUF6vu3kFNlM5vKISydlIJXDJO00/Sccgyu19xr4MEPfxZFOtNp61rNZSiKNx9izzDfLivpTuGCBiBY/MuH/ARDtrkIEBThzXHppLj72OlIwOxIa+pY/ehpv7tyUYzAZmlbLJ9t57GKoFrmpE9f98oNqEpoLGHlQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX+sg2zE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX+sg2zE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769652317; x=1801188317;
  h=date:from:to:cc:subject:message-id;
  bh=6UZLNBjvYzKbU73Lp88BVEyinDj7GYuX0YVjEj+OgAU=;
  b=PX+sg2zEpBmC+GPi+V22Ww517Y/y9gpYa4C7d+kiQUlWLgKu7JAO+Q87
   djPtdivXjMVi4TB7ufcYJPEe52iugWLVSsMBqtU+kByOUUiKM8e46n5xN
   wALSgHWp3lN3BMxwMf7IpsffIkUwV3Zwp9FRm1RcbztFSeSVVx5QLaR96
   TxsA60HE5kAyWczvf0veEJn3fXbgSkbfF/nbM79iXx/FnKwHNZnnMqSh6
   Q6Ux9IXJPP+m2dZ7JH1zVe/YYN/DDc2ERqekfNQJK2hnxb4kKoV+FCjHE
   Gj8wC471YGkdQU/tHhbOYi2b0yGIQ6JjCTxb4VIfwqlR139btLkf6STbh
   g==;
X-CSE-ConnectionGUID: 73k1ohKnRFGgvcZEZwah3A==
X-CSE-MsgGUID: T3KHTeZ4S4O2Trx9Cy5Naw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70971449"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70971449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 18:04:58 -0800
X-CSE-ConnectionGUID: cOhrjLAiSxmF20GrSScrxA==
X-CSE-MsgGUID: UkcYo9wuRkKhWrIFSeNclQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="213304833"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 18:04:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlHOu-00000000ayO-3kZS;
	Thu, 29 Jan 2026 02:04:52 +0000
Date: Thu, 29 Jan 2026 10:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/8]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: sparse: sparse: symbol
 '__kvm_iommu_reclaim_pages' was not declared. Should it be static?
Message-ID: <202601290932.j3NFqn6P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e4fe966b5aefd11fff0507ef30fea72f8cade6d4
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [8/8] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-randconfig-r131-20260128 (https://download.01.org/0day-ci/archive/20260129/202601290932.j3NFqn6P-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290932.j3NFqn6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290932.j3NFqn6P-lkp@intel.com/

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
