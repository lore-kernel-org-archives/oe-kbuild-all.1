Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF83D6479
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 20:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786740222; cv=none; b=Q4Bl5UXasOCtxPoG1WMgm3B47AImj+JZgL9EJU6SDQulnq7Rk43ZLD4ugxRbUCYL5xdLq/qx/7GQQUWxAhWIFXjvQ/Ezq9Ye9eTSYw53JHgCmPMmVihYIAaTz/d/orSPv5gFTcsekdqKRHe5872Q09MVIJB4NPILMPk8oKcaLVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786740222; c=relaxed/simple;
	bh=V+uITfiP1bTo4z0LJfOgthlzz31Yah9bbDVzjnoJfdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FyIpVI/sVE92F8c2enpHLgq8fxYRV8+lz0d4p/etAJ+GiapAA7WdHCGMDCRW4tliyNtoZBlWI9juRtJzIB1CD/Py5K6K4dYEfzdeNzJCyz8lTAFjmE8+1FuSAZMsgur/FFKOemMpKFdQ2bWJ/ulpMFEog3rpQYMhcIQckdBwz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pan/1dYN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pan/1dYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786740220; x=1818276220;
  h=date:from:to:cc:subject:message-id;
  bh=V+uITfiP1bTo4z0LJfOgthlzz31Yah9bbDVzjnoJfdY=;
  b=Pan/1dYNcd/8QfdjVMZvFKKmlAXEmzHprUpF8XtDCHJts+63ZRin5kdY
   jh2i7BVeCFOXujcQWtuw3Qb/otdbezNrNMRxrzfzeJYggFhGzwekb/54j
   dVt0Dn8b2R10QmIVGdcSg0gmF7hR2lV1Kb0aEc1PWaEwKYSinB5qhKvqG
   wMsb1u2Nk+lNELYJk6PkShPRAx/ATmRBy7LnOcVSB5p4bof3Y3TEjlZ7k
   aGer9PURcCd3c+ZbtOGUuvCK9vCmfkb2YkWU/X3mdHyGiJR7KMim7DU7L
   xbD6RdMRSP0XYP3FVjTdcY3gLPNZfZjAG7KVj1qnNzTdi8S2fCPL+3vvo
   Q==;
X-CSE-ConnectionGUID: tLrZYb5CTL6yPIC945zNxA==
X-CSE-MsgGUID: dZhiiwsaS+WoQoqNFiwWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87537529"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87537529"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 13:43:39 -0700
X-CSE-ConnectionGUID: paPKven3RJ2Frl3uPjqorw==
X-CSE-MsgGUID: H2UCGY/MRuK7FuIkuVPSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="268584746"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2026 13:43:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuyka-00000000a8c-0fsC;
	Fri, 14 Aug 2026 20:43:36 +0000
Date: Sat, 15 Aug 2026 04:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/irqchip/irq-gic-v3-its.c:5317:26: warning: shift count is negative
Message-ID: <202608150424.sSkbpILC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c3360dde0a9e76954535eba2b9cb287adf4d6444
commit: 7aae9422d19a266194ce4db6f81bb23b686e1ed3 [1/1] BACKPORT: FROMLIST: irqchip/gic-v3-its: Prepare shadow structures for KVM host deprivilege
config: arm-randconfig-001-20260815 (https://download.01.org/0day-ci/archive/20260815/202608150424.sSkbpILC-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150424.sSkbpILC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150424.sSkbpILC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3-its.c:5317:26: warning: shift count is negative [-Wshift-count-negative]
    5317 |                 its->tables[i].val &= ~GENMASK(47, 12);
         |                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:69:31: note: expanded from macro 'GENMASK'
      69 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDCP_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && (DRM_DISPLAY_HELPER [=n] || GKI_HIDDEN_DRM_CONFIGS [=y])
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +5317 drivers/irqchip/irq-gic-v3-its.c

  5285	
  5286	static int its_switch_to_shadow_locked(struct its_node *its, its_init_emulate init_emulate_cb)
  5287	{
  5288		struct its_shadow_tables *hyp_shadow, shadow;
  5289		int i, ret;
  5290		u64 baser_phys;
  5291	
  5292		hyp_shadow = its_get_shadow_tables(its);
  5293		if (!hyp_shadow)
  5294			return -ENOMEM;
  5295	
  5296		memcpy(&shadow, hyp_shadow, sizeof(shadow));
  5297		ret = init_emulate_cb(its->phys_base, hyp_shadow);
  5298		if (ret) {
  5299			its_free_shadow_tables(hyp_shadow);
  5300			return ret;
  5301		}
  5302	
  5303		/* Switch the driver command queue to use the shadow and save the original */
  5304		its->cmd_write = (its->cmd_write - its->cmd_base) +
  5305			(struct its_cmd_block *)shadow.cmd_shadow;
  5306		its->cmd_base = shadow.cmd_shadow;
  5307	
  5308		/* Replaces the first level of the indirect tables with shadow tables */
  5309		for (i = 0; i < GITS_BASER_NR_REGS; i++) {
  5310			if (!shadow.tables[i].shadow)
  5311				continue;
  5312	
  5313			baser_phys = virt_to_phys(shadow.tables[i].shadow);
  5314			if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48))
  5315				baser_phys = GITS_BASER_PHYS_52_to_48(baser_phys);
  5316	
> 5317			its->tables[i].val &= ~GENMASK(47, 12);
  5318			its->tables[i].val |= baser_phys;
  5319			its->tables[i].base = shadow.tables[i].shadow;
  5320		}
  5321	
  5322		return 0;
  5323	}
  5324	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
