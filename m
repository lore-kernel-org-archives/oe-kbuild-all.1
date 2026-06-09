Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD60F3101D4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035244; cv=none; b=d0LTnsrubs+66cBV2zdKFE5FFImy9ziukuGw/wjxex4IJMmY7q0Enljjeh2M0prMadTT0UkJIG6w4LJxVmMI55orjQjX/WWQZNrNWd62dIhNNq3X+FlD/mMF6uGlFwELuORB/Y8BX078Ekvt7+NWPPEqX2d6X6mnE8u8qHGxpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035244; c=relaxed/simple;
	bh=jyQ28qtlmQdAHDIBb/aSufTj8fRYz+nYE2XQhWrIaW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dnKZ+X71KLcLLSpfd8/7cFenjhz4AsmJIpFLjcefNeZ82KJtHS2lZaw8SqpnmquN84LWCwZwbVGXNBFpJKRWY95hrvxasOLkfjF8F0M8OafKfZAKgr19RJTm6rBWwmE8Rieu+K8AfM+gtL87JvbFlVQAZw5WhM9LEBRCrxrPQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUKioW/c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUKioW/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781035242; x=1812571242;
  h=date:from:to:cc:subject:message-id;
  bh=jyQ28qtlmQdAHDIBb/aSufTj8fRYz+nYE2XQhWrIaW0=;
  b=FUKioW/crAEwfXT4WqUbxYPPXn68bP83c7TPLDj92tr0Q1zgsQuVb4bC
   oZWEMpqdSiRzE6fyhMvsgju/zeN98RaEYpdRpQ20WjIFu0rJF8hBwed5r
   VP1brSe0k3J7hXjUDlk/dCIlt6kLPDTwJ6FBxGbkMNIalH0N94VsFfdeX
   Tmyw8tgZR8GSajgKxi7IcToTgmZm2y0Wlsrvmum0qnaXribeVJonndUE4
   0/CGzTpgcjs2Ut1uRJf8XAi/5jQKtK7obnhsXyw/KrCQ4fQlvWCHsaHg+
   eIzIWemrGmGpN2jW1c2raPxcwmWJ9FdvGI9GSJMs4nYLKyzFKH3wX8vdN
   w==;
X-CSE-ConnectionGUID: A4W/cG5gQBy7eVGgr0QNZg==
X-CSE-MsgGUID: 2mTyxfaSQ1SWgwaR9fKUIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92133984"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92133984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 13:00:42 -0700
X-CSE-ConnectionGUID: Ti+Hcdf9R1OGZgKrBnusBw==
X-CSE-MsgGUID: I6bDxUy9T16pK8PksSPSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="249881876"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 13:00:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX2cn-00000000KUU-0l68;
	Tue, 09 Jun 2026 20:00:37 +0000
Date: Wed, 10 Jun 2026 03:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/hid/spi-hid/spi-hid-of-ilitek.c:3274:6: warning: no previous
 prototype for function 'ili_node_init'
Message-ID: <202606100327.74ZKAHMu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a4d01e77dd885e0545ecd445e2facf156ddf42f5
commit: 0323b36c9b64eac74e144f67c5758176f7f881d1 [31/31] CHROMIUM: HID: spi-hid: Add Ilitek MP test support in SPI-HID framework
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260610/202606100327.74ZKAHMu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100327.74ZKAHMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100327.74ZKAHMu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/spi-hid/spi-hid-of-ilitek.c:513:5: warning: no previous prototype for function 'ili_spi_ms_register_read' [-Wmissing-prototypes]
     513 | int ili_spi_ms_register_read(u32 addr, u32 *data, int len, u8 msmode)
         |     ^
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:513:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     513 | int ili_spi_ms_register_read(u32 addr, u32 *data, int len, u8 msmode)
         | ^
         | static 
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:694:5: warning: no previous prototype for function 'ili_ic_code_reset' [-Wmissing-prototypes]
     694 | int ili_ic_code_reset(bool mcu)
         |     ^
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:694:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     694 | int ili_ic_code_reset(bool mcu)
         | ^
         | static 
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:2625:5: warning: no previous prototype for function 'ili_spi_write_then_read_split' [-Wmissing-prototypes]
    2625 | int ili_spi_write_then_read_split(struct spi_device *spi,
         |     ^
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:2625:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2625 | int ili_spi_write_then_read_split(struct spi_device *spi,
         | ^
         | static 
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:3274:6: warning: no previous prototype for function 'ili_node_init' [-Wmissing-prototypes]
    3274 | void ili_node_init(void)
         |      ^
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:3274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3274 | void ili_node_init(void)
         | ^
         | static 
>> drivers/hid/spi-hid/spi-hid-of-ilitek.c:3297:6: warning: no previous prototype for function 'ili_node_remove' [-Wmissing-prototypes]
    3297 | void ili_node_remove(struct ilitek_ts_hid_data *ts)
         |      ^
   drivers/hid/spi-hid/spi-hid-of-ilitek.c:3297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3297 | void ili_node_remove(struct ilitek_ts_hid_data *ts)
         | ^
         | static 
   5 warnings generated.


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
