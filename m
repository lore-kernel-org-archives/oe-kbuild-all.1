Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99F393DF9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484265; cv=none; b=scYiQnynDfhrL2PIy2qVd1vLC9R7Stb7pKdCpBZ7A2uYVMndfYFtx+xP/dNCTKdHWpRFjsoF/cPO3sk3+ZuJE6jXQlvsKcfCgYIEvX6JTPZnuHXZpucfnG4nLpFOkgRcjtsQCjXMu0lnal7SlnAfmkUT2E9a4JZ6dP+L/s9AZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484265; c=relaxed/simple;
	bh=EKZrmv1+gdS0GisuFgRd0fU5qugRqtxz7qgbeYRHlQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ta/Cm/ubmT5ycx5qSjwKaO7AAfAebCIw1b/W8ryIhWNtgXsP3jN5jLm0r/MGgAELwfGk9fQmgydt4eGZ+PrwWMetZErWE1ATJMv+oxAzC7L1VRB3YgjNIwYjs79REnyt6OcYSAXpFu8yBW57D3zrC+c4Cccjp/9pMxAk6WtQ7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwvZzudJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwvZzudJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780484264; x=1812020264;
  h=date:from:to:cc:subject:message-id;
  bh=EKZrmv1+gdS0GisuFgRd0fU5qugRqtxz7qgbeYRHlQE=;
  b=lwvZzudJ7NBerlXCobBumADNHr7XIEP7hEnrX6TOiYGLL46xGYVJRIUG
   34njhsBzmlnfyv2N1D5kEa8TZjYUh9IGYm+jy3yXIuJuLeYmxKeEPY3lG
   8V+xRF5RE9iwNgqjAp+2rXtqU+OoTTaIaqVICLzVV7pdPCvmVjTFbFzwo
   b9SQD1QsSEJIb2OyHYlRMGeW1NIPsA4jRQBJjqhRZHP6u4kewy6YM4Buh
   U5TL0wYKtPAC8l6+iacyhem3bvQ8CNhuFcwoa8PAV2sqRoqnlJdIMimq/
   sSN4erR976QFLAZ2RIlJPoOL0RlR/nS57U9Q4E6cpd8/8SC4bFcim1iHJ
   w==;
X-CSE-ConnectionGUID: 1RAwbjJwSYaK4j8Rul7m4A==
X-CSE-MsgGUID: /8JHp3X7TYqz5BIJTEQhQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92663865"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92663865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 03:57:43 -0700
X-CSE-ConnectionGUID: hjl3WOjAQ3mWd1jencVkXw==
X-CSE-MsgGUID: h2K6zpEqS7qSq4+RVjnTRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="237838719"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 03:57:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUjI4-00000000DK2-16vi;
	Wed, 03 Jun 2026 10:57:40 +0000
Date: Wed, 03 Jun 2026 18:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for
 'module_map_module_page'
Message-ID: <202606031848.sC3N2i9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   66b8d2a9700a7cf3c1a5f4089bb4a93d1bcbc144
commit: db8bad4a59d2609e1ec4c6da947554ab51901f4a [0/1] ANDROID: KVM: arm64: Expose unmap_module_page to modules
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260603/202606031848.sC3N2i9k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031848.sC3N2i9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031848.sC3N2i9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/modules.c:276:5: warning: no previous prototype for 'module_map_module_page' [-Wmissing-prototypes]
     276 | int module_map_module_page(u64 pfn, void *va, enum kvm_pgtable_prot prot,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/modules.c:282:5: warning: no previous prototype for 'module_map_module_pages' [-Wmissing-prototypes]
     282 | int module_map_module_pages(u64 pfn, void *va, u64 nr_pages, enum kvm_pgtable_prot prot,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/modules.c:288:5: warning: no previous prototype for 'module_unmap_module_pages' [-Wmissing-prototypes]
     288 | int module_unmap_module_pages(u64 pfn, void *va, u64 nr_pages)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


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
