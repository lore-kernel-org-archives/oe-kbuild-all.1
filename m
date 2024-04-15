Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3E460EF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713194991; cv=none; b=ea/AJYfhSqudqcHRS6tVTpmbRnzdtlonpyGFYxY5P37WJrw6lSzPkduOxJpR7zLvD5A18J3DZ63IJYTmCeYPgkqyH2HAbjr1qqrFjEMOAqZnv1iwfbP+nVSX3qCC3KIpEafy0s+y4myc/TDJvGFP5qYJ2KKuBJ33zmxt9ATvMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713194991; c=relaxed/simple;
	bh=bCSMn/QioRYUos8u5RIYAgrPC6ZvDwsUnvLNkdIR7Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bb1J4EBwGX5Dwk3I8y2ITGhFP7SeiaB6RiGaFRI6e2KpMTgxHCt9sh2Jy89JYWRq4cUOJRQWE88+kk4ep2HusttXlrYi5lznx7Jd12dC9eA0WfaS6Y3YzdhH1+xFTB9MorsxGW1g6vNVbI1tK3I1HXcO3qWMjfRzqaY3MLRRwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJsJ2jGw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJsJ2jGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713194989; x=1744730989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bCSMn/QioRYUos8u5RIYAgrPC6ZvDwsUnvLNkdIR7Gg=;
  b=DJsJ2jGwtJatC3fDqOWbOZEhVk6WBCuWrzYGVwKhv7+DQ+kPaUeAjX56
   xpqbuA3/kElQvYbQMndErTAkhBlQ89TS4fs5HThOotk6NoKD8lb2B6QHd
   volbo/g0RmSQ69xlXa8Ej+ntYdW87QwsoT7193k728NTHx0g/Zj0IjAWh
   olPqdzBep9MlRIjugBF2Esh2S7aYJdgTtvH0Nl4x1SeSSO+E/7iDOrUab
   Wd1AhhIewWNgEWnMF2mLun+8n/Et6ZFxuuTdDZ2TUOJVceUGbLgabvQMi
   24hKrnORJsFtH+4YTI4sRT1sHxkXxzWvTDiydwsErbH/Cl0r6liPjHrs8
   A==;
X-CSE-ConnectionGUID: qCHFAfdgSeWTu9XXmpy/nw==
X-CSE-MsgGUID: Vcy54VfbRZepA4/tDYoZPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8758743"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8758743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 08:29:49 -0700
X-CSE-ConnectionGUID: cc6G1IKPRW6nW4ZA1Xe9mg==
X-CSE-MsgGUID: YGHCNTieQBWaxmqy2LOrTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26746262"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 08:29:48 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwOHB-0004MA-1U;
	Mon, 15 Apr 2024 15:29:45 +0000
Date: Mon, 15 Apr 2024 23:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] error: shadow-call-stack
 sanitizer is not supported for this target
Message-ID: <202404152307.8mI64aY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3d8a2ab25745bc28cb458746056fb8ed2d81915e
commit: 5424a7cb43da76865efc5a977b6a0390fd3573cc [3/3] FROMLIST: rust: add flags for shadow call stack sanitizer
config: arm64-randconfig-002-20240415 (https://download.01.org/0day-ci/archive/20240415/202404152307.8mI64aY2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404152307.8mI64aY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404152307.8mI64aY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   509 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   516 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   528 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   537 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
>> error: shadow-call-stack sanitizer is not supported for this target
--
>> error: `-Zsanitizer=kcfi` is incompatible with `-Zsanitizer=shadow-call-stack`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
