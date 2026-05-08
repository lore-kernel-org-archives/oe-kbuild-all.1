Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217244A02
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 00:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778199296; cv=none; b=td0wNGSvyolHK5EMx8voxN90gbSFDjblrec6qpO4ENXpip/Dk3DotLT+YWTW6QuL4L37SOv3POwTA2N1vKJh+nYckxmk59xp+dM4KZ33pJzL0YfsH7/Z6gtpASLipDu2BGhSe1RXAog07wx34WlG3XxJ2rQPnDk9d9Pqcmoxd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778199296; c=relaxed/simple;
	bh=QAdd7oBJi0ZoYpSTdKb/0aYFS5mo5amwgdXdQb21EDs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vr5dIAZg3w6oCth/72khO5zM2x29jXRVFLT5+2JTSD8pOzorSzPoJL1Mfkd/TQRbt8X8LXqr+5kGd2jPRZw1/0ii5dlAnXt5YoCJcuDID/z6cRM+5pzk1K7rylM7vujjR4LqALwPmJzrqs/+ISrXJvsjShGuZhwgBFO66itrUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGTmtrX9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGTmtrX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778199294; x=1809735294;
  h=date:from:to:cc:subject:message-id;
  bh=QAdd7oBJi0ZoYpSTdKb/0aYFS5mo5amwgdXdQb21EDs=;
  b=eGTmtrX9Fjq2TH6yw/iKxo+TzCvuKDy2r+0pnuTve2XHPpU140QODyZv
   kLrMPnj0Yi09MjBahDtT6RBRYPWjfoh7WVUenrUmDyPFUt5s0sm1lAnTU
   MU6Sg+ajdkmX3mCt92lJ6SpAKYqXZzeDoUPzD0Gjxa5TIj2icfn6VCgrs
   ojo9k19/QPAlw34a+VfMz+QGOQoXYWOoCr9bdMbHh6ENCRdv4kQ8SOq5Y
   M2ctbdvskfGkoCUJ9yAtQbd4iRAspzedlkTqfadQ3wv4RAQbTlF5Ecrcr
   ELLVqqGEvWSaM3Vm54sG/TZeEOxonFJmR92ivfDQ+Dw6WTdq5l85Au766
   g==;
X-CSE-ConnectionGUID: Rp4Sg4VCRTqHQomayNoXNg==
X-CSE-MsgGUID: zAo5vcH1Ry6ntVAoUGXXOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96590836"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="96590836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 17:14:53 -0700
X-CSE-ConnectionGUID: vcS22kbhQHuAoQ895PJKpQ==
X-CSE-MsgGUID: akYgJNEOQIOhBabB0bbnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="235634181"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2026 17:14:52 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL8ri-000000000cz-10rJ;
	Fri, 08 May 2026 00:14:50 +0000
Date: Fri, 08 May 2026 08:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 3/3]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous
 prototype for 'hyp_event_trace_filtered_smc'
Message-ID: <202605080807.2BVWUmpy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   679be9831d2e9d74cc622b9716943bc96537d034
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [3/3] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-randconfig-003-20260508 (https://download.01.org/0day-ci/archive/20260508/202605080807.2BVWUmpy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080807.2BVWUmpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080807.2BVWUmpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: in expansion of macro 'HYP_EVENT'
       9 | HYP_EVENT(filtered_smc,
         | ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


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
