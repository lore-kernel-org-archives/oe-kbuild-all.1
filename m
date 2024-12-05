Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F90192D63
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 05:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733375317; cv=none; b=AvbeM+9wRF4zdnZ3jeTTFdySLe8kEcSXrZNhN+7YHcJ50/oy98TDQj3LD/jPd7f1pFirQcVfEqIKl+eFJsmHKFtAruQUVY8mui8Ps+eSBHONYC/TbHIr9nP/l7iXjPJMTZRdfl19C1F55Q6hjf0ITiHUJCkEM3/LkyY8WWxkhow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733375317; c=relaxed/simple;
	bh=tpT9ZLBO1WjplihcN3Ll5d0/6BaSo3vHPCg+7B6cXUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsO1oYSZxX47mb1YOb2XrnNotibk3CU4GmzSQNMWDvk6gkmDFyIKcEEivFqwyvrU/vIkDz5y5zmJ7fLGKD6icdHeph4RThJyKCEh0xBYvgqMpKe0VUmRqRcbsIAXzROGEV3jAc3w2NxFqpMe2kQ/oelnO5xlV/w5p8S5N4qTHXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME6JFJf5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME6JFJf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733375316; x=1764911316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpT9ZLBO1WjplihcN3Ll5d0/6BaSo3vHPCg+7B6cXUA=;
  b=ME6JFJf5uhunaIeMCyVVQbBRYUXhHRhK/uw5sjtWcDQfMD+XQ4CDV4EJ
   bRcDr7sceXZWAFRwpXNAxZ7gs1klsEaL7r/9nBCeCZtuoHTu08zMV7iiN
   DMbeWeZUJG2Acv/n3VMtmgh3NnIqEYeOcoKVijrt2QckiCfOWjbcevfAl
   jAa+oU7L8vBDb+TVrRXaIJZnQUXoDmMZLc284TtB3KR0SRbaw5fU79997
   p19rYfiGJOU4E84fxFKOf5yVtCsbt9vPX5FUSVWccTn1FzFooNfO1gSHS
   GyX7idWbsyge6uIKFUdzTlKS+tmagobeC9zCCzZkJv8OHgRXvvWMmDqk4
   Q==;
X-CSE-ConnectionGUID: LH8B0l9aRDmHYZWG0PqaAg==
X-CSE-MsgGUID: RCfOntC0RbGb5vwfx4cqfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33802255"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33802255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:08:33 -0800
X-CSE-ConnectionGUID: tG981oLDTfOYkyEXRdlEGg==
X-CSE-MsgGUID: pskDFVqNRKKNHFuK+z1p2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94818114"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 21:08:32 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ46H-0003ov-3B;
	Thu, 05 Dec 2024 05:08:29 +0000
Date: Thu, 5 Dec 2024 13:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/4] ima_efi.c:undefined reference
 to `set_module_sig_enforced'
Message-ID: <202412051311.vJpWsB7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   138f7310004259ab588799bba9b3db9accd64468
commit: 5ffc4c2275478f8d4c17795dc5f1b552559fff26 [1/4] Revert "Revert "ANDROID: GKI: Add module load time protected symbol lookup""
config: arm64-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051311.vJpWsB7E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051311.vJpWsB7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051311.vJpWsB7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: Entry trampoline text too big
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: security/integrity/ima/ima_efi.o: in function `arch_get_ima_policy':
>> ima_efi.c:(.text+0x264): undefined reference to `set_module_sig_enforced'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fixed_state':
   phylink.c:(.text+0x590): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mac_config':
   phylink.c:(.text+0x814): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x820): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x8f4): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x900): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_disconnect_phy':
   phylink.c:(.text+0xcb0): undefined reference to `phy_disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_wol':
   phylink.c:(.text+0xd54): undefined reference to `phy_ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_wol':
   phylink.c:(.text+0xdf0): undefined reference to `phy_ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_get':
   phylink.c:(.text+0xea0): undefined reference to `phy_ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_eee_err':
   phylink.c:(.text+0xfd0): undefined reference to `phy_get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_eee':
   phylink.c:(.text+0x104c): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_get_eee':
   phylink.c:(.text+0x10b0): undefined reference to `phy_ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_eee':
   phylink.c:(.text+0x1150): undefined reference to `phy_ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_an_restart':
   phylink.c:(.text+0x11e4): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x11fc): undefined reference to `mdiobus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_emul_read':
   phylink.c:(.text+0x126c): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_down':
   phylink.c:(.text+0x1314): undefined reference to `phy_speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_up':
   phylink.c:(.text+0x13dc): undefined reference to `phy_speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c45_pcs_get_state':
   phylink.c:(.text+0x15f8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x16cc): undefined reference to `phy_stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_ioctl':
   phylink.c:(.text+0x1d40): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x1de4): undefined reference to `phy_mii_ioctl'
   aarch64-linux-ld: phylink.c:(.text+0x1e68): undefined reference to `mdiobus_write'
   aarch64-linux-ld: phylink.c:(.text+0x1ed0): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_up.isra.0':
   phylink.c:(.text+0x2118): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2128): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x216c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x2178): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_set_pauseparam':
   phylink.c:(.text+0x24d8): undefined reference to `linkmode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x2520): undefined reference to `phy_set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_config':
   phylink.c:(.text+0x2b98): undefined reference to `mdiobus_modify_changed'
   aarch64-linux-ld: phylink.c:(.text+0x2bd0): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode_c37_word':
   phylink.c:(.text+0x2d5c): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c22_pcs_get_state':
   phylink.c:(.text+0x2f6c): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x2f80): undefined reference to `mdiobus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_fixedlink':
   phylink.c:(.text+0x3888): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringup_phy':
   phylink.c:(.text+0x3d88): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3e48): undefined reference to `phy_attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x3f38): undefined reference to `phy_request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connect_phy':
   phylink.c:(.text+0x41a4): undefined reference to `phy_attach_direct'
   aarch64-linux-ld: phylink.c:(.text+0x420c): undefined reference to `phy_detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_ksettings_set':
   phylink.c:(.text+0x4284): undefined reference to `phy_ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x449c): undefined reference to `phy_lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_change':
   phylink.c:(.text+0x4754): undefined reference to `phy_get_pause'
   aarch64-linux-ld: phylink.c:(.text+0x484c): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x485c): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x4950): undefined reference to `phy_speed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0x4960): undefined reference to `phy_duplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x4a68): undefined reference to `phy_start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtool_nway_reset':
   phylink.c:(.text+0x4db8): undefined reference to `phy_restart_aneg'
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   videobuf2-core.c:(.text+0x413c): undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
