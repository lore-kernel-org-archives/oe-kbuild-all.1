Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB97195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735645539; cv=none; b=oV0zY92vUTBu9ZS+Sw6jiEJfv8Wwldk8qZ4G9azQtC8/CHJluJXfCTogL4MSsSVaS1S1r980O0GjAo2usrr3gLkW5osJ/Qo5JTxfjxRTCOEUIFeu2L1T/vFLnh3b0ZogxE9QpBLa0Z93xOexXTbbYdvpH1F0Rxd+EBrBsZGZS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735645539; c=relaxed/simple;
	bh=1qV3Ntrj8JVtKizgDv6GvbMFOeh7laZaYM3rl0JmAPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FzTfrWc7mL7TehhyB4KMnv9nuCzHXgtgxCKgfD0jvYZyHIpVTeLMUX9NA6Nb1xp1ZCGC3WMmq7CW0KV7blS4I3fVUiQIURQvU2NNfFo0FnsN2o9UZxsSvHSsnU3y3LJS061NoeJvHz1fHNBE1brHKxC2f9FvEKerruN5CKBIUdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+P28iB9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+P28iB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735645537; x=1767181537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qV3Ntrj8JVtKizgDv6GvbMFOeh7laZaYM3rl0JmAPQ=;
  b=e+P28iB9g9cN2Z3exldy8kh8W5fpuRoKkVXFs40xfCF8uA1Ep34zu2W1
   KtMGdT5w4gR9dFWTMnK4VcLih4yLX7FkWXc5dW8dl3/kpWdAxR8tcSG57
   tw+DEvWZ4IuojZ3WnEb6fFjJ3Xgh4IYaiDWM5HjkpFcAIgyQieg2oxeeo
   LfNvbCJcJdJEiEfT0M8kVrzWwNY3lIUJWA8qbx2Q+UDcpAy9azbOISZ5Q
   uf+gELy68AUS/fKRdvEnJK0W8SP0cdAjhGPkqgK8IatfU60y+NbgRoKQK
   yPgiSMV5z3xt4hgo++q72Sj/ZVWyOJSTLznDudmWuDQe4sLvAujTsEZy4
   A==;
X-CSE-ConnectionGUID: PpSyzpx5Sh+MWkLxirCTOg==
X-CSE-MsgGUID: 8C5NIfqbSJy1m+VVcnwSiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="58391214"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="58391214"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 03:45:37 -0800
X-CSE-ConnectionGUID: E4/5pmubSzmzWnfXqJmCrg==
X-CSE-MsgGUID: 6lW/ryWqQB6sznit1Xiilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101884156"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Dec 2024 03:45:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSagn-00075n-1s;
	Tue, 31 Dec 2024 11:45:33 +0000
Date: Tue, 31 Dec 2024 19:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_filtered_smc'
Message-ID: <202412311921.qEfPLYsb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   69b3c870d0b8d800f7140a73551a9603ccf67c93
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [2/2] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-randconfig-r123-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311921.qEfPLYsb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241231/202412311921.qEfPLYsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311921.qEfPLYsb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: in expansion of macro 'HYP_EVENT'
       9 | HYP_EVENT(filtered_smc,
         | ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
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
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/hyp_event_trace_filtered_smc +17 arch/arm64/include/asm/kvm_define_hypevents.h

f6dbfc683cf5fb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
