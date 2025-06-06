Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246D14AD20
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220078; cv=none; b=k7oAxTl9pibl0c8zODQ8q3kvgbqa40R8QXE+TsX/rAOK/xJB6Rkte5bQFcOkwGz+IHoEKoNHgEiTD0Q2+LxKBk88Z0F7KiwnyakuIZdfQHToDd3rM2JHOepfj/DGiIviHpr6QK63453s+Vuvw2NajD3BTI0YRDU4Q/1UVMlY6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220078; c=relaxed/simple;
	bh=y7IJI4UgwJ+5JXH+y2wzGphlXBZrfYCsMPBG7gwhJNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCcJfw6lQiuZOn7pEst7Q3oTwStJzo8hgM6AiQxS+84VupAOGRjf3XdjVEbCqJYCU9+CFldl4qHbM7RWaj5jdouWJan8dOmYKq67k1Yun1T7KreHWNniMArJhshe8MzZQPzZoxqU9zp5FJAP7wVaeNIyC46Y7wCidUHBMIePWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEbfy8w9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEbfy8w9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749220077; x=1780756077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7IJI4UgwJ+5JXH+y2wzGphlXBZrfYCsMPBG7gwhJNM=;
  b=VEbfy8w9UdoK/OjhAI30i5wirIrq471PTkHAyBIIwrghF5IQ73JLN3T7
   D+iOUbKSVGWoAQSq/1/w4Z7WGUMo2W5swWDL2bgOE2Y02k8hdG+ZQlqGP
   plpEvEownW4k4CVQGQ+RaRtJZYDllklp8FsuVhI5EtDASUEOnsDkNGc1D
   tXsluTyyxdTlGemtXYeVatdi6qPdSPXEQZ2rxxyZ42zJPNAcs4Kvrbglu
   d6rf9okF6ikf+5JfTOFXkhqUVYSZrmKXZtqxSbr/AaO8Jfue1k4ausO1c
   y0XUETcCMC+Sj+o+/JCi/5DUn42Zv6zXfaqEC86DuyxjR01Pmqrf0xLd4
   Q==;
X-CSE-ConnectionGUID: +MzWruxQQy68Hz3dsg4T8A==
X-CSE-MsgGUID: s2s5qEE0Siq5CC+jWw/n0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51076019"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51076019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 07:27:56 -0700
X-CSE-ConnectionGUID: 9wp3q6MwSyqFqD9BC7tm0Q==
X-CSE-MsgGUID: kJdzQdWSTxOkrS3GHMR83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="145735337"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2025 07:27:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNY2x-00052D-1g;
	Fri, 06 Jun 2025 14:27:51 +0000
Date: Fri, 6 Jun 2025 22:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] mpam.c:undefined reference to
 `resctrl_arch_get_resource'
Message-ID: <202506062241.Z2ZA94Wb-lkp@intel.com>
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
commit: 2c4d4c6c01d4d42c3b39ddbf8687ac246b6908d6 [2368/2368] arm64/mpam: Refuse to enter powerdown state after L2 msc updated
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062241.Z2ZA94Wb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062241.Z2ZA94Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506062241.Z2ZA94Wb-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/process.o: in function `__switch_to':
   process.c:(.sched.text+0x164): undefined reference to `mpam_resctrl_default_group'
   aarch64-linux-ld: arch/arm64/kernel/process.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `mpam_resctrl_default_group' which may bind externally can not be used when making a shared object; recompile with -fPIC
   process.c:(.sched.text+0x164): dangerous relocation: unsupported relocation
   aarch64-linux-ld: process.c:(.sched.text+0x170): undefined reference to `mpam_resctrl_default_group'
   aarch64-linux-ld: arch/arm64/kernel/mpam.o: in function `mpam_pm_notifier':
>> mpam.c:(.text+0x74): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: arch/arm64/kernel/mpam.o: in function `arm64_mpam_register_cpus':
   mpam.c:(.init.text+0x68): undefined reference to `mpam_register_requestor'
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
   aarch64-linux-ld: rdtgroup.c:(.text+0xddc): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0xde8): undefined reference to `resctrl_arch_is_mbm_core_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_show_options':
   rdtgroup.c:(.text+0x1454): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1474): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1494): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x14a0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `supports_mba_mbps':
   rdtgroup.c:(.text+0x1550): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1558): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1598): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `set_mba_sc':
   rdtgroup.c:(.text+0x16d8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x16e0): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1700): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_disable_ctx':
   rdtgroup.c:(.text+0x17d0): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x17dc): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_mondata_all':
   rdtgroup.c:(.text+0x1864): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare_rmid_alloc':
   rdtgroup.c:(.text+0x1954): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `schemata_list_add':
   rdtgroup.c:(.text+0x1a3c): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1a4c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1b0c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `is_closid_match.isra.0':
   rdtgroup.c:(.text+0x1d9c): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1dbc): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_move_group_tasks.isra.0':
   rdtgroup.c:(.text+0x1f10): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rename':
   rdtgroup.c:(.text+0x2288): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x2288): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x2290): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_kill_sb':
   rdtgroup.c:(.text+0x2340): undefined reference to `resctrl_arch_reset_resources'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2454): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x2454): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x245c): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x249c): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x24a0): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_get_tree':
   rdtgroup.c:(.text+0x2530): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x25cc): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2604): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x263c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2670): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x26b0): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x26bc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x26f8): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x278c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2878): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28fc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2958): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2968): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x296c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2970): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2988): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x29a4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x29e8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_staged_configs_clear':
   rdtgroup.c:(.text+0x2be4): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `__rdtgroup_cbm_overlaps':

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
