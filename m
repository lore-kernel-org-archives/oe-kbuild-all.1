Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49A3AA1B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813039; cv=none; b=NVkIew9hwpJRW8cTbUbbdIUIPz2wpklh2GUW7qiBFtJTNUPksILEXv5MqSK0L3qBMQaLgNOQ67XidQRo/lehmP9d5OCGld2gPK+llHujF3Lidq0zFETEIcOaFN3L8MlwJ4/8nXsOcOcgZy2Mk8nZP5VbiaV7SJK6/piZAf8LI38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813039; c=relaxed/simple;
	bh=MHehQlJhQd1CaMEv8ntwhiE0yhGvp6tE2jNjPqCxyVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cRIoWNk5+X2GbFde/GMNb0yRYMn8VjNbJx1MLTsyVi7TJPohDUGVmjBHGlXBMDdXF7wa8SXnmP788JJaa90CTggRWtHCX4tBwqFYB9gn59k1J/yshIAbsnpSjLmfUnx6x+GiIpTJyHI2dE+NErNqGnLPrheWd8btTxg3V3YksHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfjQ39Qc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfjQ39Qc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778813038; x=1810349038;
  h=date:from:to:cc:subject:message-id;
  bh=MHehQlJhQd1CaMEv8ntwhiE0yhGvp6tE2jNjPqCxyVc=;
  b=nfjQ39QckUAl24XMD+/7rogjPj98ODnv4Heydmk8Ijx+Oa4A/XYRFQem
   +jH8i2h26M/Wwmay2ipSzMibLyBUId6QYoS1RQbYazhhpnhgfxF5ujwiv
   9RbusKi+27Myhk59Tq3cGqn5TeyNHB/Y08zDhtBjX41cMBy5EmTaWc1X5
   L96F/RZ/NIHSQzlPHY7DLUoY7sgkB+ZWa5PDlyXAVY3LJasIKZdg27B9Y
   F3FG908UoKBjWV6KCpTU7cI/rMs+q9NOWz4XA3TLoJvQLaWxbxb5qENok
   riNu9YmjcUP7C16Wsvh610abFFwj0JCSBtrPquVc9hocHfw+l7jHy+ERb
   A==;
X-CSE-ConnectionGUID: Wlh5zFO1S9i9sIFEaeOt0w==
X-CSE-MsgGUID: hB4mSy6gTcmcVYeOpd1ccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97194370"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="97194370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 19:43:58 -0700
X-CSE-ConnectionGUID: RwWyEB1mRZyu9ZsbFb3W6g==
X-CSE-MsgGUID: qK+GFp65TfeJfcAtAqxX8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="243530081"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2026 19:43:57 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNiWB-000000000eR-1Wfn;
	Fri, 15 May 2026 02:43:25 +0000
Date: Fri, 15 May 2026 10:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-04 1/1]
 drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type
 'struct module'
Message-ID: <202605151057.Kj0YEjGK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-04
head:   5806bc613966778fc5c53fa7fb1571c6d5fe438f
commit: b963d403e5a9d01ad135d8d346a439e1894ff341 [1/1] ANDROID: gki_defconfig: enable debug_kinfo
config: arm64-randconfig-001-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151057.Kj0YEjGK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151057.Kj0YEjGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151057.Kj0YEjGK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/debug_kinfo.c:163:30: error: offsetof of incomplete type 'struct module'
           info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
                                       ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                  ~~~~
   include/linux/printk.h:348:8: note: forward declaration of 'struct module'
   struct module;
          ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +163 drivers/android/debug_kinfo.c

1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   93  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   94  static int debug_kinfo_probe(struct platform_device *pdev)
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   95  {
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   96  	struct device_node *mem_region;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   97  	struct reserved_mem *rmem;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   98  	struct kernel_all_info *all_info;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16   99  	struct kernel_info *info;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  100  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  101  	mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  102  	if (!mem_region) {
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  103  		dev_warn(&pdev->dev, "no such memory-region\n");
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  104  		return -ENODEV;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  105  	}
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  106  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  107  	rmem = of_reserved_mem_lookup(mem_region);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  108  	if (!rmem) {
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  109  		dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  110  				pdev->dev.of_node->name);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  111  		return -ENODEV;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  112  	}
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  113  
453d97a09311698 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  114  	/* Need to wait for reserved memory to be mapped */
453d97a09311698 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  115  	if (!rmem->priv) {
453d97a09311698 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  116  		return -EPROBE_DEFER;
453d97a09311698 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  117  	}
453d97a09311698 drivers/staging/android/debug_kinfo.c Will McVicker 2021-02-08  118  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  119  	if (!rmem->base || !rmem->size) {
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  120  		dev_warn(&pdev->dev, "unexpected reserved memory\n");
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  121  		return -EINVAL;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  122  	}
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  123  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  124  	if (rmem->size < sizeof(struct kernel_all_info)) {
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  125  		dev_warn(&pdev->dev, "unexpected reserved memory size\n");
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  126  		return -EINVAL;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  127  	}
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  128  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  129  	all_info_addr = rmem->priv;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  130  	all_info_size = rmem->size;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  131  
440b6d482f0c06a drivers/staging/android/debug_kinfo.c Jone Chou     2021-04-21  132  	memset(all_info_addr, 0, sizeof(struct kernel_all_info));
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  133  	all_info = (struct kernel_all_info *)all_info_addr;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  134  	info = &(all_info->info);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  135  	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  136  	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  137  	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  138  	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  139  	info->num_syms = kallsyms_num_syms;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  140  	info->name_len = KSYM_NAME_LEN;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  141  	info->bit_per_long = BITS_PER_LONG;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  142  	info->module_name_len = MODULE_NAME_LEN;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  143  	info->symbol_len = KSYM_SYMBOL_LEN;
3777f3811a7f55a drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  144  	if (!info->enabled_base_relative)
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  145  		info->_addresses_pa = (u64)__pa_symbol((volatile void *)kallsyms_addresses);
3777f3811a7f55a drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  146  	else {
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  147  		info->_relative_pa = (u64)__pa_symbol((volatile void *)kallsyms_relative_base);
3777f3811a7f55a drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  148  		info->_offsets_pa = (u64)__pa_symbol((volatile void *)kallsyms_offsets);
3777f3811a7f55a drivers/staging/android/debug_kinfo.c Jone Chou     2021-06-06  149  	}
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  150  	info->_stext_pa = (u64)__pa_symbol(_stext);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  151  	info->_etext_pa = (u64)__pa_symbol(_etext);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  152  	info->_sinittext_pa = (u64)__pa_symbol(_sinittext);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  153  	info->_einittext_pa = (u64)__pa_symbol(_einittext);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  154  	info->_end_pa = (u64)__pa_symbol(_end);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  155  	info->_names_pa = (u64)__pa_symbol((volatile void *)kallsyms_names);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  156  	info->_token_table_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_table);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  157  	info->_token_index_pa = (u64)__pa_symbol((volatile void *)kallsyms_token_index);
570ae012689ba9d drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-20  158  	info->_markers_pa = (u64)__pa_symbol((volatile void *)kallsyms_markers);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  159  	info->thread_size = THREAD_SIZE;
a806a7915c03779 drivers/staging/android/debug_kinfo.c Jone Chou     2021-05-21  160  	info->swapper_pg_dir_pa = (u64)__pa_symbol(swapper_pg_dir);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  161  	strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
180f8b73199bd66 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21  162  	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
180f8b73199bd66 drivers/staging/android/debug_kinfo.c Jone Chou     2020-12-21 @163  	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
3e58a8565cf2040 drivers/android/debug_kinfo.c         Kuan-Ying Lee 2023-12-28  164  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  165  	update_kernel_all_info(all_info);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  166  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  167  	return 0;
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  168  }
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou     2020-10-16  169  

:::::: The code at line 163 was first introduced by commit
:::::: 180f8b73199bd665c03ff43853170280fc82e02d ANDROID: kernel: add module info for debug_kinfo

:::::: TO: Jone Chou <jonechou@google.com>
:::::: CC: Jone Chou <jonechou@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
