Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218C939BFEF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778802164; cv=none; b=H5HPZLG5720NbM+R3BwnYtdC5+zM7NPltyHG5ETiKVV7UwYSGNGroJDurQQ69jOQWmaVPfkYpLF69cnhj1OKe5Tf97uhiZjPA84fLNxYyKb2Cd6MGGj1vXMH0EvIzLXnovPMnF9SRknIIHCxk88QW3x8lDFbGSE0p/C4Nyl57KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778802164; c=relaxed/simple;
	bh=fKZUYsK7Fse8+y2KOAfa2BYewwxrkndH71aW4jtkVUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cbWIB9f+fB3r2sEs726NKoEoA3uhfZpgmBMt12wnMaBCoq+gBuh+TteN03U3hVWUdxkcXJX6yHwoVsZ5mSQsFdZznqekhf+kxDET0qwAmbG87yHBHZekkmGp1Kbk07cvjAH2cw9yLVM5O4SyiS9OeYpdwrMM5hpDQYiQdHqZ7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDnloWHL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDnloWHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778802162; x=1810338162;
  h=date:from:to:cc:subject:message-id;
  bh=fKZUYsK7Fse8+y2KOAfa2BYewwxrkndH71aW4jtkVUA=;
  b=XDnloWHLLHpUmM60aGAAmf8/eSlAAGQ/Uublpiueqg9OdZBQ9Po60W2U
   B5hHyeOfuBW5hVoVb97uM7riec11sHGx783Bc+kGrjD6itZVEmplJentf
   ZeaKgq3DUxhYL3U/Bpu2o4xKx2GzbxiJfuU8fMMJijv6tyzogIphUSAnX
   Wu170YBNaffMhO7aaW1FlWl54oyqWR+64fUrnUFRZJHrQKnYTQ+34lK1n
   HGHudJTswkyHCFkAepsT/Hudd0KFkSxOr4LmJsKZA+yxUZIxvnHdhux7G
   T8hyjZjgqsjn4cVDG9CcUHBrBj6XfpxleFcE9MwZ7P42mYFOT5jPGSxLL
   A==;
X-CSE-ConnectionGUID: z9Xg5GrwQUOSHmJkbco6qA==
X-CSE-MsgGUID: GR0jxaDuS2ui3jf2k+NVug==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83625033"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83625033"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 16:42:42 -0700
X-CSE-ConnectionGUID: Le04r1sYSjOnuRiwAe4gDw==
X-CSE-MsgGUID: +QwPxa4gRVmU2LmQ8N8VEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238783996"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 16:42:40 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNfh0-000000000MB-0l8H;
	Thu, 14 May 2026 23:42:24 +0000
Date: Fri, 15 May 2026 07:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202605150726.o86hgj6S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: 28b92141c6f37f35b82f00410d87d5727bfce827 [2/2] ANDROID: KVM: arm64: Add stage-2 pagetable snapshot walker
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150726.o86hgj6S-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150726.o86hgj6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150726.o86hgj6S-lkp@intel.com/

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
