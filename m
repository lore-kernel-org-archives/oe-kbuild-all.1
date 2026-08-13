Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4839936D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786599611; cv=none; b=AQATLlM6lLZYEoLpiwHjPTVhTXgsCRzfpq2e5c3gzGoGvPkB/9obCN2EhNq0PfKZhv3LQuhDEqrww6bFdBDdDrDlGYK5b+PPjS+usekePqFLIqt/PV6HnIpBLQKv0weSK2rpFEoFImR1JPd/ZQcvM0Y4vruSxR4ZvXp/2zTBiJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786599611; c=relaxed/simple;
	bh=bHRPMsSs9qhZu6ixXixJ55kcVAZujq6G5bxg2NOgrBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ulfnCDM2S7aYu8aqgqO02sevi1blVSMZc2jZopNWbIT2IScPvNVzsT/e22W1Aa2ckBjzoZKHXafE706GtxEznsTAsrw9+0RxE+/Q1UCHyqfDC2tdzgOLO8IZy7jWR/Qd4HUZ6mdbBCH31yAh+fOyTBoQAQTu3EXgmJE1osre3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=In0bIbPB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="In0bIbPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786599610; x=1818135610;
  h=date:from:to:cc:subject:message-id;
  bh=bHRPMsSs9qhZu6ixXixJ55kcVAZujq6G5bxg2NOgrBI=;
  b=In0bIbPBjpq5a9CyOouq78N7JG5lIQp+e7nQuUkQxqfSzKM401mJ6mDw
   hlqzKgYIw2Kvp3Xa49aqhZRzX/F6+veadz4n06LobmSBDop8HW9PhXY2f
   Ws0q47ltH3fw+fjO3u6Jl+sTFzlxWF9vE7dQtrBq1hTMa5z3SwDTns1S/
   Gm99uX5o5pbAHTEl1eweoTpcxAA+iNGamiQT+z2/eQn8hMHqEVTqn8Mcj
   nqLq+DAYmsAE5slv4RVXYxB6pHY7DsLCnDKeC8h9FKPqCde++lwCDsaqm
   jvXS/DK2uHVP9LbhU5XzZ6ujuZUM8i6Fa2djPV/wLJlKK3nG2XMZgsSW2
   g==;
X-CSE-ConnectionGUID: AWFrbmKtTC2LLMpaClQcuw==
X-CSE-MsgGUID: MlBieiYkQUCJLMm/hPwPNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97754756"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97754756"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 22:40:09 -0700
X-CSE-ConnectionGUID: fcrv5K5cT2KijJUN+Dheiw==
X-CSE-MsgGUID: DfnAs1ZORmiPPIZR5lXl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="259588288"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 22:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuOAf-00000000Swo-0FHx;
	Thu, 13 Aug 2026 05:40:05 +0000
Date: Thu, 13 Aug 2026 13:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 272/272]
 mm/swap_slots.c:95:6: warning: no previous prototype for function
 'is_swap_slot_cache_enabled'
Message-ID: <202608131314.L8Qd2rsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9c40f45d2c22f05e45bc48b1d7be869adf7e473a
commit: e064059673798b931f95f724c7e377fa8cd15df7 [272/272] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131314.L8Qd2rsR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131314.L8Qd2rsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131314.L8Qd2rsR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/swap_slots.c:95:6: warning: no previous prototype for function 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^
   mm/swap_slots.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | bool is_swap_slot_cache_enabled(void)
         | ^
         | static 
   mm/swap_slots.c:101:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^
   mm/swap_slots.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | bool check_cache_active(void)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
