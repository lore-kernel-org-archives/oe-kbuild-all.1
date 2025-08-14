Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2A266B59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 21:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208692; cv=none; b=mvNTIzyUuheMK87ZXLr/DBXKPd/iMCk5UaVBnG0dHINgBAL5Q4wwpje9ycQLgsdj3yA3eDivqOqvy6xGdtVSbpjL4tYLRXviusa6lMhpOPpY5xP8T0pMP0Z4pAYX9jfEdnWd+499euH6mciAWrQyrKx/bX26bn6UyqnFuTiksDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208692; c=relaxed/simple;
	bh=k5hN13nK5Iz/1CkEj6RrdSC5aI9hGV7EFvN6J9Alp+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeS3NtrudNy27D492cGhJ2dBD0goWSFQPt2Qo5Z1DPbd/wvWQCSOuzVt/hVt3VWafXGOayFl+gfzuQ3U7SRsw9gi1cCOTkETssYZ1FyCdF+QJgwqYeHwvti0e3sov+FKGDNIYE7NCb9O8wu1fcJqjz35EOJZL2p0f+sXHhvMZWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G64ObjNQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G64ObjNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755208691; x=1786744691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5hN13nK5Iz/1CkEj6RrdSC5aI9hGV7EFvN6J9Alp+E=;
  b=G64ObjNQw6RsX8dK1tQqDl1tdoafYuhUeIU+GDgIn9bn2INzvyfGtoq/
   4gFzINQDF0WjfwzpPmR+KdX9vVeuWlf41nZ9EmijpApm18IYORe0DKWdj
   yy+91D/qzGuEH/bhDrT3nJWg/pq6vkI7nLYxF8yVuzQybPox3l2PMnpy8
   9ivnSiX3MFVSffmXDehSRJl9jV5Lf05ah+TIG/SqcjJV8xOu8Aly5DdbL
   tR3AY23mHqQ5wWXAPpHkwXJyetFH9t+O0TnRbe0H8OUI8t4Eh+y0C0kM7
   x9BXKNcqphhAd7YfmTi8Nutww8JjFR0HxUfkMcI4s/zCvA9Z7aIwdFQRl
   Q==;
X-CSE-ConnectionGUID: vmIyQMYRT8awjo+nt8TMoA==
X-CSE-MsgGUID: aL8e06TRQ/i8hzUJi6FBfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="74988978"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="74988978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 14:58:11 -0700
X-CSE-ConnectionGUID: 1f+/ErMSSziVon43ZGafKA==
X-CSE-MsgGUID: RTbGT5dxTxyth2g6sC0xHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204052448"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 14:58:10 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umfxX-0000LP-2B;
	Thu, 14 Aug 2025 21:58:07 +0000
Date: Thu, 14 Aug 2025 23:57:21 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] arch/arm64/kvm/mmu.c:305:1:
 warning: no previous prototype for function 'kvm_pinned_pages_insert'
Message-ID: <202508142359.jjpn7NxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [4/4] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142359.jjpn7NxL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142359.jjpn7NxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142359.jjpn7NxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:305:1: warning: no previous prototype for function 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     305 | INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
         | ^
   include/linux/interval_tree_generic.h:38:15: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^
   <scratch space>:124:1: note: expanded from here
     124 | kvm_pinned_pages_insert
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
