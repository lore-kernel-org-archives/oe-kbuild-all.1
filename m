Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B51E25EB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jun 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179707; cv=none; b=cv7kGXJeM8pMZg1fZEetF9ys6J3OJPSScf2Ooz+OUPARYdjBi24gYn+dKylogWAS+aiFYcP6nsKTqrebf25qT+XNPli20GXHH7FZIxP18ODgRwskUzE4brWLF2K1Yy5CL8A6EmAq0OWdtESv66PB5yv1EFDdXcVW8ZNHe5nOzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179707; c=relaxed/simple;
	bh=uLtPXj1TO+8yvMzR0bpsTw5ttvrIgZKd/a94g6OrWxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C64hI42C7drcel6t4DkFvTEeMueH6mrp+W9ciEjkho27uAGgxb6G5vbnjK977HByXYcVQLqsq7NVCjzZycrySLD6BOeMKvpf15N7+80+im8YIIQCsnIwPLy1Au4CfB71mbbFFj87Xl2BfYD7eVtWJPolj8h1Y5kCuJSr95SbGsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzIHUimV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzIHUimV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749179704; x=1780715704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLtPXj1TO+8yvMzR0bpsTw5ttvrIgZKd/a94g6OrWxc=;
  b=VzIHUimVNv4hOPiw6J5uIfm5BonZI8gPMIsFC+tAW/IDUgDI3Fi4o7Is
   wvTtFXriwkprR/q+XBjZS/6g8++dQ2UPqNp7f1mUGYNBekdyRlEoLBPy5
   pdWVnvwZlYHvZ/gaXk2Z1ACUelVg6ZGFM0Tk5LM9WhX6xpJApaW/ITRgt
   GiUVGZh3RDmAd2FmY1mPOk2Odc2ofPOm1zYYle+8tN/hlETXSoXdoC92S
   LTkUHtn+jCQ3uh+wp8w18WP03qCjViJrsD+2xHb1XuDlRTYSgxCW3G0T+
   uigqeeZ210LRwXpT5JhiZXVVN/ubVcnbe3fSpyvw8zahsKYNbPStcB12+
   w==;
X-CSE-ConnectionGUID: x66RfFylTGiW1fjsSjZivA==
X-CSE-MsgGUID: TwMLrNkKQ56VwqKQDWL3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38954265"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="38954265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 20:15:03 -0700
X-CSE-ConnectionGUID: 02f+2fIzR5ORF7BsnoSD/Q==
X-CSE-MsgGUID: vebKvckEQ8W4BxE/hhNc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="176557418"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2025 20:15:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNNXn-0004hX-0o;
	Fri, 06 Jun 2025 03:14:59 +0000
Date: Fri, 6 Jun 2025 11:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2368/2368] aarch64-linux-ld: monitor.c:undefined
 reference to `resctrl_arch_mon_resource_init'
Message-ID: <202506061113.XapyNzuS-lkp@intel.com>
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
commit: 9d672495f39f9d76efde211b55fb591d6f7df157 [2368/2368] fs/resctrl: Adapt to the hardware topology structures of RDT and MPAM
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061113.XapyNzuS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061113.XapyNzuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506061113.XapyNzuS-lkp@intel.com/

All errors (new ones prefixed by >>):

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
>> aarch64-linux-ld: monitor.c:(.text+0x10c8): undefined reference to `resctrl_arch_mon_resource_init'
   aarch64-linux-ld: fs/resctrl/monitor.o: in function `resctrl_mon_resource_exit':
   monitor.c:(.text+0x1110): undefined reference to `resctrl_arch_get_resource'
   aarch64-linux-ld: fs/resctrl/psuedo_lock.o: in function `rdtgroup_locksetup_enter':
   psuedo_lock.c:(.text+0x3ec): undefined reference to `resctrl_arch_get_cdp_enabled'
   aarch64-linux-ld: psuedo_lock.c:(.text+0x40c): undefined reference to `resctrl_arch_get_cdp_enabled'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
