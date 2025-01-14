Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CF20F981
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736860130; cv=none; b=sPBQvsoR/8h+uN5vYc/k0u0nbWM6ayShyYjuMWxMEkf2/QIb0q2de/OaapsNFC3nc0cKpQA6QWh3OYZh2wt4EKw+FpYVqgJzE1pmYiXR+RMyTGRKpVpihMvE7E/0zJ42znk2qd5p3802Ho9X2vaNIXtWNfS1zteEuTSa4kDIdN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736860130; c=relaxed/simple;
	bh=s26PXw+8OdVI23blizg1NhISH2c/Rq82ZQ+XzZaa+Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lngWY7tELxUu0jGFSE+KVeLjRQsoRHWcV0ETBr3EsOJLTa90ZaXSNhATkk57fTy61Avs9ob6NRE3bCiRBo4E0CpS3HtZrwuEKmiqfojk+ArYBLIZqfJumbqTIRyiAnBazQx4qJd4UdcsbXUMY0NfOcRd8EICPalbLpM58n9y6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXdfOhBf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXdfOhBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736860129; x=1768396129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s26PXw+8OdVI23blizg1NhISH2c/Rq82ZQ+XzZaa+Aw=;
  b=nXdfOhBfTsc0lIWLE2LQOm/wTnrWdQRAQqKt02UUZOAX6BgbxFvQYdxI
   P3weakzvDYJmWoVKSLKPDltu/ZisVD4unvyniE5ggjvStWQzzO2Avbofv
   Hq3onPMBToDm5hVz03JgDm1hfmkuWPV6EtQKPRVyMTQsML2UcN5sJ2BZE
   vjaciul2Ut/P4olHqg4agrxSu1kwMBkOJ+X2DMezROtAZzlZ6beT/VnGg
   ozwGSfBw+H334gAqwTLvJ7ORb5fKX4HTvIMWyCCaxAWGtGpjhP9TSYuVX
   /ZndMLmgUNOWctExoSReQRctq01rWsNzYqDrWZKQY1RybLZ/o4fqON/i/
   Q==;
X-CSE-ConnectionGUID: wCuL5U1dSkCztCkoidnB4A==
X-CSE-MsgGUID: unUlFGuLR6uqMTCCV6MwRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37309769"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="37309769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 05:08:48 -0800
X-CSE-ConnectionGUID: 1rbqmoAiRh6mb8eEWPlw1g==
X-CSE-MsgGUID: 5KNflKybTX2T9228eqoxZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104880100"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2025 05:08:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXgey-000OXD-0s;
	Tue, 14 Jan 2025 13:08:44 +0000
Date: Tue, 14 Jan 2025 21:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 21/21] arch/arm64/kvm/mmu.c:305:1:
 warning: no previous prototype for function 'kvm_pinned_pages_insert'
Message-ID: <202501142136.SCAqd2YD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f22b02c4734528b9236a218ade97555cfae01fbf
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [21/21] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-randconfig-001-20250114 (https://download.01.org/0day-ci/archive/20250114/202501142136.SCAqd2YD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501142136.SCAqd2YD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501142136.SCAqd2YD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:305:1: warning: no previous prototype for function 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     305 | INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
         | ^
   include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^
   <scratch space>:73:1: note: expanded from here
      73 | kvm_pinned_pages_insert
         | ^
   arch/arm64/kvm/mmu.c:305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   include/linux/interval_tree_generic.h:38:10: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |          ^
   arch/arm64/kvm/mmu.c:1842:14: warning: variable 'ipa' set but not used [-Wunused-but-set-variable]
    1842 |         phys_addr_t ipa = fault_ipa;
         |                     ^
   2 warnings generated.


vim +/kvm_pinned_pages_insert +305 arch/arm64/kvm/mmu.c

   304	
 > 305	INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   306			     __pinned_page_start, __pinned_page_end, /* emtpy */,
   307			     kvm_pinned_pages);
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
