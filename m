Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015113246FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765883496; cv=none; b=b0ORIe8vEbrYaXVXfcjxdEmFF2M7jesBYITz8lz50bAxTRFX/Zn0qJkSAcSUUeKZZq1/36wLZUMzm4DaczHTjVWNZ4dhc2oj7ugUikiGVVaLar1uShOr5kS7uDjR1C5wiuVLq91ZVyGMbja7UiMb/L3khlN9lhooaAz8y9k48rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765883496; c=relaxed/simple;
	bh=KjlAHIxJ2iuzrzYP/AjyIogXILd4fMqZnRcKF4sf+Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvGmCcYXngC511sIeVuCMQLNWelxi0IKH00hehFOdZZiVlMEn9YWDRXGElbIE9w0dUrcW3X5odO9l1o/kQDlv3GfGi+EVaW3XAYD87IbUslXxUzrvuX6HRz03+H5L7nTCgebz08vCTQDjn/kPZSYIfSnk40HwWaLdw+uHy/OzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aT1kIwy/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aT1kIwy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765883494; x=1797419494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjlAHIxJ2iuzrzYP/AjyIogXILd4fMqZnRcKF4sf+Ds=;
  b=aT1kIwy/R5P2IWIgizoBBWsKH48uG85bG6zaeu02LEGTlVRngcjqdJ6p
   yOmZie2ByZfr9NH1G8GFuKbHqEA+ve0DTUxQRasEZFuPSojbjPYm0Tg+J
   LRVXyw/77F7gWAvmsNXTPf9VDYFthFbbncBQW4WwguUHu1xWHL9KLAp91
   q9oo/+q/GVX6IK3noYwvQGFaAA3bgwoaGHHMH7Of/PDXoC7WeayeCUrGh
   dhRhzHR0kWEqKkgUFmXnIaVbqiEcFqMcKdMZlclnLUwldtBR8SspbWWKh
   r3qwKdIbqYy2is84HIRezLnaQdvv3sAVQODfBYonMwHTxhDQigC6aYbf9
   A==;
X-CSE-ConnectionGUID: I/Bw7CTmRViS7u77T//6cg==
X-CSE-MsgGUID: irI70gmuRIq22+3pj6nFXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67676902"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67676902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 03:11:33 -0800
X-CSE-ConnectionGUID: GajmEKHSRJOBtoMLlIE72Q==
X-CSE-MsgGUID: pLEI6RQeQraKTNvJDHXHWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="221373228"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2025 03:11:32 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVSxm-000000001XU-1dbQ;
	Tue, 16 Dec 2025 11:11:30 +0000
Date: Tue, 16 Dec 2025 19:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2] arch/arm64/kvm/mmu.c:394:
 warning: Function parameter or member 'kvm' not described in
 '___unmap_stage2_range'
Message-ID: <202512161914.tVvusT6F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: b66e27a61e1f4f713201f1cd1d475da9309218ae [0/2] ANDROID: KVM: arm64: Unshare pages from __unmap_stage2_range()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251216/202512161914.tVvusT6F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161914.tVvusT6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161914.tVvusT6F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:394: warning: Function parameter or member 'kvm' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:394: warning: Function parameter or member 'addr' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:394: warning: expecting prototype for unmap_stage2_range(). Prototype was for ___unmap_stage2_range() instead


vim +394 arch/arm64/kvm/mmu.c

b66e27a61e1f4f7 arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  355  
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  356  /*
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  357   * Unmapping vs dcache management:
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  358   *
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  359   * If a guest maps certain memory pages as uncached, all writes will
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  360   * bypass the data cache and go directly to RAM.  However, the CPUs
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  361   * can still speculate reads (not writes) and fill cache lines with
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  362   * data.
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  363   *
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  364   * Those cache lines will be *clean* cache lines though, so a
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  365   * clean+invalidate operation is equivalent to an invalidate
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  366   * operation, because no cache lines are marked dirty.
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  367   *
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  368   * Those clean cache lines could be filled prior to an uncached write
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  369   * by the guest, and the cache coherent IO subsystem would therefore
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  370   * end up writing old data to disk.
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  371   *
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  372   * This is why right after unmapping a page/section and invalidating
52bae936f0e7be4 arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  373   * the corresponding TLBs, we flush to make sure the IO subsystem will
52bae936f0e7be4 arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  374   * never hit in the cache.
e48d53a91f6e908 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  375   *
e48d53a91f6e908 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  376   * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
e48d53a91f6e908 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  377   * we then fully enforce cacheability of RAM, no matter what the guest
e48d53a91f6e908 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  378   * does.
363ef89f8e9bced arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  379   */
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  380  /**
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  381   * unmap_stage2_range -- Clear stage2 page table entries to unmap a range
c9c0279cc02b4e1 arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  382   * @mmu:   The KVM stage-2 MMU pointer
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  383   * @start: The intermediate physical base address of the range to unmap
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  384   * @size:  The size of the area to unmap
c9c0279cc02b4e1 arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  385   * @may_block: Whether or not we are permitted to block
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  386   *
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  387   * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  388   * be called while holding mmu_lock (unless for freeing the stage2 pgd before
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  389   * destroying the VM), otherwise another faulting VCPU may come in and mess
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  390   * with things behind our backs.
7a1c831ee8553b8 arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  391   */
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  392  
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  393  static int ___unmap_stage2_range(struct kvm *kvm, u64 addr, u64 size)
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11 @394  {
b66e27a61e1f4f7 arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  395  	if (!is_protected_kvm_enabled())
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  396  		return kvm_pgtable_stage2_unmap(kvm->arch.mmu.pgt, addr, size);
b66e27a61e1f4f7 arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  397  
b66e27a61e1f4f7 arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  398  	return pkvm_unmap_range(kvm, addr, addr + size);
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  399  }
776adf654a1f640 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  400  

:::::: The code at line 394 was first introduced by commit
:::::: 776adf654a1f64054a76876923c1606224e431cc ANDROID: KVM: arm64: Pass kvm struct to stage2_apply_range()

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Quentin Perret <qperret@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
