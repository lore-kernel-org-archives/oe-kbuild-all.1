Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8022BD5AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252549; cv=none; b=ABN8Ad9mmd5cVL0SHJZz1h6cXuXtAZ9Yz7KNFzcXNhrDAQ1yL/vuFUdPFIQseC1cubN4mlkEuMOcpOH4+8T6HKdQuYqRHDSYQJKe9NCMpNU1DpBRzLF0kL/EqUx4+eBJtItexriY6a0D5FePqgKWSGl2Nenhxxl4UeImUqfAmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252549; c=relaxed/simple;
	bh=WJdOCijhkvkx4oHVHT1e3LlSb3z3MSzF3vjg5pxUkYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttKcl+zTOrFQgRPseS+Eorvo4gCekWTdevk1mDZxD/5KXT5xqTQMj8/L+BPvWKbCdiZRMvOOEHISJ/QNdm2NM8y/rGwaRrmDIBM40Al9UWoASIrZdCoayjk5ehCQ9HSV/MR0NEJw1NveXPow+M/kBe08ayC3VyYLbrdYDGK2t1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijMTFb/I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijMTFb/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750252548; x=1781788548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJdOCijhkvkx4oHVHT1e3LlSb3z3MSzF3vjg5pxUkYQ=;
  b=ijMTFb/IoFa2ijtowN4uEYH7v5VDRcJ4H7IFyWLn3YupFlB0cfCYmbJS
   a+k290PxM9rs/pmqppLLBb5CoFGhlH9nuZoYJb0pxhGdBsO2dsr7bRRvW
   ZbkB4uFkuLG3Ve2iavjTWd5q4Rba/+IPvGagmCzxOArTAexAsyNFtVKji
   OqvsfnFaAPlXWIUOBHe8se006bMWe+sisoF4+2v0bxZAsBrEtz5o251Fx
   TD//6QDS8vvto8H0gJzWlE5tBX+cQlA+9ym+Z78/ag6Ete9bAwX2r74jO
   nu5Csc3yZktlNBi0bq2hVTfuLM9HylQjdnGNhjVy1cSzeICTq62rWM2l9
   Q==;
X-CSE-ConnectionGUID: 4JjNgq04QmWi+bYUKmItow==
X-CSE-MsgGUID: 6qRieXOySHOXpfLDgm+FTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52388883"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52388883"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:15:47 -0700
X-CSE-ConnectionGUID: Xm4NsnH1RjO+E5djp+/fFA==
X-CSE-MsgGUID: DAfmhsGlTzCb2Qwsy/T1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149357176"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 06:15:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRsdj-000Jo0-2E;
	Wed, 18 Jun 2025 13:15:43 +0000
Date: Wed, 18 Jun 2025 21:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 4/4]
 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:24:1: sparse: sparse: symbol
 '__pcpu_scope___cur_context' was not declared. Should it be static?
Message-ID: <202506182117.vWC49e3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   de302629fac9207afcc2ab5feecc614c8badd5e5
commit: 76e0641e684e84368e03c2176e5844feb95f3abf [4/4] ANDROID: KVM: arm64: iommu: Add context for guest teardown
config: arm64-randconfig-r122-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182117.vWC49e3E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250618/202506182117.vWC49e3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182117.vWC49e3E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:24:1: sparse: sparse: symbol '__pcpu_scope___cur_context' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:81:22: sparse: sparse: symbol '__get_vcpu' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/iommu/iommu.c:209:21: sparse: sparse: Using plain integer as NULL pointer

vim +/__pcpu_scope___cur_context +24 arch/arm64/kvm/hyp/nvhe/iommu/iommu.c

    18	
    19	/* Only one set of ops supported, similary to the kernel */
  > 20	struct kvm_iommu_ops *kvm_iommu_ops;
    21	void **kvm_hyp_iommu_domains;
    22	
    23	/* Hypervisor is non-preemptable, so cur_context can be per cpu. */
  > 24	DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, __cur_context);
    25	#define cur_context (*this_cpu_ptr(&__cur_context))
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
