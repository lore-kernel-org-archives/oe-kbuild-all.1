Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AA28EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721182956; cv=none; b=mfjA01ihySQgz48Mtm+UAWNHjAFq93phtwt7lO0E9jjyorCMPMtCD5YGN5qDhWK0fG7SgPJt122851vkiLHLop3cUslDjFK5/CS1I59QK7wB0f08GKjxvixBCDpoFfyOFaCLL8r+SQ+Rl5k8xHcq2z42CT1ANr+06xeHlJnon+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721182956; c=relaxed/simple;
	bh=sxwM710tQR5lxQ+DMh1XR/UIDK5wgQRbmnACIdV4wOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CG2mt9WQ7nxZUAp02wqtSILDX81/DqaAd7Dk3kkAl1frdd+mxFTGXl20c5p+zv/FSlcrl1qg+BF1jX3Ru6Gjm1JsVcFgYXNzGB/3q8Dc4nv1bQhTY0bXtg3EI8MJYLpFR+6wrHBfNbLuDdDQzL1M23uiJlMGqIpJKREauIZHoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6ZHQs2I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6ZHQs2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721182954; x=1752718954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxwM710tQR5lxQ+DMh1XR/UIDK5wgQRbmnACIdV4wOQ=;
  b=Q6ZHQs2ITwhIAJyiWc+tErp52zGbTzJjdjrNYV2f07eAWKur3p6TkxwJ
   PxR4p7oD8bmd7cM9sxzJi9HdDpDTmDDqs3Pe/G9WyV+Wz2ldUuyyGV+PK
   0AUW2zJy2djcVCClud5beie8P5EW0tp4cLmSdiWulmt7cwlPDxxgQU/S3
   Nsovlg4yQ2oXQBZh3l/oGqqE2XnlmdpxxAG3EaGjP+laXCHSuPc5Smbs6
   Sl1Fgg23fVyGAtRVTIYTH0ogV66LczlFijqefBSm3cLELv+tfPoms9bVu
   d7y4pMoPflQs0BmKlUjVmkm9Va5KDOczT0lryGSdylmtotsuQOrvTaxQS
   w==;
X-CSE-ConnectionGUID: w0fiBWvNRA+33sD3nBfO1A==
X-CSE-MsgGUID: Y4tv2UhFRD6LZYOyJxdzWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18526802"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="18526802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 19:22:33 -0700
X-CSE-ConnectionGUID: JJUa/1dVTAyT1in4DEvQog==
X-CSE-MsgGUID: +qlM6J2oSkG2QkYnw2Rk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; 
   d="scan'208";a="54552141"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jul 2024 19:22:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTuJK-000ft0-1Q;
	Wed, 17 Jul 2024 02:22:30 +0000
Date: Wed, 17 Jul 2024 10:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] include/linux/page_counter.h:70:15:
 error: static assertion failed due to requirement 'MCT_HUGETLB_MAX <
 MCT_NR_ITEMS': MCT_HUGETLB_MAX < MCT_NR_ITEMS
Message-ID: <202407171049.YKCqSnX7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   d6bf778b60334cf45ee3171369a6a3b371e2f384
commit: 2063d04d44d1df3bc8c7b60f831a98365d4703ec [4/6] mm: memcg: merge multiple page_counters into a single structure
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407171049.YKCqSnX7-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407171049.YKCqSnX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407171049.YKCqSnX7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:21:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:70:15: error: static assertion failed due to requirement 'MCT_HUGETLB_MAX < MCT_NR_ITEMS': MCT_HUGETLB_MAX < MCT_NR_ITEMS
      70 | static_assert(MCT_HUGETLB_MAX < MCT_NR_ITEMS);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/page_counter.h:70:31: note: expression evaluates to '15 < 4'
      70 | static_assert(MCT_HUGETLB_MAX < MCT_NR_ITEMS);
         |               ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   5 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +70 include/linux/page_counter.h

    68	
    69	#ifdef CONFIG_CGROUP_HUGETLB
  > 70	static_assert(MCT_HUGETLB_MAX < MCT_NR_ITEMS);
    71	#endif  /* CONFIG_CGROUP_HUGETLB */
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
