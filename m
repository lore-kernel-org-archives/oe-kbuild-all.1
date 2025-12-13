Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2AB3019C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624057; cv=none; b=o/L2J9oX4VeTDOSs6ENJL5Q4THshAfFKqKCJ0Ax6Tam8mJZOE5cJWRMVsabRCc9vhMyu4VTvtGBFwmbfSJprveVqrS39odS/CVXZP3Xm/QR7QW36gUEvrwoDCHdeB5GKvhSpqO3/eVaxCKNE0BH85fBeaoc2b49gOJBV/YOC/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624057; c=relaxed/simple;
	bh=h5RmyXgJI/ww4hIwtFHzWpT4NBN2zivdtRqbTDgUnyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUVWTBbokxWLUwNsD9UnowUtK1ACXx6iHQm5I7TgOo45hW3uD5L+QJzKF4OIx+s5Y/sc+9m0jSXf85V/Sc3tLVKztCnxULPljgCTwk+KVsouVdswRmUnPa8W1n0iQHYpRerIhGyBNa6Av6QWqne6oe21DuN4R/3C3/eQmz/Odqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htyw9fUb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htyw9fUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765624056; x=1797160056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5RmyXgJI/ww4hIwtFHzWpT4NBN2zivdtRqbTDgUnyI=;
  b=htyw9fUbkyKQGKKbq6k8kFtkALwGbBXWoM8Qv7JPmJreTkqyHbvKqzgL
   VjtGxiY5cyuTxzwHdz2po9V8ZMb5ElaGuXUJckJ38i6sHpAB8m2XskJyh
   KSNxc2jg6ZCecbykdFC1jVpCr0xNvTnS0VRvjaPdQZapqKxqgg2wEjJbZ
   VcOY7KgaZj96q31O/oUD/ZRCi1n6sCJcyBSuFDEX5u3tt2wDA6Kd2Mnne
   WYxZKVqoB7ygvlSk52rNuS4nMNSPHtD4bTl+Mqtu0oQO5rYNhUKeDrs2z
   K3unFKJzDDzwiJxvYpHsEeqtWvKc0ntIYgtTHS83NO5auM3TG9bMHW52z
   g==;
X-CSE-ConnectionGUID: e5zew+LrQ2qnOZ7e5WzT3Q==
X-CSE-MsgGUID: tdH2TbayQDKHdKQh7Imu+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67548596"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67548596"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:07:34 -0800
X-CSE-ConnectionGUID: iTlCxRjgQM61eqoEP4b+Tw==
X-CSE-MsgGUID: ZQZIY+mCSuOIH79n5qdFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197056718"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 03:07:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNTF-000000007Wn-2tm7;
	Sat, 13 Dec 2025 11:07:29 +0000
Date: Sat, 13 Dec 2025 19:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matt Coster <matt.coster@imgtec.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse:
 sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect
 size"
Message-ID: <202512131851.1WNXk3BC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 6b53cf48d9339c75fa51927b0a67d8a6751066bd drm/imagination: Enable PowerVR driver for RISC-V
date:   3 months ago
config: riscv-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131851.1WNXk3BC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131851.1WNXk3BC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131851.1WNXk3BC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/imagination/pvr_cccb.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_util.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_debugfs.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_device_info.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_riscv.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_mips.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_params.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_params.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_context.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_startstop.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_stream.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_gem.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_meta.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_vm_mips.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_hwrt.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_ccb.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_sync.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_free_list.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_power.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_device.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw_trace.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_vm.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_job.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_mmu.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_drv.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h, ...):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_fw.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_ccb.h):
>> drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: sparse: sparse: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"
--
   drivers/gpu/drm/imagination/pvr_queue.c: note: in included file (through drivers/gpu/drm/imagination/pvr_rogue_fwif.h, drivers/gpu/drm/imagination/pvr_cccb.h):
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
