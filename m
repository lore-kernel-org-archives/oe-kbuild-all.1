Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10415471D05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866442; cv=none; b=hPYp5snvCL5j3QA+hDNY914hzQePxAg8hFQ0D7S+WTDEQdfro+lHEf3B96W2JaZM+iWlpJ9E7l6b0VIcwNiaA6JeJ+IgWRZeiNyf6Ico8IVpvGdsAu3MRrutRAt0EzjqIdwiR4IK8+clUn7y0CXv7DA/KjdyZsj/ovFH8hkvbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866442; c=relaxed/simple;
	bh=/0O6LE24NcKOW5o6o6ngBAC9fRpr6qmmI4epNYn0uag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8rcIJPIchyaFG5yIp/xgmSf/S5Ts84flzfj2lv83x7ZYhs1MOUUiT4XWYFvtcGN1ChGWbXK1j+A6RbnQYdZl6pQm8n3j8wqyq+4m+Hw0QUwAJjFJiLrtwCO4DM/JEfo2uncpFHwiqehNNOgwdfXK5UwOS1L3LgVMQPKwgfvSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dExI8gHg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dExI8gHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791866441; x=1823402441;
  h=date:from:to:cc:subject:message-id;
  bh=/0O6LE24NcKOW5o6o6ngBAC9fRpr6qmmI4epNYn0uag=;
  b=dExI8gHgEp/1R0A+1IB/4GG09BhE92iZXz7IayvsEBBINZ/WLxoq3HLC
   0/sJ/4foeySMQk74q0gXTEyyasM+7BgqoT7J+ac+tU/4cq3zZtqkIV7ws
   zzaYc3AATmg9nLiFfUX17Y8WoFJINANEEWmEeW3ICRmRdCzo+rRwu/U9y
   l36jWO75dNdRXqmy59/0ry0yj36xtg8dKtfCoySw7X7QjXyttzkLSBAz8
   0a/6YaJfpahW0cFBa6hJYRClHM7Ut8RtY2kMz3xkikRjpk2cxoXEV3IBW
   55UT9h3LcOcJR79v+TxymfZ7teDrhu2BIxjEQbWkWon/YHflccryM4OlS
   g==;
X-CSE-ConnectionGUID: KZ4ArQvwSsOWIvYdGhIG3w==
X-CSE-MsgGUID: sBDgagOmT9OD1+tAe3VHKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="481996"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="481996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 21:40:40 -0700
X-CSE-ConnectionGUID: thx3VL7URL6++fyoSfFIeg==
X-CSE-MsgGUID: ZwEjWCGvR3yiHTIvAxMyqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1521103"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2026 21:40:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGUJY-00000000AOF-2ijx;
	Tue, 13 Oct 2026 04:40:36 +0000
Date: Tue, 13 Oct 2026 06:40:26 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 4/4]
 arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202610130653.6UkH8i4B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   0670949d6852a5c556e94abd6e62b945e30d41db
commit: 28b92141c6f37f35b82f00410d87d5727bfce827 [4/4] ANDROID: KVM: arm64: Add stage-2 pagetable snapshot walker
config: arm64-randconfig-r2302-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130653.6UkH8i4B-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130653.6UkH8i4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130653.6UkH8i4B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
>> arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
>> arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
>> arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
>> arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
   arch/arm64/kvm/hyp/pgtable.c:269:5: sparse: sparse: context imbalance in 'kvm_pgtable_walk' - different lock contexts for basic block

vim +1784 arch/arm64/kvm/hyp/pgtable.c

  1764	
  1765	int kvm_pgtable_stage2_snapshot(struct kvm_pgtable_snapshot *dest_pgt,
  1766					struct kvm_pgtable *src_pgt,
  1767					size_t pgd_len)
  1768	{
  1769		struct kvm_pgtable *to_pgt = &dest_pgt->pgtable;
  1770		struct kvm_pgtable_walker walker = {
  1771			.cb	= snapshot_walker,
  1772			.flags	= KVM_PGTABLE_WALK_LEAF |
  1773				  KVM_PGTABLE_WALK_TABLE_PRE,
  1774			.arg	= &dest_pgt->mc,
  1775		};
  1776	
  1777		if (!to_pgt->pgd || dest_pgt->pgd_pages < (pgd_len >> PAGE_SHIFT))
  1778			return -EINVAL;
  1779	
  1780		/*
  1781		 * Walk the destination pagetable with the original PGD entries from
  1782		 * the source, then descend into the newly installed leafs.
  1783		 */
> 1784		memcpy(to_pgt->pgd, src_pgt->pgd, pgd_len);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
