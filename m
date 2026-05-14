Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDB3F4133
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 02:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727569; cv=none; b=NnLYtFcggYwBXaHRMH54v4j6QKLB5ZVFHlstnKs5/nQGljDxPtL28SPqKXcygOYLvJapuJwC9bchwiChqdJ89ypQLZA9OfDAx+HKdthLL8ysXLDg9mgphHGpl+0FUqBFWGp/mS4ivau52LhjKBzHIo5WagGnvBHiQSZiz3WLcnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727569; c=relaxed/simple;
	bh=7oIGPId6ULbhT1uFQFYRu2xLxfpr8hk6Xg67usodwGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M2vBOAoYdL/iX1ustaCJJVuPbDFnMV+PoPpQXUhf7ag9632oKj63LuHXLBVNh24MAryOrg0j6oOPpHArmnI/5cBwwqMfw5tjkhmn5/a2sCviOVoFPy68XzXF+W53ytxZCqORE7qs4QGz0S0/j5IBsY1YC7gyWOao+JqVvSlt8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQncmmTu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQncmmTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778727568; x=1810263568;
  h=date:from:to:cc:subject:message-id;
  bh=7oIGPId6ULbhT1uFQFYRu2xLxfpr8hk6Xg67usodwGg=;
  b=PQncmmTu2p9SZxuRkSygW61+WUu6SocaXDuX72jLt9ksrI61FNtIsGpW
   +pjYESQO4Zqb05H7pWj7HhJ8rSo8YllX0V/f4ECm7AD4tA/75VngRVTDZ
   B9sWewsr5tdkW30SKRb+iV1FWgQcH3skeUwZPGMnFSCru9M/ROxgchVnJ
   dLo/78i7IYv4+HCJqjaB7aPC9LE4D5h/6KgkzpeN9nSb5CcjtrgjuawTe
   8wq5yiAXXu0NchKCdw7qrqBWLXYJd+bBpbRx/D2sApMENtakL9el6ovIZ
   /vWilitx/Czl1Lfe493olspPbgrl5Rupr2oq5CQ7B6B/gTeNCFqu+lnoN
   w==;
X-CSE-ConnectionGUID: 1DgSBC41TzOfBn9wKlfl6w==
X-CSE-MsgGUID: MCEUql/VTfGke25BWvRYUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67193832"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="67193832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 19:59:27 -0700
X-CSE-ConnectionGUID: cOlZ/qDgSZqxFTSrQzh3Hw==
X-CSE-MsgGUID: mUCM2KpBT9aq+1F3TzKYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="237400085"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2026 19:59:25 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMIE-000000005iF-0TeU;
	Thu, 14 May 2026 02:59:22 +0000
Date: Thu, 14 May 2026 10:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/pgtable.c:1784:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202605141031.cGCoZdsc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5346453405bf12d7ed6003f45dd47b71744fe1be
commit: 28b92141c6f37f35b82f00410d87d5727bfce827 [2/2] ANDROID: KVM: arm64: Add stage-2 pagetable snapshot walker
config: arm64-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141031.cGCoZdsc-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141031.cGCoZdsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141031.cGCoZdsc-lkp@intel.com/

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
