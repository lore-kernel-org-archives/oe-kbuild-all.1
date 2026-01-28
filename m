Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C92D46D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619031; cv=none; b=m5XJR3dR2pcrcQw9KmPOF2lpAgEf4hUbANad6SLRTyskyzK01vHsJwUMI81qy7+oburzWXIxrN0567azEfLfTIbVMH8SdLL/BAuURPCa4oYfWQTEKXjrQbyGh5HkAyFqWCHA4Xct7T89QdtTK9w+xRXpZ9IkG4Lsc/VTUWaHZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619031; c=relaxed/simple;
	bh=GejeJ0lHV8J2QR1kadWGAEEQTkFIaire8G9L1RCFrXk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mwwa+qkhf5YalsgDvHPMQZesfL/uJEG6qZ2sbsx5vVBbgPe61eMn22UdxI5sEOhqbW1Bz02ExX4tJdvvo5nr6v5mrYObFOSKpZlvtpvoIwhrOuMP6abcsWgEJbhKTp+eAbtD2pNjk2YQrlDM7+DNRWAbpRVpnUnFLokFs4stIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGvmr2l8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGvmr2l8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769619029; x=1801155029;
  h=date:from:to:cc:subject:message-id;
  bh=GejeJ0lHV8J2QR1kadWGAEEQTkFIaire8G9L1RCFrXk=;
  b=NGvmr2l8KjjeN6rmN+zgPkRyEULBICJINGcqwcrxt6Ho6WfM0Huo7G6o
   VR6k9rdOPQXkOHL3NQRpn248gCAsFuCTwadWI5yBr2CrNm38Jxih9h/5R
   X3JhThFXK9kODraHystYkeN8cEk+n98jsZQ1RFKcSbzErZddhO7/SZYPA
   9g4p+3OoFl8x/AC2ySqSAl6MUy7dSa7RpTafB3aJGBwgDXvo3y3WwJvlN
   +Q+bIIMjR2PEUoYMawxKbfnB5TRPsQOGETX/3XP4Lr03bkEtZNd2JRh71
   cTdkHNCkTEaOwryQvhRUIbMfOuwXEkEwncwFDTFYlUI5YgcGyldgoIHlM
   Q==;
X-CSE-ConnectionGUID: tsPF9A7pSH6+PbTfOj/YZQ==
X-CSE-MsgGUID: EY0Dlp2NTa207NPf2ZUilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96299337"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="96299337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 08:50:28 -0800
X-CSE-ConnectionGUID: q8M6WrvVRle+UquENS0LkA==
X-CSE-MsgGUID: CA3ut6E4Qg2QkwTm8p9Neg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208336906"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 08:50:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl8kK-00000000abI-2mLa;
	Wed, 28 Jan 2026 16:50:24 +0000
Date: Thu, 29 Jan 2026 00:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8/8]
 arch/arm64/kvm/hyp/pgtable.c:1784:22: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601290004.QjhtcrlT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5a8f9765bd232fdc77183cca9f99196fa87b1bcc
commit: 28b92141c6f37f35b82f00410d87d5727bfce827 [8/8] ANDROID: KVM: arm64: Add stage-2 pagetable snapshot walker
config: arm64-randconfig-r131-20260128 (https://download.01.org/0day-ci/archive/20260129/202601290004.QjhtcrlT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290004.QjhtcrlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290004.QjhtcrlT-lkp@intel.com/

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
