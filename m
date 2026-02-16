Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E92D8379
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269930; cv=none; b=ZpbQRbBOhIXK0Oj5uBcko8imQFaMIgrkPm3/UzXo8im8OA+e/vOo+FKYIM7/7bRX5lkpfSPQsuwRr9CXjvfwLixxAHYHR0173rLBX1tj0Hr2MPp9tFJyZu8BLvE8cJoCV7Sb+dENjbMwbaJrzE52HpNmUKWw4+tkMXlTwdlWrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269930; c=relaxed/simple;
	bh=GfHNBSFKG2srYHIVplXCXarZG1ux5Q4KWSm3yRAsLwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dsym77q2buuMhSd/Thvz8pDlJ2/TulO6WYVs2hMpFJkl4dnRR/KBqmXj0XO63nmLx77C7VBFIOE6IBSRhQxu7ZrGpBcRB1xpFfRfp0pyulA5tGtlURXcYsp19QXBWK79mSWc9/6/7KUZC8OxzenlXQg86TKal2p3mNKpJe3si7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfRQrGpY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfRQrGpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771269928; x=1802805928;
  h=date:from:to:cc:subject:message-id;
  bh=GfHNBSFKG2srYHIVplXCXarZG1ux5Q4KWSm3yRAsLwU=;
  b=kfRQrGpYUGfUcv4b/oLdGeBErY3Dymz9D2+uCD+eRGITtN1gLGGP7BDA
   JLmh5cw5KPiq9weCXqriMbaCsxXqzPAl6Ndmpin1gJtFfdwLqgASonu2B
   LIXLGEBIVcJv68FJJSLOBlLO3p5AIJt7rKB679mVmRcfEQiiR7XIQsC5N
   aGbu/rcBXmEsjp7jL9KPdK6EVRnAFegVbhpG3PqpSkERv8zhe4MKVu8Ky
   akFK7dy7BlqRSvtK4LdDFesKdkIvmI2aU7Q/AujbIsuyhaXCFyHuZMlfh
   mDEh03VVYol4EI8iZKyzKFIsWzeyHRS+oWmJAQedHUKSW5/GmY2FG8Oc7
   Q==;
X-CSE-ConnectionGUID: imNO72bmQkqLkMuV35Ohjg==
X-CSE-MsgGUID: cE/PO+oARZGze6hAEn9tdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83790625"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83790625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 11:25:28 -0800
X-CSE-ConnectionGUID: 0YaVw5K6TLWGTMgko7lI5g==
X-CSE-MsgGUID: cIe+4R5GQDyH1iM5+sc11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212462669"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Feb 2026 11:25:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs4Dk-000000010DM-2GZy;
	Mon, 16 Feb 2026 19:25:24 +0000
Date: Tue, 17 Feb 2026 03:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 51/51]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for
 function 'module_map_module_page'
Message-ID: <202602170342.c2wmMPt4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   41a7c40493aca929fa8889c998fd18a2f0be18e1
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [51/51] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602170342.c2wmMPt4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170342.c2wmMPt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170342.c2wmMPt4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for function 'module_map_module_page' [-Wmissing-prototypes]
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: warning: no previous prototype for function 'module_map_module_pages' [-Wmissing-prototypes]
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:282:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: warning: no previous prototype for function 'module_unmap_module_pages' [-Wmissing-prototypes]
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         |     ^
   arch/arm64/kvm/hyp/nvhe/modules.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/module_map_module_page +276 arch/arm64/kvm/hyp/nvhe/modules.c

   275	
 > 276	int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
   277				   bool is_protected)
   278	{
   279		return __pkvm_map_module_pages(pfn, va, 1, prot, is_protected);
   280	}
   281	
 > 282	int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
   283				   bool is_protected)
   284	{
   285		return __pkvm_map_module_pages(pfn, va, nr_pages, prot, is_protected);
   286	}
   287	
 > 288	int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
   289	{
   290		return __pkvm_unmap_module_pages(pfn, va, nr_pages);
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
