Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43363DDDDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945414; cv=none; b=ZCrvhm8+qL/UuROSpamdgEMurl0HH6QS8wKLN+jl376XK/kRrD/o6Jz4Z06AT466BT9yMPfgBLwJoz8PpWw3ZrDUCPfj+biAUmajSZ+xNrOYmlaGXWPI7ECifTT9hsIzuNYzFaX6Any6pS2VwSxbg3XwnjClSzshXgI+SwKC898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945414; c=relaxed/simple;
	bh=HqX7xpk0Nh1GkbdlSAPyvz7brLcjK2lk3Ak6Ayvku0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FROax04O1eyw1H720olarNi6kfYfLEl9oUyM+YakxpXJKufQPdPM9bowi6yyT5ext9m34Ox8kO1St+1dGv8shZPObt24CLT0Rx3cnoPQ3JDLfmmMc9i+SCdH59c2vC6Pv80nFvuFRoWUUg92WLBITKjIfm/8FTRiYCsqKsRhrsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOZVJ2wq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOZVJ2wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774945413; x=1806481413;
  h=date:from:to:cc:subject:message-id;
  bh=HqX7xpk0Nh1GkbdlSAPyvz7brLcjK2lk3Ak6Ayvku0U=;
  b=UOZVJ2wqqF25ik4EUyXHeooZY+ZmzDT7skdnse8MsoyvdqanDWgFce+b
   OuVB7Tb+H+vJaYIVzpJFlJvJKyJ48+nsQ89ujxpypnK0PJ68p2F+f1b7N
   AwZsFvb5ScNIg6QRIEAawxDyhqjSyKOr7eDoQhQ2pZJkzWOrJpt2PES+D
   3cRoiopbrs4hp2xqcGTL2E2TMsgpj07Ts/ewdFOm2XCpbD6dastUa83c7
   oEelE1lXxdM7Ou4A3q3A97rcVeHWUGrj6kax0PIofrwd0PB4r+PjDs0U9
   V8niqR2bpHQC+iuvaBgGwK4SvT78ybUvqJgV79JkktGLE3PbcXL2AFJOH
   g==;
X-CSE-ConnectionGUID: tMEADg6eSF+zm8+uE78fRw==
X-CSE-MsgGUID: 6MYqPnvTS0296IYn5BAljA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93533768"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93533768"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:23:32 -0700
X-CSE-ConnectionGUID: gnJr02s9SdO2eHxIqgDtzg==
X-CSE-MsgGUID: oV5ikPTES9qfByXjH1RAEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230757657"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 01:23:30 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7UNk-000000002Pj-0RSg;
	Tue, 31 Mar 2026 08:23:28 +0000
Date: Tue, 31 Mar 2026 16:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] arch/arm64/kvm/mmu.c:394:
 warning: Function parameter or member 'kvm' not described in
 '___unmap_stage2_range'
Message-ID: <202603311618.n0d8DBCp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: b66e27a61e1f4f713201f1cd1d475da9309218ae [2/2] ANDROID: KVM: arm64: Unshare pages from __unmap_stage2_range()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603311618.n0d8DBCp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311618.n0d8DBCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311618.n0d8DBCp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:394: warning: Function parameter or member 'kvm' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:394: warning: Function parameter or member 'addr' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:394: warning: expecting prototype for unmap_stage2_range(). Prototype was for ___unmap_stage2_range() instead


vim +394 arch/arm64/kvm/mmu.c

b66e27a61e1f4f arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  355  
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  356  /*
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  357   * Unmapping vs dcache management:
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  358   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  359   * If a guest maps certain memory pages as uncached, all writes will
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  360   * bypass the data cache and go directly to RAM.  However, the CPUs
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  361   * can still speculate reads (not writes) and fill cache lines with
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  362   * data.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  363   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  364   * Those cache lines will be *clean* cache lines though, so a
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  365   * clean+invalidate operation is equivalent to an invalidate
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  366   * operation, because no cache lines are marked dirty.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  367   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  368   * Those clean cache lines could be filled prior to an uncached write
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  369   * by the guest, and the cache coherent IO subsystem would therefore
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  370   * end up writing old data to disk.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  371   *
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  372   * This is why right after unmapping a page/section and invalidating
52bae936f0e7be arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  373   * the corresponding TLBs, we flush to make sure the IO subsystem will
52bae936f0e7be arch/arm64/kvm/mmu.c Will Deacon      2020-09-11  374   * never hit in the cache.
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  375   *
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  376   * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  377   * we then fully enforce cacheability of RAM, no matter what the guest
e48d53a91f6e90 virt/kvm/arm/mmu.c   Marc Zyngier     2018-04-06  378   * does.
363ef89f8e9bce arch/arm/kvm/mmu.c   Marc Zyngier     2014-12-19  379   */
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  380  /**
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  381   * unmap_stage2_range -- Clear stage2 page table entries to unmap a range
c9c0279cc02b4e arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  382   * @mmu:   The KVM stage-2 MMU pointer
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  383   * @start: The intermediate physical base address of the range to unmap
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  384   * @size:  The size of the area to unmap
c9c0279cc02b4e arch/arm64/kvm/mmu.c Xiaofei Tan      2020-09-17  385   * @may_block: Whether or not we are permitted to block
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  386   *
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  387   * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  388   * be called while holding mmu_lock (unless for freeing the stage2 pgd before
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  389   * destroying the VM), otherwise another faulting VCPU may come in and mess
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  390   * with things behind our backs.
7a1c831ee8553b arch/arm/kvm/mmu.c   Suzuki K Poulose 2016-03-23  391   */
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  392  
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  393  static int ___unmap_stage2_range(struct kvm *kvm, u64 addr, u64 size)
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11 @394  {
b66e27a61e1f4f arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  395  	if (!is_protected_kvm_enabled())
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  396  		return kvm_pgtable_stage2_unmap(kvm->arch.mmu.pgt, addr, size);
b66e27a61e1f4f arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  397  
b66e27a61e1f4f arch/arm64/kvm/mmu.c Quentin Perret   2022-07-06  398  	return pkvm_unmap_range(kvm, addr, addr + size);
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  399  }
776adf654a1f64 arch/arm64/kvm/mmu.c Quentin Perret   2022-05-11  400  

:::::: The code at line 394 was first introduced by commit
:::::: 776adf654a1f64054a76876923c1606224e431cc ANDROID: KVM: arm64: Pass kvm struct to stage2_apply_range()

:::::: TO: Quentin Perret <qperret@google.com>
:::::: CC: Quentin Perret <qperret@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
