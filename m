Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374232CAB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 01:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727228754; cv=none; b=HP9rsX5N1gTJ9kDX0cC2b+z/xdOAupXbMaVYW1UWOltRe74SyIyTbkS3+1EdI4RbGim6gc9vTOWsF1RI/nULzKcaE5xW/n9yOPEGC3lzmBa9wx8Hjdf6szc4DXtsDFLpBd+szb5s5IQAwQOMgZgz4FcdE2Ewp4UCDUwlNwpO0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727228754; c=relaxed/simple;
	bh=+A4RW9GyB/0EPCh3SZHwRLt+vVCChnut9Cld1HSbrMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLNoxgIHolmbC5KxATCqC/nMFoHUfFcoFgTY1npOCXQs4is0lAaR/dln/Umoj38befjGvvWe41lkUv247artwGkUTWg6jh90s9qouE61p5XvWY/fsy5C7RtfftB9Tzj41K1u/AjnU/Y521BXn8wmljYs8HVp/JfkZjKCH5HS2Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieaCiaG7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieaCiaG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727228753; x=1758764753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+A4RW9GyB/0EPCh3SZHwRLt+vVCChnut9Cld1HSbrMM=;
  b=ieaCiaG7WWYj6JJcqEsJRh0zhkoggKzz35fX/YLkFUqHSAj5cA/jiph0
   nSPEXQ7hxRY8yDbFXKGL9ZfMlKIxlXN+9Jnlp5xNWCieMG9r9lJJs8ZXT
   Rl3O6rkhVwEEg8zH9v2Hth8pa0xvptqmoWfDvOXQZV7qiqn+ifL/tA/7T
   HlDeAu1SuFqfwRuIFeK+64lY9C7ZE0dNzststKRv5prNaMD34pqfxblPj
   SI+vaxCJRQX+0oXspv6jfKobSXcOh/ZcYaM+XzLBoUevWVpoLNKt9ge9N
   oMaWi0aRSzbBMtrEXLgWFdajuAAOe6i+G5kPjCXTwopcNThIOfhfYrdmA
   A==;
X-CSE-ConnectionGUID: JZ07hmu0Tp+QSrM358B1uA==
X-CSE-MsgGUID: a77e9chES+S2ENUNHbPwiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="37631411"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="37631411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 18:45:52 -0700
X-CSE-ConnectionGUID: cdK+tFZkTWCEQlDc2ibYww==
X-CSE-MsgGUID: 7rw9cgrhRKa3NfzEGuMCbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76543320"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 18:45:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stH6B-000J1h-2b;
	Wed, 25 Sep 2024 01:45:47 +0000
Date: Wed, 25 Sep 2024 09:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/7] ERROR: modpost:
 "v4l2_m2m_init" [drivers/media/platform/imagination/e5010_jpeg_enc.ko]
 undefined!
Message-ID: <202409250942.Y6kpn6Xs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4be14b7b159e3904d539f8038959035c58d446b4
commit: ee08ab29ba54091d42662c0fb8bb4122a426c42d [4/7] Merge 91bd008d4e2b ("Merge tag 'probes-v6.11' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-randconfig-006-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250942.Y6kpn6Xs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250942.Y6kpn6Xs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250942.Y6kpn6Xs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ufs/ufs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-fractional-divider_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/dtlk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82365.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
>> ERROR: modpost: "v4l2_m2m_init" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_encoder_cmd" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_last_buffer_done" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_expbuf" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_resume" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ioctl_querybuf" [drivers/media/platform/imagination/e5010_jpeg_enc.ko] undefined!
WARNING: modpost: suppressed 66 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
