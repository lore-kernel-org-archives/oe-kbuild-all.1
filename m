Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B6377ED7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 21:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965238; cv=none; b=R6bDeKzOZpe4h28mKZCYokCNeObmsOBgrmyYN4mLfNy4yTZwM+RFWWxey8TgGEVWwbY6hA1/U/UyaxzV+juM0YTaD8nwg45miGpNt7aklnuGGuTizfE9kiwpPdbwb/rVm3AbAbvuxlklb68sD50vfSUjZUsoCe0wXI8ExaLtD4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965238; c=relaxed/simple;
	bh=fCv3a8iQlr6KhsNqfxmBGncbsinWu6KOcvkqEkaMQac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQ2/ZKSxZ7ipQQN6qR3Nj+6XYZ7hyJFr+RZsDCYQtiIq+Ubiptl+xnV//9l3sYRJnnLK8RsdSlC9d746ExeAbE14Owfs4PLjZpoJNxEMdwubm0vFhfLY3y6tKdKQnqMSmSGHO0RCaSji/422NTPSqpgM0cUXq1m6fvinj/mZ3Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XU6YsFbA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XU6YsFbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785965237; x=1817501237;
  h=date:from:to:cc:subject:message-id;
  bh=fCv3a8iQlr6KhsNqfxmBGncbsinWu6KOcvkqEkaMQac=;
  b=XU6YsFbARTjRHFvc0Bi9Q4sQovTzV6S5/e+rvct1baGm9JOryjkipkJC
   8/TJXvwP7KjCdahayQuzwjmY1WcVx2XWGUbP+i2WwqtDE/60sUf9z/aTE
   odO3tUZT64BIldc5DTzyrNw9LbKblHckLq7MwcNWuPJnXf45vT5Z6/xjm
   /u3lBcDrQlG2OvB1/etGNNXU7xeaSxe7JwxjYTFLt7rvezk8yBhikPXur
   DACar7m4+vFOoKDC/ZJqIBR0rhOvfIPzdtotf7ujF50HcIQdM4jCLHOBB
   awFSPk4BqmYwOrG41pjXF1Mrseny3Zb2hHuEurOPXB49glYcfPDGRHICT
   A==;
X-CSE-ConnectionGUID: uZpcCyHAQXy7/Qpzt/2njQ==
X-CSE-MsgGUID: O8wOn/BcStGId1IphsYA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="109342486"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="109342486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 14:27:17 -0700
X-CSE-ConnectionGUID: d6skdz9/TCqjsYJY8UpweA==
X-CSE-MsgGUID: pTN2QR5fSTyCiVl30Gfavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="286574013"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2026 14:27:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrj8q-00000000DUX-1g5e;
	Wed, 05 Aug 2026 21:27:12 +0000
Date: Thu, 06 Aug 2026 05:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/2]
 include/linux/android_kabi.h:65:17: error: static assertion failed:
 "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned
 the same as atomic64_t nr_task_refs"
Message-ID: <202608060537.iyQfagJS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   43cfff9a6e925a92e86e83f67db81659b3c405e5
commit: e24cc2d5218669b7412788d57528059ec6ecee4e [0/2] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-buildonly-randconfig-001-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060537.iyQfagJS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060537.iyQfagJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060537.iyQfagJS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/slub.c:13:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/page_alloc.c:19:
>> include/linux/android_kabi.h:65:17: error: static assertion failed: "include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs"
      65 |                 _Static_assert(                                         \
         |                 ^~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:17: note: in expansion of macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:9: note: in expansion of macro '_ANDROID_KABI_REPLACE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:9: note: in expansion of macro 'ANDROID_BACKPORT_USE'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:1831:6: warning: no previous prototype for 'prep_new_page' [-Wmissing-prototypes]
    1831 | void prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
         |      ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
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
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
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


vim +65 include/linux/android_kabi.h

e97af2a2f5563a Giuliano Procida   2025-05-28  54  
e97af2a2f5563a Giuliano Procida   2025-05-28  55  #define _ANDROID_KABI_RULE(hint, target, value) \
e97af2a2f5563a Giuliano Procida   2025-05-28  56  	__ANDROID_KABI_RULE(hint, #target, #value)
e3e94686886450 Giuliano Procida   2025-04-16  57  
e3e94686886450 Giuliano Procida   2025-04-16  58  #define _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new)			\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  59  	union {								\
e3e94686886450 Giuliano Procida   2025-04-16  60  		_Static_assert(						\
e3e94686886450 Giuliano Procida   2025-04-16  61  			sizeof(struct { _new; }) <=			\
e3e94686886450 Giuliano Procida   2025-04-16  62  				sizeof(struct { _orig; }),		\
e3e94686886450 Giuliano Procida   2025-04-16  63  			FILE_LINE ": " __stringify(_new)		\
e3e94686886450 Giuliano Procida   2025-04-16  64  				" is larger than " __stringify(_orig));	\
e3e94686886450 Giuliano Procida   2025-04-16 @65  		_Static_assert(						\
e3e94686886450 Giuliano Procida   2025-04-16  66  			__alignof__(struct { _new; }) <=		\
e3e94686886450 Giuliano Procida   2025-04-16  67  				__alignof__(struct { _orig; }),		\
e3e94686886450 Giuliano Procida   2025-04-16  68  			FILE_LINE ": " __stringify(_orig)		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  69  				" is not aligned the same as "		\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  70  				__stringify(_new));			\
804873a198f8dc Greg Kroah-Hartman 2020-03-11  71  	}
804873a198f8dc Greg Kroah-Hartman 2020-03-11  72  

:::::: The code at line 65 was first introduced by commit
:::::: e3e946868864503f88b95a0d8ffe6d61b7df82d6 ANDROID: update KABI macros for gendwarfksyms

:::::: TO: Giuliano Procida <gprocida@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
