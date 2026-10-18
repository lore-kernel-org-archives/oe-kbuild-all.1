Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B453DD532
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356268; cv=none; b=TuylZQguXpez4SCkxrWMLQ8biFsUMm4gNrBCwJpmv8oYNLDuJnp8JqMoqdweSkXZbOhfYFEvTfdwisBa6YoR7buTTs9gFm7o0tRp7Q+/GwScm8V8l9IxApfLzZCd6rkNhenAqSRebeLZggNVvDKoFWtO+M1aJ0ZdCIjL5TOgfEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356268; c=relaxed/simple;
	bh=yvsRm/c69vxqERNiTcZU0xmiwCooKCIlKY6+qxJZvwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KAmu+7LBBbmT4/+CM4G+jX+HQVUmBoafVwfPVaO42p2bYNtcbL0+mfqCzUxPSCw0EKtDmGsl/N9pdUWTcOKy9LaOvd0d2rLtYuKAvnwPOFCQxhZWIlkSwzQMHSmAF3i4k+M1Fqp9KQuQVmbp4TPnXM8lbloXe3eZ/oT8t6Q/GT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4yR3KDA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4yR3KDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792356266; x=1823892266;
  h=date:from:to:cc:subject:message-id;
  bh=yvsRm/c69vxqERNiTcZU0xmiwCooKCIlKY6+qxJZvwY=;
  b=C4yR3KDA7+d0kfblB66TpWthMu8zmJ2TbgEXv72SlL0H+V+oUk06l+It
   yvzQPhtUFbmEbrZVY6yJID9vlgt9yO8KfIIwGcFcm3BvCavCvIaWSvjFy
   8/TzVgm/EamKk51GiZKmKIE8WOhxu0ovjtak5H7hChuIQRstAEv6csfnV
   x/tfySKVily3F40RGBTUyDlh8XkgymsuUZjzx4x5Oh1v2jZqW8d5I+Z9F
   SgAX1JZVA7i8j7fCN7NLp853BTa2Abxqk0jRtf2vRQ4M6eaohkMqzpRCj
   xq1hRRIzlXVrnL4uLPiHsaghrm2FFwQwvWzP/W+f6nVg6u6rYYLZCA2SV
   g==;
X-CSE-ConnectionGUID: 4h1jzzhGSraxY11B0CZCDA==
X-CSE-MsgGUID: B2ev226BSES6ZD6C+Z5tqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="928723"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="928723"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:44:25 -0700
X-CSE-ConnectionGUID: rv6GPsdOTqe4C6G5Cy9Unw==
X-CSE-MsgGUID: eAJsX79FQouUPKoxuqN4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4126917"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 13:44:24 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIXjx-000000005Gx-3xM2;
	Sun, 18 Oct 2026 20:44:21 +0000
Date: Sun, 18 Oct 2026 22:43:29 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member
 'adev' not described in 'gh_rm'
Message-ID: <202610182221.s7Wo2OTG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Prakruthi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: 1dce9d7d4deea1d677677ba5dc6e0879679e5b38 [336/336] ANDROID: gunyah: Add support for Gunyah vendor modules
config: arm64-randconfig-r2202-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182221.s7Wo2OTG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182221.s7Wo2OTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182221.s7Wo2OTG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'msgq_client' not described in 'gh_rm'
>> drivers/virt/gunyah/rsc_mgr.c:159: warning: Function parameter or member 'adev' not described in 'gh_rm'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Function parameter or member 'rm_error' not described in 'gh_rm_remap_error'
   drivers/virt/gunyah/rsc_mgr.c:166: warning: Excess function parameter 'gh_error' description in 'gh_rm_remap_error'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +159 drivers/virt/gunyah/rsc_mgr.c

d5e8df2cc4a1706 Elliot Berman           2022-08-10  123  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  124  /**
d5e8df2cc4a1706 Elliot Berman           2022-08-10  125   * struct gh_rm - private data for communicating w/Gunyah resource manager
d5e8df2cc4a1706 Elliot Berman           2022-08-10  126   * @dev: pointer to device
d5e8df2cc4a1706 Elliot Berman           2022-08-10  127   * @tx_ghrsc: message queue resource to TX to RM
d5e8df2cc4a1706 Elliot Berman           2022-08-10  128   * @rx_ghrsc: message queue resource to RX from RM
d5e8df2cc4a1706 Elliot Berman           2022-08-10  129   * @msgq: mailbox instance of above
d5e8df2cc4a1706 Elliot Berman           2022-08-10  130   * @active_rx_connection: ongoing gh_rm_connection for which we're receiving fragments
d5e8df2cc4a1706 Elliot Berman           2022-08-10  131   * @last_tx_ret: return value of last mailbox tx
d5e8df2cc4a1706 Elliot Berman           2022-08-10  132   * @call_xarray: xarray to allocate & lookup sequence IDs for Request/Response flows
d5e8df2cc4a1706 Elliot Berman           2022-08-10  133   * @next_seq: next ID to allocate (for xa_alloc_cyclic)
d5e8df2cc4a1706 Elliot Berman           2022-08-10  134   * @cache: cache for allocating Tx messages
d5e8df2cc4a1706 Elliot Berman           2022-08-10  135   * @send_lock: synchronization to allow only one request to be sent at a time
d5e8df2cc4a1706 Elliot Berman           2022-08-10  136   * @nh: notifier chain for clients interested in RM notification messages
f251362242ba3ef Elliot Berman           2022-10-14  137   * @miscdev: /dev/gunyah
4cf9feacb7e4ba2 Elliot Berman           2022-12-13  138   * @irq_domain: Domain to translate Gunyah hwirqs to Linux irqs
d5e8df2cc4a1706 Elliot Berman           2022-08-10  139   */
d5e8df2cc4a1706 Elliot Berman           2022-08-10  140  struct gh_rm {
d5e8df2cc4a1706 Elliot Berman           2022-08-10  141  	struct device *dev;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  142  	struct gh_resource tx_ghrsc;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  143  	struct gh_resource rx_ghrsc;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  144  	struct gh_msgq msgq;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  145  	struct mbox_client msgq_client;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  146  	struct gh_rm_connection *active_rx_connection;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  147  	int last_tx_ret;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  148  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  149  	struct xarray call_xarray;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  150  	u32 next_seq;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  151  
d5e8df2cc4a1706 Elliot Berman           2022-08-10  152  	struct kmem_cache *cache;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  153  	struct mutex send_lock;
d5e8df2cc4a1706 Elliot Berman           2022-08-10  154  	struct blocking_notifier_head nh;
f251362242ba3ef Elliot Berman           2022-10-14  155  
1dce9d7d4deea1d Prakruthi Deepak Heragu 2023-02-27  156  	struct auxiliary_device adev;
f251362242ba3ef Elliot Berman           2022-10-14  157  	struct miscdevice miscdev;
4cf9feacb7e4ba2 Elliot Berman           2022-12-13  158  	struct irq_domain *irq_domain;
d5e8df2cc4a1706 Elliot Berman           2022-08-10 @159  };
d5e8df2cc4a1706 Elliot Berman           2022-08-10  160  

:::::: The code at line 159 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
