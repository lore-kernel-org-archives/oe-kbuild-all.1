Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A5313B5AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 03:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804826; cv=none; b=GX9KTJh5AOEBhrfLL1h2IsTKzFxt5GNJoTiN+Mf2xPpvJjOGbxdYVq32LEj5vJdYYhjiEs4z+8eVUB8GhiPNTgCG8F8jJ9Mdk6Fc5b4X6HTgA+b/Wy0SL71AICOJsO1AcJkwmJoPSsg40QrJDXSiKbJDKXaAbaPoBT+xB1JFo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804826; c=relaxed/simple;
	bh=4JsUaiI30axqLs4AHFP+kyFsJrf6/CIP8nSHGol94DY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6keXqr+WJSCbnnej7WJ1sKwsESK5av2HCwuWg6vA6rIUNaVFXSZieygge06CwZN9zEg5ewy97iWNb0EJtCpUP6Qkb0O/FqDrHgJM8xA+X1cLBFUqPVQU90XHofm9uBlm9hygDDgTV9ruLZHdRCcicACFQn2VkcGADcvpHKCISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOTMO+qq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOTMO+qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712804824; x=1744340824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JsUaiI30axqLs4AHFP+kyFsJrf6/CIP8nSHGol94DY=;
  b=IOTMO+qqOEZ/ctVwBanbwvhSGIB9o1HunTWZV26LDsqhHcPw7XKUgoGL
   hiDO8YsjJiCG1dhxHJfxrRZRjzXi2TufkUkXGFGbdVK3U7i/32thBnmfP
   hK5z8J31bQK4TUs+MSBmbhL6qGKvxW9lp97rT54yAHYBtsJ65tk3mg9BL
   p8CB3iY2qg+WCB4azdb58MHDHm24fbCUxcdUqM2zgLbZ3t9FacGKyHfKv
   Ucs7LZzwAQH+4HHv9z6+S5PNAxknxa8c3P2+EbVOYIWfhJGyG0ayupZFk
   yXIDfdxLQm9YMM77uWr1S4NCJnggP4kgool8nLq82/lOOVSavuD5redPl
   Q==;
X-CSE-ConnectionGUID: wG4ccBGnSmqaaWuwnYjkfg==
X-CSE-MsgGUID: SCZmXse6QEeDRWEJJVu/tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8361360"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8361360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:07:03 -0700
X-CSE-ConnectionGUID: 6NLMAN8fTMCRLJjffDmmTQ==
X-CSE-MsgGUID: PnQLy7XVS2CKwa50GfftQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25538564"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2024 20:07:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rukmC-00089O-0R;
	Thu, 11 Apr 2024 03:07:00 +0000
Date: Thu, 11 Apr 2024 11:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 29/38]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:44:7: warning: no previous prototype
 for '__kvm_iommu_donate_pages'
Message-ID: <202404111116.TiqPuRSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ed3c4cbe0c7f9ad1ffc0151e3e9b779227103e41
commit: 4ad0b651d058e1858771f56a77a1118863f594aa [29/38] ANDROID: KVM: arm64: iommu: Add pgtable allocation functions
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111116.TiqPuRSq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111116.TiqPuRSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111116.TiqPuRSq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:44:7: warning: no previous prototype for '__kvm_iommu_donate_pages' [-Wmissing-prototypes]
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


vim +/__kvm_iommu_donate_pages +44 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

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
