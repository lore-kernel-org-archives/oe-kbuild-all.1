Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B764071C6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780802536; cv=none; b=FZN9yLiRjf7qVKacenKeGDzanT7wIrBRMoQEKOkUmU87Lmvr7H1mZVYEIm+uwWZywGUY4qHXIyMyRjOgERE1staSTYI+tJUTdpvXuZYOgKZdXjVaTTtZ3z2oxDr7TN3TNpoAUdf23jImPqAiD2AOQOHAbuIqk/k3T2YOdJ93oPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780802536; c=relaxed/simple;
	bh=9dbx6DpuHhiRxO0R9lBB23dJBdOcku4RiRiBHrE6aRs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjUDEbw0JKzTT+qvHtlHIPBVMzXCh370nDliwKhdN+ri+5H/jKyRvNegXhM/ra9KLHjLvB3khTxMrrX4iVK1U/eS3dlyl5RGdoqA3HHIOTITu8NGIfp5MtpKbrCUYGrNnUb1xdiX4HjS7+7F4/yY7w9bWnM4B/euoFJOH2/jH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AouY+ki4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AouY+ki4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780802533; x=1812338533;
  h=date:from:to:cc:subject:message-id;
  bh=9dbx6DpuHhiRxO0R9lBB23dJBdOcku4RiRiBHrE6aRs=;
  b=AouY+ki41+00v0Tkta3MxG3VpFsuc1kRQcB8csGUzM0X1VxPLXg6GcqV
   /8ECacmbhwQqBYLYze0k0gdYFeuK+G6SglRvBn2TYC0yDGgKrpxnYM+FA
   kgbMixgkUNa+YtrgZP1sFneZn/M8mBRX61zp0dUbOH71d6zmyLqLq0iyZ
   5Sb7KGo4Usgx2ZMfASHzkB4EdqaDDYnq5LHllKwPrE8GtFqiefG/XSFg7
   a4BIgUYKxF/1LAI5sfEplnjhuI0R0oHwfTp6xlzmxQosKs4Caj9ua6oh/
   6q9uRye1KWHDf2j8C0ZdvpPQ51/ngnr1xwIfbM7zh0X9sU2Ihcj3l50nS
   Q==;
X-CSE-ConnectionGUID: OrnD7Y8DTiuUwp5vQM1huA==
X-CSE-MsgGUID: mShJPIw0RpeQ9dinQDyxPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="93066892"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="93066892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 20:22:12 -0700
X-CSE-ConnectionGUID: 2gTww33rQ3GTHuX3/oaz4A==
X-CSE-MsgGUID: tXvHiUgGQT2ieDcf6DLe6g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2026 20:22:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wW45Q-00000000Ha2-32sz;
	Sun, 07 Jun 2026 03:22:08 +0000
Date: Sun, 07 Jun 2026 11:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type
 'struct module'
Message-ID: <202606071103.08akKrYL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kuan-Ying,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: bf309bfecfed8d40a870a96a53d3c3c4448e67bf [2/2] ANDROID: gki_defconfig: enable debug_kinfo
config: arm64-randconfig-r113-20260607 (https://download.01.org/0day-ci/archive/20260607/202606071103.08akKrYL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260607/202606071103.08akKrYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606071103.08akKrYL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/android/debug_kinfo.c:10:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2177:
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
>> drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type 'struct module'
     163 |         info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
         |                                     ^        ~~~~~~~~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
     348 | struct module;
         |        ^
   5 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +163 drivers/android/debug_kinfo.c

1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   93  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   94  static int debug_kinfo_probe(struct platform_device *pdev)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   95  {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   96  	struct device_node *mem_region;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   97  	struct reserved_mem *rmem;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   98  	struct kernel_all_info *all_info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   99  	struct kernel_info *info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  100  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  101  	mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  102  	if (!mem_region) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  103  		dev_warn(&pdev->dev, "no such memory-region\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  104  		return -ENODEV;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  105  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  106  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  107  	rmem = of_reserved_mem_lookup(mem_region);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  108  	if (!rmem) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  109  		dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  110  				pdev->dev.of_node->name);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  111  		return -ENODEV;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  112  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  113  
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  114  	/* Need to wait for reserved memory to be mapped */
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  115  	if (!rmem->priv) {
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  116  		return -EPROBE_DEFER;
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  117  	}
453d97a0931169 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  118  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  119  	if (!rmem->base || !rmem->size) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  120  		dev_warn(&pdev->dev, "unexpected reserved memory\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  121  		return -EINVAL;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  122  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  123  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  124  	if (rmem->size < sizeof(struct kernel_all_info)) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  125  		dev_warn(&pdev->dev, "unexpected reserved memory size\n");
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  126  		return -EINVAL;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  127  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  128  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  129  	all_info_addr = rmem->priv;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  130  	all_info_size = rmem->size;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  131  
440b6d482f0c06 drivers/staging/android/debug_kinfo.c Jone Chou     2021-04-21  132  	memset(all_info_addr, 0, sizeof(struct kernel_all_info));
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  133  	all_info = (struct kernel_all_info *)all_info_addr;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  134  	info = &(all_info->info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  135  	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  136  	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  137  	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  138  	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  139  	info->num_syms = kallsyms_num_syms;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  140  	info->name_len = KSYM_NAME_LEN;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  141  	info->bit_per_long = BITS_PER_LONG;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  142  	info->module_name_len = MODULE_NAME_LEN;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  143  	info->symbol_len = KSYM_SYMBOL_LEN;
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  144  	if (!info->enabled_base_relative)
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  145  		info->_addresses_pa = (u64)__pa_symbol((volatile void *)kallsyms_addresses);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  146  	else {
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  147  		info->_relative_pa = (u64)__pa_symbol((volatile void *)kallsyms_relative_base);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  148  		info->_offsets_pa = (u64)__pa_symbol((volatile void *)kallsyms_offsets);
3777f3811a7f55 drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  149  	}
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  150  	info->_stext_pa = (u64)__pa_symbol(_stext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  151  	info->_etext_pa = (u64)__pa_symbol(_etext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  152  	info->_sinittext_pa = (u64)__pa_symbol(_sinittext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  153  	info->_einittext_pa = (u64)__pa_symbol(_einittext);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  154  	info->_end_pa = (u64)__pa_symbol(_end);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  155  	info->_names_pa = (u64)__pa_symbol((volatile void *)kallsyms_names);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  156  	info->_token_table_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_table);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  157  	info->_token_index_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_index);
570ae012689ba9 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  158  	info->_markers_pa = (u64)__pa_symbol((volatile void *)kallsyms_markers);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  159  	info->thread_size = THREAD_SIZE;
a806a7915c0377 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-21  160  	info->swapper_pg_dir_pa = (u64)__pa_symbol(swapper_pg_dir);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  161  	strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
180f8b73199bd6 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21  162  	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
180f8b73199bd6 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21 @163  	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
b8d72cb07e32f7 drivers/android/debug_kinfo.c         Kuan-Ying Lee 2023-12-28  164  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  165  	update_kernel_all_info(all_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  166  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  167  	return 0;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  168  }
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  169  

:::::: The code at line 163 was first introduced by commit
:::::: 180f8b73199bd665c03ff43853170280fc82e02d ANDROID: kernel: add module info for debug_kinfo

:::::: TO: Jone Chou <jonechou@google.com>
:::::: CC: Jone Chou <jonechou@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
