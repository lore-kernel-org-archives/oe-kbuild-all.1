Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BD3A63F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895796; cv=none; b=Gdw2F975hve0Quy4/2kma783SbE8bhgh3Y4oTiGlG7V731bzDblxsBcTIZ6h254kM/mmKkb/jlEqqslnUlSbsguWa6rU8lUOYG85UF+gDtrKA9T7VRcQyMTCpVc+fT0kZNHODOW7m8SUa4RWjpAevKpUYYrWd063m6ldoOjLB40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895796; c=relaxed/simple;
	bh=XArvKmVvec9UKfemmCHmMUP/Q2YB4L7qbfd7Pr0IZ/4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ml6Yfk0i4QJ/nh/zlzUUczN4GgrfqN15Qx7gV1doxlvnBX8Z0+oAQt1frOL39CZhIWilDWYgV1R0PHuelrQNro5y6q/tDo4MmqB+BlrdeB8vjJv7vSALYqgqfcrU1HDUZNqWryBSRM1/7akqDzP4dEFvpj9/b+LfVjJHhL+sDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDZdT/X4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDZdT/X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774895795; x=1806431795;
  h=date:from:to:cc:subject:message-id;
  bh=XArvKmVvec9UKfemmCHmMUP/Q2YB4L7qbfd7Pr0IZ/4=;
  b=mDZdT/X4gzooilc958KCjWEkjXGOxu99q11iLemQxzGpV7rtPRTwLRvm
   SOlmDS15ziasTZHM78QNSU67scFq+PRiLm4I15tsVu4IzCGCd9BXFq03K
   VHcfHcnzI/oN267tajDP5vj/KhDlY6PoDn7e+MnYlnjcVBQKOVFoWWrg6
   1PfmMRnljivFn3/pmBC/y/uBdAVaMIQIfo9PfeVg9X2cousNti5FuSuhh
   uGn9q+NkWQdUFqx1a4Ul8vewZyYDOzWKm5xi8Z4UL9tG2cjXN/a0mi6rB
   dwbd9YdxbACdVzmJf8eZyCXhJ+KchqF8QprJXesMc/mjH8x9xyYzvom8n
   g==;
X-CSE-ConnectionGUID: /JUGPvFiTsqWPoMv2qO0/A==
X-CSE-MsgGUID: OtXhtzjlTxqM62vcmVwvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87367454"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87367454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 11:36:34 -0700
X-CSE-ConnectionGUID: GNmLiIOjRHu2TxsLENVrTw==
X-CSE-MsgGUID: k059Xp2sRnmcs7fQs14i6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="230941152"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2026 11:36:32 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7HTS-000000001VR-0jjm;
	Mon, 30 Mar 2026 18:36:30 +0000
Date: Tue, 31 Mar 2026 02:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 arch/arm64/kvm/iommu.c:63:15: warning: no previous prototype for
 'kvm_get_iommu_id'
Message-ID: <202603310204.Crtoqn9r-lkp@intel.com>
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
commit: 9d5e57d93b40eb389a4d67fc606dc62089e1cae6 [0/2] ANDROID: KVM: arm64: iommu: Add kernel wrapper for HOST_HVC PD
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260331/202603310204.Crtoqn9r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310204.Crtoqn9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310204.Crtoqn9r-lkp@intel.com/

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
