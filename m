Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51537104C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 05:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537259; cv=none; b=i/VRLDon2XATcQgEpzd4m1gtdRJzfhO5zJv7rpcW2cxd8N5IAjUuYdDT4j0WuKY1vxxICkS+4qPEdfBIwq2HnIjuWPIOFNjZL+GnhYK8+dtjqHFNS+iER0nJfdFdXEmBzYNPS5AhvOlhXQI5/QXRryE4bvpbJLOKzNC6gOk3lAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537259; c=relaxed/simple;
	bh=nHLBjxACQglqAvoBAgjBmmDkTXVE+raf6wuv5GvBrWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WXVsPR/TEJSDepUcHErmnTnfQAIbkktHpVccLRwRhEU3zd7zHxmcNCbhM5RxfrOtn9LaUXrurQa29G6odo1fgXLUCoZX0KdUOvYDJQxVIfoW7eLLLMFV5URiceQULwXjtmzT58js3fkTYYwRVAUp4zUvknmCCtbcvAXnx0FrF7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZsIjAnk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZsIjAnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537258; x=1821073258;
  h=date:from:to:cc:subject:message-id;
  bh=nHLBjxACQglqAvoBAgjBmmDkTXVE+raf6wuv5GvBrWU=;
  b=dZsIjAnkPzqscHDQJqrqCIwHaSOq+qTlxgA+y7AucozTIvzq02A8QJHN
   HJ887SnvSk4k6lkJe1vYO/52WOxjqafbBi38FyWETKAb50lQDF2yW1i0a
   ZZk9IMQfeWWHSOAyZkUvXvtJQmfgm4i7ZPan0D3A3yztx9C10ULl+QPE4
   yZqGbl0M3vACUbvZMgI1EN/+idhCrt6rjwAj9Qu8O8BICFVCcA1/VbNqn
   VXclcAt4R0NEdumtvZpaExW9OyhMUEhoUcmE90vzmeEzeS/480hRiLfmj
   cctfHMLWXgMXfCOk52GE4m5d9CbNmj7RX7HOfUTc8GB9XkDHSYQkacQs3
   g==;
X-CSE-ConnectionGUID: 3eYF8kgDQ6+gO7ee1KvAHQ==
X-CSE-MsgGUID: xDdlwlrGQzmgMuA5h4G0eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92415726"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92415726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:40:57 -0700
X-CSE-ConnectionGUID: 75hSPENwTQSeUHlAkMKj2w==
X-CSE-MsgGUID: IKK2y/6qTEC8gFHkLhxhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277355927"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2026 22:40:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6iO5-000000005Xx-2mmR;
	Wed, 16 Sep 2026 05:40:53 +0000
Date: Wed, 16 Sep 2026 13:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: sparse: sparse: symbol
 'module_map_module_page' was not declared. Should it be static?
Message-ID: <202609161335.Z3YyTdz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   57041e4a7e52342473871000827584f966d8cbd3
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [1/1] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-randconfig-r123-20260910 (https://download.01.org/0day-ci/archive/20260916/202609161335.Z3YyTdz3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d3db069999553568848400c84cbf815c03f5470f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161335.Z3YyTdz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161335.Z3YyTdz3-lkp@intel.com/

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
