Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F371280325
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781413845; cv=none; b=QEYtScRglzylzzodYvHgh7LL/bHXRYpGBYiBHhl3UxU80/EmoXUovz4/RxQY8mryodDraTCYg6YnFhMqZgQVuZEMnDiEHe+R61VRlgh7spt7z0vd78d1fmJjpWBGZWQix5RWBXeqshSAboX1ZGDdCq1LP9unc/4e72Xi7/JhMR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781413845; c=relaxed/simple;
	bh=7XDd7hzWPvFzxqG9KowxMxmchYKOHMMUjCVaPkOoUGM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dszgy1wG9+rVtxFZwNlvNYYzeqWuDaYosd+ItE4+i+Zr0Uad0Z5P4OzsG8gcoND8inEVaGjcxWlF6NCuyS9/6GuW/Jak/XtqkkwJExaOG5mlsBJ1Fl7mT9xyzs8dI9kBZjfGUcK19GgScCgigNGOX6Gga38D8M4kQ+DWGqYnaxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKgrBCM3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKgrBCM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781413843; x=1812949843;
  h=date:from:to:cc:subject:message-id;
  bh=7XDd7hzWPvFzxqG9KowxMxmchYKOHMMUjCVaPkOoUGM=;
  b=WKgrBCM3KK4DVMHnY/SrvRBjrxRaYwqS6xGRsRaDE0C+Ubbs7x/y+zEg
   LMRsT7bJvEZ13NU7e/uvl747SEKKLy9kE6Ok1N8f/H3fQ9ktdVzvPIRSw
   QyrcXvF2ouCIAibSKb3bqHNgeqnZJxFLu6YpGl8MQ4lz1BATrzRxOGtT2
   tTvAW6fLbgFH5tRu9PLJu3A2QLh/DbxEBZWrhzl/+cOIRIsulYc/3XMqW
   I2XLQS3JFR2Jd9E+eomnnFvzKAJyJxq21Sg3MJ3gDv6NQGvDkj0gBfcUF
   +bIpk6oXoQCHUbo8elydasMSVO0/sZKo6/8Smuz7IlfwSzxLYbg9H/jPs
   g==;
X-CSE-ConnectionGUID: Lyvxm8dfQyiTeJKhVWBTOg==
X-CSE-MsgGUID: e0+YlS/yTza86yjyGl+CaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82380006"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="82380006"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 22:10:38 -0700
X-CSE-ConnectionGUID: L1MocZCRRHyHil6F4O16bQ==
X-CSE-MsgGUID: sw7IMp/kS1WMKrMqmg7b/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="242795638"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jun 2026 22:10:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYd7C-00000000QZo-0fuN;
	Sun, 14 Jun 2026 05:10:34 +0000
Date: Sun, 14 Jun 2026 13:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1:
 sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is
 incorrect size"
Message-ID: <202606141201.SQ9cRxN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: 6b53cf48d9339c75fa51927b0a67d8a6751066bd drm/imagination: Enable PowerVR driver for RISC-V
date:   10 months ago
config: riscv-randconfig-r122-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141201.SQ9cRxN0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141201.SQ9cRxN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6b53cf48d933 ("drm/imagination: Enable PowerVR driver for RISC-V")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141201.SQ9cRxN0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/imagination/pvr_cccb.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_ccb.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_device.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_device_info.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_free_list.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_startstop.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_trace.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_util.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_meta.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_context.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_drv.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h, drivers/gpu/drm/imagination/pvr_context.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_hwrt.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_mips.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_gem.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_riscv.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_job.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h, drivers/gpu/drm/imagination/pvr_context.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_mmu.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_debugfs.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_params.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_params.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_stream.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_vm_mips.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_sync.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_queue.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_vm.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_power.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, drivers/gpu/drm/imagination/pvr_device.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"

vim +487 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h

a26f067feac1f6 Sarah Walker 2023-11-22  463  
a26f067feac1f6 Sarah Walker 2023-11-22  464  OFFSET_CHECK(struct rogue_fwif_hwrtdata, pm_mlist_dev_addr, 0);
a26f067feac1f6 Sarah Walker 2023-11-22  465  OFFSET_CHECK(struct rogue_fwif_hwrtdata, vce_cat_base, 8);
a26f067feac1f6 Sarah Walker 2023-11-22  466  OFFSET_CHECK(struct rogue_fwif_hwrtdata, vce_last_cat_base, 40);
a26f067feac1f6 Sarah Walker 2023-11-22  467  OFFSET_CHECK(struct rogue_fwif_hwrtdata, te_cat_base, 72);
a26f067feac1f6 Sarah Walker 2023-11-22  468  OFFSET_CHECK(struct rogue_fwif_hwrtdata, te_last_cat_base, 104);
a26f067feac1f6 Sarah Walker 2023-11-22  469  OFFSET_CHECK(struct rogue_fwif_hwrtdata, alist_cat_base, 136);
a26f067feac1f6 Sarah Walker 2023-11-22  470  OFFSET_CHECK(struct rogue_fwif_hwrtdata, alist_last_cat_base, 144);
a26f067feac1f6 Sarah Walker 2023-11-22  471  OFFSET_CHECK(struct rogue_fwif_hwrtdata, pm_alist_stack_pointer, 152);
a26f067feac1f6 Sarah Walker 2023-11-22  472  OFFSET_CHECK(struct rogue_fwif_hwrtdata, pm_mlist_stack_pointer, 160);
a26f067feac1f6 Sarah Walker 2023-11-22  473  OFFSET_CHECK(struct rogue_fwif_hwrtdata, hwrt_data_common_fw_addr, 164);
a26f067feac1f6 Sarah Walker 2023-11-22  474  OFFSET_CHECK(struct rogue_fwif_hwrtdata, hwrt_data_flags, 168);
a26f067feac1f6 Sarah Walker 2023-11-22  475  OFFSET_CHECK(struct rogue_fwif_hwrtdata, state, 172);
a26f067feac1f6 Sarah Walker 2023-11-22  476  OFFSET_CHECK(struct rogue_fwif_hwrtdata, freelists_fw_addr, 176);
a26f067feac1f6 Sarah Walker 2023-11-22  477  OFFSET_CHECK(struct rogue_fwif_hwrtdata, freelist_hwr_snapshot, 188);
a26f067feac1f6 Sarah Walker 2023-11-22  478  OFFSET_CHECK(struct rogue_fwif_hwrtdata, vheap_table_dev_addr, 200);
a26f067feac1f6 Sarah Walker 2023-11-22  479  OFFSET_CHECK(struct rogue_fwif_hwrtdata, rta_ctl, 208);
a26f067feac1f6 Sarah Walker 2023-11-22  480  OFFSET_CHECK(struct rogue_fwif_hwrtdata, tail_ptrs_dev_addr, 240);
a26f067feac1f6 Sarah Walker 2023-11-22  481  OFFSET_CHECK(struct rogue_fwif_hwrtdata, macrotile_array_dev_addr, 248);
a26f067feac1f6 Sarah Walker 2023-11-22  482  OFFSET_CHECK(struct rogue_fwif_hwrtdata, rgn_header_dev_addr, 256);
a26f067feac1f6 Sarah Walker 2023-11-22  483  OFFSET_CHECK(struct rogue_fwif_hwrtdata, rtc_dev_addr, 264);
a26f067feac1f6 Sarah Walker 2023-11-22  484  OFFSET_CHECK(struct rogue_fwif_hwrtdata, owner_geom_not_used_by_host, 272);
a26f067feac1f6 Sarah Walker 2023-11-22  485  OFFSET_CHECK(struct rogue_fwif_hwrtdata, geom_caches_need_zeroing, 276);
a26f067feac1f6 Sarah Walker 2023-11-22  486  OFFSET_CHECK(struct rogue_fwif_hwrtdata, cleanup_state, 320);
a26f067feac1f6 Sarah Walker 2023-11-22 @487  SIZE_CHECK(struct rogue_fwif_hwrtdata, 384);
a26f067feac1f6 Sarah Walker 2023-11-22  488  

:::::: The code at line 487 was first introduced by commit
:::::: a26f067feac1f6142c3ccbaeaee8f84078bca9d4 drm/imagination: Add FWIF headers

:::::: TO: Sarah Walker <sarah.walker@imgtec.com>
:::::: CC: Maxime Ripard <mripard@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
