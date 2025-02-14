Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1901946DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562850; cv=none; b=gF9OmqNz0Wqa2A3tK/DIJwrgzRXR4m8QxvM0b41uCjR3NYQR7YP3RLdm50QXG+sbm0uo6Mp76PSTSXMd1KRIRfSGzPGlGrOzxp4l6ncrboGWkBJZcyf2JESPFyx2w/g/IR/uWAWRydlNuLiUgXkyVKeAD3h7SgA3w1TTVkYCbGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562850; c=relaxed/simple;
	bh=LuhUi9RqMz6wtDqo1+M42tA60CT2AmH8tgwUZUON0Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k2Utky1DcnbpqLDcEJB7zW3t8itKva0PhOqB2oe+BVJ4t8Nxz9aLTnVenOyHbNvYdHzvt13z9BCaQ9krcIDQcPUJqXa6DaXV7NeblEIovAhXr8PW/810zbgDWpImPLEo+7qVwXmDGGv3J6JPgKTWPBHqQhBnF2V+Erv/+eMMg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLn+st+y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLn+st+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739562849; x=1771098849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LuhUi9RqMz6wtDqo1+M42tA60CT2AmH8tgwUZUON0Bs=;
  b=lLn+st+y2e8Q5DFsz42Tu+1pKRw0l54BXDJ8Xm/R0kxL7p1AYUwb7cbc
   gJVK6cdFrT2rNk28uLvpczBD7lgajgaYENy/4/HtzdjmdJi7RmiYWNmDn
   gosYONbt2hA0DaiC3mpJ2X36ISLaKb+4NWX+pb3jGHYVg6MtDEqbis3Jn
   24YooXDKSg6DroQCTlQM89md9SkGlAzmxXp2NwIBk6ZCUuMFeXVymB5QA
   x8c68+5QI0GFzlv4AnTCtvEzp6OmrKTS0Kj6q8TmIuVm75aH59eqkTXC/
   te3sSBZtd6m8paWNC0MCRK7sJyPzO0dQ9cfmN4Dy3EWGZiyoYFkdadYJZ
   g==;
X-CSE-ConnectionGUID: qQmAfDlnQEqbzNQnWRqJow==
X-CSE-MsgGUID: P4sz9kKNQc+V7vrdMpEBnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40463778"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40463778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:54:07 -0800
X-CSE-ConnectionGUID: /gmedweHS9eQAKv652FE8A==
X-CSE-MsgGUID: vC1W9MzeTvGiu8J9o473qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113272597"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2025 11:54:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj1lD-001A63-1I;
	Fri, 14 Feb 2025 19:54:03 +0000
Date: Sat, 15 Feb 2025 03:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/91] mm/swap_slots.c:95:6:
 warning: no previous prototype for function 'is_swap_slot_cache_enabled'
Message-ID: <202502150347.UohjWnc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d54a4869d416b5e3beebfa0e94bc0e2cd7568737
commit: e064059673798b931f95f724c7e377fa8cd15df7 [0/91] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150347.UohjWnc2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150347.UohjWnc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150347.UohjWnc2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swap_slots.c:30:
   In file included from include/linux/swap_slots.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:29:
   In file included from include/linux/cgroup-defs.h:22:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1593:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/swap_slots.c:95:6: warning: no previous prototype for function 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^
   mm/swap_slots.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | bool is_swap_slot_cache_enabled(void)
         | ^
         | static 
   mm/swap_slots.c:101:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | bool check_cache_active(void)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
