Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA022D8768
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408882; cv=none; b=UhoQfxBdgRoyI6sXw6W5R+K/AAzvMvPZxv5pCG/759ESK0n7y1Ckh57UDKuQFV3vDhOADEG0b3sRl0WjUQZP0ViIYgW1krt/5X20CeHfBcJP4F25dwwirjC/7SURLNuqDuNHO1hRnc7vlERB4f+xM+/CEbRP+9ifNFWGiTZGVcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408882; c=relaxed/simple;
	bh=JsSZMB1VUaQ4JgPG6ZMQ8EKdIkRXlSxGX1WR896WUO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kEcVchqUPa4bSnmwiK1nbPSMBxHIQV3Gp6LoMDRx44inl+pKw6Y+YGwErTD0MAL9ii6Pjo1ALl7D4rkYLTjK69EVJ6PPyJfhPwXdYQ++tHqV5bDp1EmMaQH1Fh0php4fuS5xf3/W16mw2UUQH9EZa05ng2o2QuYVtHoqajvc+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM4ap9La; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM4ap9La"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766408877; x=1797944877;
  h=date:from:to:cc:subject:message-id;
  bh=JsSZMB1VUaQ4JgPG6ZMQ8EKdIkRXlSxGX1WR896WUO8=;
  b=LM4ap9Lam6SlowTBBwP467NhjJ34Nes7ai9JnjnbkntWCVstlDV4764i
   n+wIKb/Sb+A/gD2C6hE1wX3cpOgKu4fRnBneMs2hoIDBE5jCjWS6e/Kn6
   hXPfEqh4JkmGKv507/i0L5sUGCRqEun40cJ1rZ+2MXtMFyher9MnQ3LGH
   jBbHZ+6n2KHJkRg1iz8WNHfhLwUCsRLAegENmoxeRELY3Tark/Y7g0xUC
   hDwCvFnGRLfppMWFnG4xaQqCH88dBpuM2ExeiMv+TNXQ1VjrcIoRPRRmw
   5h7WK224/OmjqH0ogTZ9Ro1tnfIzNdWFXJI3mUj7tc2TTYBQLzmshO7TS
   A==;
X-CSE-ConnectionGUID: 7kCNJ53WRdO4O/A3Hx0d3A==
X-CSE-MsgGUID: RibIm/+VT36Sc1h6RX0PYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68336790"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68336790"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:07:56 -0800
X-CSE-ConnectionGUID: Lb2+MEBVQZeJk42V0vMwqA==
X-CSE-MsgGUID: WOZ6QsDDR/SEFpzIid99TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="223009418"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 05:07:54 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfdg-000000000bY-2VLA;
	Mon, 22 Dec 2025 13:07:52 +0000
Date: Mon, 22 Dec 2025 21:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] arch/arm64/kvm/rme.c:799:16:
 warning: variable 'data_flags' set but not used
Message-ID: <202512222100.DZ0g6W61-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: e216f77846eeb7062baa345cea2be0978dea94cc [3542/3542] [v8-19-43]arm64: RME: Allow populating initial contents
config: arm64-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251222/202512222100.DZ0g6W61-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222100.DZ0g6W61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222100.DZ0g6W61-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/rme.c:742:7: error: call to undeclared function 'kvm_slot_can_be_private'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     742 |         if (!kvm_slot_can_be_private(memslot)) {
         |              ^
   arch/arm64/kvm/rme.c:763:9: error: call to undeclared function '__kvm_faultin_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     763 |                 pfn = __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), FOLL_WRITE,
         |                       ^
   arch/arm64/kvm/rme.c:771:9: error: call to undeclared function 'kvm_gmem_get_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     771 |                 ret = kvm_gmem_get_pfn(kvm, memslot,
         |                       ^
>> arch/arm64/kvm/rme.c:799:16: warning: variable 'data_flags' set but not used [-Wunused-but-set-variable]
     799 |         unsigned long data_flags = 0;
         |                       ^
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/data_flags +799 arch/arm64/kvm/rme.c

   794	
   795	static int kvm_populate_realm(struct kvm *kvm,
   796				      struct arm_rme_populate_realm *args)
   797	{
   798		phys_addr_t ipa_base, ipa_end;
 > 799		unsigned long data_flags = 0;
   800	
   801		if (kvm_realm_state(kvm) != REALM_STATE_NEW)
   802			return -EPERM;
   803	
   804		if (!IS_ALIGNED(args->base, PAGE_SIZE) ||
   805		    !IS_ALIGNED(args->size, PAGE_SIZE) ||
   806		    (args->flags & ~RMI_MEASURE_CONTENT))
   807			return -EINVAL;
   808	
   809		ipa_base = args->base;
   810		ipa_end = ipa_base + args->size;
   811	
   812		if (ipa_end < ipa_base)
   813			return -EINVAL;
   814	
   815		if (args->flags & RMI_MEASURE_CONTENT)
   816			data_flags |= RMI_MEASURE_CONTENT;
   817	
   818		/*
   819		 * Perform the population in parts to ensure locks are not held for too
   820		 * long
   821		 */
   822		while (ipa_base < ipa_end) {
   823			phys_addr_t end = min(ipa_end, ipa_base + SZ_2M);
   824	
   825			int ret = populate_region(kvm, ipa_base, end,
   826						  args->flags);
   827	
   828			if (ret)
   829				return ret;
   830	
   831			ipa_base = end;
   832	
   833			cond_resched();
   834		}
   835	
   836		return 0;
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
