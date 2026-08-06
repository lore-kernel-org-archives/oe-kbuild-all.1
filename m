Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57D33B6FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 03:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988707; cv=none; b=dpntaSbZC4kU8+jTlzzVX3c8htv3IgtoA9KsW0Y6sEefrT1b9AOsQlzL4AyKGvlmBGlGalCcQcNqZkUh+stC9JNEIU4YoVXe5HAIHgOctNd+rD0lbHcSpHSH7jm5gUhD+bAy+XMjtBNMpW3i77f1QtlAi/qF69KvvdS2ZwCn40A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988707; c=relaxed/simple;
	bh=/414JQE8+FTwo98qPwBZ5HoH7H3daAQM+kScRXebrz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CDwcGA++4arwt8XTTWH3XXAoEWIuoTu5PYbn3DzQpj/0YXVGAZPcUIgqSUYjWBiuZsPN4FNy33g3Xk+SU1YMurqbY/cHmsKMc+QTki3M7OrmxxUak2RQPKftkGD/gI9G+G+J4ZVMGbQB7QtgGf3vpU3arG1i6z/nDkdG1qmRKSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTNNOTml; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTNNOTml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785988706; x=1817524706;
  h=date:from:to:cc:subject:message-id;
  bh=/414JQE8+FTwo98qPwBZ5HoH7H3daAQM+kScRXebrz8=;
  b=lTNNOTmlEXrwy1ipYSr/U+VPIkPyK+q4MeV8vpPRKZ1ybQRRBV6kvm6v
   DmJL+McW4m7hBgZY2JGNj0OAJkG0CbH8ZqYLsBzBkLcF+w5KgWpuJpn6/
   pF9YKJoYYt5Ev6zjUO07gQJzjzLCkJQqeEA6890psiZENFaUjZ6eDwzek
   arlBF9ZU0tO1P4vfDpVHh0J5BdseFslwaAMVIe8JAWRIRjUtiMaTERlMF
   G6fqbnLZ1TTUq8nDdsdtygzgmsMlq4H/1qd15hIR3K2tnycqHRr4zoHpR
   dZztrJscqAsBcr3r7paziZLrmrRzL00iYXi0JTkEBmGaVAa2MHqwUl8uC
   g==;
X-CSE-ConnectionGUID: etzAl0WZTpCPiALGrbmSJg==
X-CSE-MsgGUID: IacTcpViTta7CAG2ZtYvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103976800"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="103976800"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 20:58:23 -0700
X-CSE-ConnectionGUID: gNbcYTVGQZqg3iBS/JIwew==
X-CSE-MsgGUID: kLGpPHx8RJ2p3RdyntzyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="262057560"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Aug 2026 20:58:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrpFL-00000000E4v-0xps;
	Thu, 06 Aug 2026 03:58:19 +0000
Date: Thu, 06 Aug 2026 11:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 2/2]
 include/linux/dma-buf.h:547:2: error: static assertion failed due to
 requirement '__alignof(struct dma_buf::(unnamed union)::(unnamed
 union)::(unnamed at include/linux/dma-buf.h:547:2)) <= __alignof(struct
 dma_buf::(unnamed union)::(unnamed union)::(unnam...
Message-ID: <202608061151.CGSF4fQ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   43cfff9a6e925a92e86e83f67db81659b3c405e5
commit: e24cc2d5218669b7412788d57528059ec6ecee4e [2/2] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-buildonly-randconfig-003-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061151.CGSF4fQ0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061151.CGSF4fQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061151.CGSF4fQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/file.c:25:
>> include/linux/dma-buf.h:547:2: error: static assertion failed due to requirement '__alignof(struct dma_buf::(unnamed union)::(unnamed union)::(unnamed at include/linux/dma-buf.h:547:2)) <= __alignof(struct dma_buf::(unnamed union)::(unnamed union)::(unnamed at include/linux/dma-buf.h:547:2))': include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:4: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:2: note: expression evaluates to '8 <= 4'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:34: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
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
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +547 include/linux/dma-buf.h

   539	
   540		ANDROID_KABI_RESERVE(1);
   541		ANDROID_KABI_RESERVE(2);
   542		/**
   543		 * @nr_task_refs:
   544		 *
   545		 * The number of tasks that reference this buffer. For calculating PSS.
   546		 */
 > 547		ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
   548	};
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
