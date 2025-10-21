Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F818346795
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761063418; cv=none; b=jy0JNaZOy7Z4ZuqcrWK2LTdHAkggVrAqSxQJ9IrVnpD0aj1vWTNap+WToKaSbMK+tZvkRYE4gzMo1TUfBOfoldYGIYKlv5ryYmyIKhbQghlPd+OHsbV0vlgZ7zuiNfwTfpaS+U47g4EcrgNQ0TgVLxAPXv9TidPPsRL1Ko/HNJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761063418; c=relaxed/simple;
	bh=kkPgNX+j1NJxW2N+nYT/lLiyOhOwh3rlpUl3dLOuZcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYeIibcIBGvZdOG5oe13Sk5yQkKBU/TEHx0dLzcyQXDCaB3KDOueGnkhe7Y+0wFbftpbUYzXixZFjt42n8lGvJakjXBiFv3BV++Ru/rRLHJGGFLXYrwtyz9xILzLCpGgau/TMBUmfl4kkznRLavrsIvk1MYnhoDnSLOcSzXIfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgAS3Lle; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgAS3Lle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761063415; x=1792599415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkPgNX+j1NJxW2N+nYT/lLiyOhOwh3rlpUl3dLOuZcI=;
  b=lgAS3Lle3hX+orKriQR8bNVUKr0ZDhrulazSuQRDBqOHaB5iRjGff387
   ptssdSxrpKhr2ZSzdF8/ytzkWd4GjGwYDmoRCwdrKxAy0ONDFH4gkrYEt
   omtqfVrkfp/qmQVgQvVZd2VV4pAHep9wPpBRxEQC3oQMRyVAX6v6pZPpT
   Y7P3rjsg+XpgsVk1ZPyigE64VviWC5mHkIxldfUSV6NELfR/2SHfuSHDe
   alU9aq/HXC9H7Mv55/R0jq2RwEYZApd/UXQ3Xr4hiQ5EtA4wqrxUtiIdu
   MqOvJXDRBfXRtY9xP8zh/E2vV2fSDBD3+ro0S2FU2O7Ol4AOO8SGMNBsn
   Q==;
X-CSE-ConnectionGUID: 4vbbXcDoTuuXyNft4BQjdw==
X-CSE-MsgGUID: Ztn02rMRT92El2Ezo8N+4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62896760"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62896760"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 09:16:54 -0700
X-CSE-ConnectionGUID: 6aCohDdeTQePUWEuJwMxvA==
X-CSE-MsgGUID: M9N47cTRRvaKNSlhZrlpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="214584376"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Oct 2025 09:16:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBF2Y-000B0P-33;
	Tue, 21 Oct 2025 16:16:50 +0000
Date: Wed, 22 Oct 2025 00:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [linux-next:master 1355/3056] xe_pci.c:undefined reference to
 `xe_configfs_primary_gt_allowed'
Message-ID: <202510220010.Ly8icYfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 [1355/3056] drm/xe/configfs: Add attribute to disable GT types
config: xtensa-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220010.Ly8icYfP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220010.Ly8icYfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220010.Ly8icYfP-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init':
   xe_guc.c:(.text+0x1140): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x138a): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engine_setup_default_lrc_state':
   xe_hw_engine.c:(.text+0xf1c): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0x1202): undefined reference to `xe_configfs_get_engines_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_invalidate_state_cache_wa':
   xe_lrc.c:(.text+0x31c): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0x353): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   xtensa-linux-ld: xe_lrc.c:(.text+0x398): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   xe_lrc.c:(.text+0x3cf): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_write_ring':
   xe_lrc.c:(.text+0x4058): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x41c3): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x28): undefined reference to `xe_configfs_init'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x2c): undefined reference to `xe_configfs_exit'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `read_gmdid':
>> xe_pci.c:(.text+0x908): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   xe_pci.c:(.text+0xb38): undefined reference to `xe_configfs_primary_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `read_gmdid':
>> xe_pci.c:(.text+0x91c): undefined reference to `xe_configfs_media_gt_allowed'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   xe_pci.c:(.text+0xc08): undefined reference to `xe_configfs_media_gt_allowed'
>> xtensa-linux-ld: xe_pci.c:(.text+0xdf8): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0xe97): undefined reference to `xe_configfs_check_device'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `psmi_debugfs_capture_addr_show':
   xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x532): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: xe_psmi.c:(.text+0x5a0): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5c2): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_not_sriov_vf':
   xe_rtp.c:(.text+0xdcc): undefined reference to `xe_configfs_get_psmi_enabled'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_boot_enabled':
   xe_survivability_mode.c:(.text+0x3f8): undefined reference to `xe_configfs_get_survivability_mode'
   xtensa-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x436): undefined reference to `xe_configfs_get_survivability_mode'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
