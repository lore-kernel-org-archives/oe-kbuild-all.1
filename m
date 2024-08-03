Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8001ABEB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722646769; cv=none; b=p4G+s8IpXxWKgfThqCnlx/e+DAmDSSyWaJ8tRcXNASB4/t/fizIwP/8vtcV3zNcx9fyYZqk1fQ53n2hiLjwFg2Qru0EVtxFEaDjmucS2uz/c01De1tO5ogr0bYbdlp5027gqh6bT8Wk4hWBuedNh542Ed+gh3CwlruBAZd59HNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722646769; c=relaxed/simple;
	bh=7mv5RDuqwAspPGtxGYn+A1VvE94Kx8w0t0ObrM98dAw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwmi4Hehguthts+iIKKuInmU7BOdy/YttOa8yn2qu++iwtNXAwsO9Rx/TaKyPqXakkx5hTIcGSR9Jb3SxG9QGlI51RTMc9U5zQCZsGc6YSsHZq9jvUrLz3DHS1ntXkVyPtzypgzyN7hUrsdh0riAPZh9rOYT8S5lG6XhJQ5lEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJlkmZ0p; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJlkmZ0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722646767; x=1754182767;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7mv5RDuqwAspPGtxGYn+A1VvE94Kx8w0t0ObrM98dAw=;
  b=bJlkmZ0pmXh3qLpiQ8V+2t9pUpiArqbyPtsZHF66XjVwBQY8EM8bTOYP
   Cxh2equwLW64Q7YQBrzJnD/M4C8XMGc7jjksnR2CElr7MeI4/qcT8xZtp
   mIvNtVNB5Ce7W5SadJdhiYUC6Os6BPvB+TQVGN3Bsd4WDw/8oKK5rIOdr
   ul97h0vg11txBAJW2+e6XIPQv3NpjXxRIP2GK9aD950BLOG/N0Tim/Grv
   4qlPGRkDPmHrzrpRMf+3g9clShJGyyRPpvcc4Rfhhf9FqwAT93GOkTcD9
   MlmVW5zt7r3PnbuXiIn/iMsOE7ttoYwS0mtZCXH4U9G0iLpU77WwJiOyz
   g==;
X-CSE-ConnectionGUID: tWlE1EknTKiEHeeS9+td9A==
X-CSE-MsgGUID: qk4qMQIyT2WbjGVtTP3b8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31835476"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31835476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 17:59:25 -0700
X-CSE-ConnectionGUID: VQqMPvSQTFOmNfeQrYmzbA==
X-CSE-MsgGUID: Mk+bg8PMS7m2v8VT2HBU7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55455660"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2024 17:59:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa37B-000xeO-0L
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Aug 2024 00:59:21 +0000
Date: Sat, 3 Aug 2024 08:59:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 2627/29299]
 drivers/staging/android/debug_kinfo.c:162:33: error: offsetof of incomplete
 type 'struct module'
Message-ID: <202408030842.FSHqogYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jone,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   9485d66da87d67d1efc4a5f2d357616c6501dc72
commit: 180f8b73199bd665c03ff43853170280fc82e02d [2627/29299] ANDROID: kernel: add module info for debug_kinfo
config: x86_64-buildonly-randconfig-005-20240803 (https://download.01.org/0day-ci/archive/20240803/202408030842.FSHqogYK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030842.FSHqogYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030842.FSHqogYK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:162:33: error: offsetof of incomplete type 'struct module'
     162 |         info->mod_core_layout_offset = offsetof(struct module, core_layout);
         |                                        ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:140:35: note: expanded from macro '__compiler_offsetof'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:79:8: note: forward declaration of 'struct module'
      79 | struct module;
         |        ^
   drivers/staging/android/debug_kinfo.c:163:33: error: offsetof of incomplete type 'struct module'
     163 |         info->mod_init_layout_offset = offsetof(struct module, init_layout);
         |                                        ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:140:35: note: expanded from macro '__compiler_offsetof'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:79:8: note: forward declaration of 'struct module'
      79 | struct module;
         |        ^
   drivers/staging/android/debug_kinfo.c:164:30: error: offsetof of incomplete type 'struct module'
     164 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^        ~~~~~~
   include/linux/stddef.h:17:32: note: expanded from macro 'offsetof'
      17 | #define offsetof(TYPE, MEMBER)  __compiler_offsetof(TYPE, MEMBER)
         |                                 ^                   ~~~~
   include/linux/compiler_types.h:140:35: note: expanded from macro '__compiler_offsetof'
     140 | #define __compiler_offsetof(a, b)       __builtin_offsetof(a, b)
         |                                         ^                  ~
   arch/x86/include/asm/alternative.h:79:8: note: forward declaration of 'struct module'
      79 | struct module;
         |        ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +162 drivers/staging/android/debug_kinfo.c

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
   113		/* Need to wait for reserved memory to be mapped */
   114		if (!rmem->priv) {
   115			return -EPROBE_DEFER;
   116		}
   117	
   118		if (!rmem->base || !rmem->size) {
   119			dev_warn(&pdev->dev, "unexpected reserved memory\n");
   120			return -EINVAL;
   121		}
   122	
   123		if (rmem->size < sizeof(struct kernel_all_info)) {
   124			dev_warn(&pdev->dev, "unexpected reserved memory size\n");
   125			return -EINVAL;
   126		}
   127	
   128		all_info_addr = rmem->priv;
   129		all_info_size = rmem->size;
   130	
   131		memset(all_info_addr, 0, sizeof(struct kernel_all_info));
   132		all_info = (struct kernel_all_info *)all_info_addr;
   133		info = &(all_info->info);
   134		info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
   135		info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
   136		info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
   137		info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
   138		info->num_syms = kallsyms_num_syms;
   139		info->name_len = KSYM_NAME_LEN;
   140		info->bit_per_long = BITS_PER_LONG;
   141		info->module_name_len = MODULE_NAME_LEN;
   142		info->symbol_len = KSYM_SYMBOL_LEN;
   143		if (!info->enabled_base_relative)
   144			info->_addresses_pa = (u64)__pa_symbol((volatile void *)kallsyms_addresses);
   145		else {
   146			info->_relative_pa = (u64)__pa_symbol((volatile void *)kallsyms_relative_base);
   147			info->_offsets_pa = (u64)__pa_symbol((volatile void *)kallsyms_offsets);
   148		}
   149		info->_stext_pa = (u64)__pa_symbol(_stext);
   150		info->_etext_pa = (u64)__pa_symbol(_etext);
   151		info->_sinittext_pa = (u64)__pa_symbol(_sinittext);
   152		info->_einittext_pa = (u64)__pa_symbol(_einittext);
   153		info->_end_pa = (u64)__pa_symbol(_end);
   154		info->_names_pa = (u64)__pa_symbol((volatile void *)kallsyms_names);
   155		info->_token_table_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_table);
   156		info->_token_index_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_index);
   157		info->_markers_pa = (u64)__pa_symbol((volatile void *)kallsyms_markers);
   158		info->thread_size = THREAD_SIZE;
   159		info->swapper_pg_dir_pa = (u64)__pa_symbol(swapper_pg_dir);
   160		strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
   161		info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
 > 162		info->mod_core_layout_offset = offsetof(struct module, core_layout);
   163		info->mod_init_layout_offset = offsetof(struct module, init_layout);
   164		info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
   165	
   166		update_kernel_all_info(all_info);
   167	
   168		return 0;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
