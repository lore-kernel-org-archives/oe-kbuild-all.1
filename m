Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CE185920
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737416486; cv=none; b=uviucTiYWHcuewxsL2IMRNCWfvnS0ojqYcqYL+K/lCEd6wyNjGMaiBU4AYSX5W3m0TKaacHvVzz6Jj7RCYFYNI38ojZ+RwLXvSZcK1ky86UEuETGWm4u9DvrxA1OGv8mMNP9waL3nwYHU/+B8PmVcFMVYghW1Xtbb31077h2/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737416486; c=relaxed/simple;
	bh=yT+DQpT4VPlJiV7GZM6yoJ2gVD4c/iGfEnMDo1CZ594=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xh3U8a4dJXCjaHXh8VCmHZG6223kBvfTDOtFchIs1AB5Qj62e2Dw4eyQwlcInvLscBcRB0HWxy3IOzzSR35Nrai/GJjy9BDnxby95GDKCcI2icpFNeDEfVxkgk1x7zaPGtp9DNjoP0mjeeSv8ofHYUByg7Ew0FVK74YqkNvIkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbEyD3VX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbEyD3VX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737416485; x=1768952485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yT+DQpT4VPlJiV7GZM6yoJ2gVD4c/iGfEnMDo1CZ594=;
  b=hbEyD3VXginWPEYzGdC+d6GhT+/3oan7X0mFZuWP3Vc+c/Ik9pzCdeMd
   B/8LiGDTHfZH1n3uLYo9ROP7GqhTgurETmSmoW2nGYspW1cw4UO/68+S/
   aWF5M4YQHwjAFM0KnbXz6DFnC5I51vBRvN33dLAno7rgLEFlD0RUGAw9M
   T3LrgGZEOKzHgY2NnrvubmMwcrCIkTjk6SH2hKIe5GvbFB/znVgiudlrM
   chLvC6mxSvjkKJ1fc2OE4UxYTiM5tAlAkPglQCCOubwixXeJ9QNMKgAjR
   32v9LDDK/jDRbKcfX9zPqBmoCIsy8ly1yUdpxdOfR8C9aO0ZxfqAt1wIk
   Q==;
X-CSE-ConnectionGUID: 85amXX/bS6uQShYFLNCPhg==
X-CSE-MsgGUID: RKwzTntOTK6gk3sQVLZ1dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37928695"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37928695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 15:41:24 -0800
X-CSE-ConnectionGUID: 3itKMtI3QW6c8oL8cdF3qA==
X-CSE-MsgGUID: 4MDTP2t6SOGmGHExDv/9Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107070915"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2025 15:41:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta1OS-000XMB-1w;
	Mon, 20 Jan 2025 23:41:20 +0000
Date: Tue, 21 Jan 2025 07:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-11 0/2]
 drivers/staging/android/debug_kinfo.c:154:33: error: offsetof of incomplete
 type 'struct module'
Message-ID: <202501210720.gVniQkzv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-11
head:   166086404cf0b7721886efbc7e0fa2b98544ed91
commit: b8f0143948f8c85965945691b7361f34ee848bc7 [0/2] ANDROID: kernel: add module info for debug_kinfo
config: x86_64-buildonly-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210720.gVniQkzv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210720.gVniQkzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210720.gVniQkzv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/android/debug_kinfo.c:10:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1556:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/android/debug_kinfo.c:154:33: error: offsetof of incomplete type 'struct module'
     154 |         info->mod_core_layout_offset = offsetof(struct module, core_layout);
         |                                        ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:135:35: note: expanded from macro '__compiler_offsetof'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:76:8: note: forward declaration of 'struct module'
      76 | struct module;
         |        ^
   drivers/staging/android/debug_kinfo.c:155:33: error: offsetof of incomplete type 'struct module'
     155 |         info->mod_init_layout_offset = offsetof(struct module, init_layout);
         |                                        ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:135:35: note: expanded from macro '__compiler_offsetof'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:76:8: note: forward declaration of 'struct module'
      76 | struct module;
         |        ^
   drivers/staging/android/debug_kinfo.c:156:30: error: offsetof of incomplete type 'struct module'
     156 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:135:35: note: expanded from macro '__compiler_offsetof'
     135 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:76:8: note: forward declaration of 'struct module'
      76 | struct module;
         |        ^
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +154 drivers/staging/android/debug_kinfo.c

    92	
    93	static int debug_kinfo_probe(struct platform_device *pdev)
    94	{
    95		struct device_node *mem_region;
    96		struct reserved_mem *rmem;
    97		struct kernel_all_info *all_info;
    98		struct kernel_info *info;
    99	
   100		mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
   101		if (!mem_region) {
   102			dev_warn(&pdev->dev, "no such memory-region\n");
   103			return -ENODEV;
   104		}
   105	
   106		rmem = of_reserved_mem_lookup(mem_region);
   107		if (!rmem) {
   108			dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
   109					pdev->dev.of_node->name);
   110			return -ENODEV;
   111		}
   112	
   113		if (!rmem->base || !rmem->size) {
   114			dev_warn(&pdev->dev, "unexpected reserved memory\n");
   115			return -EINVAL;
   116		}
   117	
   118		if (rmem->size < sizeof(struct kernel_all_info)) {
   119			dev_warn(&pdev->dev, "unexpected reserved memory size\n");
   120			return -EINVAL;
   121		}
   122	
   123		all_info_addr = rmem->priv;
   124		all_info_size = rmem->size;
   125	
   126		memset(all_info_addr, 0, all_info_size);
   127		all_info = (struct kernel_all_info *)all_info_addr;
   128		info = &(all_info->info);
   129		info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
   130		info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
   131		info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
   132		info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
   133		info->num_syms = kallsyms_num_syms;
   134		info->name_len = KSYM_NAME_LEN;
   135		info->bit_per_long = BITS_PER_LONG;
   136		info->module_name_len = MODULE_NAME_LEN;
   137		info->symbol_len = KSYM_SYMBOL_LEN;
   138		info->_addresses_pa = (u64)virt_to_phys((volatile void *)kallsyms_addresses);
   139		info->_relative_pa = (u64)virt_to_phys((volatile void *)kallsyms_relative_base);
   140		info->_stext_pa = (u64)virt_to_phys(_stext);
   141		info->_etext_pa = (u64)virt_to_phys(_etext);
   142		info->_sinittext_pa = (u64)virt_to_phys(_sinittext);
   143		info->_einittext_pa = (u64)virt_to_phys(_einittext);
   144		info->_end_pa = (u64)virt_to_phys(_end);
   145		info->_offsets_pa = (u64)virt_to_phys((volatile void *)kallsyms_offsets);
   146		info->_names_pa = (u64)virt_to_phys((volatile void *)kallsyms_names);
   147		info->_token_table_pa = (u64)virt_to_phys((volatile void *)kallsyms_token_table);
   148		info->_token_index_pa = (u64)virt_to_phys((volatile void *)kallsyms_token_index);
   149		info->_markers_pa = (u64)virt_to_phys((volatile void *)kallsyms_markers);
   150		info->thread_size = THREAD_SIZE;
   151		info->swapper_pg_dir_pa = (u64)virt_to_phys(swapper_pg_dir);
   152		strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
   153		info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
 > 154		info->mod_core_layout_offset = offsetof(struct module, core_layout);
   155		info->mod_init_layout_offset = offsetof(struct module, init_layout);
   156		info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
   157	
   158		update_kernel_all_info(all_info);
   159	
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
