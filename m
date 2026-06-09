Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D153D3332
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032061; cv=none; b=sKeL3ocPVboniFi8B1OJXuPNnLxxqCg5iwKP+0EqGG0ezf6wYTi4FPHP6oOsjbx4RvFwMsS0ftSpMnXbt7mliAbgbLlCO/a/juX/Wf3QXU3hVb3HTUiE7RigsuJ00fxhp7Z4ReWQGx9Y+Y9HhM8PEVSr15IIaPhT0eH1jvHSjzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032061; c=relaxed/simple;
	bh=GXmmLaq3PWR77uTSd8rnHQ/j9t4MtqRryfNNDDE2Pko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a0N4X5bvGEYF9ldjgO/6ETecuZ5MRZbUdy0rL9KDai0wM+gH/9xbzC9xwZg5karvw7OHxEVgTL6lMlLUxmeZeDaWMa5ozItCEsLQFVJ5/yEGFxaANZM9dr2fFd8rj6CrqYtqy5GxuIDkkzbQrXySeF3CptOCd+VNK1RGjI50hnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mix4VMYs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mix4VMYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032061; x=1812568061;
  h=date:from:to:cc:subject:message-id;
  bh=GXmmLaq3PWR77uTSd8rnHQ/j9t4MtqRryfNNDDE2Pko=;
  b=Mix4VMYsrWh3+sh126bWQCHIu8v9TRCRNuONaZThti7siHbe/eMS0HSj
   WLVqKJNqHVkRQyvWdmKxOusqJBVbLXYRCmCsXOYYyoK4eYnJzJRx+VR0T
   QL2x6Lpp9/FGNO4/CAd0u9P3XAd7lGUEFPFZHZgsNhm5B2btZJO9KhECw
   ev/6giCMMZ0qwDfL6GxZnGZR/Rhq3rSQ5OiC2ZoskGBmg6AJPvzyQycbi
   EdI1jwqeYz9jpej/ynRVSpMyFfOM/eLBZKzE4ZkTREMTETTNMyKOmB02z
   NseqFIjGKonYuhdWc6Fvbjj/cGpOxTDrU/qp0hW5bs4a7zrhT557D737J
   g==;
X-CSE-ConnectionGUID: ztWuhrrpTyqtgdUJu6gvtw==
X-CSE-MsgGUID: yvsE057CRXKNw32g6skx7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85655655"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85655655"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:07:39 -0700
X-CSE-ConnectionGUID: iyAsO/xQTiOQUUYzW9/7nA==
X-CSE-MsgGUID: 9ue3lhipQJaWLvdI1oio1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="241806140"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2026 12:07:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX1nS-00000000KSi-2An6;
	Tue, 09 Jun 2026 19:07:34 +0000
Date: Wed, 10 Jun 2026 03:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/hid/spi-hid/spi-hid-of-ilitek.c:3274:6: warning: no previous
 prototype for 'ili_node_init'
Message-ID: <202606100330.w3p22cxP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a4d01e77dd885e0545ecd445e2facf156ddf42f5
commit: 0323b36c9b64eac74e144f67c5758176f7f881d1 [31/31] CHROMIUM: HID: spi-hid: Add Ilitek MP test support in SPI-HID framework
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606100330.w3p22cxP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100330.w3p22cxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100330.w3p22cxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/spi-hid/spi-hid-of-ilitek.c:513:5: warning: no previous prototype for 'ili_spi_ms_register_read' [-Wmissing-prototypes]
     513 | int ili_spi_ms_register_read(u32 addr, u32 *data, int len, u8 msmode)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:694:5: warning: no previous prototype for 'ili_ic_code_reset' [-Wmissing-prototypes]
     694 | int ili_ic_code_reset(bool mcu)
         |     ^~~~~~~~~~~~~~~~~
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:2625:5: warning: no previous prototype for 'ili_spi_write_then_read_split' [-Wmissing-prototypes]
    2625 | int ili_spi_write_then_read_split(struct spi_device *spi,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:3274:6: warning: no previous prototype for 'ili_node_init' [-Wmissing-prototypes]
    3274 | void ili_node_init(void)
         |      ^~~~~~~~~~~~~
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:3297:6: warning: no previous prototype for 'ili_node_remove' [-Wmissing-prototypes]
    3297 | void ili_node_remove(struct ilitek_ts_hid_data *ts)
         |      ^~~~~~~~~~~~~~~


vim +/ili_node_init +3274 drivers/hid/spi-hid/spi-hid-of-ilitek.c

  3273	
> 3274	void ili_node_init(void)
  3275	{
  3276		int i = 0;
  3277	
  3278		proc_dir_ilitek = proc_mkdir("ilitek", NULL);
  3279	
  3280		for (; i < ARRAY_SIZE(iliproc); i++) {
  3281			iliproc[i].node = proc_create(
  3282									iliproc[i].name,
  3283									0644,
  3284									proc_dir_ilitek,
  3285									iliproc[i].fops);
  3286	
  3287			if (iliproc[i].node == NULL) {
  3288				iliproc[i].isCreated = false;
  3289				ILI_ERR("Failed to create %s under /proc\n", iliproc[i].name);
  3290			} else {
  3291				iliproc[i].isCreated = true;
  3292				ILI_INFO("Succeed to create %s under /proc\n", iliproc[i].name);
  3293			}
  3294		}
  3295	}
  3296	
> 3297	void ili_node_remove(struct ilitek_ts_hid_data *ts)
  3298	{
  3299		int i = 0;
  3300	
  3301		/* Remove nodes under /proc/ilitek */
  3302		for (; i < ARRAY_SIZE(iliproc); i++) {
  3303			if (iliproc[i].isCreated && iliproc[i].node) {
  3304				proc_remove(iliproc[i].node);
  3305				iliproc[i].node = NULL;
  3306				iliproc[i].isCreated = false;
  3307			}
  3308		}
  3309	
  3310		if (proc_dir_ilitek) {
  3311			proc_remove(proc_dir_ilitek);
  3312			proc_dir_ilitek = NULL;
  3313		}
  3314	
  3315		ILI_INFO("Remove TP filesystem node.\n");
  3316	}
  3317	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
