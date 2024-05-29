Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BD1C230E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970069; cv=none; b=m8zoIgnhGtPhuf9l4LgK3YkwwalniBN+LYdswT/rsy/IqQ4ni8is+E9KhEwUEWoRxBc9HzLVV9ssOnCz3YkCwNt6ZlwEyw4NQC3Y2pVUkDGrzrO09MoebG0WLU5CzAs6OkMXCpF4VOZhjrbLKjNRgUMVsFwqYBmDX32EGgMag0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970069; c=relaxed/simple;
	bh=H5KfOUNjLhaiOhbV7MUe6COJzskNnIYeixYUur2rsP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEvk5YIULqu56S2pSej5gb29OvaqNWDydRWJuM0sAOsI1+SGDanN83CLbBtmBzOBXVBLL5kKLqFcpIX/+FXxNvNq4mMS6wrm50n1dSoa5lva7Pc2ZZdionAQUJ6DKpPncHlvWwkTJE9rwAh/3ToL6O7ChI1RfZUEaiyoFXp8fOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEIA4RQf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEIA4RQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716970068; x=1748506068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5KfOUNjLhaiOhbV7MUe6COJzskNnIYeixYUur2rsP0=;
  b=gEIA4RQf8X0RsUJHH+x+1/3JrxTmdxeJLllJMDdEoNM7ecHeBTpkRpvr
   Mo1tkFoCzGggNJFFpnufuGIbg534D2CBbEdTbqVO+Jq4ri3zd6/irz4zX
   MNBkTJ3RJVEU1x2TXJJA6LhOiOistjZE5MGl4sIc1G13MI7IdYkIExKo3
   wpcZAnD6G0xrgD8YK8GFhMFsMZ5d3fH/Bjcp6A6c5TjVRFKGJXZOy6E/4
   fRordlCRw7VExR6IJDTynwsuodod0mc8Be/LMnpHGhFsOqJgcnnGP87dd
   gTyWAUTy+vooP9OJnn19/o94Bsi7WKNA6rUh2zNqgoOaH3MGrXi0+b6AM
   Q==;
X-CSE-ConnectionGUID: UbvDPkmOTLK7nkmPq7JMGw==
X-CSE-MsgGUID: 2HXyd9jtQl+Pc29OQjLPzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30858399"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="30858399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 01:07:48 -0700
X-CSE-ConnectionGUID: tIkDoun/SVKBd6y/S38Uiw==
X-CSE-MsgGUID: aJltZPe6RQegZV+3qIsw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="40235894"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 01:07:46 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCELY-000DJ1-0L;
	Wed, 29 May 2024 08:07:44 +0000
Date: Wed, 29 May 2024 16:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 23/44]
 drivers/virt/gunyah/gunyah_platform_hooks.c:42:5: warning: conflicting types
 for 'gunyah_rm_platform_pre_demand_page' due to enum/integer mismatch; have
 'int(struct gunyah_rm *, u16,  enum gunyah_pagetable_access,  struct folio
 *)' {aka 'int(struct gunyah...
Message-ID: <202405291638.zjUBtCaf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8ae1f42fd034d5d8d1566cf9705840942dd6fc40
commit: 8134d2cbc1b62d687bc49f3481ba27ee5fdc76cd [23/44] FROMLIST: gunyah: rsc_mgr: Add platform ops on mem_lend/mem_reclaim
config: arm64-randconfig-r054-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291638.zjUBtCaf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291638.zjUBtCaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291638.zjUBtCaf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/gunyah/gunyah_platform_hooks.c:42:5: warning: conflicting types for 'gunyah_rm_platform_pre_demand_page' due to enum/integer mismatch; have 'int(struct gunyah_rm *, u16,  enum gunyah_pagetable_access,  struct folio *)' {aka 'int(struct gunyah_rm *, short unsigned int,  enum gunyah_pagetable_access,  struct folio *)'} [-Wenum-int-mismatch]
      42 | int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/virt/gunyah/gunyah_platform_hooks.c:11:
   drivers/virt/gunyah/rsc_mgr.h:125:5: note: previous declaration of 'gunyah_rm_platform_pre_demand_page' with type 'int(struct gunyah_rm *, u16,  u32,  struct folio *)' {aka 'int(struct gunyah_rm *, short unsigned int,  unsigned int,  struct folio *)'}
     125 | int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virt/gunyah/gunyah_platform_hooks.c:56:5: warning: conflicting types for 'gunyah_rm_platform_reclaim_demand_page' due to enum/integer mismatch; have 'int(struct gunyah_rm *, u16,  enum gunyah_pagetable_access,  struct folio *)' {aka 'int(struct gunyah_rm *, short unsigned int,  enum gunyah_pagetable_access,  struct folio *)'} [-Wenum-int-mismatch]
      56 | int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virt/gunyah/rsc_mgr.h:127:5: note: previous declaration of 'gunyah_rm_platform_reclaim_demand_page' with type 'int(struct gunyah_rm *, u16,  u32,  struct folio *)' {aka 'int(struct gunyah_rm *, short unsigned int,  unsigned int,  struct folio *)'}
     127 | int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
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
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +42 drivers/virt/gunyah/gunyah_platform_hooks.c

    41	
  > 42	int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
    43					       enum gunyah_pagetable_access access,
    44					       struct folio *folio)
    45	{
    46		int ret = 0;
    47	
    48		down_read(&rm_platform_ops_lock);
    49		if (rm_platform_ops && rm_platform_ops->pre_demand_page)
    50			ret = rm_platform_ops->pre_demand_page(rm, vmid, access, folio);
    51		up_read(&rm_platform_ops_lock);
    52		return ret;
    53	}
    54	EXPORT_SYMBOL_GPL(gunyah_rm_platform_pre_demand_page);
    55	
  > 56	int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
    57						   enum gunyah_pagetable_access access,
    58						   struct folio *folio)
    59	{
    60		int ret = 0;
    61	
    62		down_read(&rm_platform_ops_lock);
    63		if (rm_platform_ops && rm_platform_ops->pre_demand_page)
    64			ret = rm_platform_ops->release_demand_page(rm, vmid, access,
    65								   folio);
    66		up_read(&rm_platform_ops_lock);
    67		return ret;
    68	}
    69	EXPORT_SYMBOL_GPL(gunyah_rm_platform_reclaim_demand_page);
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
