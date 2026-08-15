Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D6345EDF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783476; cv=none; b=sO3rig8X33k7AcyBK+Qj9Z4FnZKLhyJPxq1hVmr8Wc61Gb4LNsEFaefDed9nNkVPWo/NBJ4FBRlos/vpq0//lmscw69RJLryYcnGy7v25qWn5qKetQ1dNMKQERldINd+HUR+a9jIPZ82kzS/dxAic9Lv2XXpjdKWG4k4BxOPKfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783476; c=relaxed/simple;
	bh=A4++mrZ3TWd0pPMvRR4TbzQprD7rtoPm1itU4Nm6/w4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Aw3321r6PIJJ5Y+J9mDmpqZ30I710ve9tOenxoj2k9liMijFmu4Q4SYJAUXoXVrh0Fv7myWnCkdINh4P7Tz7S/sGuwbjT79ythNnwEHCOUdDp1yE0VGxgmqVWvhtFOZc4G2HyeCdRfR2BbfHRQk1eHnkBAFZHF91ISiyavNfHHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIzkifee; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIzkifee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786783474; x=1818319474;
  h=date:from:to:cc:subject:message-id;
  bh=A4++mrZ3TWd0pPMvRR4TbzQprD7rtoPm1itU4Nm6/w4=;
  b=eIzkifeet0yVIpuCgwBukJn/t3x7watuz3RPACVBeRPh/ILyjNkK7Zxq
   qpwGsTy9FeuOOofkpJWMr2pupTBtqwEJkIOcHJu2ktUsBdCKTei8nigE5
   8JLGG1devbjCJQ/oZO/jg7uFJ7+UtfAjk952RDidCgfYF2B6j+DxK1gtI
   m9yGW7D+Z9M/cTeCEwPLF3rWpjbi0pK4dMdiywfavnCZi1DWFdyRuO6Mk
   juiBqSsCNKqSCH6f50FKqxdx1InPJB8N3VnbVrTbdvefVKfaxCnsi6OgC
   TVpgJa8tVhhpT2VKds0ZHqcAH0JVvMSoEVh45Y63BmhdBYez85hMaRiq9
   g==;
X-CSE-ConnectionGUID: 3ra2yNIlTdeVuV1mCXftog==
X-CSE-MsgGUID: TgVWdM5ZTj2OAU5yDE4E4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="74879803"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="74879803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 01:44:34 -0700
X-CSE-ConnectionGUID: J+tGbiOgQ4emVjFxa7l7EQ==
X-CSE-MsgGUID: HsaTewVKS66Lt9oORfCRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="262660604"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2026 01:44:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvA0D-00000000baU-3hMe;
	Sat, 15 Aug 2026 08:44:29 +0000
Date: Sat, 15 Aug 2026 16:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 include/uapi/linux/bits.h:9:19: warning: right shift count is negative
Message-ID: <202608151635.WvQtNDEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c3360dde0a9e76954535eba2b9cb287adf4d6444
commit: 7aae9422d19a266194ce4db6f81bb23b686e1ed3 [1/1] BACKPORT: FROMLIST: irqchip/gic-v3-its: Prepare shadow structures for KVM host deprivilege
config: arm-randconfig-r122-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151635.WvQtNDEJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151635.WvQtNDEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151635.WvQtNDEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:7,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/irqchip/irq-gic-v3-its.c:7:
   drivers/irqchip/irq-gic-v3-its.c: In function 'its_switch_to_shadow_locked':
>> include/uapi/linux/bits.h:9:19: warning: right shift count is negative [-Wshift-count-negative]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:69:38: note: in expansion of macro '__GENMASK'
      69 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/irqchip/irq-gic-v3-its.c:5317:40: note: in expansion of macro 'GENMASK'
    5317 |                 its->tables[i].val &= ~GENMASK(47, 12);
         |                                        ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +9 include/uapi/linux/bits.h

3c7a8e190bc5808 Paolo Bonzini 2023-12-12   6  
3c7a8e190bc5808 Paolo Bonzini 2023-12-12   7  #define __GENMASK(h, l) \
3c7a8e190bc5808 Paolo Bonzini 2023-12-12   8          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
3c7a8e190bc5808 Paolo Bonzini 2023-12-12  @9           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
3c7a8e190bc5808 Paolo Bonzini 2023-12-12  10  

:::::: The code at line 9 was first introduced by commit
:::::: 3c7a8e190bc580813ddd9259f62971c8d2a6b5ad uapi: introduce uapi-friendly macros for GENMASK

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
