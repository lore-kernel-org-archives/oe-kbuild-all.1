Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA9F190664
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736290485; cv=none; b=p1tipOdmC/kAjDhuAvok+LgUo6UoMhGbqv+f1J03Geh+NAoBXLtc58vHD2yfFAZlIIckcIwE6Shpai3iTcMTFOKpSoyTapVj2G3cf/T88OfjIbmTSwxU6M761pjj69IUiVcSZs7CIUOfkSs2BrMtNbTfW+riSvek6LXIv4IsQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736290485; c=relaxed/simple;
	bh=0ifZ/aSkgj59NPo5KnDiZyFIUs35a7LklSVMOVyaDL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/skEGAcxb+qNat9M3yZXNT42lg9Eiw92sFpnDKbEoGRop7txWRLS5FXlQh9GvNBd2zdTUJZowKzqJ3CMtB+2oZBVv9/W6Ldil3iWbyWI+q020TEWVe1hyaGr4AfyTawKAQWJuZAwfzO3n3GuK2ptXmbcX1m7icb5Mx/YyNxaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNIB5sGj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNIB5sGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736290483; x=1767826483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ifZ/aSkgj59NPo5KnDiZyFIUs35a7LklSVMOVyaDL0=;
  b=FNIB5sGjHQt/n6d6Fuv1kqoitI+OLRxDneEl+v6vqURaayl+32KLoQ1R
   8X1Lbxdz74QqU3zc1EgWVT7CS8MHRSBub4EjCC+wcPl14Xi7glaK2Zmmk
   sI3f+zorVUgGukrBQtoUBJwZfV6sDHLDTEuPW3dv5sL3PsZ3bq03Ut1M7
   C4AQkemmCz+3ttfRstWQu8xF26voQBggCGYxTKODtFCSeAQZImihlmD1x
   j/DfeU6BA6tSKim/NvY6eZiiFkiebyyd1eVddA0yxLqSQPEf50snaDvzQ
   Ibjn96pqnWmoRr45KRux5WshtABWRpTydsHkyqnRUYWz+1xnVfnjbtBWY
   Q==;
X-CSE-ConnectionGUID: 1xYkGDHhQ06kgTkfWvLPrg==
X-CSE-MsgGUID: mx61GbcOT5ucRk9CdIXwDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47853627"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47853627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 14:54:42 -0800
X-CSE-ConnectionGUID: tasSN+m9SlCriKpT1ksSlg==
X-CSE-MsgGUID: 2fOd8jZlRZmm4iJKMTtq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="133758885"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2025 14:54:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVIT9-000FJb-2Y;
	Tue, 07 Jan 2025 22:54:39 +0000
Date: Wed, 8 Jan 2025 06:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 1/1] warning: unused variable:
 `vma_addr`
Message-ID: <202501080651.5UZkD74c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   b0be1be9b407de23f02737e66549b1fb936a0149
commit: 5c5a27aad449371dc776656bd2d6d83070d68fcf [1/1] ANDROID: update to mm abstractions v10
config: x86_64-randconfig-123-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080651.5UZkD74c-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080651.5UZkD74c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080651.5UZkD74c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused variable: `vma_addr`
   --> rust/kernel/mm.rs:208:38
   |
   208 |     pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaReadGuard<'_>> {
   |                                      ^^^^^^^^ help: if this is intentional, prefix it with an underscore: `_vma_addr`
   |
   = note: `#[warn(unused_variables)]` on by default
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   1 warning generated.
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> warning: unused variable: `vma_addr`
   --> rust/kernel/mm.rs:208:38
   |
   208 |     pub fn lock_vma_under_rcu(&self, vma_addr: usize) -> Option<VmaReadGuard<'_>> {
   |                                      ^^^^^^^^ help: if this is intentional, prefix it with an underscore: `_vma_addr`
   |
   = note: `#[warn(unused_variables)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
