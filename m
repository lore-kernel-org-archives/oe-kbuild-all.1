Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28863F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 05:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688448517; x=1719984517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KP5I1UIrrKbMbQtwqnriArfKRwLwlA8EkIMKPnnR0Pw=;
  b=GdktpReavmjgSVfHS1IPR+LVOfNa+cbiUYmny8UmF/qT3yP2qGI3XKhH
   KznlpfY1nqyuEUSj8Xs/IqPG5vE9V2Mg55eahpGWGEb5iCLYPrxx7voiv
   t2XmN/thkgP6dycGBCo3xNMzMCupPLzFd8HnGAEfIljd4tpQOaYxC/Pph
   GDMx2Rq3FvT7Z45TVyWobCKGp/oeU3hF24OZSFvT1dVfdx9qebG8exw/3
   VWJL0cB1oc45XTCHwwK0cKJ8o6nKsAML9kNbV+iXlBOL5c39YHhTvXC0r
   QGPPzIp3KXgj/QvRjd9fKb8SJK9jdW6J6Zy+yMfE3lmCp8XlC9zZ/aSUy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429075915"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="429075915"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 22:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832039620"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="832039620"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 22:28:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGYaY-000Hu3-2I;
	Tue, 04 Jul 2023 05:28:34 +0000
Date: Tue, 4 Jul 2023 13:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2196/21334]
 drivers/staging/android/debug_kinfo.c:164:34: warning:
 'debug_kinfo_of_match' defined but not used
Message-ID: <202307041334.Da8KpM7f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a68e7f0e6fe3971c1524bf0f6ebc88f02e641613
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/21334] ANDROID: staging: add debug-kinfo driver
config: x86_64-randconfig-x061-20230704 (https://download.01.org/0day-ci/archive/20230704/202307041334.Da8KpM7f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041334.Da8KpM7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041334.Da8KpM7f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
--
   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/power/hibernate_asm_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> drivers/media/common/videobuf2/videobuf2-core.c:2055: undefined reference to `v4l_vb2q_enable_media_source'

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

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/android/debug_kinfo.c:64:30: sparse: sparse: Using plain integer as NULL pointer

vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

    57	
    58	static int build_info_set(const char *str, const struct kernel_param *kp)
    59	{
    60		struct kernel_all_info *all_info;
    61		size_t build_info_size;
    62		int ret = 0;
    63	
  > 64		if (all_info_addr == 0 || all_info_size == 0) {
    65			ret = -EPERM;
    66			goto Exit;
    67		}
    68	
    69		all_info = (struct kernel_all_info *)all_info_addr;
    70		build_info_size = sizeof(all_info->info.build_info);
    71	
    72		memcpy(&all_info->info.build_info, str, min(build_info_size - 1, strlen(str)));
    73		update_kernel_all_info(all_info);
    74	
    75		if (strlen(str) > build_info_size) {
    76			pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
    77					__func__, build_info_size, str);
    78			ret = -ENOMEM;
    79		}
    80	
    81	Exit:
    82		vunmap(all_info_addr);
    83		return ret;
    84	}
    85	
    86	static const struct kernel_param_ops build_info_op = {
    87		.set = build_info_set,
    88	};
    89	
    90	module_param_cb(build_info, &build_info_op, NULL, 0200);
    91	MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");
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
   113		/* Deferred until dss.ko(dpm.o) and debug-snapshot-debug-kinfo.ko are ready */
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
   131		memset(all_info_addr, 0, all_info_size);
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
   143		info->_addresses_pa = (u64)virt_to_phys((volatile void *)kallsyms_addresses);
   144		info->_relative_pa = (u64)virt_to_phys((volatile void *)kallsyms_relative_base);
   145		info->_stext_pa = (u64)virt_to_phys(_stext);
   146		info->_etext_pa = (u64)virt_to_phys(_etext);
   147		info->_sinittext_pa = (u64)virt_to_phys(_sinittext);
   148		info->_einittext_pa = (u64)virt_to_phys(_einittext);
   149		info->_end_pa = (u64)virt_to_phys(_end);
   150		info->_offsets_pa = (u64)virt_to_phys((volatile void *)kallsyms_offsets);
   151		info->_names_pa = (u64)virt_to_phys((volatile void *)kallsyms_names);
   152		info->_token_table_pa = (u64)virt_to_phys((volatile void *)kallsyms_token_table);
   153		info->_token_index_pa = (u64)virt_to_phys((volatile void *)kallsyms_token_index);
   154		info->_markers_pa = (u64)virt_to_phys((volatile void *)kallsyms_markers);
   155		info->thread_size = THREAD_SIZE;
   156		info->swapper_pg_dir_pa = (u64)virt_to_phys(swapper_pg_dir);
   157		strlcpy(info->last_uts_release, init_utsname()->release, sizeof(info->last_uts_release));
   158	
   159		update_kernel_all_info(all_info);
   160	
   161		return 0;
   162	}
   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
