Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D210E3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338811; cv=none; b=djr74CZ/s7+CNbvyAF2npb9VyN1gVQo4lQQXD//k7vupsvlvI/Xp1zgAX79eV4Tcw2RtxL/ZqjKVDXkpvu/Ay7AiVdJgLLQLzp6+DFMDhpytQHk3q88OHyjFlR1/zV/Ax042H9wZnG5oXhqcf++xII+CcujCftAORnjGyucADzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338811; c=relaxed/simple;
	bh=P80nLXKhBsEdRblGLgZU3Xe2yLvrsS4q5oa2hNkxRJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BdNYm2nJsyRthW/T5Q96AtyGIOly6PSfmPqvFXelfD/b8GsvWNqauoo0dUvhJNOqc5e3Iyf/Xc+zHeWOZiR7RDEBuY40zeKxG8ZZYwdWmgd+Tmnkvjps3DO5vpcNLLjC2pMx71AfAmE40t7LujpelA3WFpceZA9xnCD8rtsD+4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW8lLCfB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW8lLCfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709338810; x=1740874810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P80nLXKhBsEdRblGLgZU3Xe2yLvrsS4q5oa2hNkxRJ8=;
  b=OW8lLCfBsrSREnJzu1RyNzpPDnaJnO1lCuPOocIvyZV62O2OvS5nus/2
   u1gyHbBZIqGIKqwiwp0+PwRCz7Ekfxjs5pdC2/F9EsT6eOsDthffAiAeu
   cIxK4I0UyfEmkLABtGro/yDyCMYelQB8yZcXNQNvoeBVhREAm0cMAektV
   FdCDIqzg2/QlKn/4OCPTKyzvEbEGgPF1Fa7OqSu9usIhv/4fcZJvimbNn
   Cevhm2Z4TFmbK2sh2MoNsdsgkAqE2n18t7mSt1GICqySsC1KcCIZ66+RD
   UKhGQZ9MyVYIsWFVzd7tQPqVx2A2YzWDS5/sr8yyYnHgptbH9kZk/lrP5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4018679"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4018679"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:20:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="13022359"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2024 16:20:09 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgD6k-000EBr-1l;
	Sat, 02 Mar 2024 00:20:06 +0000
Date: Sat, 2 Mar 2024 08:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 21212/21225] arch/arm64/kvm/mmu.c:325:
 warning: Function parameter or member 'kvm' not described in
 '___unmap_stage2_range'
Message-ID: <202403020848.NhQvWYG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   9fb9c28f7505def5e73aa702321678ac6fd67a55
commit: 6ba13efef403b22c63cc425313097dde4c832664 [21212/21225] ANDROID: KVM: arm64: Pass kvm struct to stage2_apply_range()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240302/202403020848.NhQvWYG2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403020848.NhQvWYG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020848.NhQvWYG2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:325: warning: Function parameter or member 'kvm' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:325: warning: Function parameter or member 'addr' not described in '___unmap_stage2_range'
>> arch/arm64/kvm/mmu.c:325: warning: expecting prototype for unmap_stage2_range(). Prototype was for ___unmap_stage2_range() instead


vim +325 arch/arm64/kvm/mmu.c

   286	
   287	/*
   288	 * Unmapping vs dcache management:
   289	 *
   290	 * If a guest maps certain memory pages as uncached, all writes will
   291	 * bypass the data cache and go directly to RAM.  However, the CPUs
   292	 * can still speculate reads (not writes) and fill cache lines with
   293	 * data.
   294	 *
   295	 * Those cache lines will be *clean* cache lines though, so a
   296	 * clean+invalidate operation is equivalent to an invalidate
   297	 * operation, because no cache lines are marked dirty.
   298	 *
   299	 * Those clean cache lines could be filled prior to an uncached write
   300	 * by the guest, and the cache coherent IO subsystem would therefore
   301	 * end up writing old data to disk.
   302	 *
   303	 * This is why right after unmapping a page/section and invalidating
   304	 * the corresponding TLBs, we flush to make sure the IO subsystem will
   305	 * never hit in the cache.
   306	 *
   307	 * This is all avoided on systems that have ARM64_HAS_STAGE2_FWB, as
   308	 * we then fully enforce cacheability of RAM, no matter what the guest
   309	 * does.
   310	 */
   311	/**
   312	 * unmap_stage2_range -- Clear stage2 page table entries to unmap a range
   313	 * @mmu:   The KVM stage-2 MMU pointer
   314	 * @start: The intermediate physical base address of the range to unmap
   315	 * @size:  The size of the area to unmap
   316	 * @may_block: Whether or not we are permitted to block
   317	 *
   318	 * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
   319	 * be called while holding mmu_lock (unless for freeing the stage2 pgd before
   320	 * destroying the VM), otherwise another faulting VCPU may come in and mess
   321	 * with things behind our backs.
   322	 */
   323	
   324	static int ___unmap_stage2_range(struct kvm *kvm, u64 addr, u64 size)
 > 325	{
   326		return kvm_pgtable_stage2_unmap(kvm->arch.mmu.pgt, addr, size);
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
