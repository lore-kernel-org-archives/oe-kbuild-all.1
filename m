Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BC288C1C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213910; cv=none; b=chuwMVdw5N2hpF78YtgFqPSsBCnON0HryWrCeOHYa1H7ThYlIzet4Ekz1RArMEVUWLKh0aoYbedXqq+wJLMR9MHYQzla0Cutf9stFXNMV7uHtj+UDxztjx9UuI7SOM+8MCvQ00WQY6pGHyXyqA/mcZpTPH4xcF9T5BFyFyr0+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213910; c=relaxed/simple;
	bh=Z4FqJOyter6R2I0fSn/UuAGtHLsCbSGz8nF2eruaiuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xly35CYLo46hki8q7JqZ6kpC7MrB55tAgZoiTEGJCGFhLMEV7g67lPIirLONVFab2XAqF+3LzRP0K7i4eLGMqehyDmelkKKdgWmlph8rlU7FrtDMQ5W5vUifjbz6yevZP6KwughQWc1igQYD8Pbgq4aRA5/rrqO90yMTbuZzfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv0BkLMn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv0BkLMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749213908; x=1780749908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4FqJOyter6R2I0fSn/UuAGtHLsCbSGz8nF2eruaiuM=;
  b=Cv0BkLMn+cWRGejXV+AS3+TqGMZOuGoHmfcojgvUzQUTry4cuxFGpfF3
   X82+HFUCAbmVyXaGFn4TVmvOYhe29DYJpKGYDkqq1m5D1n/tSl8yfQVSP
   JL54r7fbpjgErmoUqoGIlDtFrHBgPuBs0r6Icg5MAnWRxXkVGBHqRWojf
   X6c/mqBEYHTccwZxAs3HpiwB/jfetsV1SjZehSpu8wRcoRMQeJLDit00l
   FWIBdfNpEFHKzZwEOGxkKwJDbhR4VdV5x0qxbomvASnrjc5eoQCMInnct
   KLyJZ0FhoGd7n6TTAaytQAX/ckaTNgfWm0amEOw8ERrdjt66HT4wAtCAu
   A==;
X-CSE-ConnectionGUID: dQQEs0LFQiORQZynevlqCg==
X-CSE-MsgGUID: BfggNmZoQmuRxLpiYaE8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51065524"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51065524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 05:43:47 -0700
X-CSE-ConnectionGUID: KrzLVECzSBSML8sfuLkuIQ==
X-CSE-MsgGUID: yvIjyJOGQOq4FFYfMNMkHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="149658597"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2025 05:43:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNWQB-0004yt-14;
	Fri, 06 Jun 2025 12:43:43 +0000
Date: Fri, 6 Jun 2025 20:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] aarch64-linux-ld: rdtgroup.c:undefined
 reference to `resctrl_arch_is_mbm_core_enabled'
Message-ID: <202506062019.9DntRx4K-lkp@intel.com>
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
commit: 556688623b2b867f4e766229a1593f1d0820be34 [2368/2368] fs/resctrl: Create l2 cache monitors
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062019.9DntRx4K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062019.9DntRx4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506062019.9DntRx4K-lkp@intel.com/

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
   aarch64-linux-ld: rdtgroup.c:(.text+0xddc): undefined reference to `resctrl_arch_is_mbm_local_enabled'
>> aarch64-linux-ld: rdtgroup.c:(.text+0xde8): undefined reference to `resctrl_arch_is_mbm_core_enabled'
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
   rdtgroup.c:(.text+0x1698): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x16a0): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x16c0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_disable_ctx':
   rdtgroup.c:(.text+0x1790): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x179c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_mondata_all':
   rdtgroup.c:(.text+0x181c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare_rmid_alloc':
   rdtgroup.c:(.text+0x18d4): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `schemata_list_add':
   rdtgroup.c:(.text+0x19bc): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x19cc): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1a8c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `is_closid_match.isra.0':
   rdtgroup.c:(.text+0x1d1c): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x1d3c): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_move_group_tasks.isra.0':
   rdtgroup.c:(.text+0x1e90): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rename':
   rdtgroup.c:(.text+0x2208): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x2208): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x2210): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_kill_sb':
   rdtgroup.c:(.text+0x22c0): undefined reference to `resctrl_arch_reset_resources'
   aarch64-linux-ld: rdtgroup.c:(.text+0x23d4): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x23d4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x23dc): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x241c): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2420): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_get_tree':
   rdtgroup.c:(.text+0x24b0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x254c): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2584): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x25bc): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x25f8): undefined reference to `resctrl_arch_set_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x260c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2648): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x26dc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x27c8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x284c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28a8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28b8): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28bc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28c0): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28d8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28f4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x2938): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_staged_configs_clear':
   rdtgroup.c:(.text+0x2b24): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `__rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x2d18): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_bit_usage_show':
   rdtgroup.c:(.text+0x2f00): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_init_alloc.isra.0':
   rdtgroup.c:(.text+0x3168): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x31c8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x32d0): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x32f4): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x330c): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x344c): undefined reference to `resctrl_arch_update_domains'
   aarch64-linux-ld: rdtgroup.c:(.text+0x34c4): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x34d4): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x36e8): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_size_show':
   rdtgroup.c:(.text+0x3df0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3e4c): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mode_write':
   rdtgroup.c:(.text+0x40c0): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_tasks_write':
   rdtgroup.c:(.text+0x4528): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4550): undefined reference to `resctrl_arch_match_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4574): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x45b8): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x45cc): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4610): undefined reference to `resctrl_sched_in'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rmdir':
   rdtgroup.c:(.text+0x4d78): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4dc8): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4dc8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4dcc): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e58): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4ea0): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4ea0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4ea4): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare':
   rdtgroup.c:(.text+0x505c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mkdir':
   rdtgroup.c:(.text+0x512c): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x524c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x52c8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5320): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_domain':
   rdtgroup.c:(.text+0x54cc): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5574): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5588): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_online_domain':
   rdtgroup.c:(.text+0x5648): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56fc): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5704): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5710): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5760): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x579c): undefined reference to `resctrl_arch_is_mbm_core_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x57e4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5840): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x58ac): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
   rdtgroup.c:(.text+0x5a20): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5b84): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5ba8): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_init':
   rdtgroup.c:(.text+0x5c8c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `parse_bw_conf_type.isra.0':
   ctrlmondata.c:(.text+0x430): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0x4b4): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `parse_bw':
   ctrlmondata.c:(.text+0x568): undefined reference to `resctrl_arch_hide_cdp'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_schemata_write':
   ctrlmondata.c:(.text+0x948): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0x964): undefined reference to `resctrl_arch_update_domains'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_schemata_show':
   ctrlmondata.c:(.text+0xbcc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xc24): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `mon_event_read':
   ctrlmondata.c:(.text+0xd14): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xd60): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `rdtgroup_mondata_show':
   ctrlmondata.c:(.text+0xdd0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0xddc): undefined reference to `resctrl_arch_find_domain'
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
   aarch64-linux-ld: monitor.c:(.text+0x1e8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x230): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x2b8): undefined reference to `resctrl_arch_mon_ctx_free'
>> aarch64-linux-ld: monitor.c:(.text+0x2bc): undefined reference to `resctrl_arch_is_mbm_core_enabled'
   aarch64-linux-ld: monitor.c:(.text+0x2d8): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x334): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `__check_limbo':
   monitor.c:(.text+0x3a4): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x3ac): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: monitor.c:(.text+0x3c4): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x46c): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x48c): undefined reference to `resctrl_arch_rmid_read'
   aarch64-linux-ld: monitor.c:(.text+0x564): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `has_busy_rmid':
   monitor.c:(.text+0x5d0): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `alloc_rmid':
   monitor.c:(.text+0x6ac): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x6bc): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `free_rmid':
   monitor.c:(.text+0x9cc): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x9dc): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0xa08): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0xa10): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: monitor.c:(.text+0xa20): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xa34): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `mbm_handle_overflow':
   monitor.c:(.text+0xb94): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: monitor.c:(.text+0xbb0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xc4c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xcac): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: monitor.c:(.text+0xcbc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xcd8): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0xda8): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: monitor.c:(.text+0xe44): undefined reference to `resctrl_arch_update_one'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `mbm_setup_overflow_handler':
   monitor.c:(.text+0xf0c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `resctrl_mon_resource_init':
   monitor.c:(.text+0x1010): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x1050): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: monitor.c:(.text+0x1068): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: monitor.c:(.text+0x10e4): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x1130): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x1148): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x1184): undefined reference to `resctrl_arch_mon_resource_init'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `resctrl_mon_resource_exit':
   monitor.c:(.text+0x11d0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/psuedo_lock.o: in function `rdtgroup_locksetup_enter':
   psuedo_lock.c:(.text+0x3ec): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: psuedo_lock.c:(.text+0x40c): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.o: in function `arm_smmu_device_hw_probe':
   arm-smmu-v3.c:(.text+0x2a94): undefined reference to `mpam_register_requestor'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
