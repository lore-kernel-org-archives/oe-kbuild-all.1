Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F867190696
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731781801; cv=none; b=HegKtLYAVZc7toTQGGwy8Ed8x4bB/3J/vtUotYuTwnJiXoLl42sPJFgvN64shXzh9DGZZOv0v9GK8lA+JZPMEX6AeFoiIOgIi8IPvEb5C1z+nblRNq+LEzO1qnr/35b7/PDJ58gBtYQNpG7/2OuE+XIR/09N0Ghv62xgYtYknCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731781801; c=relaxed/simple;
	bh=fIqy7ep8aGEQdjQQlBJJ0/X3Rk6lM5/8f91/a2fJx8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qmmo1jNfGQbSjwwEADrWrkFev24T1zlB/88diC3SSq5wjVfqBI6fLd5OhxTbHr+HI1Rikp4hKUIl9j2S2mMazEXvp9/7SuSUrQ2lvGqAHmBbzs6JohU6MW2xM5jkou6GQ27HQllyAs3qJIt6kBS+9r8XRHTfcXSga/vScSOFW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gp8xb4oH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gp8xb4oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731781800; x=1763317800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fIqy7ep8aGEQdjQQlBJJ0/X3Rk6lM5/8f91/a2fJx8g=;
  b=gp8xb4oHEqeYLCkt3bxHNmENesySLVh5w4TlVxq24hqAj8Bg95tFhUvT
   XDZps3w++kI8tWDrMV8Dmhpoxge7mLsaBIdVGuWAR5NX5PsujNdZtWBMW
   JYaDUsK8XO6lXoFT1wPokqvfomzEUejxM5CMg3xXkhE85PIj1XMULIHcY
   +63Fw5XRQEZO+t0FAqSiGyddTCdWc0rNdqBKajqwA+Lqcv2LmH2j/k6CO
   mLf36EX1iJ+XFuGqjt9NSqBx9UUafBhKCFVslBiOoECuyyWKhb2s9e16d
   laMWSZbcYD8xzUAErQx235wuGNxblEj4uBX+tS5EoJnDCcp7/n5ebGi+Y
   g==;
X-CSE-ConnectionGUID: 9vAvlpnQT2WcrjkHYoVoTA==
X-CSE-MsgGUID: QL/HQyhsRmSLnWFPNngkow==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31160693"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31160693"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:29:57 -0800
X-CSE-ConnectionGUID: 6v2hcnCpTiW0B072xeOLrw==
X-CSE-MsgGUID: L+MruDlyRKKnzXL8P6Z7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93782360"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 10:29:55 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNYP-00011j-1m;
	Sat, 16 Nov 2024 18:29:53 +0000
Date: Sun, 17 Nov 2024 02:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 247/328] arch/arm64/kvm/mmu.c:378:
 warning: Function parameter or struct member 'addr' not described in
 '___unmap_stage2_range'
Message-ID: <202411170222.MhGFOeXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5a4c93e2f794001a5efa13c0dec931235240d384
commit: fcc111df8789eb3964c040712266abb15c823476 [247/328] ANDROID: KVM: arm64: Unshare pages from __unmap_stage2_range()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170222.MhGFOeXC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170222.MhGFOeXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170222.MhGFOeXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:378: warning: Function parameter or struct member 'addr' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:378: warning: expecting prototype for __unmap_stage2_range(). Prototype was for ___unmap_stage2_range() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +378 arch/arm64/kvm/mmu.c

fcc111df8789eb arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  339  
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  340  /*
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  341   * Unmapping vs dcache management:
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  342   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  343   * If a guest maps certain memory pages as uncached, all writes will
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  344   * bypass the data cache and go directly to RAM.  However, the CPUs
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  345   * can still speculate reads (not writes) and fill cache lines with
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  346   * data.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  347   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  348   * Those cache lines will be *clean* cache lines though, so a
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  349   * clean+invalidate operation is equivalent to an invalidate
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  350   * operation, because no cache lines are marked dirty.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  351   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  352   * Those clean cache lines could be filled prior to an uncached write
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  353   * by the guest, and the cache coherent IO subsystem would therefore
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  354   * end up writing old data to disk.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  355   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  356   * This is why right after unmapping a page/section and invalidating
52bae936f0e7be arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  357   * the corresponding TLBs, we flush to make sure the IO subsystem will
52bae936f0e7be arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  358   * never hit in the cache.
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  359   *
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  360   * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  361   * we then fully enforce cacheability of RAM, no matter what the guest
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  362   * does.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  363   */
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  364  /**
ffd9eaffa34d79 arch/arm64/kvm/mmu.c Randy Dunlap     2024-01-17  365   * __unmap_stage2_range -- Clear stage2 page table entries to unmap a range
c9c0279cc02b4e arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  366   * @mmu:   The KVM stage-2 MMU pointer
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  367   * @start: The intermediate physical base address of the range to unmap
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  368   * @size:  The size of the area to unmap
c9c0279cc02b4e arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  369   * @may_block: Whether or not we are permitted to block
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  370   *
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  371   * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  372   * be called while holding mmu_lock (unless for freeing the stage2 pgd before
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  373   * destroying the VM), otherwise another faulting VCPU may come in and mess
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  374   * with things behind our backs.
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  375   */
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  376  
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  377  static int ___unmap_stage2_range(struct kvm_s2_mmu *mmu, u64 addr, u64 size)
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11 @378  {
fcc111df8789eb arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  379  	if (!is_protected_kvm_enabled())
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  380  		return kvm_pgtable_stage2_unmap(mmu->pgt, addr, size);
fcc111df8789eb arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  381  
fcc111df8789eb arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  382  	return pkvm_unmap_range(kvm_s2_mmu_to_kvm(mmu), addr, addr + size);
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  383  }
80a72f6ae4aa66 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  384  

:::::: The code at line 378 was first introduced by commit
:::::: 80a72f6ae4aa66b8fb00a1c8a0d61f054d618003 ANDROID: KVM: amr64: Pass kvm_s2_mmu struct from stage2_apply_range()

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Keir Fraser <keirf@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
