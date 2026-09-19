Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870044F563
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814256; cv=none; b=bmloXWULmSVFyreXvaGsSdsqQ8k55Me9lGScBT40eVjmUP0hJxwWLDRSkZokIq7pXFkgjevc52HnypB2Azc7Mid5bO7unDsFvLZWe4H6fcj6hSIm+oknR1ZCZ9Gkc1tQ3HpDR0WBJuU9Mbtq/yQ+wca7Xmbt6r431ptv/HW99q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814256; c=relaxed/simple;
	bh=MVOba0VB+thORzQwuHHAubrZiUJkxBtDsqvgQi6bwgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XelJ6hYZ72YoXHhqwQXH+r54U4qnh9pk9YCi4u7vNMx3b/OF4ScHzICsAzJPtkjJQ3vdeOsPCWzi+QC82oTI50m8xIIzq7bOPjOI3EZOlsgRuu0X/W9pqeH/uGl9Bj0gepOca1XtZfijJZ15P4WlXPZ2R+nwPsU9V3RvZbrZkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSjd9UkF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSjd9UkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789814253; x=1821350253;
  h=date:from:to:cc:subject:message-id;
  bh=MVOba0VB+thORzQwuHHAubrZiUJkxBtDsqvgQi6bwgs=;
  b=GSjd9UkF7zYItmSeNzWb2Pd5OqT5C0RplQmUJJenI++vJ6lMM80d3Abm
   lv4+PAnxUS6GHOeoBFrB7hNSV6/fogyGhNquaU6fwC1nOWdQ0skOAY5g6
   llBqxRDvyqjwqGxvG4tDWzyqxBsbHB5OU6y49xNFPxt3wA9XUllN0JliT
   WfMhmCCq3+exEvz5y1XCt/Ey1UZJUMNS8wGV28Z1gQYrgFYIV3liqTMZz
   475qFsyAnHRrs0U3YdSvxVu/+WbVvcWr398WQJKfcWEQ5RsWyorE1I/q4
   VaDVrMwtaT0qxf3e6XAyZTFay2wcy0lkRSn56LCWJ6i2wdTRE39zoAhoZ
   g==;
X-CSE-ConnectionGUID: zxxE4JmzQfGHnnuuzX9jnQ==
X-CSE-MsgGUID: Rnn7aZZGQwC9xl1g7TtaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101693542"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="101693542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 03:37:32 -0700
X-CSE-ConnectionGUID: jBEgMm6wSZene+/lgPcqLw==
X-CSE-MsgGUID: PiqkXt1ETmidsih/yigEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="279981318"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Sep 2026 03:37:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7sRd-00000000Aqr-0U4Z;
	Sat, 19 Sep 2026 10:37:21 +0000
Date: Sat, 19 Sep 2026 18:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: sparse: sparse: symbol
 'module_map_module_page' was not declared. Should it be static?
Message-ID: <202609191849.iUqy7jTK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [1/1] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260919/202609191849.iUqy7jTK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191849.iUqy7jTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191849.iUqy7jTK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: sparse: sparse: symbol 'module_map_module_page' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: sparse: sparse: symbol 'module_map_module_pages' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: sparse: sparse: symbol 'module_unmap_module_pages' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/modules.c:392:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/modules.c:393:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

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
