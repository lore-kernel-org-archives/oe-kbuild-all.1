Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA2A111D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705724431; cv=none; b=QOxIYPo8Z0nZcfz4usP0/SZpJMbVhQHXJHN9MXidTj2DJgUj9bMTuxw8TqodJw8nR7EKx9aoFpjxNaVTAAsUt3hc20ht3vToMhr8X7inLnC3oXXtU+6B0dncx6hSH7VMwZhM3sCqG0jm21Qq6vRpJUqub1xOEVbh7s50u35+vMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705724431; c=relaxed/simple;
	bh=M93PdFv3g1BWBkS6YlLM2GyWQR5gVebWDPy7if6QNOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJzF5uCwQQYWJAM0/OEBvsPE2OeiAu3S9+kBhTF0BjkMBCJjEtVb07+Npuc/YuXG7jkGpKt19xN9H37dRcyDkDqFpO0HiotBl3mo1gitGxwxf5rmnQ2VXGEKvhsbrYwM6bQqYb18s3fy4USdY8uvpmYM6wL354Pe7QJP66+q3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daTRtaTE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daTRtaTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705724428; x=1737260428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M93PdFv3g1BWBkS6YlLM2GyWQR5gVebWDPy7if6QNOE=;
  b=daTRtaTEqukvzSUv4dy/cYLMJNQ2kVKKlPYto+ZG9HTKga0S2HLl0rqp
   pqCj4CHvrnTqoROpN9u9msaLjld/u2DCsGJ2EBUN1mo2UYHQJu0btcWFl
   IpCBGIX2MwcSloK8K2a/juPSUNxIffhC3z3HbyiRZYwYu/R+Rq2h/E4bX
   N76yDAh6MDR/7csyvXmNLtDlLrhsARvbj86zkoDhAPE62WBXaNVeGItwe
   uhvDTfxmeieTK3JKy5epArmp2B9V/jm4boD0MdO7QyssZwnthxNkny1Vz
   NwHAadGO19hpQ5IjHqZmX27/ItgAObdkXEXVQBcKFz/xA3+JpP4f+vn6g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="785841"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="785841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1116406535"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="1116406535"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2024 20:20:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR2qG-0004jg-05;
	Sat, 20 Jan 2024 04:20:24 +0000
Date: Sat, 20 Jan 2024 12:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 72/175]
 arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string
 literal in 'asm'
Message-ID: <202401201220.Y1iDhZU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   5a2bf0952d2c97a20e6b5ff9c036b6e48ee028db
commit: 6b29a1afdbebcc81e940e5c0f648aa1c32d3325d [72/175] ANDROID: KVM: arm64: Use atomic refcount helpers for 'struct hyp_page::refcount'
config: arm64-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201220.Y1iDhZU9-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201220.Y1iDhZU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201220.Y1iDhZU9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/hyp-constants.c:4:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
   1 error generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/switch.c:29:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14:
   In file included from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:12:
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
   arch/arm64/kvm/hyp/nvhe/switch.c:187:26: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     187 |         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:188:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     188 |         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:189:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     189 |         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:190:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     190 |         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:191:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     191 |         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:192:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     192 |         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:193:29: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     193 |         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:194:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     194 |         [ESR_ELx_EC_PAC]                = kvm_hyp_handle_ptrauth,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:186:28: note: previous initialization is here
     186 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:199:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     199 |         [ESR_ELx_EC_HVC64]              = kvm_handle_pvm_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:28: note: previous initialization is here
     198 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:200:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     200 |         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:28: note: previous initialization is here
     198 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:201:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     201 |         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/switch.c:198:28: note: previous initialization is here
     198 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
--
   In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:19:
   In file included from arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:14:
   In file included from arch/arm64/kvm/hyp/include/nvhe/pkvm.h:12:
   In file included from arch/arm64/kvm/hyp/include/nvhe/gfp.h:7:
   In file included from arch/arm64/kvm/hyp/include/nvhe/memory.h:9:
>> arch/arm64/kvm/hyp/include/nvhe/refcount.h:35:15: error: expected string literal in 'asm'
      35 |         asm volatile(__LSE_PREAMBLE
         |                      ^
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:362:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     362 |         [ESR_ELx_EC_WFx]                = handle_pvm_entry_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:361:28: note: previous initialization is here
     361 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:363:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     363 |         [ESR_ELx_EC_HVC64]              = handle_pvm_entry_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:361:28: note: previous initialization is here
     361 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:364:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     364 |         [ESR_ELx_EC_SYS64]              = handle_pvm_entry_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:361:28: note: previous initialization is here
     361 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:365:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     365 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_entry_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:361:28: note: previous initialization is here
     361 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:366:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     366 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_entry_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:361:28: note: previous initialization is here
     361 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:371:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     371 |         [ESR_ELx_EC_WFx]                = handle_pvm_exit_wfx,
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:370:28: note: previous initialization is here
     370 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:372:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     372 |         [ESR_ELx_EC_HVC64]              = handle_pvm_exit_hvc64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:370:28: note: previous initialization is here
     370 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:373:24: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     373 |         [ESR_ELx_EC_SYS64]              = handle_pvm_exit_sys64,
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:370:28: note: previous initialization is here
     370 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:374:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     374 |         [ESR_ELx_EC_IABT_LOW]           = handle_pvm_exit_iabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:370:28: note: previous initialization is here
     370 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:375:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     375 |         [ESR_ELx_EC_DABT_LOW]           = handle_pvm_exit_dabt,
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:370:28: note: previous initialization is here
     370 |         [0 ... ESR_ELx_EC_MAX]          = NULL,
         |                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:384:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     384 |         [ESR_ELx_EC_IABT_LOW]           = handle_vm_exit_abt,
         |                                           ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:383:28: note: previous initialization is here
     383 |         [0 ... ESR_ELx_EC_MAX]          = handle_vm_exit_generic,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/hyp-main.c:385:27: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     385 |         [ESR_ELx_EC_DABT_LOW]           = handle_vm_exit_abt,

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/asm +35 arch/arm64/kvm/hyp/include/nvhe/refcount.h

bb06ac6eeaa7e6 Will Deacon 2023-06-30  30  
bb06ac6eeaa7e6 Will Deacon 2023-06-30  31  static inline s16 __lse_refcount_fetch_add_16(u16 *refcount, s16 addend)
bb06ac6eeaa7e6 Will Deacon 2023-06-30  32  {
bb06ac6eeaa7e6 Will Deacon 2023-06-30  33  	s16 old;
bb06ac6eeaa7e6 Will Deacon 2023-06-30  34  
bb06ac6eeaa7e6 Will Deacon 2023-06-30 @35  	asm volatile(__LSE_PREAMBLE
bb06ac6eeaa7e6 Will Deacon 2023-06-30  36  	"	ldaddh	%w[addend], %w[old], %[refcount]"
bb06ac6eeaa7e6 Will Deacon 2023-06-30  37  	: [refcount] "+Q" (*refcount),
bb06ac6eeaa7e6 Will Deacon 2023-06-30  38  	  [old] "=r" (old)
bb06ac6eeaa7e6 Will Deacon 2023-06-30  39  	: [addend] "r" (addend));
bb06ac6eeaa7e6 Will Deacon 2023-06-30  40  
bb06ac6eeaa7e6 Will Deacon 2023-06-30  41  	return old + addend;
bb06ac6eeaa7e6 Will Deacon 2023-06-30  42  }
bb06ac6eeaa7e6 Will Deacon 2023-06-30  43  

:::::: The code at line 35 was first introduced by commit
:::::: bb06ac6eeaa7e68e1c532bda6814d1d2108f44d8 ANDROID: KVM: arm64: Add atomics-based checking refcount implementation at EL2

:::::: TO: Will Deacon <willdeacon@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
