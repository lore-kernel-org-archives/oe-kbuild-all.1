Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7E11CB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574167; cv=none; b=cB2dpIwkQOVhBMieq2MuJNcEz7ysHwQpH52C+hjW6IiHBlFIpQxVYBB8NAiSHZnb4scopFB/B84FgwrL/K/+AMxZmqdB9I+PutuqAxlIweOovKg2aUlMeAa+wfw8Nv0jiVmTbclc3ozFN52Cvw09fsNMTZuUWuyuAFI+TJjh23k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574167; c=relaxed/simple;
	bh=OrO5ic3Y0GGOq3EDtoE0sEqmTokrj1FrnpNXP+J4Axg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHfWqePxkr3tYI5uQT+hWYk0EylPmyBKRdQyRBSIyeM0mMDY/gvmV7EIJ//uoAfPXNLc4vYP9xX/PSSh/i1yihjInKh7/3Q3qFBuLsj+qTXIqwiprKhq852MwwHj9eDztSnAICt+or8sIcUGiyYu27sOjz0x68YbRtSwQlD/HlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoL6ZXO+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoL6ZXO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718574164; x=1750110164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrO5ic3Y0GGOq3EDtoE0sEqmTokrj1FrnpNXP+J4Axg=;
  b=JoL6ZXO+s/LyJGnhSU2qTRtl+ZENbZgmJEw9VI1IhMlFMuHyqw/c8wOY
   6ObXMPOnQ5HbBghf8SSTLrI6o/IBdjHIpJ1B3uQI1DIm3+VYYvstE4ObU
   DqxPwUde/0C67NJxdL9ty7912GDkjoDENz/OClZh82IMkneplQ8diNszD
   Dg/B3WBkiLhdFpqunL1gVU+Z/a9QvH6d6EFvg48luYx5bJU7TARUEBYko
   l8cwXMyXoPAuYTI9pglbJ0641+odGCScUDAgA9fut0gRAD7dnsArju0Z2
   gpJtGihEjPkzhfw2B+L22yrVZXCbptT3V8aqdtzIB2QgC1sS/86NfC2AE
   Q==;
X-CSE-ConnectionGUID: iVAqQFnPTRSMSUhMZ8k5Ow==
X-CSE-MsgGUID: 2+QE2eRyQgKArHWuUb1P5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37921470"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="37921470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 14:42:44 -0700
X-CSE-ConnectionGUID: /n6Mq1DNRQGCIe59Wdy8NA==
X-CSE-MsgGUID: /Ebi2WhuReWBSaowNxWTPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="45949871"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2024 14:42:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIxe4-0003Ma-2m;
	Sun, 16 Jun 2024 21:42:40 +0000
Date: Mon, 17 Jun 2024 05:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.10-rc1 103/114] ld.lld: error: undefined
 symbol: mpam_resctrl_default_group
Message-ID: <202406170514.1pdwdpJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.10-rc1
head:   d9ba67a1a8dc6551a0b3254a8f2ee9993ad17957
commit: e2d751c1b4396c4c55c1089a705cd587962b3d5c [103/114] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-randconfig-r063-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170514.1pdwdpJt-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170514.1pdwdpJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170514.1pdwdpJt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mpam_resctrl_default_group
   >>> referenced by mpam.h:156 (arch/arm64/include/asm/mpam.h:156)
   >>>               arch/arm64/kernel/process.o:(__switch_to) in archive vmlinux.a
   >>> referenced by mpam.h:156 (arch/arm64/include/asm/mpam.h:156)
   >>>               arch/arm64/kernel/process.o:(__switch_to) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mpam_register_requestor
   >>> referenced by mpam.c:49 (arch/arm64/kernel/mpam.c:49)
   >>>               arch/arm64/kernel/mpam.o:(arm64_mpam_register_cpus) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: resctrl_arch_mon_capable
   >>> referenced by rdtgroup.c:665 (fs/resctrl/rdtgroup.c:665)
   >>>               fs/resctrl/rdtgroup.o:(rdtgroup_tasks_assigned) in archive vmlinux.a
   >>> referenced by rdtgroup.c:3828 (fs/resctrl/rdtgroup.c:3828)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_offline_domain) in archive vmlinux.a
   >>> referenced by monitor.c:324 (fs/resctrl/monitor.c:324)
   >>>               fs/resctrl/monitor.o:(free_rmid) in archive vmlinux.a
   >>> referenced 19 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_get_config
   >>> referenced by rdtgroup.c:1273 (fs/resctrl/rdtgroup.c:1273)
   >>>               fs/resctrl/rdtgroup.o:(__rdtgroup_cbm_overlaps) in archive vmlinux.a
   >>> referenced by ctrlmondata.c:398 (fs/resctrl/ctrlmondata.c:398)
   >>>               fs/resctrl/ctrlmondata.o:(rdtgroup_schemata_show) in archive vmlinux.a
   >>> referenced by monitor.c:510 (fs/resctrl/monitor.c:510)
   >>>               fs/resctrl/monitor.o:(mbm_handle_overflow) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_mon_ctx_free
   >>> referenced by ctrlmondata.c:491 (fs/resctrl/ctrlmondata.c:491)
   >>>               fs/resctrl/ctrlmondata.o:(mon_event_read) in archive vmlinux.a
   >>> referenced by monitor.c:184 (fs/resctrl/monitor.c:184)
   >>>               fs/resctrl/monitor.o:(__check_limbo) in archive vmlinux.a
   >>> referenced by ctrlmondata.c:491 (fs/resctrl/ctrlmondata.c:491)
   >>>               fs/resctrl/ctrlmondata.o:(rdtgroup_mondata_show) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_find_domain
   >>> referenced by ctrlmondata.c:517 (fs/resctrl/ctrlmondata.c:517)
   >>>               fs/resctrl/ctrlmondata.o:(rdtgroup_mondata_show) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: resctrl_arch_is_mbm_local_enabled
   >>> referenced by rdtgroup.c:2269 (fs/resctrl/rdtgroup.c:2269)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_offline_domain) in archive vmlinux.a
   >>> referenced by rdtgroup.c:120 (fs/resctrl/rdtgroup.c:120)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_offline_domain) in archive vmlinux.a
   >>> referenced by rdtgroup.c:2269 (fs/resctrl/rdtgroup.c:2269)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_online_domain) in archive vmlinux.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_rmid_idx_encode
   >>> referenced by monitor.c:210 (fs/resctrl/monitor.c:210)
   >>>               fs/resctrl/monitor.o:(alloc_rmid) in archive vmlinux.a
   >>> referenced by monitor.c:211 (fs/resctrl/monitor.c:211)
   >>>               fs/resctrl/monitor.o:(alloc_rmid) in archive vmlinux.a
   >>> referenced by monitor.c:318 (fs/resctrl/monitor.c:318)
   >>>               fs/resctrl/monitor.o:(free_rmid) in archive vmlinux.a
   >>> referenced 6 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_is_mbm_total_enabled
   >>> referenced by rdtgroup.c:119 (fs/resctrl/rdtgroup.c:119)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_offline_domain) in archive vmlinux.a
   >>> referenced by rdtgroup.c:3862 (fs/resctrl/rdtgroup.c:3862)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_online_domain) in archive vmlinux.a
   >>> referenced by rdtgroup.c:119 (fs/resctrl/rdtgroup.c:119)
   >>>               fs/resctrl/rdtgroup.o:(resctrl_online_domain) in archive vmlinux.a
   >>> referenced 4 more times
--
>> ld.lld: error: undefined symbol: resctrl_arch_get_resource
   >>> referenced by monitor.c:131 (fs/resctrl/monitor.c:131)
   >>>               fs/resctrl/monitor.o:(__check_limbo) in archive vmlinux.a
   >>> referenced by rdtgroup.c:108 (fs/resctrl/rdtgroup.c:108)
   >>>               fs/resctrl/rdtgroup.o:(rdt_staged_configs_clear) in archive vmlinux.a
   >>> referenced by rdtgroup.c:108 (fs/resctrl/rdtgroup.c:108)
   >>>               fs/resctrl/rdtgroup.o:(rdt_staged_configs_clear) in archive vmlinux.a
   >>> referenced 36 more times
--
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
   pahole: .tmp_vmlinux.btf: Invalid argument
>> ld.lld: error: .btf.vmlinux.bin.o: unknown file type
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
