Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D162309A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 04:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335246; cv=none; b=nBuiUskjBA2eBzDpzqJmERMUYzsnH/atutwTMzRbbrFxssNo5VNkXSbe6kTvhaEWPd68yH9IZHmowrB3cmBkFmU9U8K5+yS/qSlX3/KNQc+LXEG3g1NamDQPu6mFgE50KptNpKaT5s/5VsxTVIyJvHcgOWvpgnC+FphRnHSvePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335246; c=relaxed/simple;
	bh=Qa+aVDZ9385qLRB5N7jHplPAkWgfmhTHG/FDG+ZAYsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ine9zBlkXh2c49UA3mn2EsiMOJhR7lmJ59kE1VICkmDp9vTEA8LCjxoaklMPnOZAldnDSKy64u6QO9xlrqngXOCB9/D/5Oko5RZi9lBv9rdz68v/LmCi4SmpxeiaP7LVugYl0HzRX1dVMK154keRP924n+sA22UJdav25Kp5rA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dStZ/DNo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dStZ/DNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732335245; x=1763871245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qa+aVDZ9385qLRB5N7jHplPAkWgfmhTHG/FDG+ZAYsE=;
  b=dStZ/DNoxmUjcfmrAfjIAzulq4yBblohMAv7Rg0n76eb1SQ4UmahqqtE
   +vQhZuTb8WMNwZF/AUCrbmFXB6BjpbUSzzNW0nwPed7fp0suImbB66DFb
   vJaa8mltlHkjfWVPFmLkHmKbQcXPVR1FNts8ZBOCqqtiXyxRgeVXVBLk3
   QGl+ipU1Urs7q6Fdd+cYomVzei9Q6hjQDD1HG4jeD3btm/y42/FTDubOC
   IRlQKH8xQdmvtO/nfn4dtYACCPBU1ZW+kLuK0lZFia9EgyWlRBX/bA2au
   XsqjruxCM5MDbZ2PPb5X2oFtykQrUVIrQBJzvL1A4MSKkpHnj2WVyRyx7
   Q==;
X-CSE-ConnectionGUID: ExAUr9v1Rum3JLSzJXsBcg==
X-CSE-MsgGUID: tWRBC80fTaiD11PmvCUH3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35356125"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35356125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:14:04 -0800
X-CSE-ConnectionGUID: rCJMSmRzT5q0yQfklzzkNA==
X-CSE-MsgGUID: yscYMNDDSeWuLNEOEVdZOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="114036852"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 20:14:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhWy-0004Px-2y;
	Sat, 23 Nov 2024 04:14:00 +0000
Date: Sat, 23 Nov 2024 12:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 11839/19814]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_filtered_smc'
Message-ID: <202411231209.oXFSsk34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e2fbfb2efc8d61bff3b6ca9212c57cd9568f6442
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [11839/19814] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-randconfig-003-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231209.oXFSsk34-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231209.oXFSsk34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231209.oXFSsk34-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: in expansion of macro 'HYP_EVENT'
       9 | HYP_EVENT(filtered_smc,
         | ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/hyp_event_trace_filtered_smc +17 arch/arm64/include/asm/kvm_define_hypevents.h

f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
