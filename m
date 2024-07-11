Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BC8249A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720680015; cv=none; b=BRMzDTzXF6UgGOXCKtwQbMkFfpQYwx/IGiFjxB2KflpJsrTCuERt53/0q6HHgJli1dPHadQnj2DOzJ9ahcVjhi6wwXGSFXJozdI2+xTo7wPk1yTmnAtIo/bKBhkVQnCV96ffHVPdFnMb5SgCaqvZBGkMtpDerCYehnxi96VH9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720680015; c=relaxed/simple;
	bh=xrFYSd9eU8ridSiEcaLQFxDlPH6gOnDXbFva9xuYeeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/MLQ9Q1Ludoit5XxONf2Adk+kmSnrjM3xymprAxtVfWAACl6f1V0F5SDKZx8pD32fVuHbbugw/Lv90pSwlVIBM1bffrNAcOOuE2LGfbTLI1EVFZ1vMMRqi1pnqZfn19lHGZnYJmn1Be+WQuMUwzxK8ftNKPEajaK3IaesK64Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duGb4VI3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duGb4VI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720680012; x=1752216012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xrFYSd9eU8ridSiEcaLQFxDlPH6gOnDXbFva9xuYeeA=;
  b=duGb4VI3S3NPduxJbo4qpfD9LdOrY45W3o97vA1vXuC5CwbBWvQ20WoH
   yjMoiL4Ew3rvD6RUt5tDrr7jfcFAOfHk+4vrFf4ZE9vuXUX8EHQA1ZRIV
   YQaC46d/t6s6ZYtowLlNfEQFNU9g3kd0mcLUdnh7TsJ81ysYVAvIYTC+p
   Fm2kkkmVCjtlJXQcKpFi/TvKtaaBkMzdpl1+i9HeMNzYSdUvg7SRSuAId
   Qh+Gu3bC6W7R5tFwskxoZsLaDv8yblQQf0lv5ifzmGV7IHUkBaypL42Hg
   BJmGYw1/C/R2gcXaqd+IHRUGaphy+PQJxAy/kC7FT11dPVPzm3FUKKDkV
   A==;
X-CSE-ConnectionGUID: Jt2ztVe6SdGuiCRCAK62jg==
X-CSE-MsgGUID: 763U3unXQq2arb0wQ1MvXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18245334"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="18245334"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 23:40:12 -0700
X-CSE-ConnectionGUID: bsQWnzBMTUaEDHYy3m/68Q==
X-CSE-MsgGUID: O5rQM/+xRaS4VRyWnnS/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48346881"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2024 23:40:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRnTL-000Yty-2E;
	Thu, 11 Jul 2024 06:40:07 +0000
Date: Thu, 11 Jul 2024 14:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 1/4] include/linux/page_counter.h:71:21:
 error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
Message-ID: <202407111429.hZw7ERqj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   34c52c20ddd81cc0cbd01d6f60cdf686704c59a4
commit: 705fdb35274011a225cba5d0e488c3e29e6c3120 [1/4] mm: memcg: merge multiple page_counters into a single structure
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240711/202407111429.hZw7ERqj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111429.hZw7ERqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111429.hZw7ERqj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:71:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:72:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      72 |         atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:73:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      73 |         atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:76:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      76 |         unsigned long elow[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:77:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      77 |         atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:78:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      78 |         atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:86:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      86 |         unsigned long min[MCT_NR_WITH_GUARANTEES];
         |                           ^
   include/linux/page_counter.h:87:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      87 |         unsigned long low[MCT_NR_WITH_GUARANTEES];
         |                           ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/filemap.c:23:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
--
   In file included from mm/mempool.c:13:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/mempool.c:21:
   In file included from mm/slab.h:11:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:71:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:72:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      72 |         atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:73:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      73 |         atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:76:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      76 |         unsigned long elow[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:77:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      77 |         atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:78:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      78 |         atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:86:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      86 |         unsigned long min[MCT_NR_WITH_GUARANTEES];
         |                           ^
   include/linux/page_counter.h:87:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      87 |         unsigned long low[MCT_NR_WITH_GUARANTEES];
         |                           ^
   1 warning and 8 errors generated.
--
   In file included from mm/oom_kill.c:21:
   In file included from include/linux/oom.h:11:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/oom_kill.c:30:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:71:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:72:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      72 |         atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:73:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      73 |         atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:76:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      76 |         unsigned long elow[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:77:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      77 |         atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:78:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      78 |         atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:86:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      86 |         unsigned long min[MCT_NR_WITH_GUARANTEES];
         |                           ^
   include/linux/page_counter.h:87:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      87 |         unsigned long low[MCT_NR_WITH_GUARANTEES];
         |                           ^
   In file included from mm/oom_kill.c:30:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/oom_kill.c:30:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/oom_kill.c:30:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/oom_kill.c:30:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
--
   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:21:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:71:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      71 |         unsigned long emin[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:72:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      72 |         atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:73:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      73 |         atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:76:21: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      76 |         unsigned long elow[MCT_NR_WITH_GUARANTEES];
         |                            ^
   include/linux/page_counter.h:77:26: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      77 |         atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
         |                                 ^
   include/linux/page_counter.h:78:35: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      78 |         atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
         |                                          ^
   include/linux/page_counter.h:86:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      86 |         unsigned long min[MCT_NR_WITH_GUARANTEES];
         |                           ^
   include/linux/page_counter.h:87:20: error: use of undeclared identifier 'MCT_NR_WITH_GUARANTEES'
      87 |         unsigned long low[MCT_NR_WITH_GUARANTEES];
         |                           ^
   In file included from mm/page-writeback.c:21:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/page-writeback.c:21:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/page-writeback.c:21:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/page-writeback.c:21:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
..


vim +/MCT_NR_WITH_GUARANTEES +71 include/linux/page_counter.h

    61	
    62	struct page_counter {
    63		/*
    64		 * Make sure 'usage' does not share cacheline with any other field. The
    65		 * memcg->memory.usage is a hot member of struct mem_cgroup.
    66		 */
    67		atomic_long_t usage[MCT_NR_ITEMS];
    68		CACHELINE_PADDING(_pad1_);
    69	
    70		/* effective memory.min and memory.min usage tracking */
  > 71		unsigned long emin[MCT_NR_WITH_GUARANTEES];
    72		atomic_long_t min_usage[MCT_NR_WITH_GUARANTEES];
    73		atomic_long_t children_min_usage[MCT_NR_WITH_GUARANTEES];
    74	
    75		/* effective memory.low and memory.low usage tracking */
    76		unsigned long elow[MCT_NR_WITH_GUARANTEES];
    77		atomic_long_t low_usage[MCT_NR_WITH_GUARANTEES];
    78		atomic_long_t children_low_usage[MCT_NR_WITH_GUARANTEES];
    79	
    80		unsigned long watermark[MCT_NR_ITEMS];
    81		unsigned long failcnt[MCT_NR_ITEMS];
    82	
    83		/* Keep all the read most fields in a separete cacheline. */
    84		CACHELINE_PADDING(_pad2_);
    85	
    86		unsigned long min[MCT_NR_WITH_GUARANTEES];
    87		unsigned long low[MCT_NR_WITH_GUARANTEES];
    88		unsigned long high[MCT_NR_ITEMS];
    89		unsigned long max[MCT_NR_ITEMS];
    90	
    91		struct page_counter *parent;
    92	} ____cacheline_internodealigned_in_smp;
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
