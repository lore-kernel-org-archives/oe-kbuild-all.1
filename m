Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADE78F2B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196081; cv=none; b=H8D0avVL5bMLHjeYjRy0muNvNR5VSX25jQ7/OJnY6wv8/AXFIFWpuTDicWmkhRyf1JG19V91RFuelv5BiCtXHurm+Dtrf0jXY9lOfOW90BcnoatI10yGtbSPwaYfcZyn7aVj8RDE3uP8Q3htji1DpS0aOf4VeG1j0jbmyoA5I6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196081; c=relaxed/simple;
	bh=4LOcyNMxg3RR2edrFBFXAJeZckWpOhzm/4KWytcjma0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIMLKosPOl6bPXmdwF4CdRLVqYKmSXDL2Y97FpSYiAEi5czyw6hdxkxbE5FBJAT0FN9z1NnE/s/oKceOYnDNCLlQu3I4hq8Q8kWfmdovtcK1/Z58JCOwz9ki0HIZe6hbEYoRJEqkFlBqty04kkoNi9bcP854tb/v10rUZdBRx2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA9Z/0Os; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA9Z/0Os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196079; x=1786732079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4LOcyNMxg3RR2edrFBFXAJeZckWpOhzm/4KWytcjma0=;
  b=HA9Z/0OsTp3AVwRjwzNAbRKabMwFtEpRIytLcmfWtn55qKmn/Qrnwa1r
   CAoF/UVNIPVEd+SOu+ZwBRCv1tk1X7/2Wze/wo8EXaznDPYMeVYPc9dk2
   lashgmKIqXSYW+/BNVKHLTaELCpWcXVUYDVTqA8SUrm+FH/zeHHtqlSp5
   e3D88FGrxKznsOy1vwDTWR8vxt2va6JsIA5dxSJFYCixvPebQuTbtxVU9
   lEIx/iBDKrSDYABGhfFxKCa30DF3CitINZdkaCK/U8LqchmJ+z0iq/pE9
   IpuTHjNRcc2ZcONUKrqmzWpZF9WsbAn4+K1wg9rB0h6rkLbC9MaB6O1fj
   A==;
X-CSE-ConnectionGUID: By40QsE/Q26zdeUJHhVdJA==
X-CSE-MsgGUID: iy/iWtSCSJ2dZYDqOi5yeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57594439"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57594439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:27:59 -0700
X-CSE-ConnectionGUID: bhY2NJqIQcu68nYR8E6gqg==
X-CSE-MsgGUID: 88oAQg4JTH6Bk0yx1yl6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204006903"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 11:27:58 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcg7-0000Jn-10;
	Thu, 14 Aug 2025 18:27:55 +0000
Date: Thu, 14 Aug 2025 20:26:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] arch/arm64/kvm/mmu.c:378:
 warning: Function parameter or struct member 'addr' not described in
 '___unmap_stage2_range'
Message-ID: <202508142037.RSHP64l2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: fcc111df8789eb3964c040712266abb15c823476 [4/4] ANDROID: KVM: arm64: Unshare pages from __unmap_stage2_range()
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142037.RSHP64l2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142037.RSHP64l2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142037.RSHP64l2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:378: warning: Function parameter or struct member 'addr' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:378: warning: expecting prototype for __unmap_stage2_range(). Prototype was for ___unmap_stage2_range() instead


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
