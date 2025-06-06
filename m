Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD9283FF9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749199534; cv=none; b=od7ur7ZWxv8phe2L+Yf8ameBOIHQ8Qm/943M3hBA+A8zHzLuxyJPl7z9lhUrctEJvOGD+OsmMk5Caa+BHXVZDQI357lzIVgfDdPTLnZk026mwD0k9+9o0h1bMoPoanRtL4OrO/rySzkjX6275lvwpOvZqmyrJsw5ORR/WPVTZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749199534; c=relaxed/simple;
	bh=TEqYL1UOFAveXbx/WmcgfVN95XhOHxdsB7Pax9o4x6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ex97vIlIXnD+ZMNaICBeJGSVPZK9UbK9SsdBgFg9LWV5cnMcYKcvGPl+rApCeN8IjQhFEUe0g65Gk9/9/Hw0rnJE3diCj4NBtmZUGYhfnOtr4LJ2bwe0JXDmCwY4q2ovdtAjXzSd2x6Vd62LL1AxkwmMyHlbBBNCJJxX4AJ8fss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhXn6V8+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhXn6V8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749199532; x=1780735532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEqYL1UOFAveXbx/WmcgfVN95XhOHxdsB7Pax9o4x6Y=;
  b=VhXn6V8+5Ic3tTtTnR1PoRy315qX2NYOtITr+lvUsFg91tAImUAXaikG
   6NMl8M/9sjHOlm9ktLbLfRgXwjoD4UzYuToQ+uypzR4JOkqHhfInkVplY
   UBJvXl5veE/wU9BaRhaZt6e9IGvs275keC1LVL8dDXwsIbGmPqvQyazcc
   oY4hvIGUMGMZxNrQPaT0lgIZRf8Jo1la8HiquJYqfs3X5cnAVYbNpz8m6
   2YipGcZzwmng/Q1U9G65q4EytyQYc9RXUgH3SfG4Wr52Ae3ihGkAEC86i
   8GBJf037ZRHzQu+aC9gHeUKMP9fa3rOWT9KmLhS0BkGPnZhd4JlrgazIa
   g==;
X-CSE-ConnectionGUID: TBID4Rg1TDeeuQvB6xdRLg==
X-CSE-MsgGUID: mVRhoprCRgmmxTB7w3KZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55151268"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="55151268"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 01:45:31 -0700
X-CSE-ConnectionGUID: 1GcSbcCXS4iVr6QKlH2OAQ==
X-CSE-MsgGUID: BuRAJCubSRSXeSDiC7kw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="150596046"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jun 2025 01:45:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNSha-0004rL-0a;
	Fri, 06 Jun 2025 08:45:26 +0000
Date: Fri, 6 Jun 2025 16:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] aarch64-linux-ld: rdtgroup.c:undefined
 reference to `resctrl_arch_would_mbm_overflow'
Message-ID: <202506061655.Rt6FNr52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b252849e2320fe952d448bcb2d23699e357b3d54
commit: 63ef510d15264460c349182162d635eb4a113aac [2368/2368] fs/resctrl: Determine whether the MBM monitors require overflow checking
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061655.Rt6FNr52-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061655.Rt6FNr52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061655.Rt6FNr52-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/process.o: in function `__switch_to':
   process.c:(.sched.text+0x164): undefined reference to `mpam_resctrl_default_group'
   aarch64-linux-ld: arch/arm64/kernel/process.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mpam_resctrl_default_group' which may bind externally can not be used when making a shared object; recompile with -fPIC
   process.c:(.sched.text+0x164): dangerous relocation: unsupported relocation
   aarch64-linux-ld: process.c:(.sched.text+0x170): undefined reference to `mpam_resctrl_default_group'
   aarch64-linux-ld: arch/arm64/kernel/mpam.o: in function `arm64_mpam_register_cpus':
   mpam.c:(.init.text+0x48): undefined reference to `mpam_register_requestor'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `is_rmid_match':
   rdtgroup.c:(.text+0x94): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0xc0): undefined reference to `resctrl_arch_match_rmid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `_update_task_closid_rmid':
   rdtgroup.c:(.text+0x354): undefined reference to `resctrl_sched_in'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `update_closid_rmid':
   rdtgroup.c:(.text+0x3ac): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x3ac): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x3b0): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `cpus_ctrl_write':
   rdtgroup.c:(.text+0x460): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x460): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x46c): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mon_config_write':
   rdtgroup.c:(.text+0x748): undefined reference to `resctrl_arch_mon_event_config_read'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_mon_event_config_read' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x748): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x750): undefined reference to `resctrl_arch_mon_event_config_read'
   aarch64-linux-ld: rdtgroup.c:(.text+0x774): undefined reference to `resctrl_arch_mon_event_config_write'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_mon_event_config_write' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x774): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x77c): undefined reference to `resctrl_arch_mon_event_config_write'
   aarch64-linux-ld: rdtgroup.c:(.text+0x7ac): undefined reference to `resctrl_arch_reset_rmid_all'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mbm_config_show':
   rdtgroup.c:(.text+0x9dc): undefined reference to `resctrl_arch_mon_event_config_read'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_mon_event_config_read' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x9dc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x9e4): undefined reference to `resctrl_arch_mon_event_config_read'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_is_mbm_enabled':
   rdtgroup.c:(.text+0xdc8): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0xdd4): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_show_options':
   rdtgroup.c:(.text+0x1414): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1434): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1454): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1460): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `supports_mba_mbps':
   rdtgroup.c:(.text+0x1510): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1518): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1558): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `set_mba_sc':
   rdtgroup.c:(.text+0x1658): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1660): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1680): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_disable_ctx':
   rdtgroup.c:(.text+0x1750): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x175c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_mondata_all':
   rdtgroup.c:(.text+0x17dc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare_rmid_alloc':
   rdtgroup.c:(.text+0x1894): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `schemata_list_add':
   rdtgroup.c:(.text+0x197c): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x198c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1a4c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `is_closid_match.isra.0':
   rdtgroup.c:(.text+0x1cdc): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1cfc): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_move_group_tasks.isra.0':
   rdtgroup.c:(.text+0x1e50): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rename':
   rdtgroup.c:(.text+0x21c8): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x21c8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x21d0): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_kill_sb':
   rdtgroup.c:(.text+0x2280): undefined reference to `resctrl_arch_reset_resources'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2394): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x2394): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x239c): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x23d4): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x23d8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_get_tree':
   rdtgroup.c:(.text+0x2470): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x250c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2544): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x257c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x25b8): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x25cc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2608): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x269c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2778): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x27fc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2858): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2868): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x286c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2870): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2888): undefined reference to `resctrl_arch_mon_capable'
>> aarch64-linux-ld: rdtgroup.c:(.text+0x28a4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28e8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_staged_configs_clear':
   rdtgroup.c:(.text+0x2aa4): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `__rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x2c98): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_bit_usage_show':
   rdtgroup.c:(.text+0x2e80): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_init_alloc.isra.0':
   rdtgroup.c:(.text+0x30e8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3148): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3250): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3274): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x328c): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x33cc): undefined reference to `resctrl_arch_update_domains'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3444): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3454): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x3668): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_size_show':
   rdtgroup.c:(.text+0x3d70): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3dcc): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mode_write':
   rdtgroup.c:(.text+0x4040): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_tasks_write':
   rdtgroup.c:(.text+0x44a8): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x44d0): undefined reference to `resctrl_arch_match_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x44f4): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4538): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x454c): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4590): undefined reference to `resctrl_sched_in'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rmdir':
   rdtgroup.c:(.text+0x4cf8): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4d48): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4d48): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4d4c): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4dd8): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e20): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4e20): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e24): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare':
   rdtgroup.c:(.text+0x4fdc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mkdir':
   rdtgroup.c:(.text+0x50ac): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x51cc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5248): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x52a0): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_domain':
   rdtgroup.c:(.text+0x544c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x54f4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5508): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_online_domain':
   rdtgroup.c:(.text+0x55c8): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x567c): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5684): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5690): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56e0): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5728): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5780): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x57ec): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
   rdtgroup.c:(.text+0x5960): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5ac4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5ae8): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_init':
   rdtgroup.c:(.text+0x5bcc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `parse_bw':
   ctrlmondata.c:(.text+0x168): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0x1e8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_schemata_write':
   ctrlmondata.c:(.text+0x888): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0x8a4): undefined reference to `resctrl_arch_update_domains'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_schemata_show':
   ctrlmondata.c:(.text+0xb0c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xb64): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `mon_event_read':
   ctrlmondata.c:(.text+0xc54): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xca0): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_mondata_show':
   ctrlmondata.c:(.text+0xd10): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xd1c): undefined reference to `resctrl_arch_find_domain'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `__mon_event_count':
   monitor.c:(.text+0x54): undefined reference to `resctrl_arch_reset_rmid'
   aarch64-linux-ld: monitor.c:(.text+0x68): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0xc4): undefined reference to `resctrl_arch_rmid_read'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `mbm_update':
   monitor.c:(.text+0x11c): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: monitor.c:(.text+0x138): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x184): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: monitor.c:(.text+0x188): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: monitor.c:(.text+0x1a4): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x1f8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x23c): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x2bc): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `__check_limbo':
   monitor.c:(.text+0x324): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x32c): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: monitor.c:(.text+0x344): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x3ec): undefined reference to `resctrl_arch_rmid_idx_decode'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
