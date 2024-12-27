Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE21F4727
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735311106; cv=none; b=fkwO0oC5Il54R2SaiXMwUzJtBzNxacC8vF93GnuKXrlLdUiVIyIcYSqyjcVHzxnW6K07GCh3cSsSb14BxqCuQf9+opXYcdg1P57IMGXmNznzWa7yxIE6ngZvWqBuhPsPaFqDDZ7/MIcCSW8XUz0lJMI8dKaw4IJAyukQUkbebrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735311106; c=relaxed/simple;
	bh=Hw1rUMqpJiN7XWpGGe/iTyg49rRlP427bBWrsLgi7NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSfU8I7AKvMashLv8InVbfQcEY7QvXZnNZ0Pxf7mxKhLlYzBYWMcu5t57l4tDb/zOCRrbqY7xpyuAupTsucms++FxQq5DUQho/bNq+DpVIs+bT+0JvY178FHB7m+MN4Xw/kz2sIffc/e2lNWo7qyiys0e1KJEAfjvS01mXiohnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEmoLenx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEmoLenx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735311105; x=1766847105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hw1rUMqpJiN7XWpGGe/iTyg49rRlP427bBWrsLgi7NA=;
  b=KEmoLenxpaYgti1WKYfgr/xv4TBpTNrphWw/bVlqJ5SqgPiri0vTGiC2
   xSUe5CG4hyMVclLpfPo/pT74qkKOVk0mwIvks5Iyq8qy6Ycgv3DQPkWYB
   V3tVgWJ/WKDBXdogql8zYBbXbiRBcepbvNRAgvV4FxjlgSbqPHY3SEs5g
   MG8OcInpJCGaB1hi0uc380ntHiM27U4dAzXwSVPj2QTakavSeOkWUTDqC
   3D4kirYPkOuyfWvpQ1FX2c9Lkj2eTV1gAIagdsoKMQWJd5fN5vnlWNdMo
   8BtvDH21bp3NhWVhhuSLOnNTno46kr1f5K2CDr7kTcoZhEoLOYsNRFm+6
   Q==;
X-CSE-ConnectionGUID: g3RvVnwLQCGJxnk/7Xpn7A==
X-CSE-MsgGUID: +NzTl1M7T9matVWuUnudGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35872883"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35872883"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:51:44 -0800
X-CSE-ConnectionGUID: aUWPOtU8QwyUn7ItGOA48A==
X-CSE-MsgGUID: KUxXv5HsSp+XV6XsCgw91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100017563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 06:51:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRBgi-0003FQ-0E;
	Fri, 27 Dec 2024 14:51:40 +0000
Date: Fri, 27 Dec 2024 22:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/d4xx.c:4565:66:
 warning: '
Message-ID: <202412272220.zJ3cZ2oZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 115648ff1b1a301ea69324d80b1297d1041fd3b8 [3/3] media: i2c: platform: fix multiple compile errors
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241227/202412272220.zJ3cZ2oZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272220.zJ3cZ2oZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272220.zJ3cZ2oZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/d4xx.c:2814:17: warning: initialized field overwritten [-Woverride-init]
    2814 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2814:17: note: (near initialization for 'ds5_ctrl_erb.step')
   drivers/media/i2c/d4xx.c:2828:17: warning: initialized field overwritten [-Woverride-init]
    2828 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2828:17: note: (near initialization for 'ds5_ctrl_ewb.step')
   drivers/media/i2c/d4xx.c:2842:17: warning: initialized field overwritten [-Woverride-init]
    2842 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2842:17: note: (near initialization for 'ds5_ctrl_hwmc.step')
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream':
   drivers/media/i2c/d4xx.c:3761:64: warning: variable 'vc_id' set but not used [-Wunused-but-set-variable]
    3761 |         u16 config_status_base, stream_status_base, stream_id, vc_id;
         |                                                                ^~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_parse_cam':
   drivers/media/i2c/d4xx.c:4397:32: warning: the comparison will always evaluate as 'true' for the address of 'depth_b' will never be NULL [-Waddress]
    4397 |         if ((&(state->depth_b) != NULL) && (&(state->rgb_b) != NULL)) {
         |                                ^~
   drivers/media/i2c/d4xx.c:467:11: note: 'depth_b' declared here
     467 |         } depth_b;
         |           ^~~~~~~
   drivers/media/i2c/d4xx.c:4397:61: warning: the comparison will always evaluate as 'true' for the address of 'rgb_b' will never be NULL [-Waddress]
    4397 |         if ((&(state->depth_b) != NULL) && (&(state->rgb_b) != NULL)) {
         |                                                             ^~
   drivers/media/i2c/d4xx.c:476:11: note: 'rgb_b' declared here
     476 |         } rgb_b;
         |           ^~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_probe':
   drivers/media/i2c/d4xx.c:5201:25: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    5201 |         int ret, retry, err = 0;
         |                         ^~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:929:36: warning: 'd46x_calibration_sizes' defined but not used [-Wunused-const-variable=]
     929 | static const struct ds5_resolution d46x_calibration_sizes[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:913:36: warning: 'ds5_size_w10' defined but not used [-Wunused-const-variable=]
     913 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:743:18: warning: 'ds5_framerate_25' defined but not used [-Wunused-const-variable=]
     743 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:727:18: warning: 'ds5_default_framerate' defined but not used [-Wunused-const-variable=]
     727 | static const u16 ds5_default_framerate = 30;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_dfu_device_read':
>> drivers/media/i2c/d4xx.c:4565:66: warning: '
      ' directive output may be truncated writing 1 byte into a region of size between 0 and 8 [-Wformat-truncation=]
    4565 |         snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
         |                                                                  ^~
   drivers/media/i2c/d4xx.c:4565:9: note: 'snprintf' output between 26 and 34 bytes into a destination of size 32
    4565 |         snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4566 |                         (fw_ver >> 8) & 0xff, fw_ver & 0xff,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4567 |                         (fw_build >> 8) & 0xff, fw_build & 0xff);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [y]:
   - DWMAC_INTEL_PLAT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=y] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=y]


vim +4565 drivers/media/i2c/d4xx.c

e986ee1ba98444 zouxiaoh 2024-01-18  4549  
e986ee1ba98444 zouxiaoh 2024-01-18  4550  /* When a process reads from our device, this gets called. */
e986ee1ba98444 zouxiaoh 2024-01-18  4551  static ssize_t ds5_dfu_device_read(struct file *flip,
e986ee1ba98444 zouxiaoh 2024-01-18  4552  		char __user *buffer, size_t len, loff_t *offset)
e986ee1ba98444 zouxiaoh 2024-01-18  4553  {
e986ee1ba98444 zouxiaoh 2024-01-18  4554  	struct ds5 *state = flip->private_data;
e986ee1ba98444 zouxiaoh 2024-01-18  4555  	u16 fw_ver, fw_build;
e986ee1ba98444 zouxiaoh 2024-01-18  4556  	char msg[32];
e986ee1ba98444 zouxiaoh 2024-01-18  4557  	int ret = 0;
e986ee1ba98444 zouxiaoh 2024-01-18  4558  
e986ee1ba98444 zouxiaoh 2024-01-18  4559  	if (mutex_lock_interruptible(&state->lock))
e986ee1ba98444 zouxiaoh 2024-01-18  4560  		return -ERESTARTSYS;
e986ee1ba98444 zouxiaoh 2024-01-18  4561  	ret |= ds5_read(state, DS5_FW_VERSION, &fw_ver);
e986ee1ba98444 zouxiaoh 2024-01-18  4562  	ret |= ds5_read(state, DS5_FW_BUILD, &fw_build);
e986ee1ba98444 zouxiaoh 2024-01-18  4563  	if (ret < 0)
e986ee1ba98444 zouxiaoh 2024-01-18  4564  		goto e_dfu_read_failed;
e986ee1ba98444 zouxiaoh 2024-01-18 @4565  	snprintf(msg, sizeof(msg), "DFU info: \tver:  %d.%d.%d.%d\n",
e986ee1ba98444 zouxiaoh 2024-01-18  4566  			(fw_ver >> 8) & 0xff, fw_ver & 0xff,
e986ee1ba98444 zouxiaoh 2024-01-18  4567  			(fw_build >> 8) & 0xff, fw_build & 0xff);
e986ee1ba98444 zouxiaoh 2024-01-18  4568  
e986ee1ba98444 zouxiaoh 2024-01-18  4569  	if (copy_to_user(buffer, msg, strlen(msg)))
e986ee1ba98444 zouxiaoh 2024-01-18  4570  		ret = -EFAULT;
e986ee1ba98444 zouxiaoh 2024-01-18  4571  	else {
e986ee1ba98444 zouxiaoh 2024-01-18  4572  		state->dfu_dev.msg_write_once = ~state->dfu_dev.msg_write_once;
e986ee1ba98444 zouxiaoh 2024-01-18  4573  		ret = strlen(msg) & state->dfu_dev.msg_write_once;
e986ee1ba98444 zouxiaoh 2024-01-18  4574  	}
e986ee1ba98444 zouxiaoh 2024-01-18  4575  
e986ee1ba98444 zouxiaoh 2024-01-18  4576  e_dfu_read_failed:
e986ee1ba98444 zouxiaoh 2024-01-18  4577  	mutex_unlock(&state->lock);
e986ee1ba98444 zouxiaoh 2024-01-18  4578  	return ret;
e986ee1ba98444 zouxiaoh 2024-01-18  4579  };
e986ee1ba98444 zouxiaoh 2024-01-18  4580  

:::::: The code at line 4565 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
