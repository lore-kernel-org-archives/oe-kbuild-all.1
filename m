Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66ED43147
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206025; cv=none; b=VOAvNbeSQN7Do9RRm5c6UazAzIoO6TjDW512TcFOBkYHQvEMk826bf3eLeETQUfBCEngF0KdH5mwZJQed0mOkXvAZQ+n/VKiXpKZjgLyC9YXAYwTSw9IsKOVQ6aPJv+vUu2zczxjruP98TOb51Ai6IL6QV/tQPbrErGbyPm6YgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206025; c=relaxed/simple;
	bh=1mtvITF7cyNtwAPivc4ckd4gsv5+3/+BWjXEo1kNCFE=;
	h=Date:From:Cc:Subject:Message-ID; b=cAz6tP2AtmB1GOIfFEFFO3KVAWkeMO+gPiHD0FFRNu2Q5qA60C+SndbQbKi02BSnANzle2I1dWhewYjdrJg/fdQcTEHWKaYoJPQPe6qPhlb+LzzsccWSakJ0nqG6ri2Hk289q4LAbThkobQuTp4ArOqyMD1ME0cDvofxB2HV4Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKH3owWe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKH3owWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206024; x=1806742024;
  h=date:from:cc:subject:message-id;
  bh=1mtvITF7cyNtwAPivc4ckd4gsv5+3/+BWjXEo1kNCFE=;
  b=jKH3owWeyH7gBZ48wpBm32YUXbI5cvOc2xHAcuLmuanwNW4BAZHGSgJu
   qxkjRk/dQA6s+e6VZAmSKlQ8h1I4r9z9bRjR8KEA73YTjcNelbVVuBkjp
   uOf2GMAlCGJlDT3GcCHNRh7YLQHPUXjcFzqqvlMEQrWlapl12QDl6RCRm
   7M7rx/wODX8pE1pPq/fnArZxHlZSt84U00NZcHtdEnfK+v45ez8mYmPtG
   aWmv7gBXiW05jmwWT71ECMha+80Oh/YLKoWeU+2dK5HzRuMQ1E5gp+EK4
   KS6yMX8K36x7KN4VcCIIhRHa9XGT8jZ1RUcNEdF7f8H2IJy8ehP9m2DQW
   g==;
X-CSE-ConnectionGUID: CtRkC4jiRiGmzQiekgZeBg==
X-CSE-MsgGUID: c2SY+uscTzChpIDw7R6Y+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312101"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: k7o/L5vKTCGWxIiEnDeeTw==
X-CSE-MsgGUID: fqkD0xOuQ8CiQGsr8HNEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287310"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB7-00000000174-0HDv;
	Fri, 03 Apr 2026 08:46:57 +0000
Date: Fri, 03 Apr 2026 16:46:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riana Tauro <riana.tauro@intel.com>
Subject: drivers/gpu/drm/xe/xe_psmi.c:36:undefined reference to
 `xe_configfs_get_psmi_enabled'
Message-ID: <202604031148.C5iucYd3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5619b098e2fbf3a23bf13d91897056a1fe238c6d
commit: afe902848b417da81f60b3d15cbae40a67286dbf drm/xe/configfs: Allow to enable PSMI
date:   7 months ago
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260403/202604031148.C5iucYd3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031148.C5iucYd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: afe902848b41 ("drm/xe/configfs: Allow to enable PSMI")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031148.C5iucYd3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   drivers/gpu/drm/xe/xe_guc.c:91:(.text+0xb0a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.c:91:(.text+0xb0a): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x97a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:812:(.text+0x97a): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
>> drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x30e): undefined reference to `xe_configfs_get_psmi_enabled'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x30e): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x380): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x380): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
>> drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x6fe): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:150:(.text+0x14e): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:227:(.text+0x1b0): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:232:(.text+0x1ca): undefined reference to `xe_configfs_clear_survivability_mode'


vim +36 drivers/gpu/drm/xe/xe_psmi.c

aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  12  
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  13  /*
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  14   * PSMI capture support
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  15   *
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  16   * Requirement for PSMI capture is to have a physically contiguous buffer.  The
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  17   * PSMI tool owns doing all necessary configuration (MMIO register writes are
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  18   * done from user-space). However, KMD needs to provide the PSMI tool with the
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  19   * required physical address of the base of PSMI buffer in case of VRAM.
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  20   *
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  21   * VRAM backed PSMI buffer:
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  22   * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag which
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  23   * creates a contiguous allocation. The physical address is returned from
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  24   * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  25   * PCIBAR through sysfs.
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  26   *
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  27   * SYSTEM memory backed PSMI buffer:
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  28   * Interface here does not support allocating from SYSTEM memory region.  The
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  29   * PSMI tool needs to allocate memory themselves using hugetlbfs. In order to
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  30   * get the physical address, user-space can query /proc/[pid]/pagemap. As an
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  31   * alternative, CMA debugfs could also be used to allocate reserved CMA memory.
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  32   */
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  33  
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  34  static bool psmi_enabled(struct xe_device *xe)
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  35  {
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21 @36  	return xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev));
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  37  }
aaa0c1f50a3d3f Lucas De Marchi 2025-08-21  38  

:::::: The code at line 36 was first introduced by commit
:::::: aaa0c1f50a3d3fc1624360eaeb7fe69af62f7107 drm/xe/psmi: Add debugfs interface for PSMI

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
