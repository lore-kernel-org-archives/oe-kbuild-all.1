Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193C19882B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 22:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759530190; cv=none; b=PhpWg6IpeiawJcBX2i2CMBRhmu84S/jUx3a2K9b1vjrjFFk6hZN3U2aF9sZw6iZABv4wS8stwi5joBy2Nq/rQzv3OVAZ5A4PdGHdlk5IIHlXP1WoiKrP2cjD11tsXCig7Xp7tAYbeKe7hQYVfoJXdq0jkWH9pUR2EW1x5VX7IS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759530190; c=relaxed/simple;
	bh=2SIteGMx6NczlhPxs/nyIjEIOo0Mo8DN86/uK9zvzFs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwoh55dFnRxr9rZ/Y/n4BmGzHFEIs140pXJhxXoU1A14WoNC9vzUPUTOqXdHuT4Y5bea6l9+93n/MXcYIK26NByK6iVA1WH6GZPUJEt33hlaL1ZBlmZPZ1tQrWOPMHj5W7ltiLY7t07Mz60J2I5Baf3HgO0cebl1n8LdHMiIbQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nducRFc8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nducRFc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759530189; x=1791066189;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2SIteGMx6NczlhPxs/nyIjEIOo0Mo8DN86/uK9zvzFs=;
  b=nducRFc8u0umJ7XJRVHFsbaxzZRXdeY/DrSA15dwN6zfWjT95sQioO6P
   2yZlc6kkaCDNojm1vzdp/ZaZJzo22/nvcPK+gkwESXBnRgTPpSo8u1BeI
   T8OG33ijpASVCn8pWDjLOj6iGdFOo1pENUURX8lEG+OpK6PleH+b2B3Ps
   BaknT5ryL7WRsIE2XBGJTSSCp+VqskwCAxayq7EVqPaM8ffi745T2fc4n
   nf73qLFm2f/yk8ejqm1zkeKen+SsiREL9LQ/Ttqy5NeIPNKWACatLJIIj
   ZReQRMCw2kfYQbW/K0dHlYSRhTidNap1nAG0n6SGfhWyfFrTWNxg/ydFl
   A==;
X-CSE-ConnectionGUID: UzuOP3KXRYOiOQgwdPgFaA==
X-CSE-MsgGUID: aAh2WNPCRouByc/vD94V1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61523943"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="61523943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 15:23:08 -0700
X-CSE-ConnectionGUID: D0oRHJR2QNu3cje/b/+vxA==
X-CSE-MsgGUID: KxIoQ81qSi6CVuI1SjLeRA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Oct 2025 15:23:06 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4oB5-0004wN-35;
	Fri, 03 Oct 2025 22:23:03 +0000
Date: Sat, 4 Oct 2025 06:22:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kai Huang <kai.huang@intel.com>
Subject: [intel-tdx:mig-dpamt-v3 52/97] arch/x86/kvm/mmu/tdp_mmu.c:2044:40:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202510040640.MMjSZpYO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git mig-dpamt-v3
head:   365885765611aa7959870e2388dda12ce2126442
commit: dddd97198be79a9cc966723adce6a29a90de7177 [52/97] KVM: x86/mmu: Add implementation for kvm_mmu_restore_private_pages()
config: x86_64-randconfig-123-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040640.MMjSZpYO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040640.MMjSZpYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040640.MMjSZpYO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep @@     got unsigned long long [usertype] *sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse:     expected unsigned long long [noderef] [usertype] __rcu *[usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2044:40: sparse:     got unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected unsigned long long [usertype] *sptep @@     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep @@
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse:     expected unsigned long long [usertype] *sptep
   arch/x86/kvm/mmu/tdp_mmu.c:2073:71: sparse:     got unsigned long long [noderef] [usertype] __rcu *[addressable] [usertype] sptep
   arch/x86/kvm/mmu/tdp_mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:869:9: sparse: sparse: context imbalance in '__tdp_mmu_zap_root' - unexpected unlock
   arch/x86/kvm/mmu/tdp_mmu.c:1596:33: sparse: sparse: context imbalance in 'tdp_mmu_split_huge_pages_root' - unexpected unlock

vim +2044 arch/x86/kvm/mmu/tdp_mmu.c

  2034	
  2035	static int tdp_mmu_restore_private_page(struct kvm *kvm, gfn_t gfn,
  2036						u64 *sptep, u64 old_spte, int level)
  2037	{
  2038		int ret;
  2039	
  2040		if (!is_writable_pte(old_spte)) {
  2041			ret = static_call(kvm_x86_write_unblock_private_page)(kvm, gfn, level);
  2042			if (ret)
  2043				return ret;
> 2044			kvm_tdp_mmu_write_spte(sptep, old_spte,
  2045					       old_spte | PT_WRITABLE_MASK, level);
  2046		}
  2047	
  2048		if (!kvm_x86_ops.restore_private_page)
  2049			return 0;
  2050	
  2051		return static_call(kvm_x86_restore_private_page)(kvm, gfn);
  2052	}
  2053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
