Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE131E9906
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 05:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749187816; cv=none; b=T4dyaqbWoiaKy7VNeEB/5rqdhqTBRXsR3vD38L7QnH0B2a4RjR7Z7Eh6oO7QGJAyysgpYEQdFb10YI9PrqkurO/6W6AHVxE8cxx7oR0EYt52OvsLImnNwzS2WQ23XjAJXFBOmI6jehRLJ0SvEcd+16VQstVWSi4Eqaxstwvn3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749187816; c=relaxed/simple;
	bh=/uKVgSYGivcHD71Jep29wq6au4H55+QQfeKTlueSfNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2oWbUhfuGZ+bQTRtYMGVTOcMIxBU4qXsrPz4jwMwbCv6rNETXe4a2jQlpQDazbbWwS3x+lqgarIYyKM9h/ugSyXlXNZ11aD8WRCq7GHsWiztTim0tjIjOCFBxGMbq7wbI9dNxXaeL8thnjKuiOb8E0MOpKIBGCwhK7cF+PgOV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlxzEldP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlxzEldP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749187814; x=1780723814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/uKVgSYGivcHD71Jep29wq6au4H55+QQfeKTlueSfNo=;
  b=TlxzEldPm5KTTn7mMTqUwnI9gnPrpuaNaoI/s0X0bnCuttFOQJyr9/e2
   f6U58KbnCsyvSl10INzXyilpljGcIjt6ihbY0I3dbS7Ww7Iy6r5k9Jyj0
   Wr4LYdvrvye8+Jjmhgy0MG0P5BAioG8qQRihatZ30b+7f0HATVFzZ9NL9
   vmATx37N7D7VW7mNZtYSpwnECDNBxxP7uw1fSWBhi4ZZYFpHYkcLfPKfb
   4KjNGVfqSdM9JQMn67P+VvyV+8Rnsrh9oqOcGNMkWJeSQPIrLhAQBjwLm
   PI1wuYmHRi9YKO2EcDt+Vv1LiI/W282hFH4ZjBisF2DFEJyXMlA99Vu7v
   A==;
X-CSE-ConnectionGUID: a9jH3AjaTCSoaejWtl2i0A==
X-CSE-MsgGUID: IOnB7Qg9RVqRVYYGwtaWgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55118464"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="55118464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 22:30:13 -0700
X-CSE-ConnectionGUID: 0i9srrsFSky5EzLjmJTO2Q==
X-CSE-MsgGUID: anogs+s6SAmxSVNmNd6Lqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="145604348"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2025 22:30:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNPeb-0004lJ-3A;
	Fri, 06 Jun 2025 05:30:09 +0000
Date: Fri, 6 Jun 2025 13:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] arm-smmu-v3.c:undefined reference to
 `mpam_register_requestor'
Message-ID: <202506061331.jqvAMh0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   98afdf0c3d90d25408acc748fef15202f4864b40
commit: 4c56f8ef604b87b22207c39fe844294a56f6874d [2368/2368] iommu/arm-smmu-v3: Register SMMU capabilities with MPAM
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061331.jqvAMh0M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061331.jqvAMh0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061331.jqvAMh0M-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   aarch64-linux-ld: rdtgroup.c:(.text+0x54fc): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_online_domain':
   rdtgroup.c:(.text+0x55c8): undefined reference to `resctrl_arch_get_num_closid'
   aarch64-linux-ld: rdtgroup.c:(.text+0x567c): undefined reference to `resctrl_arch_system_num_rmid_idx'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5684): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5690): undefined reference to `resctrl_arch_is_mbm_total_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x56e0): undefined reference to `resctrl_arch_is_mbm_local_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5778): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
   aarch64-linux-ld: rdtgroup.c:(.text+0x57e4): undefined reference to `resctrl_arch_mon_capable'
   aarch64-linux-ld: fs/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
   rdtgroup.c:(.text+0x5960): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: rdtgroup.c:(.text+0x5ae0): undefined reference to `resctrl_arch_is_llc_occupancy_enabled'
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
>> arm-smmu-v3.c:(.text+0x2954): undefined reference to `mpam_register_requestor'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
