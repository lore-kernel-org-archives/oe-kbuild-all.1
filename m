Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844417FF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709775163; cv=none; b=uZcQ7SULOCRKmm8ufuV93eQXyBiHadpNatAKg7tVXvKU93JywM1jArEWDLGcj+EROsenwz/mqHtb4EVFyu5ck9GQQlVHkszb8NIKgF1BBdOxOFwP275dfeL0DocM+gyw20dIU6jufW06JNJCMHEwO77HAFo62GZY6bsOePrO4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709775163; c=relaxed/simple;
	bh=9jUTvCqLwYoCNbD0FFNZoa/JwTJqX6+8eiJUzuZlpq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1UxKEesRSeq2kCHR3ZN2LR5HbRSKzpo766Baz2DpDaureawI+CSxUY3e0n06KX8CS9dOU2q4FQoA6Hge15WWdyEWLKSZr+4p30pzkVNxW0li4AOeu1V+P36m/DHxwnMrrIARU0TpqGAs8dpp2XLEQMutFVhueHNTVX4hHlsl9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0Jr1+i5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0Jr1+i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709775161; x=1741311161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jUTvCqLwYoCNbD0FFNZoa/JwTJqX6+8eiJUzuZlpq8=;
  b=U0Jr1+i5vW+9pacPH2FG7CJUEzJvPlY5ssiC7hYU6nDnenWH6K0yWbI9
   mCD6DB2mql5gCeHSDKB6PXpTeG4M3elSw2GzR5cDBYRbHHBND4Ik9F2qL
   mSSKZquqXSzEBKESzJ/GFnc45ErPFsDbr3q2QGWVtxlOPvtHyT4/P98jO
   nxOjaAzIdyUecaSBhc6L+f+dQFB3eTvGWWHywx5QsTtemFteycu/8J5wT
   YxOvAo5M/6uRHriSI90e4t+gKvXH4L3+LcMLOXEA99UUD0f7v0X5J8e6G
   xQr434AEYAS3Db87UZs7EfUwlr2jOeijy/6qyKmXVE24dTDdnYpNOh2Dd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="26897626"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="26897626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="33099705"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2024 17:32:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri2ce-0004gH-34;
	Thu, 07 Mar 2024 01:32:36 +0000
Date: Thu, 7 Mar 2024 09:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 43/57]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: warning: no previous prototype
 for 'kvm_iommu_refill'
Message-ID: <202403070900.T358ivlP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   6872638c2ef3e7439a7f074a8757cbf3060db80e
commit: aceff10b565a25855e8b24f3e26105db8cfeb77b [43/57] ANDROID: KVM: arm64: iommu: Use unified allocator interface
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240307/202403070900.T358ivlP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070900.T358ivlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070900.T358ivlP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:55:5: warning: no previous prototype for 'kvm_iommu_refill' [-Wmissing-prototypes]
      55 | int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
         |     ^~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:60:6: warning: no previous prototype for 'kvm_iommu_reclaim' [-Wmissing-prototypes]
      60 | void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
         |      ^~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:65:5: warning: no previous prototype for 'kvm_iommu_reclaimable' [-Wmissing-prototypes]
      65 | int kvm_iommu_reclaimable(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/kvm_iommu_refill +55 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    54	
  > 55	int kvm_iommu_refill(struct kvm_hyp_memcache *host_mc)
    56	{
    57		return refill_hyp_pool(&iommu_host_pool, host_mc);
    58	}
    59	
  > 60	void kvm_iommu_reclaim(struct kvm_hyp_memcache *host_mc, int target)
    61	{
    62		reclaim_hyp_pool(&iommu_host_pool, host_mc, target);
    63	}
    64	
  > 65	int kvm_iommu_reclaimable(void)
    66	{
    67		return hyp_pool_free_pages(&iommu_host_pool);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
