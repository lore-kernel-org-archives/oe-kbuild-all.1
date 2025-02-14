Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBD264A80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739554432; cv=none; b=ldjhK93RnFIjp9Vrye81gT5H2s2Odzvdh87q109Cdfn08cbPRLQ9kcxaXbHA53+x0OPWRFY558rIyo2Jkr7OAwaC0VNLtFhX406Y88MZ8gwVoR71JKvdyZdmr8LQXWVNG0n7QQGXWHR5jfVhWPeQZa0s7tGbZ8eo761rmpO7gTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739554432; c=relaxed/simple;
	bh=MKL9Aj3EZFY5rtoom2Q1Jy0ycBaeUYnWcBDLHcoeZ/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbxxIp4FfjvPg1wXmK9Cmj3rJ3gyOUiFzmH6MA0CzoxH0rxVl+ZFxKHV4iaXxmIidXE8ZtrMgW61zuBKTc/P7PEmEzQCcAu1vVQT85WYJmiZGSVgYqkjvCfq/MHsRTKvRy2gWcZE8x3HQueT7FzRN8xG03VNWPV0Yv4iMS7wx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6QsC5WP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6QsC5WP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739554430; x=1771090430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKL9Aj3EZFY5rtoom2Q1Jy0ycBaeUYnWcBDLHcoeZ/4=;
  b=F6QsC5WPyOuOIpS6GkWruBj1Gw6Wp8SPGfT1PTb45oJQkw0u43zJs4l8
   vtv0Kwxq2WIIZX2dzmIJRkskyYdNZYHSQrwkS1/vqwHaFbYj6Ps7VoS0t
   2wJDIhWuzXm5O5j8E/2gJKrfzE1y9DZ4nWWiJ62kwbDHI9GLxWfrJ911K
   XIC5dzQD6+ylzoA12CmdyLkqGavhU/XrQoLuasHWgmoflBuXlf8aDFEqI
   aiiZv1orPhoLKKo5vcrIiehpIQ4WMjzCtlE+WMDemYLImabRm6sk69G/3
   EpRFSy4MDQqK6gqLdFGOMm1/FCkZuj6pO9rOEwF2BgHs+QIAjIoxX3Ih9
   g==;
X-CSE-ConnectionGUID: O1OXrNlqQkS8L5zWkZNLSg==
X-CSE-MsgGUID: WkdXjEBTSH2j8QRkzPyf9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40578359"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40578359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:33:50 -0800
X-CSE-ConnectionGUID: KkgstNQvT8SprlPBHmE6kA==
X-CSE-MsgGUID: TrYknG/KQjSzp/wVLdL7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114420085"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 09:33:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizZS-0019wR-1r;
	Fri, 14 Feb 2025 17:33:46 +0000
Date: Sat, 15 Feb 2025 01:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/91] mm/swap_slots.c:93:6:
 warning: no previous prototype for function 'check_cache_active'
Message-ID: <202502150119.bRZ6hQju-lkp@intel.com>
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
commit: 06c2766cbc9923d67d45fc191c467b5e2685175d [0/91] ANDROID: mm: export symbols used in vendor hook android_vh_get_swap_page()
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150119.bRZ6hQju-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150119.bRZ6hQju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150119.bRZ6hQju-lkp@intel.com/

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
>> mm/swap_slots.c:93:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
      93 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:93:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      93 | bool check_cache_active(void)
         | ^
         | static 
   2 warnings generated.
--
   In file included from mm/swapfile.c:9:
   In file included from include/linux/mm.h:1593:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
>> mm/swapfile.c:775:5: warning: no previous prototype for function 'scan_swap_map_slots' [-Wmissing-prototypes]
     775 | int scan_swap_map_slots(struct swap_info_struct *si,
         |     ^
   mm/swapfile.c:775:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     775 | int scan_swap_map_slots(struct swap_info_struct *si,
         | ^
         | static 
>> mm/swapfile.c:993:5: warning: no previous prototype for function 'swap_alloc_cluster' [-Wmissing-prototypes]
     993 | int swap_alloc_cluster(struct swap_info_struct *si, swp_entry_t *slot)
         |     ^
   mm/swapfile.c:993:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     993 | int swap_alloc_cluster(struct swap_info_struct *si, swp_entry_t *slot)
         | ^
         | static 
   4 warnings generated.

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


vim +/check_cache_active +93 mm/swap_slots.c

    92	
  > 93	bool check_cache_active(void)
    94	{
    95		long pages;
    96	
    97		if (!swap_slot_cache_enabled)
    98			return false;
    99	
   100		pages = get_nr_swap_pages();
   101		if (!swap_slot_cache_active) {
   102			if (pages > num_online_cpus() *
   103			    THRESHOLD_ACTIVATE_SWAP_SLOTS_CACHE)
   104				reactivate_swap_slots_cache();
   105			goto out;
   106		}
   107	
   108		/* if global pool of slot caches too low, deactivate cache */
   109		if (pages < num_online_cpus() * THRESHOLD_DEACTIVATE_SWAP_SLOTS_CACHE)
   110			deactivate_swap_slots_cache();
   111	out:
   112		return swap_slot_cache_active;
   113	}
   114	EXPORT_SYMBOL_GPL(check_cache_active);
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
