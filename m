Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011153A7585
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907331; cv=none; b=TacXgDIG1CU2SmStdt0OuDHzcVfBCRRyfx0eMiKZ3ZOGxbec9syoAhdjTmI3QXNRg5GB9GgHA4eNpCXC5cGchl14kqvEEAe18bbJ59vaNQXL+NhvnXdNvyK2z/UBxutRX27qiZBlvNYRSrEAzWn1wSdeVaMn1ACvhMWmo7UNd48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907331; c=relaxed/simple;
	bh=ZXk0hO7Gu/ZJ0d7MVrxguDDDNYE/uLOgJloCmbWAwH8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cFcC/sm0GK49RjHNWXQACFbuRfbqo0zwhYGNWleK0brCtYPyn0MuITDviZ3570lMOt115sqKdggrwGg2oYYGBrx4V/OdXNuo7/d0UrMsGt9/aKxudth/kRMRFRNut5Fc1Ssd3hWRGL6Jnaxc+BuSS1f7jmK07NgeM9LZyD5SvEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYHec7kX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYHec7kX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774907330; x=1806443330;
  h=date:from:to:cc:subject:message-id;
  bh=ZXk0hO7Gu/ZJ0d7MVrxguDDDNYE/uLOgJloCmbWAwH8=;
  b=QYHec7kXVY933tYgovCvtXqs/4eEM2uNXwV0seeRthfkGpUnomOqFB7h
   ohlTk7SsSycyMy4CIRNjNrk2NyPisIWdRyTER6WerTrsGSHVpY5M7nSR8
   DO3IbilyW9Z1skU82Twc0e/OY7Ga3Sj3FNy6hBH0lmSeZW6lMDH5MW/AC
   ZrQw6byD2WdijudGdDXDeh7y2TzSHtuSdI4qnHdi+iHHW4G3n/1hU2By+
   F+EscxMigHkllRLYs68FfoiQrXRdbOoTaxcsDbolh4F/5GBr8073ANMHD
   fdwVb2pFAcYgZVEw5VA8yO2pqtdgYpMaA2Y0meiKQ8Qk4LQALcZwNzuz8
   g==;
X-CSE-ConnectionGUID: xSSAmfG6SQ6jO0rx8La1dg==
X-CSE-MsgGUID: TzYOkPH9QmKs4m5WZ0izmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76102165"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="76102165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 14:48:50 -0700
X-CSE-ConnectionGUID: W0z7St6pTZu0fbIyMpHS8A==
X-CSE-MsgGUID: ouOlrKYORTG3rQEUmtBvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="231104416"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2026 14:48:48 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7KTV-000000001lB-3CfK;
	Mon, 30 Mar 2026 21:48:45 +0000
Date: Tue, 31 Mar 2026 05:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:62:6: warning: no previous prototype
 for '__kvm_iommu_reclaim_pages'
Message-ID: <202603310504.B2yVaC6h-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [0/2] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260331/202603310504.B2yVaC6h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310504.B2yVaC6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310504.B2yVaC6h-lkp@intel.com/

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

    43	
  > 44	void *__kvm_iommu_donate_pages(struct hyp_pool *pool, u8 order, bool request)
    45	{
    46		void *p;
    47		struct kvm_hyp_req *req = this_cpu_ptr(&host_hyp_reqs);
    48	
    49		p = hyp_alloc_pages(pool, order);
    50		if (p)
    51			return p;
    52	
    53		if (request) {
    54			req->type = KVM_HYP_REQ_TYPE_MEM;
    55			req->mem.dest = REQ_MEM_DEST_HYP_IOMMU;
    56			req->mem.sz_alloc = (1 << order) * PAGE_SIZE;
    57			req->mem.nr_pages = 1;
    58		}
    59		return NULL;
    60	}
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
