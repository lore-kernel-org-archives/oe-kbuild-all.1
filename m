Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC74315F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718803031; cv=none; b=l9sB5aTLEuKPtVRN6eChCrGxY2s6pAchjo2eVdoH9+FUCVO9rk4wXp42LxAFvyC44jNZq7hg3SroxnXNJY2xvGTZZ/knAd0cZaDgBZrBwDtI5qMcJ0y9k9tGT/k3P0zOcjGc380EGslHdYPynl2fNXBRMrdNqtGrKjgpt5T/32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718803031; c=relaxed/simple;
	bh=W3mNJ8pJWeS4TIMmAyJcXXrazOt/BN6RSl19lib1PVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=taaFJF0icYVg5vvUw2/09sjiKAmL7b3nomzWnmyRn7GN6EUcUsesf+0bz/eDUXsDPrrzPmG9FfAZoAB0wPYxdpIqr91Fj6rR9ahXuyFYCwsF4w2nkyMC0X97BxNXg5voxuiuJd9MRNaLQya0n6ur/Rcied0w5xmd/THcUGEVTbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiVsJWOw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiVsJWOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718803029; x=1750339029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W3mNJ8pJWeS4TIMmAyJcXXrazOt/BN6RSl19lib1PVg=;
  b=WiVsJWOwykZp72h+kSm3lHzM99Uba7qYiaDqyS81sNy8pF6Wc4Ng6JvN
   iNHVw6OTqH7F9SB1AOrjWJORkQBFIsJDIeQcKkb9hD450gUbpD/ukQAUR
   NvXQr4/doicMaFmfZycJ69Bx2S8t89UOxl372qnTCfzbkTFq3A756OoUJ
   1xWmNM6X2l5Xysb9sQ+VlYeWER8N3iI3EwIuqDry09O/oTNeEZcG2i2qE
   UheQ7t5ta8TgWo3o6a3ThHw2D/ymzXFxCrXvM6k1NDtEWgD4bPExkhdNk
   lY3E/H7te233nKlQCV+tAOEoQPyV2QGdO75FYzVDYxTrxiN2L2GVtMhZz
   g==;
X-CSE-ConnectionGUID: ClHIxv5VS6uAHhJKZPoczw==
X-CSE-MsgGUID: lH4etsVnRt2JSetPppl39A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15453090"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="15453090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 06:17:08 -0700
X-CSE-ConnectionGUID: IbI/FL9YTNqw9DyfulqkVw==
X-CSE-MsgGUID: D/BrQZIBQziUUz4mIZm3zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; 
   d="scan'208";a="46368267"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2024 06:17:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJvBO-0006c8-13;
	Wed, 19 Jun 2024 13:17:02 +0000
Date: Wed, 19 Jun 2024 21:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anna-maria-devel:vdso/cleanup 4/4]
 arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the
 result of '<<' to a boolean always evaluates to true
Message-ID: <202406192153.9GbqKMDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git vdso/cleanup
head:   1f2cec28b82b702d8baeb95bb9b66061e876d6c5
commit: 1f2cec28b82b702d8baeb95bb9b66061e876d6c5 [4/4] powerpc/vdso: Ease access to vdso data when TIME_NS is enabled
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240619/202406192153.9GbqKMDI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406192153.9GbqKMDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406192153.9GbqKMDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2253:
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
   In file included from arch/powerpc/kernel/asm-offsets.c:35:
   In file included from arch/powerpc/include/asm/vdso_datapage.h:39:
   In file included from include/vdso/datapage.h:149:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     109 |         return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
         |                                               ^
   arch/powerpc/include/asm/vdso/gettimeofday.h:105:20: note: expanded from macro 'P_SIZE'
     105 | #define P_SIZE  (1U << CONFIG_PAGE_SHIFT)
         |                     ^
   6 warnings generated.
--
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:149:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     109 |         return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
         |                                               ^
   arch/powerpc/include/asm/vdso/gettimeofday.h:105:20: note: expanded from macro 'P_SIZE'
     105 | #define P_SIZE  (1U << CONFIG_PAGE_SHIFT)
         |                     ^
   1 warning generated.
--
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2253:
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
   In file included from arch/powerpc/kernel/asm-offsets.c:35:
   In file included from arch/powerpc/include/asm/vdso_datapage.h:39:
   In file included from include/vdso/datapage.h:149:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     109 |         return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
         |                                               ^
   arch/powerpc/include/asm/vdso/gettimeofday.h:105:20: note: expanded from macro 'P_SIZE'
     105 | #define P_SIZE  (1U << CONFIG_PAGE_SHIFT)
         |                     ^
   6 warnings generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:149:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     109 |         return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
         |                                               ^
   arch/powerpc/include/asm/vdso/gettimeofday.h:105:20: note: expanded from macro 'P_SIZE'
     105 | #define P_SIZE  (1U << CONFIG_PAGE_SHIFT)
         |                     ^
   1 warning generated.
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:149:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:109:40: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
     109 |         return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
         |                                               ^
   arch/powerpc/include/asm/vdso/gettimeofday.h:105:20: note: expanded from macro 'P_SIZE'
     105 | #define P_SIZE  (1U << CONFIG_PAGE_SHIFT)
         |                     ^
   1 warning generated.


vim +109 arch/powerpc/include/asm/vdso/gettimeofday.h

   103	
   104	#ifdef CONFIG_TIME_NS
   105	#define P_SIZE	(1U << CONFIG_PAGE_SHIFT)
   106	static __always_inline
   107	const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
   108	{
 > 109		return (void *)(((unsigned long)vd & !P_SIZE) + P_SIZE);
   110	}
   111	#undef P_SIZE
   112	#endif
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
