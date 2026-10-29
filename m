Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285357;
	b=jVXfzuLWjbJOcy59wvWu6NRe9c7IbYrMD+COXHx7MiadNIuPPb91QJZGHBxvod+fg1FH
	 SwJTG/POIMW0XxTVYK9D4/9T5TiGF0Zf/6lB4QS4sHqTI8lU/HqKtGH9OPOM2TIcp/l9a
	 wO9FP4/lq4mukuNbNMqki9kqeivKjXcSOAhngkMFf3cSas2Cc8Hs2X7ICl0/NMGPhJ+RK
	 iLHhhEUWaEa8GQ1BpKWjPvVRMrfQVrWeiDGuHF4n0rM1nwNa5amcRf4To86NvI/xCiDaV
	 kHymfg0hUySZNN55HRXguMId+mm948qJrDfGDH28SWBhV2qQyWonOvUc05YbTgmYadA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285357;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rNVOFdXX6gkgr2VQ8Eq84yLJN2tkCmfcFhd28RDFj+U=;
	b=blvndgtA0An+OBDCC5KDFaOGlBqqv9wwf2MJMN3YIvJElbSeA44OGN7v8r4lXO2Ao+vm
	 cX0RUluyX4AUej++ZJZwsyfGwAiI2D8PMbhRfCYf/V0QPlTp0ueB2C67Y0Yn6LcyYWh82
	 u+2rjxi62K/qps6zN4rgARvLB8qzRVSH/6F/UxEcNS1KvUS07c3LUeJwxOaOsEJ00kwWP
	 tmGY1yORJ6Drb5Cfpx3zUQi9kzrlpAmUCb1/TKvruOlQH3iKEcbnEtMXgrmx3lCBiLliR
	 zGgvLkYrvaG08EyZWqQ1KAu2z1pjr2idb171SjWe/T3wnRSxjwxC+QBnQfUSGoy7vxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HNKw8KY3;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B52606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 14:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B52606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HNKw8KY3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793285356; x=1824821356;
  h=date:from:to:cc:subject:message-id;
  bh=XL2noOHb4Y8ae3FzNdNqTc+NsVDObeYhBB1ch5WjkNE=;
  b=HNKw8KY3s5YZN/h4aipl9Xg6oUASzz/4VQo02tS2/uuM9eKixWROCrhg
   sVYf4BqX+euRH63I1riUERkEynkzPsguAlviZqgFVvcJHpd8k4hE8fJyk
   SGGKVu9lz8DlZ306M6aZJyuTgNQaPYgdaHDTFYHAQDl7GR6qrU+lUnmS1
   6TneVGCOkSCzZdAslGhlI/O2JI2rKiI4gHd2Uz/WRmkNj9VGe9f3O/s/M
   mzOe83Ac7NUTvcLITzcTUbRRUZPz+eh39VDHlCD9QVFeVEm/JNdlmQRoc
   FEqA6LzW1vcsug3nrGW+ZcNbGciLtFEZPgkkc42W2hxNgyogjzEQ6D6JE
   Q==;
X-CSE-ConnectionGUID: Z4sGH9SiQKi4IdMu685TmQ==
X-CSE-MsgGUID: CdmlE1SASyeGoghJ6tAq3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2123484"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2123484"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:49:16 -0700
X-CSE-ConnectionGUID: uW7isfpsRJiLWUwxZkqaQA==
X-CSE-MsgGUID: 8hIfa9oCTXK6wej/gWJ7Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="7000652"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 29 Oct 2026 07:49:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMRRI-00000000aFU-1AAi;
	Thu, 29 Oct 2026 14:49:12 +0000
Date: Thu, 29 Oct 2026 22:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/mmu.c:378: warning: Function parameter or struct member 'addr'
 not described in '___unmap_stage2_range'
Message-ID: <202610292257.ELEb1wQN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: fcc111df8789eb3964c040712266abb15c823476 [2/2] ANDROID: KVM: arm64: Unshare pages from __unmap_stage2_range()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261029/202610292257.ELEb1wQN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292257.ELEb1wQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292257.ELEb1wQN-lkp@intel.com/

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
