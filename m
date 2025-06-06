Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE83286885
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207041; cv=none; b=G3cFa9ysazR9m26HAcrfgcY6LeXD0/RUXeFGRdj9ylG9/uHbt7wvYsscmECwLKS2kV7X++UQLVVXJycU6Z6sbCf9d6zp8rUPHV1AIBNqrrNk+BjF2VKXYB5Qyz/WLLRZf1khm8JB1P9V2J5Y2Gjk5vYJfrDGPbSPjaTMRo4iOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207041; c=relaxed/simple;
	bh=eT3NWOigGAFHvp0SyMwpygC9gIHHOljvnkQzHLlawlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trF5hP8+BIegLXFS1aHzJE1QEHDrdYUqh337E8bJ6vhW093gMBzquNVayUSUBOG+rEoAHCIP0ITzoLwEvSVxHQgi2BtXmPFf/UZSGdH1BGx5aWnro4k59fk65MkDlDMhcAAxr8Bjb+nvi6h/JdM7PH0+paP5KazpUoSIPsFMBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm5/AYv7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm5/AYv7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749207039; x=1780743039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eT3NWOigGAFHvp0SyMwpygC9gIHHOljvnkQzHLlawlQ=;
  b=gm5/AYv7k0+1ULwUI/11tMo5+svU6A5Y0euiqiY4QyYcVuVy1QAdog+n
   wq0ntjYkLPUghMrTetB8G56U7/iCgWWL8EYdDG6u1Qq5NSRl7ZCjVACmV
   37v+O3oTUDHH5hWiXBf44JAvISahcuDqrytI6PGvJ/bHy/lhF5S9AbRpT
   eB8yQitc4zpixP+5XKNBgPnKktdx41hFJLDqMFcJ71kuHptLb/0U2Qpeb
   antdc98maB+RElyRgTw2xvE6trv4w/Q6mf/XGi8rx3sBYLz2A5QdOsyXm
   dqp/8v6bn11+LiBb+7zhLETymbKl4vvgUC/F8TO2cTbGs07vRXJxCDXNH
   w==;
X-CSE-ConnectionGUID: 1ODaMNPkQVaACkvFGMhp6g==
X-CSE-MsgGUID: vx7d8BBeR5WZdHExfz4WWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51233595"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51233595"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 03:50:38 -0700
X-CSE-ConnectionGUID: XmJt2mwjRSSnm8qkeL6Sjw==
X-CSE-MsgGUID: krrVT/lGQcGM5H3pd+B+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="168977106"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jun 2025 03:50:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNUeh-0004vj-0s;
	Fri, 06 Jun 2025 10:50:35 +0000
Date: Fri, 6 Jun 2025 18:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] ctrlmondata.c:undefined reference to
 `resctrl_arch_hide_cdp'
Message-ID: <202506061824.reydkcjF-lkp@intel.com>
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
commit: 5e0e3aa64e83dff9703e3f887a2be3271801ed22 [2368/2368] fs/resctrl: Fix configuration to wrong control group when CDP is enabled
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061824.reydkcjF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061824.reydkcjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061824.reydkcjF-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   aarch64-linux-ld: rdtgroup.c:(.text+0x23dc): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x23e0): undefined reference to `resctrl_arch_mon_capable'
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
   aarch64-linux-ld: rdtgroup.c:(.text+0x28a4): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x28e8): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_staged_configs_clear':
   rdtgroup.c:(.text+0x2ae4): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `__rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x2cd8): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdt_bit_usage_show':
   rdtgroup.c:(.text+0x2ec0): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_init_alloc.isra.0':
   rdtgroup.c:(.text+0x3128): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3188): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3290): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x32b4): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x32cc): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x340c): undefined reference to `resctrl_arch_update_domains'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3484): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3494): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_cbm_overlaps':
   rdtgroup.c:(.text+0x36a8): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_size_show':
   rdtgroup.c:(.text+0x3db0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x3e0c): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mode_write':
   rdtgroup.c:(.text+0x4080): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_tasks_write':
   rdtgroup.c:(.text+0x44e8): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4510): undefined reference to `resctrl_arch_match_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4534): undefined reference to `resctrl_arch_match_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4578): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x458c): undefined reference to `resctrl_arch_set_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x45d0): undefined reference to `resctrl_sched_in'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_rmdir':
   rdtgroup.c:(.text+0x4d38): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4d88): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4d88): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4d8c): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e18): undefined reference to `resctrl_arch_set_cpu_default_closid_rmid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e60): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `resctrl_arch_sync_cpu_defaults' which may bind externally can not be used when making a shared object; recompile with -fPIC
   rdtgroup.c:(.text+0x4e60): dangerous relocation: unsupported relocation
   aarch64-linux-ld: rdtgroup.c:(.text+0x4e64): undefined reference to `resctrl_arch_sync_cpu_defaults'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `mkdir_rdt_prepare':
   rdtgroup.c:(.text+0x501c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `rdtgroup_mkdir':
   rdtgroup.c:(.text+0x50ec): undefined reference to `resctrl_arch_alloc_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x520c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5288): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x52e0): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_domain':
   rdtgroup.c:(.text+0x548c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5534): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5548): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_online_domain':
   rdtgroup.c:(.text+0x5608): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56bc): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56c4): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56d0): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5720): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5768): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x57c0): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x582c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
   rdtgroup.c:(.text+0x59a0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5b04): undefined reference to `resctrl_arch_would_mbm_overflow'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5b28): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_init':
   rdtgroup.c:(.text+0x5c0c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `parse_bw_conf_type.isra.0':
   ctrlmondata.c:(.text+0x428): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: ctrlmondata.c:(.text+0x4a8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/ctrlmondata.o: in function `parse_bw':
>> ctrlmondata.c:(.text+0x568): undefined reference to `resctrl_arch_hide_cdp'
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
   aarch64-linux-ld: monitor.c:(.text+0x1f8): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x23c): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x2bc): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `__check_limbo':
   monitor.c:(.text+0x324): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x32c): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: monitor.c:(.text+0x344): undefined reference to `resctrl_arch_mon_ctx_alloc'
   aarch64-linux-ld: monitor.c:(.text+0x3ec): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x40c): undefined reference to `resctrl_arch_rmid_read'
   aarch64-linux-ld: monitor.c:(.text+0x4d8): undefined reference to `resctrl_arch_mon_ctx_free'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `has_busy_rmid':
   monitor.c:(.text+0x510): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `alloc_rmid':
   monitor.c:(.text+0x5e4): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x5f4): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `free_rmid':
   monitor.c:(.text+0x90c): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x91c): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x948): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x950): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: monitor.c:(.text+0x960): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0x974): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `mbm_handle_overflow':
   monitor.c:(.text+0xad4): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: monitor.c:(.text+0xaf0): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xb8c): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xbec): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: monitor.c:(.text+0xbfc): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xc18): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0xce8): undefined reference to `resctrl_arch_get_config'
   aarch64-linux-ld: monitor.c:(.text+0xd84): undefined reference to `resctrl_arch_update_one'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `mbm_setup_overflow_handler':
   monitor.c:(.text+0xe4c): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `resctrl_mon_resource_init':
   monitor.c:(.text+0xf50): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: monitor.c:(.text+0xf98): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: monitor.c:(.text+0xfa8): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: monitor.c:(.text+0x1028): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x1074): undefined reference to `resctrl_arch_rmid_idx_encode'
   aarch64-linux-ld: monitor.c:(.text+0x108c): undefined reference to `resctrl_arch_rmid_idx_decode'
   aarch64-linux-ld: monitor.c:(.text+0x10c8): undefined reference to `resctrl_arch_mon_resource_init'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `resctrl_mon_resource_exit':
   monitor.c:(.text+0x1110): undefined reference to `resctrl_arch_get_resource'
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
