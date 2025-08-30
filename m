Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A54A01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 00:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513260; cv=none; b=JEWDXnBPnpnijHwjOOrZmrH1+qXPDIvXn4PeTgM/9459BiMOjIyWT/YAf2cSt1RBYcnPuCUf9mmMZ7ZJKdroe4+OD58wrYDxDpgZDOcqrOqZTCohY5GltUaYzHLJo3eh4InRLEI7bsLl/MRowt/hC1TatFedNvv1Up27cMHVhiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513260; c=relaxed/simple;
	bh=HGg4cWO+AaMqBlUmoJdfC5IEfpnhKAOKL7u5P1Gp70Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HV9IVOwG0GmQNokCR6qPRYS9+TzP6OCh1kDQbn+i9KiN4FhqRhQqeHfg60pgp2XkriD0hWfhfZL4h3/Ayc/dPht5rkGfSwcAoxjAZFXvCFuDck+N9xSLTVv/rGKLAq5AeWLskQ/BZLS46a+WjUsm3JITB7t6Ud1oAncGha/I3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3eu7E99; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3eu7E99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756513258; x=1788049258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HGg4cWO+AaMqBlUmoJdfC5IEfpnhKAOKL7u5P1Gp70Y=;
  b=T3eu7E99AIDdWqTvkz0pgnEjwbipRldrAZdbLfX0zfQi/HIqw9fKPJuh
   qIC8yvlx/YSFlQ6+4MbRtY1jHcO0XiKQeDrqMe51k3Cy5lwP1K1FL4beV
   QrqT2HO6tz4O3+SSMBTw1rKUFbdQKxiwb3KyhqyU26R2Z2MeOLQqYzHB+
   zyPomQ6uVOoCBCE5SfIx94a2MvJR0uNnlBEhTRCWQ1ln/73InD7PHr+Ck
   Qu0v4Lzjtd1YzK6sepK+MKWU1AJutVoDqMGouccXAlc70dDZZ8c73IECe
   Hs03XtUsAZ9nik67k4HEuRv4Tk/uHOf8CXiDG3DPUqPg2utNqN2HycNky
   Q==;
X-CSE-ConnectionGUID: F1QkiB+uRw2PeepdBRrsbQ==
X-CSE-MsgGUID: /g+S4el2TwqSPengLWjWOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46376145"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="46376145"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 17:20:56 -0700
X-CSE-ConnectionGUID: O11iizkyTVeiCSzKVM2jFA==
X-CSE-MsgGUID: pcaCM/bVQH6+WQ70C/Z86Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170024734"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2025 17:20:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us9Kv-000V4R-1q;
	Sat, 30 Aug 2025 00:20:53 +0000
Date: Sat, 30 Aug 2025 08:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2] vmlinux.o: warning:
 objtool: vm_find_vqs+0x71d: stack state mismatch: cfa1=4+200 cfa2=-1+0
Message-ID: <202508300836.aKPvM1B5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   8479c7078d88df74ac0b390190ae7c3248d0014c
commit: acd4b6b3c4098b7eae68484359098c8bd4f74039 [2/2] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250830/202508300836.aKPvM1B5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300836.aKPvM1B5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300836.aKPvM1B5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vm_find_vqs+0x71d: stack state mismatch: cfa1=4+200 cfa2=-1+0
   vmlinux.o: warning: objtool: rk806_set_mode_dcdc() falls through to next function rk8xx_is_enabled_wmsk_regmap()
   vmlinux.o: warning: objtool: amd_set_spi_freq() falls through to next function amd_spi_set_opcode()

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
