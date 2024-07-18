Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C614389A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336336; cv=none; b=ljhEvVVdOzgelA+8pk0baKAuxnL+A8arkKhCKXbi7HelTDUxP1OCjjaHJiTLHXDXW/wWtDJk5b7ISotj2g3G6o6mHjoQyKjBPkXAUDbzO05Q2QSZv0PqditRA8S5FcwYtMc3+BHeOJrCg5/2Eo4nMT7ehKt07JZeVFqFpKCUp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336336; c=relaxed/simple;
	bh=H1wkUXdsDwAKsn4DG15w0V4fKyqmeRoxkGOJzKDljy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4wCOrmhH3nOnSPJv5VRyFnYsph/RJFRpBBqPiVbCdoLmJY9XU9g9JSzdzEDiArM+dAFFLqfaQNeh8TlLDNEJ/zAfkok6VRY9jSfio2Z/Ay1eED6WG1rzGGoHy9ogufbcAcWlZ9OByg/B1Dnr0RbfdFHF7+RaW6dweD5K5P3j3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILnoe0F7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILnoe0F7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721336334; x=1752872334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H1wkUXdsDwAKsn4DG15w0V4fKyqmeRoxkGOJzKDljy4=;
  b=ILnoe0F7KLqm6PalChsISu4UB8+B80T4qEobtDLA5affJ+4j6GXV4oQL
   8pwBTDY6SjahxbJ65l/ZOhcnvkrjdTtVf9KLmzJOfXMhzsdVMy9JdEixr
   jtm9ZHh15Ls9Kzac8LqOLW55KOhfLLsWVEO/s+gpsECViG5aHrbIrEUMe
   TRS2XTPKpCKnI5zu+nrrlgn+JgwQi9Dpx2Zb8zdSpo5sgtCdgDHYFJqEq
   xlCFnjnnnAFsmB8oPlc9Hzsv2ktKwGRtkclcMFFVlv0TS7HAm6e4DG2Wv
   LPU0KVSUxodfoR+L87BX93LSmilA3VUr+gzKFwPixBnI7wjdbuIfIgKH7
   w==;
X-CSE-ConnectionGUID: ReLbEprIQl2CgLlaciSgQQ==
X-CSE-MsgGUID: GGH7/cGqScSAGdf1hyeymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="12614583"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="12614583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 13:58:53 -0700
X-CSE-ConnectionGUID: FMoLsbDZTku2C+gQhmeQ+Q==
X-CSE-MsgGUID: u73q9bWBSvabwFkUcLwzHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="51175976"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2024 13:58:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUYDC-000haA-0A;
	Thu, 18 Jul 2024 20:58:50 +0000
Date: Fri, 19 Jul 2024 04:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/10]
 arch/arm64/kvm/hyp/pgtable.c:1784:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202407190407.3xFi4137-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5bea47f9916929b7b92c5d44034af49bbfb55dc6
commit: 28b92141c6f37f35b82f00410d87d5727bfce827 [3/10] ANDROID: KVM: arm64: Add stage-2 pagetable snapshot walker
config: arm64-randconfig-r113-20240716 (https://download.01.org/0day-ci/archive/20240719/202407190407.3xFi4137-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240719/202407190407.3xFi4137-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407190407.3xFi4137-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/pgtable.c:1784:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:22: sparse:     expected void *
   arch/arm64/kvm/hyp/pgtable.c:1784:22: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
>> arch/arm64/kvm/hyp/pgtable.c:1784:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd @@
   arch/arm64/kvm/hyp/pgtable.c:1784:36: sparse:     expected void const *
   arch/arm64/kvm/hyp/pgtable.c:1784:36: sparse:     got unsigned long long [noderef] [usertype] __rcu *[usertype] pgd
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
